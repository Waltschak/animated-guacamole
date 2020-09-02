class UserPreferencesController < ApplicationController

    def update
        @user_preference = current_user.user_preference
        @user_preference.avatar_rendering_string = create_avatar(@user_preference.skin_tone)
            if @user_preference.update(preferences_params)
              if @user_preference.address_changed? || @user_preference.latitude_changed?
              @user_preference.city = Geocoder.search(@user_preference.address).first.city
               @user_preference.save
               puts "Geocoded City"
              end
              redirect_to dashboards_path, notice: 'Preferences were successfully updated.'
            else
              render :edit
            end
      end

    def edit
      @user_preference = current_user.user_preference
    end

    def create_avatar(skin_color)
      rendering_string = "<svg width='136px' height='104px' viewBox='0 0 136 104' version='1.1'><g id='Head/Front/Afro' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'><path d='M61,77.7068588 C72.4289379,77.7068588 76.5854974,64.0240838 83.0786187,56.5153483 C87.7243138,51.143002 95.6530795,52.7449442 98,45.2237762 C103.901542,26.3111237 88.1061086,13 67.5,13 C46.8938914,13 33,24.6742524 30,42.2237762 C27,59.7733 40.3938914,77.7068588 61,77.7068588 Z' id='Hair-Back' fill='#191847'></path><g id='Head' transform='translate(54.000000, 31.000000)' fill='**SKIN_COLOR**'><path d='M8.26227388,34.4901268 C3.65436435,29.0813759 0.535634794,22.4528771 1.05677633,15.0254539 C2.55833022,-6.37502057 32.3485306,-1.66718886 38.1433414,9.13393292 C43.9381521,19.9350547 43.249578,47.3329958 35.7603014,49.2634576 C32.7735882,50.033323 26.4110012,48.1474609 19.935372,44.244306 L24,73 L0,73 L8.26227388,34.4901268 Z'></path></g><path d='M72.379769,51.7233675 C71.5077737,51.2620302 70.5086201,51 69.4466684,51 C66.0464589,51 63.2900445,53.6862915 63.2900445,57 C63.2900445,58.3524891 63.749225,59.6004592 64.5239446,60.6039231 C63.0651901,63.0083834 62.0695832,65.5346814 61.7432388,68.1317726 C56.6870351,68.1317726 38.2335803,49 56.6167901,31 C75,13 101.566014,38.6959598 93.5831606,40.1945268 C88.9934286,41.0561261 79.7498479,45.4379083 72.3797716,51.7233656 Z' id='Hair' fill='#191847'></path></g></svg>"
      return rendering_string.gsub("**SKIN_COLOR**",@user_preference.skin_tone)
    end

  private

  def preferences_params
    params.require(:user_preference).permit(:city, :temp_br1, :temp_br2, :temp_br3, :temp_br4, :notification_time, :name, :avatar, :address, :skin_tone, :hairstyle ,:avatar_rendering_string)
  end
end
