From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH v2] ARM: dts: bugfix tqma7 soft reset issue
Date: Tue, 16 Apr 2019 11:08:05 +0200
Message-ID: <20190416090805.13166-1-bruno.thomsen@gmail.com>
References: <20190414120629.8912-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190414120629.8912-1-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, laa@kamstrup.com, festevam@gmail.com, s.hauer@pengutronix.de, clemens.ml@gmx.net, bruno.thomsen@gmail.com, ksc@kamstrup.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

Running reboot command on the TQMa7 board would just hang infinite
at the end of the system shutdown process.

Handling of i.MX7 errata e10574:
Watchdog: A watchdog timeout or software trigger will not reset the SOC.

Moved pinctrl from common mba7 to common tqma7 dtsi as it improves
readability of errata handling. Most integrators of this SoM will
likely use the development board as inspiration for handling this
SoC issue.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
v2:
Moved pinctrl from common development board to common SoM.
Removed Markus reviewed-by as he only acked the fsl,ext-reset-output part.

 arch/arm/boot/dts/imx7-mba7.dtsi  | 11 -----------
 arch/arm/boot/dts/imx7-tqma7.dtsi | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi b/arch/arm/boot/dts/imx7-mba7.dtsi
index 578341b6848b..50abf18ad30b 100644
--- a/arch/arm/boot/dts/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/imx7-mba7.dtsi
@@ -472,12 +472,6 @@
 			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x59
 		>;
 	};
-
-	pinctrl_wdog1: wdog1grp {
-		fsl,pins = <
-			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B	0x30
-		>;
-	};
 };
 
 &pwm1 {
@@ -554,8 +548,3 @@
 	no-1-8-v;
 	status = "okay";
 };
-
-&wdog1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wdog1>;
-};
diff --git a/arch/arm/boot/dts/imx7-tqma7.dtsi b/arch/arm/boot/dts/imx7-tqma7.dtsi
index 85fe461e5e67..9aaed85138cb 100644
--- a/arch/arm/boot/dts/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/imx7-tqma7.dtsi
@@ -209,6 +209,14 @@
 	};
 };
 
+&iomuxc_lpsr {
+	pinctrl_wdog1: wdog1grp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B	0x30
+		>;
+	};
+};
+
 &sdma {
 	status = "okay";
 };
@@ -228,5 +236,14 @@
 };
 
 &wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog1>;
+	/*
+	 * Errata e10574:
+	 * WDOG reset needs to run with WDOG_RESET_B signal enabled.
+	 * X1-51 (WDOG1#) signal needs carrier board handling to reset
+	 * TQMa7 on X1-22 (RESET_IN#).
+	 */
+	fsl,ext-reset-output;
 	status = "okay";
 };
-- 
2.20.1
