require 'spec_helper'

describe Reservation do
  subject { create :reservation }

  it 'has appropriate fields' do
    should respond_to :table
    should respond_to :start_at
    should respond_to :end_at
  end

  describe 'validations' do
    context 'overbooking' do
      let!(:table) { '#25' }
      let!(:now) { Time.now }
      let!(:another_table) { '#15' }
      let!(:reservation) { create :reservation, table: table,
                                  start_at: now + 1.day + 4.hours,
                                  end_at: now + 1.day + 7.hours }

      context 'when has same table' do
        it 'is invalid when interlacing by time' do
          res1 = build :reservation, table: table,
                       start_at: now + 1.day + 2.hours,
                       end_at: now + 1.day + 5.hours
          expect(res1).not_to be_valid

          res2 = build :reservation, table: table,
                       start_at: now + 1.day + 6.hours,
                       end_at: now + 1.day + 8.hours
          expect(res2).not_to be_valid
        end

        it 'is invalid when included by time' do
          res1 = build :reservation, table: table,
                       start_at: now + 1.day + 5.hours,
                       end_at: now + 1.day + 6.hours
          expect(res1).not_to be_valid

          res2 = build :reservation, table: table,
                       start_at: now + 1.day + 2.hours,
                       end_at: now + 1.day + 8.hours
          expect(res2).not_to be_valid
        end

        it 'is valid when not interlacing and not included by time' do
          res1 = build :reservation, table: table,
                       start_at: now + 1.day + 2.hours,
                       end_at: now + 1.day + 3.hours
          expect(res1).to be_valid
        end

        it 'is valid when interlacing only by end-start xor start-and' do
          res1 = build :reservation, table: table,
                       start_at: now + 1.day + 2.hours,
                       end_at: now + 1.day + 4.hours
          expect(res1).to be_valid

          res2 = build :reservation, table: table,
                       start_at: now + 1.day + 7.hours,
                       end_at: now + 1.day + 8.hours
          expect(res2).to be_valid
        end
      end

      context 'when has different table' do
        it 'is valid' do
          res = build :reservation, table: another_table,
                      start_at: now + 1.day + 5.hours,
                      end_at: now + 1.day + 8.hours
          expect(res).to be_valid
        end
      end
    end
  end
end
