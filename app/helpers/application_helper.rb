require 'redcarpet'
module ApplicationHelper


	 def markdown(text)
	     options = {
      	filter_html:     true,
      	hard_wrap:       true, 
      	link_attributes: { rel: 'nofollow', target: "_blank" },
     	space_after_headers: true, 
      	fenced_code_blocks: true
    	}

    	extensions = {
      	autolink:           true,
      	superscript:        true,
      	disable_indented_code_blocks: true
    	}
    	renderer = Redcarpet::Render::HTML.new(options)
		markdown = Redcarpet::Markdown.new(HTMLwithPygments, fenced_code_blocks: true)
		markdown.render(text).html_safe
		# syntax_highlighter(Redcarpet::Markdown.new(text, options).to_html).html_safe
	end

# # 	def markdown(text)
# # 	  # options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
# # 	  # syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
# # 	end

# # # 	def syntax_highlighter(html)
# # # 	  doc = Nokogiri::HTML(html)
# # # 	  doc.search("//pre[@lang]").each do |pre|
# # # 	    pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
# # #     end
# # # 	  doc.to_s
# 	end

class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end
end
end 