From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/3] clk: Broadcom BCM63138 support
Date: Tue, 27 Oct 2015 16:56:14 -0700
Message-ID: <1445990177-27474-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series adds support for the Broadcom BCM63138 DSL SoCs
clocking framework.

Since the HW is identical to the one found in Broadcom iProc SoCs, but the
integration is different (obviously), there is still a new compatible string
introduced just in case we happen to find issues in the future.

This applies on top of clk/next as of
679c51cffc3b316bd89ecc91ef92603dd6d4fc68 ("clk: Add stubs for of_clk_*() APIs when CONFIG_OF=n")

Since there is an obvious dependency between patch 2 and 3, we can either
merge this through the Clock tree or via a future arm-soc pull requests
for Broadcom SoCs.

Florian Fainelli (3):
  clk: iproc: Extend binding to cover BCM63138
  clk: bcm: Add BCM63138 clock support
  ARM: dts: BCM63xx: Add ARMPLL device tree nodes

 .../bindings/clock/brcm,iproc-clocks.txt           |  5 +++
 arch/arm/boot/dts/bcm63138.dtsi                    | 39 ++++++++++++++++------
 drivers/clk/bcm/Kconfig                            | 10 ++++++
 drivers/clk/bcm/Makefile                           |  1 +
 drivers/clk/bcm/clk-bcm63xx.c                      | 22 ++++++++++++
 5 files changed, 67 insertions(+), 10 deletions(-)
 create mode 100644 drivers/clk/bcm/clk-bcm63xx.c

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
