require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns all tasks to @tasks' do
      task = create(:task)
      get :index
      expect(assigns(:tasks)).to eq([task])
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new task to @task' do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new task' do
        expect {
          post :create, params: { task: attributes_for(:task) }
        }.to change(Task, :count).by(1)
      end

      it 'redirects to the index page' do
        post :create, params: { task: attributes_for(:task) }
        expect(response).to redirect_to(tasks_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new task' do
        expect {
          post :create, params: { task: attributes_for(:task, name: nil) }
        }.to_not change(Task, :count)
      end

      it 'renders the new template' do
        post :create, params: { task: attributes_for(:task, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end


  describe 'GET #edit' do
    it 'renders the edit template' do
      task = create(:task)
      get :edit, params: { id: task.id }
      expect(response).to render_template(:edit)
    end

    it 'assigns the requested task to @task' do
      task = create(:task)
      get :edit, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'PUT #update' do
    let(:task) { create(:task) }

    context 'with valid parameters' do
      it 'updates the task' do
        put :update, params: { id: task.id, task: { description: 'Updated description' } }
        task.reload
        expect(task.description).to eq('Updated description')
      end

      it 'redirects to the index page' do
        put :update, params: { id: task.id, task: { description: 'Updated description' } }
        expect(response).to redirect_to(tasks_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the task' do
        put :update, params: { id: task.id, task: { name: nil } }
        task.reload
        expect(task.name).to_not be_nil
      end

      it 'renders the edit template' do
        put :update, params: { id: task.id, task: { name: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      task = create(:task)
      get :show, params: { id: task.id }
      expect(response).to render_template(:show)
    end

    it 'assigns the requested task to @task' do
      task = create(:task)
      get :show, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end
end
