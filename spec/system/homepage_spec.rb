require 'rails_helper'

describe 'Homepage' do
  it 'view codeplay courses' do
    allow(Faraday).to receive(:get).and_return(
      instance_double(Faraday::Response, status: 200, 
                                         body: File.read(Rails.root.join('spec/fixtures/courses.json')))
    )
    visit root_path

    expect(page).to have_content('Ruby')
    expect(page).to have_content('Um curso de Ruby')
    expect(page).to have_content('John Doe')
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('Um curso de Ruby on Rails')
    expect(page).to have_content('Jane Doe')
  end

  it 'view codeplay courses' do
    allow(Faraday).to receive(:get)
    .and_raise(Faraday::ConnectionFailed, nil)

    visit root_path

    expect(page).to have_content('Site temporariamente indisponível')
  end
end