From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v2 0/4] pinctrl: aspeed: Add initial pinconf support
Date: Fri,  7 Apr 2017 22:27:09 +0930
Message-ID: <20170407125713.15678-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

v2 breaks the pinconf patch for the Aspeed pin controller out into a series,
adding explicit documentation to the devicetree bindings and breaking out
changes to the core from those to the SoC drivers.

The changes also address review comments from Joel.

Cheers,

Andrew

Andrew Jeffery (4):
  pinctrl: aspeed: Document pinconf in devicetree bindings
  pinctrl: aspeed: Add core pinconf support
  pinctrl: aspeed: g4: Add pinconf support
  pinctrl: aspeed: g5: Add pinconf support

 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  40 +++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 117 +++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 153 ++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            | 211 +++++++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  28 +++
 5 files changed, 538 insertions(+), 11 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
