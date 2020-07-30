
exports.healthcheck = async event => {
  return {
    statusCode: 200,
    body: JSON.stringify({ input: event }, null, 2),
  }
}
