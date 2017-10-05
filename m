From: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
Subject: [PATCH] dt-bindings: pinctrl: Move mcp23s08 from gpio
Date: Thu,  5 Oct 2017 09:50:02 +0200
Message-ID: <20171005075002.9901-1-poeschel@lemonage.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The mcp23s08 driver was moved from gpio to pinctrl. This moves it's
devicetree binding doc as well. So driver and binding doc are in sync
again.

Signed-off-by: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
---
 .../bindings/{gpio/gpio-mcp23s08.txt => pinctrl/pinctrl-mcp23s08.txt}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{gpio/gpio-mcp23s08.txt => pinctrl/pinctrl-mcp23s08.txt} (100%)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
similarity index 100%
rename from Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
rename to Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
