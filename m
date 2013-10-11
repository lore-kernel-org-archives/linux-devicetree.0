From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH v2 4/6] ARM: at91/dt: define sama5d3xek's main clk frequency
Date: Fri, 11 Oct 2013 14:43:34 +0200
Message-ID: <1381495416-15928-5-git-send-email-b.brezillon@overkiz.com>
References: <1381495416-15928-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381495416-15928-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Mike Turquette <mturquette@linaro.org>
Cc: Boris BREZILLON <b.brezillon@overkiz.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define the main clock frequency for the new main clock node
in sama5d3xcm.dtsi.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 arch/arm/boot/dts/sama5d3xcm.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d3xcm.dtsi b/arch/arm/boot/dts/sama5d3xcm.dtsi
index 726a0f3..dce5419 100644
--- a/arch/arm/boot/dts/sama5d3xcm.dtsi
+++ b/arch/arm/boot/dts/sama5d3xcm.dtsi
@@ -38,6 +38,12 @@
 			macb0: ethernet@f0028000 {
 				phy-mode = "rgmii";
 			};
+
+			pmc: pmc@fffffc00 {
+				main: mainck {
+					clock-frequency = <12000000>;
+				};
+			};
 		};
 
 		nand0: nand@60000000 {
-- 
1.7.9.5
