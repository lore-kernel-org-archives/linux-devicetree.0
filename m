From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/10] clk: iproc: add support for BCM NS, NSP, and NS2
Date: Fri, 2 Oct 2015 18:57:35 -0400
Message-ID: <1443826665-17570-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for the Broadcom Northstar, Northstar
Plus, and Northstar 2 clocks.  Some slight modifications were necessary
to clk-iproc-pll to get Northstar and Northstar Plus working, due to
differences in register layout.  This is the reason why the first patch
is necessary.  Some more modifications were necessary to clk-iproc-pll
to get Northstar 2 working, due to differences in register layout (and
resulting fallout in Cygnus and NSP).  This is the reason why the sixth
and seventh patches are necessary.  The fifth patch is clean-up to
prevent accidentally forgetting to adjust for the base write errata
(which happened a few times, but was caught in internal review).

There is a potential merge "race" between the device tree changes and
the clk changes.  If the device tree changes go in before the clk
changes, there is a window where there are non-working clk entries in
the device tree.  So, it makes the most sense for this series to be
pulled into the clk maintainer's tree solely.  

Also, the Northstar Plus device tree modifications were left out of this
series due to potential complications with the merging of this series.
Northstar Plus was recently accepted, and only exists in Florian's tree.
This would cause merge issues in the clk tree.  So, the NSP device tree
changes will be submitted at a later date.

Thanks,
Jon


 .../bindings/clock/brcm,iproc-clocks.txt           |  78 ++++++
 arch/arm/boot/dts/bcm5301x.dtsi                    |  67 ++++-
 arch/arm64/Kconfig.platforms                       |   1 +
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |  81 ++++++
 drivers/clk/Makefile                               |   3 +-
 drivers/clk/bcm/Makefile                           |   3 +
 drivers/clk/bcm/clk-cygnus.c                       |  17 +-
 drivers/clk/bcm/clk-iproc-pll.c                    | 183 +++++++------
 drivers/clk/bcm/clk-iproc.h                        |  22 +-
 drivers/clk/bcm/clk-ns2.c                          | 290 +++++++++++++++++++++
 drivers/clk/bcm/clk-nsp.c                          | 143 ++++++++++
 include/dt-bindings/clock/bcm-ns2.h                |  72 +++++
 include/dt-bindings/clock/bcm-nsp.h                |  51 ++++
 13 files changed, 918 insertions(+), 93 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
