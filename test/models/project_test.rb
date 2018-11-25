require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'is not valid without name' do
    p = Project.create(
      name: nil,
      country: 'Colombia',
      city: 'Bogotá',
      neighborhood: 'Cedritos',
      address: 'calle 166 # 12 - 69',
      phone_number: '1234567890',
      description: 'Esto es un proyecto de pruebas',
      stratum: 4,
      activated: 1,
      sales_room_address: 'calle 92 # 16 - 60',
      sales_room_phone: '0987654321',
      sales_room_email: 'sales@test.com',
      estimated_start_date: '2018-12-20',
      estimated_end_date: '2020-04-12'
    )
    assert p.errors[:name].any?
    refute p.valid?
  end

  test 'not valid without country, city, neighborhood, address, phone_number, description, stratum' do
    p = Project.create(
      name: nil,
      country: nil,
      city: nil,
      neighborhood: nil,
      address: nil,
      phone_number: nil,
      description: nil,
      stratum: nil,
      activated: 1,
      sales_room_address: 'calle 92 # 16 - 60',
      sales_room_phone: '0987654321',
      sales_room_email: 'sales@test.com',
      estimated_start_date: '2018-12-20',
      estimated_end_date: '2020-04-12'
    )
    assert p.errors[:country].any?
    assert p.errors[:city].any?
    assert p.errors[:neighborhood].any?
    assert p.errors[:address].any?
    assert p.errors[:phone_number].any?
    assert p.errors[:description].any?
    assert p.errors[:stratum].any?
    refute p.valid?
  end

  test 'not valid with invalid sales_room_email' do
    p = Project.create(
      name: 'Proyecto de Pruebas',
      country: 'Colombia',
      city: 'Bogotá',
      neighborhood: 'Cedritos',
      address: 'calle 166 # 12 - 69',
      phone_number: '1234567890',
      description: 'Esto es un proyecto de pruebas',
      stratum: 4,
      activated: 1,
      sales_room_address: 'calle 92 # 16 - 60',
      sales_room_phone: '0987654321',
      sales_room_email: 'test@emailcom',
      estimated_start_date: '2018-12-20',
      estimated_end_date: '2020-04-12'
    )
    assert p.errors[:sales_room_email].any?
    assert p.errors[:sales_room_email], 'is not an email'
    refute p.valid?
  end
end
