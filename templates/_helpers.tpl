#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

{{- define "postgres_host" -}}
{{ .Values.postgres.hostName }}
{{- end -}}

{{- define "postgres_url" -}}
jdbc:postgresql://{{ .Values.postgres.hostName }}:{{ .Values.postgres.port }}/{{ .Values.global.db.tenantsDb }}
{{- end -}}

{{- define "postgres_user" -}}
{{ .Values.postgres.auth.username | default "postgres" }}
{{- end -}}

{{- define "postgres_password" -}}
{{ coalesce .Values.postgres.auth.password .Values.postgres.auth.postgresPassword }}
{{- end -}}

{{- define "secrets" -}}
fineract_tenants_pwd: {{ include "postgres_password" . | b64enc }}
FINERACT_DEFAULT_TENANTDB_PWD: {{ include "postgres_password" . | b64enc }}
{{ if .Values.extraSecretEnv }}
{{- range $key, $value := .Values.extraSecretEnv }}
{{ $key }}: {{ tpl $value $ | b64enc }}
{{- end }}
{{- end }}
{{- end -}}
