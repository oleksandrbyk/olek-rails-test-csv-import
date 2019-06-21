class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone, :errors

  def errors
    object.errors.full_messages.join(', ')
  end
end
