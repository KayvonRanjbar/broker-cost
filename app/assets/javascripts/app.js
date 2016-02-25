$(document).ready(function() {

  if ($('#brokers_info').length > 0) {

    var broker_data = $('#brokers_info').data('brokers');

    $("#calculate").click(function(e) {
      e.preventDefault();
      var stockTrades = $('#stock-trades').val();
      var mfTrades = $('#mf-trades').val();
      var optionTrades = $('#option-trades').val();
      var marginUse = $('#margin-use').val();
      var combined_data = broker_data.map(function(obj){
        var rObj = {};
        rObj['name'] = obj.name;
        rObj['cost'] = Math.round(obj.stock_trade_fee * stockTrades + obj.mutual_fund_trade_fee * mfTrades + obj.option_base_trade_fee * optionTrades + obj.margin_rate * marginUse);
        return rObj;
      })
      drawBarChart(combined_data)
    })

    function drawBarChart(calculated_data) {

      // Wiping previous bar chart
      d3.selectAll(".label").remove();
      d3.selectAll(".bar").remove();
      d3.selectAll(".x axis").remove();
      d3.selectAll(".y axis").remove();
      d3.selectAll(".tick").remove();
      d3.selectAll(".domain").remove();
      d3.selectAll("text").remove();

      var margin = {top: 40, right: 30, bottom: 30, left: 40},
          width = 576 - margin.left - margin.right,
          height = 300 - margin.top - margin.bottom;

      var x = d3.scale.ordinal()
          .rangeRoundBands([0, width], .1);

      var y = d3.scale.linear()
          .range([height, 0]);

      var xAxis = d3.svg.axis()
          .scale(x)
          .orient("bottom");

      var yAxis = d3.svg.axis()
          .scale(y)
          .orient("left")
          .ticks(10, "$");

      var chart = d3.select(".chart")
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom)
        .append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

      x.domain(calculated_data.map(function(d) { return d.name; }));
      y.domain([0, d3.max(calculated_data, function(d) { return d.cost; })]);

      chart.append("g")
          .attr("class", "x axis")
          .attr("transform", "translate(0," + height + ")")
          .call(xAxis);

      chart.append("g")
        .attr("class", "y axis")
        .call(yAxis)
      .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".71em")
        .style("text-anchor", "end")
        .text("Cost");

      chart.selectAll(".bar")
          .data(calculated_data)
        .enter().append("rect")
          .attr("class", "bar")
          .attr("x", function(d) { return x(d.name); })
          .attr("y", function(d) { return y(d.cost); })
          .attr("height", function(d) { return height - y(d.cost); })
          .attr("width", x.rangeBand())
          .attr("fill", "steelblue")
          .text("Cost")
          .on('mouseover', function(d) {
            d3.select(this)
              .attr('fill', 'red');
          })
          .on('mouseout', function(d) {
            d3.select(this)
              .attr('fill', 'steelblue');
          });

      chart.selectAll(".label")
          .data(calculated_data)
          .enter().append("svg:text")
              .attr("class", "label")
              .attr("x", function(d) {
                  return x(d.name) + x.rangeBand() / 2;
              })
              .attr("y", function(d) {
                  return y(d.cost) - 5;
              })
              .attr("text-anchor", "middle")
              .text(function(d) {
                  return d3.format("$")(d.cost);
              });
      
      chart.append("text")
        .attr("x", (width / 2))
        .attr("y", 0 - (margin.top / 2))
        .attr("text-anchor", "middle")
        .style("font-size", "16px")
        .style("text-decoration", "underline")
        .text("Annual Broker Cost");

    }

  }

});
