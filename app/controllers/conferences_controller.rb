class ConferencesController < InheritedResources::Base

  private

    def conference_params
      params.require(:conference).permit(:image, :description, :created_at)
    end
end

