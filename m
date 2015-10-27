From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 1/3] clk: iproc: Extend binding to cover BCM63138
Date: Mon, 26 Oct 2015 20:53:15 -0700
Message-ID: <1445917997-3629-2-git-send-email-f.fainelli@gmail.com>
References: <1445917997-3629-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1445917997-3629-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, sboyd@codeaurora.org, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Broadcom BCM63138 DSL SoCs have the same ARMPLL clocking infrastructure
as the Cygnus and iProc chips, add a dedicated compatible string and
document that the ARMPLL node is a valid node for this chip.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
No changes in v2

 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
index ede65a55e21b..0b35e71b39e8 100644
--- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
@@ -208,3 +208,8 @@ These clock IDs are defined in:
     ch3_unused	lcpll_ports	4	BCM_NS2_LCPLL_PORTS_CH3_UNUSED
     ch4_unused	lcpll_ports	5	BCM_NS2_LCPLL_PORTS_CH4_UNUSED
     ch5_unused	lcpll_ports	6	BCM_NS2_LCPLL_PORTS_CH5_UNUSED
+
+BCM63138
+--------
+PLL and leaf clock compatible strings for BCM63138 are:
+    "brcm,bcm63138-armpll"
-- 
2.1.0

