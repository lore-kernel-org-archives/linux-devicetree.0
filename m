From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 11/11] ARM i.MX6q: Add LDB device to device tree
Date: Thu, 28 Mar 2013 16:23:35 +0100
Message-ID: <1364484215-13935-12-git-send-email-p.zabel@pengutronix.de>
References: <1364484215-13935-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1364484215-13935-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: linux-arm-kernel@lists.infradead.org
Cc: devel@driverdev.osuosl.org, Fabio Estevam <fabio.estevam@freescale.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, Martin Fuzzey <mfuzzey@parkeon.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sean Cross <xobs@kosagi.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Add ldb device tree node and clock lookups.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v2:
 - Removed clocks properties from imx6qdl.dtsi,
   those are to be set in imx6q.dtsi and imx6dl.
---
 arch/arm/boot/dts/imx6q.dtsi   | 17 +++++++++++++++++
 arch/arm/boot/dts/imx6qdl.dtsi | 26 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index cba021e..1a30227 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -294,3 +294,20 @@
 		};
 	};
 };
+
+&ldb {
+	clocks = <&clks 33>, <&clks 34>,
+		 <&clks 39>, <&clks 40>, <&clks 41>, <&clks 42>,
+		 <&clks 135>, <&clks 136>;
+	clock-names = "di0_pll", "di1_pll",
+		      "di0_sel", "di1_sel", "di2_sel", "di3_sel",
+		      "di0", "di1";
+
+	lvds-channel@0 {
+		crtcs = <&ipu1 0>, <&ipu1 1>, <&ipu2 0>, <&ipu2 1>;
+	};
+
+	lvds-channel@1 {
+		crtcs = <&ipu1 0>, <&ipu1 1>, <&ipu2 0>, <&ipu2 1>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 06ec460..dd5ef96 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -529,6 +529,26 @@
 				reg = <0x020e0000 0x38>;
 			};
 
+			ldb: ldb@020e0008 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,imx6q-ldb", "fsl,imx53-ldb";
+				gpr = <&gpr>;
+				status = "disabled";
+
+				lvds-channel@0 {
+					reg = <0>;
+					crtcs = <&ipu1 0>;
+					status = "disabled";
+				};
+
+				lvds-channel@1 {
+					reg = <1>;
+					crtcs = <&ipu1 1>;
+					status = "disabled";
+				};
+			};
+
 			dcic1: dcic@020e4000 {
 				reg = <0x020e4000 0x4000>;
 				interrupts = <0 124 0x04>;
-- 
1.8.2.rc2
