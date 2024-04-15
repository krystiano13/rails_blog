require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? with no date returns true" do
    assert BlogPost.new(published_at: nil).draft?
  end

  test "draft? with date returns false" do
    assert !BlogPost.new(published_at: DateTime.new).draft?
  end

  test "scheduled? with with future date returns true" do
    assert BlogPost.new(published_at: 1.year.from_now).scheduled?
  end

  test "scheduled? with past date returns false" do
    assert !BlogPost.new(published_at: 1.year.ago).scheduled?
  end

  test "published? with past date returns true" do
    assert BlogPost.new(published_at: 1.year.ago).published?
  end

  test "published? with future date returns false" do
    assert !BlogPost.new(published_at: 1.year.from_now).published?
  end
end
