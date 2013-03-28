From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 10/11] ARM i.MX53: Add LDB device to device tree
Date: Thu, 28 Mar 2013 16:23:34 +0100
Message-ID: <1364484215-13935-11-git-send-email-p.zabel@pengutronix.de>
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
Cc: devel@driverdev.osuosl.org, Fabio Estevam <fabio.estevam@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, Martin Fuzzey <mfuzzey@parkeon.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sean Cross <xobs@kosagi.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm/boot/dts/imx53.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index b07bbdcc..30aed40 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -511,6 +511,33 @@
 				reg = <0x53fa8000 0xc>;
 			};
 
+			ldb: ldb@53fa8008 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,imx53-ldb";
+				reg = <0x53fa8008 0x4>;
+				gpr = <&gpr>;
+				clocks = <&clks 122>, <&clks 120>,
+					 <&clks 115>, <&clks 116>,
+					 <&clks 123>, <&clks 85>;
+				clock-names = "di0_pll", "di1_pll",
+					      "di0_sel", "di1_sel",
+					      "di0", "di1";
+				status = "disabled";
+
+				lvds-channel@0 {
+					reg = <0>;
+					crtcs = <&ipu 0>;
+					status = "disabled";
+				};
+
+				lvds-channel@1 {
+					reg = <1>;
+					crtcs = <&ipu 1>;
+					status = "disabled";
+				};
+			};
+
 			pwm1: pwm@53fb4000 {
 				#pwm-cells = <2>;
 				compatible = "fsl,imx53-pwm", "fsl,imx27-pwm";
-- 
1.8.2.rc2
