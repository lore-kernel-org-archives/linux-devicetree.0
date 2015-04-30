From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] clk: si5351: Some fixes
Date: Thu, 30 Apr 2015 19:45:50 +0200
Message-ID: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Russell King <rmk+linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

For Si5351 clock driver, Michael Welling and Jean-Francois Moine reported
issues with recent v4.x kernels due to broken/missing/wrong parent clock
claming. This patch set now deals with the issues reported.

Patch 1 amends the binding documentation mention clock-names property
for the "xtal" and "clkin" parent clock inputs of Si5351 variants.

Patch 2 adds the clock-names property for the SolidRun CuBox using Si5351
with a fixed oscillator connected to "xtal" input.

Patch 3 reworks the way we claim parent clocks by using devm_clk_get()
for both DT and platform_data based registration. Also, properly check
for errors returned by devm_clk_get() and prepare/enable the parent clocks.

Patch 4 introduces a function to reset PLLs on rate change. This should
improve generated clock output stability. I currently have no scope at hand
to actually test that properly, so there may be more issues remaining.

@Michael, Jean-Francois: Please test and report if there are still
issues remaining.

Sebastian

Sebastian Hesselbarth (4):
  clk: si5351: Mention clock-names in the binding documentation
  ARM: dove: Add clock-names to CuBox Si5351 clk generator
  clk: si5351: Do not pass struct clk in platform_data
  clk: si5351: Reset PLL after rate change

 .../devicetree/bindings/clock/silabs,si5351.txt    |  4 +-
 arch/arm/boot/dts/dove-cubox.dts                   |  1 +
 drivers/clk/clk-si5351.c                           | 87 +++++++++++++++++-----
 include/linux/platform_data/si5351.h               |  4 -
 4 files changed, 73 insertions(+), 23 deletions(-)

---
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>
Cc: Russell King <rmk+linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
