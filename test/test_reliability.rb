require(File.dirname(__FILE__)+'/test_helpers.rb')


class StatsampleReliabilityTestCase < Test::Unit::TestCase

  def setup
    @x1=[1,1,1,1,2,2,2,2,3,3,3,30].to_vector(:scale)
    @x2=[1,1,1,2,2,3,3,3,3,4,4,50].to_vector(:scale)
    @x3=[2,2,1,1,1,2,2,2,3,4,5,40].to_vector(:scale)
    @x4=[1,2,3,4,4,4,4,3,4,4,5,30].to_vector(:scale)
    @ds={'x1'=>@x1,'x2'=>@x2,'x3'=>@x3,'x4'=>@x4}.to_dataset
  end

  def test_general
    ia=Statsample::Reliability::ItemAnalysis.new(@ds)
    assert_in_delta(0.980,ia.alpha,0.001)
    assert_in_delta(0.999,ia.alpha_standarized,0.001)
    assert_in_delta(0.999,ia.item_total_correlation()['x1'],0.001)
    assert_in_delta(1050.455,ia.stats_if_deleted()['x1'][:variance_sample],0.001)
  end
end
