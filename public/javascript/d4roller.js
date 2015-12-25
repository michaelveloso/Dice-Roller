var d4Button = $("#d4-roll")
var d4NumDice = $("#d4-num-dice").get(0)
var d4Total = $("#d4-total").get(0)
var d4Rolls = $("#d4-rolls").get(0)
var d4ModIndiv = $("#d4-mod-indiv").get(0)
var d4ModTotal = $("#d4-mod-total").get(0)
var d4CullType = $("#d4-cull-type").get(0)
var d4CullNum = $("#d4-cull-num").get(0)

var d4Clear = function() {
  d4Total.value = "";
  d4Rolls.value = "";
}

var d4CullTypeCheck = function() {
  if (d4CullType.value == "none")
  {
    d4CullNum.value = "";
  }
}

var d4CullNumCheck = function(d4sRolled) {
  if (d4CullNum.value > d4sRolled)
  {
    d4CullNum.value = d4sRolled;
  }
}

d4Button.on ("click", function(event){
  event.preventDefault();
  var d4sRolled = +d4NumDice.value;
  var d4Add = +d4ModIndiv.value;

  d4CullTypeCheck();
  d4CullNumCheck(d4sRolled);

  if (d4sRolled > 0)
  {
    var d4Request = $.ajax({
      url: "/roll",
      method: "GET",
      data: { num_dice: d4sRolled,
              die: {
                min: 1,
                max: 4,
                mod_indiv: d4Add,
                mod_total: d4ModTotal.value,
                floor: 1 + d4Add,
                ceiling: 4 + d4Add,
                cull_type: d4CullType.value,
                cull_num: +d4CullNum.value
              },
            }
    });
    d4Request.success (function(result) {
      d4Total.value = result.total;
      d4Rolls.value = result.rolls;
    });
  }
  else
  {
    d4Clear();
  };
});
