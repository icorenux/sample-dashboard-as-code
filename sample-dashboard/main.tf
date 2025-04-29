resource "datadog_dashboard_json" "dashboard_json" {
  dashboard = <<EOF
{
  "title": "Ardityo's Dashboard Thu, Mar 27, 10:21:47 am",
  "description": null,
  "widgets": [
    {
      "id": 2604207636958610,
      "definition": {
        "title": "",
        "title_size": "16",
        "title_align": "left",
        "show_legend": true,
        "legend_layout": "auto",
        "legend_columns": [
          "avg",
          "min",
          "max",
          "value",
          "sum"
        ],
        "time": {},
        "type": "timeseries",
        "requests": [
          {
            "response_format": "timeseries",
            "queries": [
              {
                "name": "query1",
                "data_source": "metrics",
                "query": "avg:system.cpu.user{*}"
              }
            ],
            "style": {
              "palette": "dog_classic",
              "order_by": "values",
              "line_type": "solid",
              "line_width": "normal"
            },
            "display_type": "line"
          }
        ]
      },
      "layout": {
        "x": 0,
        "y": 0,
        "width": 4,
        "height": 2
      }
    }
  ],
  "template_variables": [],
  "layout_type": "ordered",
  "notify_list": [],
  "reflow_type": "fixed"
}
EOF
}