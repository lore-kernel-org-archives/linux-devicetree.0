From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v3 0/5] pinctrl: mcp32s08: add open drain config for irq
Date: Tue, 21 Nov 2017 16:21:26 +0800
Message-ID: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a continuation of patch 4/5/6 from my previous series 
"gpio: mcp23s08: add support for mcp23018"
The other patches from that series having already been applied.

Hopefully I've address all of Linus's concerns.
Wasn't too sure on how to handle the depcrated property documentation.

Changes from v2:
- Use standard 'drive-open-drain' for irq output configuration
- deprecate 'microchip,irq-active-high' property and extract
  the irq polarity from the 'interrupts' property.
- 'microchip,irq-active-high' property is now ignored except
  for a warning if the property exists. 
  This is probably safe as the 'interrupts' property is most 
  likely setup correctly. 


Phil Reid (5):
  pinctrl: mcp23s08: remove hard coded irq polarity in irq_setup
  dt-bindings: pinctrl: mcp23s08: add documentation for drive-open-drain
  pinctrl: mcp23s08: add open drain configuration for irq output
  pinctrl: mcp23s08: configure irq polarity using irq data
  dt-bindings: pinctrl: deprecate 'microchip,irq-active-high' property

 .../bindings/pinctrl/pinctrl-mcp23s08.txt          |  6 +++--
 drivers/pinctrl/pinctrl-mcp23s08.c                 | 28 ++++++++++++----------
 2 files changed, 20 insertions(+), 14 deletions(-)

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
