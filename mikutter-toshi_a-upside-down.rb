

Plugin.create(:"mikutter-toshi_a-upside-down") {
  class Gdk::MiraclePainter < Gtk::Object
    alias :render_to_context_org :render_to_context

    def render_to_context(context)
      if message.user[:idname] == "toshi_a"
        context.rotate(Math::PI)
        context.translate(-width, -height)
      end

      render_to_context_org(context)
    end
  end
}
