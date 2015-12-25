var d6Button = $("#d6-roll")
var d6NumDice = $("#d6-num-dice").get(0)
var d6Total = $("#d6-total").get(0)
var d6Rolls = $("#d6-rolls").get(0)
var d6ModIndiv = $("#d6-mod-indiv").get(0)
var d6ModTotal = $("#d6-mod-total").get(0)
var d6CullType = $("#d6-cull-type").get(0)
var d6CullNum = $("#d6-cull-num").get(0)

var d6Clear = function() {
  d6Total.value = "";
  d6Rolls.value = "";
}

var d6CullTypeCheck = function() {
  if (d6CullType.value == "none")
  {
    d6CullNum.value = "";
  }
}

var d6CullNumCheck = function(d6sRolled) {
  if (d6CullNum.value > d6sRolled)
  {
    d6CullNum.value = d6sRolled;
  }
}

d6Button.on ("click", function(event){
  event.preventDefault();
  var d6sRolled = +d6NumDice.value;
  var d6Add = +d6ModIndiv.value;

  d6CullTypeCheck();
  d6CullNumCheck(d6sRolled);

  if (d6sRolled > 0)
  {
    var d6Request = $.ajax({
      url: "/roll",
      method: "GET",
      data: { num_dice: d6sRolled,
              die: {
                min: 1,
                max: 6,
                mod_indiv: d6Add,
                mod_total: d6ModTotal.value,
                floor: 1 + d6Add,
                ceiling: 6 + d6Add,
                cull_type: d6CullType.value,
                cull_num: +d6CullNum.value
              },
            }
    });
    d6Request.success (function(result) {
      d6Total.value = result.total;
      d6Rolls.value = result.rolls;
    });
  }
  else
  {
    d6Clear();
  };
});
