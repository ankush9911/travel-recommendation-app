import gradio as gr
from pyswip import Prolog

# Load Prolog KB
prolog = Prolog()
prolog.consult("travel_kb.pl")

def parse_activities(text):
    if not text.strip():
        return "[]"
    return "[" + ",".join(a.strip().lower().replace(" ", "_") for a in text.split(",")) + "]"

def recommend(cost, season, trip_type, days, activities):
    prefs = parse_activities(activities)
    q = f"recommend_unique({cost},{season},{trip_type},{int(days)},{prefs},Results)"

    try:
        res = list(prolog.query(q))
        results = res[0]["Results"]

        out = "### 🌍 Top Travel Recommendations\n\n"
        
        for place, country, score in results[:5]:
            out += f"""
<div style='padding:10px; border-radius:10px; background:#f7f7f7; margin-bottom:10px; border-left:6px solid #4CAF50'>
    <h3 style='margin:0; padding:0'>🏖️ {place}</h3>
    <p style='margin:0; padding:0; font-size:16px'><strong>{country}</strong></p>
    <p style='margin:0; padding:0; font-size:14px'>⭐ Score: <strong>{score}</strong></p>
</div>
"""
        return out

    except Exception as e:
        return f"❌ Error: {e}"

ui = gr.Interface(
    fn=recommend,
    inputs=[
        gr.Dropdown(["budget", "mid", "luxury"], label="Budget"),
        gr.Dropdown(["summer","winter","spring","autumn","year_round"], label="Season"),
        gr.Dropdown(["beach","mountain","city","cultural","adventure","nature"], label="Trip Type"),
        gr.Number(label="Days", value=3),
        gr.Textbox(label="Activities (comma separated)")
    ],
    outputs=gr.HTML(),
    title="✈️ Travel Recommendation System"
)

ui.launch(share=True)
