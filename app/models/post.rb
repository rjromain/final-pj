class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy 
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true 
	 # # [..]
 
  #   protected
 
  #   def generate_body_html
	 #    return if body.blank?
	 #    	markdown = Redcarpet::Markdown.new(
		#       Redcarpet::Render::HTML.new(:hard_wrap => true),
		#       :no_intra_emphasis => true,
		#       :autolink => true,
		#       :fenced_code_blocks => true)
	 
	 #    	self.body_html = Redcarpet::Render::SmartyPants.render(
	 #     	 SyntaxHighlighter.new(markdown.render(body)).to_s)
	 # end

end
