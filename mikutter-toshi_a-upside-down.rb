

Plugin.create(:"mikutter-toshi_a-upside-down") {
  class Gdk::MiraclePainter < Gtk::Object
    alias :render_to_context_org :render_to_context

    def render_to_context(context)
      if message.user[:idname] =~ /toshi_a.*/ && !message[:teoku_nai]
        context.rotate(Math::PI)
        context.translate(-width, -height)
      end

      render_to_context_org(context)
    end
  end

  command(:teokurete_nai_nintei,
          :name => _("逆さまにする"),
          :condition => lambda { |opt| Plugin::Command[:HasMessage] && opt.messages[0].user[:idname] =~ /toshi_a.*/ },
          :visible => true,
          :role => :timeline) { |opt|
    widget = Plugin[:gtk].widgetof(opt.widget)

    opt.messages[0][:teoku_nai] = !opt.messages[0][:teoku_nai]

    widget.modified(opt.messages[0])
  }
}
