# This is an example controller to check whether our app works
class ArbitraryController < ApplicationController
  def index
    data = {
      message: 'This is an arbitrary JSON response',
      items: [
        { id: 1, name: 'Item 1', description: 'Description for Item 1' },
        { id: 2, name: 'Item 2', description: 'Description for Item 2' },
        { id: 3, name: 'Item 3', description: 'Description for Item 3' },
      ],
    }
    render json: data
  end
end
