{{/*
Expand the name of the chart.
*/}}
{{- define "customer-abc-elasticsearch.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end -}}
