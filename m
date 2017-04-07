From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v2 0/4] gpio: aspeed: Add debounce support
Date: Fri,  7 Apr 2017 22:28:58 +0930
Message-ID: <20170407125902.15960-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

v2 of the Aspeed GPIO debounce patch expands it out into a series, resolving a
lack of devicetree binding documentation updates in the initial send, and
completely reworking the debounce timer use tracking for space efficiency.

I do wonder whether there's a more acceptable way to track the use of the
timers than what I've got, but it at least works.

The rework was largely an effort to resolve Joel's review of v1, in the absence
of any other feedback.

Cheers,

Andrew

In v2:
* Update devicetree bindings documentation
* Address Joel's comments

Andrew Jeffery (4):
  gpio: aspeed: dt: Fix description alignment in bindings document
  gpio: aspeed: dt: Add optional clocks property
  gpio: aspeed: Add debounce support
  gpio: aspeed: Add open-source and open-drain support

 .../devicetree/bindings/gpio/gpio-aspeed.txt       |   3 +-
 drivers/gpio/gpio-aspeed.c                         | 285 ++++++++++++++++++++-
 2 files changed, 282 insertions(+), 6 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
