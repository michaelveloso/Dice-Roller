var d4Button = $("#d4-roll")
var d4NumDice = $("#d4-num-dice").get(0)
var d4Total = $("#d4-total").get(0)
var d4Rolls = $("#d4-rolls").get(0)
var d4ModIndiv = $("#d4-mod-indiv").get(0)

d4Button.on ("click", function(event){
  event.preventDefault();
  var d4Request = $.ajax({
    url: "/d4",
    method: "GET",
    data: { num_dice: d4NumDice.value,
            d4: {
              min: 1,
              max: 4,
              mod_indiv: d4ModIndiv.value,
              mod_total: 0,
              floor: 1,
              ceiling: 4 + d4ModIndiv.value,
            },
          }
  });
  d4Request.success (function(result) {
    d4Total.value = result.total;
    d4Rolls.value = result.rolls;
  });
});
