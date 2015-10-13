From: Jon Mason <jonmason@broadcom.com>
Subject: [RFC 1/5] clk: iproc: define Broadcom NSP iProc clock binding
Date: Tue, 13 Oct 2015 17:22:23 -0400
Message-ID: <1444771347-11382-2-git-send-email-jonmason@broadcom.com>
References: <1444771347-11382-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444771347-11382-1-git-send-email-jonmason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Document the device tree bindings for Broadcom Northstar Plus
architecture based clock controller

Signed-off-by: Jon Mason <jonmason@broadcom.com>
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
