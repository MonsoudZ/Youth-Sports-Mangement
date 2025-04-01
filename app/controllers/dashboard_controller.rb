class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @dashboard_data = {
      title: 'Dashboard',
      stats: collect_stats,
      roles: current_user.roles || []
    }
  end

  private

  def collect_stats
    stats = {}
    
    # If user has no roles, show basic stats
    if current_user.roles.empty?
      stats.merge!(
        total_users: User.count,
        total_teams: 0,
        total_facilities: 0
      )
      return stats
    end
    
    if current_user.has_role?('director')
      stats.merge!(
        total_users: User.count,
        total_teams: 0, # We'll add this later
        total_facilities: 0 # We'll add this later
      )
    end

    if current_user.has_role?('facility_admin')
      stats.merge!(
        total_facilities: 0, # We'll add this later
        active_events: 0, # We'll add this later
        total_users: User.count
      )
    end

    if current_user.has_role?('coach')
      stats.merge!(
        my_teams: 0, # We'll add this later
        upcoming_practices: 0, # We'll add this later
        total_players: 0 # We'll add this later
      )
    end

    if current_user.has_role?('parent')
      stats.merge!(
        my_children: 0, # We'll add this later
        upcoming_events: 0, # We'll add this later
        attendance: 0 # We'll add this later
      )
    end

    stats
  end
end
