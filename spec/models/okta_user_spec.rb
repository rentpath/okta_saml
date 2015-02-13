require_relative '../spec_helper'

describe OktaUser do
  describe '.retrieve_from_cookie' do
    context 'when remember_token parameter blank' do
      it 'returns nil' do
        expect(OktaUser.retrieve_from_cookie('')).to be_nil
      end
    end

    context 'when remember_token parameter nil' do
      it 'returns nil' do
        expect(OktaUser.retrieve_from_cookie(nil)).to be_nil
      end
    end
  end

  describe 'contains arbitrary attributes' do
    context 'when attributes are nil' do
      it 'returns nil' do
        expect(OktaUser.new({email: 'j@j.com', attributes: nil}).attributes).to be_nil
      end
    end

    context 'when attributes are not provided' do
      it 'returns nil' do
        expect(OktaUser.new({email: 'j@j.com'}).attributes).to be_nil
      end
    end

    context 'when attributes are provided' do
      it 'returns the same attributes' do
        attrs = {first_name: 'John', last_name: 'Doe'}
        expect(OktaUser.new({email: 'j@j.com', attributes: attrs}).attributes).to eq(attrs)
      end
    end
  end
end
