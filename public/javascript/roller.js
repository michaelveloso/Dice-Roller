$(".die-form").on ("submit", function(event){
  event.preventDefault();
  var thisForm = $(this)
  var cullNumField = thisForm.children(".num-culled-field").first();
  var totalField = thisForm.children(".total-output").first();
  var rollsField = thisForm.children(".rolls-output").first();
  var dieData = parseDataSerialized(thisForm.serialize());
  dieData = normalizeDieData(dieData);
  cullNumField.val(dieData.cull_num);
  if (dieData.num_dice > 0)
  {
    var rollRequest = $.ajax({
      url: "/roll",
      method: "GET",
      data: {
              die: dieData
            }
    });
    rollRequest.success (function(result) {
      totalField.val(result.total);
      rollsField.val(result.rolls);
    });
  }
  else
  {
    totalField.val("");
    rollsField.val("");
  };
});

var parseDataSerialized = function(rawDataSerialized) {
  var keyValuePairs = rawDataSerialized.split("&");
  var hash = keyValuePairsToHash(keyValuePairs);
  return hash;
};

var keyValuePairsToHash = function(pairs) {
  var hash = {};
  pairs.forEach(function(value, index, array)
  {
    var pair = value.split("=");
    var key = pair[0];
    var value = pair[1];
    hash[key] = value;
  });
  hash.floor = +hash.mod_indiv + 1;
  hash.ceiling = +hash.mod_indiv + (+hash.max);
  return hash;
}

var normalizeDieData = function(dieData)
{
  if (dieData.cull_num > dieData.num_dice)
  {
    dieData.cull_num = dieData.num_dice;
  }

  if (dieData.cull_type == "none")
  {
    dieData.cull_num = "";
  }

  return dieData;
}
