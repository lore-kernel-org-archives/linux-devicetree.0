From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH 0/4] pinctrl: Add USB support for Aspeed SoCs
Date: Tue, 27 Jun 2017 11:42:10 +0930
Message-ID: <20170627021214.23323-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

With recent interest in the USB virtual hub in the Aspeed SoCs[1] it is a good
time to add pinmux support for the USB ports and controllers. The earlier
series of pinmux patches for the Aspeed SoCs focussed on supporting pins which
were capable of GPIO. This is not the case for the USB pins, hence they have
been unsupported until now.

Rob: I know you've mentioned previously you desired complete bindings to be
provided up front, so apologies for continuing to add functionality. This looks
to be the last of it.

Cheers,

Andrew

[1] https://www.spinics.net/lists/linux-usb/msg158506.html

Andrew Jeffery (4):
  ARM: aspeed: g4: Add USB functions to pinctrl bindings
  ARM: aspeed: g5: Add USB functions to pinctrl bindings
  pinctrl: aspeed: g4: Add USB device and host support
  pinctrl: aspeed: g5: Add USB device and host support

 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  8 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 66 +++++++++++++++++++---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 58 ++++++++++++++++++-
 3 files changed, 121 insertions(+), 11 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
