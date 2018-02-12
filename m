From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 0/3] misc: aspeed-lpc-ctrl fixes
Date: Mon, 12 Feb 2018 17:38:44 +1030
Message-ID: <20180212070847.32387-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ryan Chen <ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patches were developed when testing upstream Linux with OpenBMC on
Romulus. We need to ensure the LPC clock is enabled, now that the clock
driver turns off any unused clocks. We also need to enable the LPC
firmware cycles bit as we do not intend to upstream any mach-aspeed
hacks.

There was no existing binding document for the LPC host interface
controller, so I wrote one that includes the required clock description.

Joel Stanley (3):
  dt-bindings: aspeed-lpc: Document LPC Host Interface Controller
  misc: aspeed-lpc: Request and enable LPC clock
  misc: aspeed-lpc-ctrl: Enable FWH and A2H bridge cycles

 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 40 ++++++++++++++++++++
 drivers/misc/aspeed-lpc-ctrl.c                     | 44 +++++++++++++++++++---
 2 files changed, 79 insertions(+), 5 deletions(-)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
