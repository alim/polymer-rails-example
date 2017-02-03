module ApplicationHelper
  def include_polymer
    @polymer = true
    result = <<-EOF
    <script src='/assets/webcomponentsjs/webcomponents-lite.js'></script>
    EOF
    result.html_safe
  end

  def include_component(package: nil, component: nil)
    result = ''
    unless @polymer == true
      result = <<-EOF
      <script src='/assets/webcomponentsjs/webcomponents-lite.js'></script>
      EOF
      @polymer = true
    end

    result += <<-EOF
     <link rel='import' href='/assets/#{package}/#{component}.html'>
    EOF

    result.html_safe
  end
end
