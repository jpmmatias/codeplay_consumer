require 'rails_helper'

describe 'Enrollments' do
  it 'view all enrollments' do
    allow(Faraday).to receive(:get).and_return(
      instance_double(
        Faraday::Response,
        status: 200,
        body: File.read(Rails.root.join('spec/fixtures/enrollments.json'))
      )
    )

    visit root_path
    click_on('Inscrições')

    expect(page).to have_content('jane.doe@codeplay.com')
    expect(page).to have_content('EExvNVfMX6qgvxrMCDMb')
    expect(page).to have_content('10.0')
  end
end
