From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [RESEND PATCH 0/2] Fix clock name in Aspeed GPIO bindings and driver
Date: Tue,  8 Aug 2017 15:46:32 +0930
Message-ID: <20170808061634.11857-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Resending to fix Ryan's email address. I think I'll step away from computers
now.

Hello,

Joel discovered I brain-farted the referenced clock name in the patches
introducing the debounce capability for the Aspeed driver. The datasheet says
PCLK but I wrote HPLL for whatever reason, so clean up that mistake by simply
removing references to HPLL and put the onus on the devicetree author to
get it right.

Cheers,

Andrew

Andrew Jeffery (2):
  dt-bindings: gpio: aspeed: Remove reference to clock name
  gpio: aspeed: Remove reference to clock name in debounce warning
    message

 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 2 +-
 drivers/gpio/gpio-aspeed.c                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
