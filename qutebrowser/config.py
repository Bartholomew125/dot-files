config.load_autoconfig()
config.set('content.user_stylesheets', ['~/.config/qutebrowser/css/transparent.css'])

c.tabs.position = "top"
c.auto_save.session = True
c.fonts.default_family = "Noto Color Emoji, sans-serif"

PURPLE = "rgba(215,137,255,0.8)"
TRANSLUCENT = "rgba(0,0,0,0)"

# As transparent as can be
c.colors.statusbar.normal.bg = TRANSLUCENT
c.colors.statusbar.command.bg = "rgba(0,0,0,0.5)"
c.colors.completion.category.bg = "rgba(0,0,0,0.8)"
c.colors.completion.category.fg = PURPLE
c.colors.completion.even.bg = "rgba(0,0,0,0.7)"
c.colors.completion.odd.bg = "rgba(100,100,100,0.2)"
c.colors.completion.item.selected.bg = PURPLE
c.colors.completion.item.selected.fg = "rgb(255,255,255)"
c.colors.completion.item.selected.border.bottom = "rgba(255,255,255,1)"
c.colors.completion.item.selected.border.top = "rgba(255,255,255,1)"
c.colors.completion.item.selected.match.fg = "rgba(0,0,0,1)"
c.colors.completion.scrollbar.bg = TRANSLUCENT
c.colors.completion.scrollbar.fg = PURPLE
c.colors.tabs.bar.bg = TRANSLUCENT
c.colors.tabs.odd.bg = TRANSLUCENT
c.colors.tabs.even.bg = TRANSLUCENT
c.colors.tabs.selected.even.bg = PURPLE
c.colors.tabs.selected.odd.bg = PURPLE
c.colors.webpage.bg = TRANSLUCENT

