From: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Subject: [RFC 0/9] Allow modifications of specific clocks via DT and more
Date: Tue, 19 Jan 2016 14:51:31 +0000
Message-ID: <1453215100-2382-1-git-send-email-kernel@martin.sperl.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>

This patch series (which requires the patch-series-v4 of
"clk: bcm2835: add clocks and add MASH support") allows to configure
specific aspects (mostly with regards to clock selection) of individual
clocks to get configured via the device-tree.

Also - for debug purposes - a patch has been added that exposes the
raw clock registers read-only via debugfs.

Martin Sperl (9):
  clk: bcm2835: add basic device tree support for per clock settings
  clk: bcm2835: add support for parent selection in DT
  clk: bcm2835: add ability to control mash level via device-tree
  clk: bcm2835: reorganize bcm2835_clock_determine_rate
  clk: bcm2835: prefer clocks that use integer dividers
  clk: bcm2835: allow to define a minimum fractional divider in DT
  clk: bcm2835: allow clock choosing mechanims to be selected in DT
  dt-bindings: bcm2835: document optional per clock dt-nodes
  clk: bcm2835: expose raw clock-registers via debugfs

 .../bindings/clock/brcm,bcm2835-cprman.txt         |   33 ++
 drivers/clk/bcm/clk-bcm2835.c                      |  508 ++++++++++++++++++--
 include/dt-bindings/clock/bcm2835.h                |   15 +
 3 files changed, 512 insertions(+), 44 deletions(-)

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
