require 'rails_helper'

RSpec.describe "/samples", type: :request do
  let(:sample) { create(:sample_default) }
  let(:builded_attributes) { FactoryBot.build(:sample_default) }
  let(:invalid_attributes) { FactoryBot.build(:sample_without_codebar)}

  let(:valid_headers) {  }

  describe "GET /index" do
    it "renders a successful response" do
      get samples_path, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get sample_url(sample), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Sample" do
        expect {
          post samples_url,
               params: { sample: builded_attributes }, headers: valid_headers, as: :json
        }.to change(Sample, :count).by(1)
      end

      it "renders a JSON response with the new sample" do
        post samples_url,
             params: { sample: builded_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Sample" do
        expect {
          post samples_url, params: { sample: invalid_attributes }, as: :json
        }.to change(Sample, :count).by(0)
      end

      it "renders a JSON response with errors for the new sample" do
        post samples_url,
             params: { sample: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { FactoryBot.build(:sample_default) }

      it "updates the requested sample" do
        patch sample_url(sample),
              params: { sample: new_attributes }, headers: valid_headers, as: :json
        sample.reload
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the sample" do
        patch sample_url(sample),
              params: { sample: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the sample" do
        patch sample_url(sample),
              params: { sample: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested sample" do
      sample.save
      expect {
        delete sample_url(sample), headers: valid_headers, as: :json
      }.to change(Sample, :count).by(-1)
    end
  end
end
