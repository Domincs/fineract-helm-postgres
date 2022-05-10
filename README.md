# fineract



![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) 

Apache Fineract: A Platform for Microfinance

**Homepage:** <https://github.com/apache/fineract>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Dominic | dominicchingoma@gmail.com |  |

## Source Code

* <https://github.com/Domincs/fineract-helm-postgres>

## TL;DR;

__NOTE__: Providing values for at least `postgres.auth.password` and `mysql.auth.postgresPassword` is mandatory at installation time

```console
$ helm repo add one-acre-fund https://one-acre-fund.github.io/oaf-public-charts
$ helm install --set mysql.auth.password=xxx --set mysql.auth.rootPassword=yyy my-release one-acre-fund/fineract
```

## Requirements

__NOTE__: Postgres instance with fineract_tenants and fineract_default DB installed. 



## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fineractServer.extraEnv | object | See `values.yaml` | Dictionary of key/value pairs to pass as environment variables to the backend pods They will be evaluated as Helm templates |
| fineractServer.extraSecretEnv | object | `{}` | Same as `extraEnv` but passed as secrets |
| fineractServer.image.name | string | `"apache/fineract"` | Fineract Docker image name |
| fineractServer.image.tag | string | `"latest"` | Fineract Docker image tag |
| fineractServer.replicas | int | `1` | Number of backend pods |
| fineractServer.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"}}` | Resource settings for Backend pods |
| fineractUI.enabled | bool | `true` | Deploy MIFOS UI? |
| fineractUI.image.name | string | `"openmf/community-app"` | Frontend Docker image name |
| fineractUI.image.tag | string | `"latest"` | Frontend Docker image tag |
| fineractUI.replicas | int | `1` | Number of frontend pods |
| fineractUI.resources | object | `{"limits":{"cpu":"100m","memory":"100Mi"}}` | Resource settings for Backend pods |
| global.db.defaultDb | string | `"fineract_default"` | DB name for defaults db |
| global.db.tenantsDb | string | `"fineract_tenants"` | DB name for tenants db |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Create Ingress? |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` | TLS settings |
| mifosx.apiURL | string | `"https://www.example.com"` |  |
| mifosx.enabled | bool | `false` | Deploy mifos-x UI? |
| mifosx.image.name | string | `"oneacrefund/mifos-x"` | Frontend Docker image name |
| mifosx.image.tag | string | `"latest"` | Frontend Docker image tag |
| mifosx.replicas | int | `1` | Number of frontend pods |
| mifosx.resources.limits.cpu | string | `"100m"` |  |
| mifosx.resources.limits.memory | string | `"100Mi"` |  |
| mifosx.tenant | string | `"default"` | Resource settings for Backend pods |
| postgres.auth.password | string | `""` | Please change these... |
| postgres.auth.postgresPassword | string | `""` | Please change these... |
| postgres.auth.username | string | `"fineract"` | Fineract db user |
| service.type | string | `"ClusterIP"` | Service type for Fineract and UI services |