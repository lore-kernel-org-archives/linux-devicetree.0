From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 09/10] clk: iproc: define Broadcom NSP iProc clock binding
Date: Thu, 15 Oct 2015 15:48:32 -0400
Message-ID: <1444938513-10758-10-git-send-email-jonmason@broadcom.com>
References: <1444938513-10758-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444938513-10758-1-git-send-email-jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the device tree bindings for Broadcom Northstar Plus
architecture based clock controller

Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../bindings/clock/brcm,iproc-clocks.txt           | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
index da8d9bb..b3c3e9d 100644
--- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
@@ -130,3 +130,33 @@ These clock IDs are defined in:
     ch3_unused mipipll          4       BCM_CYGNUS_MIPIPLL_CH3_UNUSED
     ch4_unused mipipll          5       BCM_CYGNUS_MIPIPLL_CH4_UNUSED
     ch5_unused mipipll          6       BCM_CYGNUS_MIPIPLL_CH5_UNUSED
+
+Northstar and Northstar Plus
+------
+PLL and leaf clock compatible strings for Northstar and Northstar Plus are:
+ "brcm,nsp-armpll"
+ "brcm,nsp-genpll"
+ "brcm,nsp-lcpll0"
+
+The following table defines the set of PLL/clock index and ID for Northstar and
+Northstar Plus.  These clock IDs are defined in:
+    "include/dt-bindings/clock/bcm-nsp.h"
+
+    Clock	Source		Index	ID
+    ---		-----		-----	---------
+    crystal	N/A		N/A	N/A
+
+    armpll	crystal		N/A	N/A
+
+    genpll	crystal		0	BCM_NSP_GENPLL
+    phy		genpll		1	BCM_NSP_GENPLL_PHY_CLK
+    ethernetclk	genpll		2	BCM_NSP_GENPLL_ENET_SW_CLK
+    usbclk	genpll		3	BCM_NSP_GENPLL_USB_PHY_REF_CLK
+    iprocfast	genpll		4	BCM_NSP_GENPLL_IPROCFAST_CLK
+    sata1	genpll		5	BCM_NSP_GENPLL_SATA1_CLK
+    sata2	genpll		6	BCM_NSP_GENPLL_SATA2_CLK
+
+    lcpll0	crystal		0	BCM_NSP_LCPLL0
+    pcie_phy	lcpll0		1	BCM_NSP_LCPLL0_PCIE_PHY_REF_CLK
+    sdio	lcpll0		2	BCM_NSP_LCPLL0_SDIO_CLK
+    ddr_phy	lcpll0		3	BCM_NSP_LCPLL0_DDR_PHY_CLK
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
