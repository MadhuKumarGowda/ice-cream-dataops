SELECT DISTINCT
  timeseries.externalId,
  array(
    node_reference(assets.space, assets.externalId)
  ) AS assets,
  timeseries.isStep,
  timeseries.type,
  timeseries.space
FROM
  cdf_data_models(
    'cdf_cdm', 'CogniteCore', 'v1', 'CogniteTimeSeries'
  ) AS timeseries
INNER JOIN
  cdf_data_models(
    'cdf_cdm', 'CogniteCore', 'v1', 'CogniteAsset'
  ) AS assets
ON
  split_part(timeseries.externalId, ':', 1) = assets.externalId
  AND assets.space = 'icapi_dm_space'
WHERE
  timeseries.space = 'icapi_dm_space';