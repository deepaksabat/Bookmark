require 'test_helper'

class BookMarksControllerTest < ActionController::TestCase
  setup do
    @book_mark = book_marks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_marks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_mark" do
    assert_difference('BookMark.count') do
      post :create, book_mark: { label: @book_mark.label, name: @book_mark.name, note: @book_mark.note, url: @book_mark.url }
    end

    assert_redirected_to book_mark_path(assigns(:book_mark))
  end

  test "should show book_mark" do
    get :show, id: @book_mark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_mark
    assert_response :success
  end

  test "should update book_mark" do
    patch :update, id: @book_mark, book_mark: { label: @book_mark.label, name: @book_mark.name, note: @book_mark.note, url: @book_mark.url }
    assert_redirected_to book_mark_path(assigns(:book_mark))
  end

  test "should destroy book_mark" do
    assert_difference('BookMark.count', -1) do
      delete :destroy, id: @book_mark
    end

    assert_redirected_to book_marks_path
  end
end
