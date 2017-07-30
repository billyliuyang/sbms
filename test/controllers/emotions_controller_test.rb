require 'test_helper'

class EmotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emotion = emotions(:one)
  end

  test "should get index" do
    get emotions_url
    assert_response :success
  end

  test "should get new" do
    get new_emotion_url
    assert_response :success
  end

  test "should create emotion" do
    assert_difference('Emotion.count') do
      post emotions_url, params: { emotion: { current_hr: @emotion.current_hr, emotion_a: @emotion.emotion_a, emotion_v: @emotion.emotion_v, user_id: @emotion.user_id } }
    end

    assert_redirected_to emotion_url(Emotion.last)
  end

  test "should show emotion" do
    get emotion_url(@emotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_emotion_url(@emotion)
    assert_response :success
  end

  test "should update emotion" do
    patch emotion_url(@emotion), params: { emotion: { current_hr: @emotion.current_hr, emotion_a: @emotion.emotion_a, emotion_v: @emotion.emotion_v, user_id: @emotion.user_id } }
    assert_redirected_to emotion_url(@emotion)
  end

  test "should destroy emotion" do
    assert_difference('Emotion.count', -1) do
      delete emotion_url(@emotion)
    end

    assert_redirected_to emotions_url
  end
end
