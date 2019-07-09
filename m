From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 04/10] ARM: dts: imx6ul: segin: Fix LED naming for phyCORE and
 PEB-EVAL-01
Date: Tue, 9 Jul 2019 09:19:21 +0200
Message-ID: <1562656767-273566-5-git-send-email-s.riedmueller@phytec.de>
References: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, martyn.welch@collabora.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fix node name for the user LEDs to prevent the pinctrl of the phyCORE's
leds node from being overwritten. Also use more generic names for user
LEDs.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi       |  3 +--
 arch/arm/boot/dts/imx6ul-phytec-segin-peb-eval-01.dtsi | 16 +++++++++-------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
index 1b745582911c..73266b4a889b 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-phycore-som.dtsi
@@ -31,8 +31,7 @@
 		pinctrl-0 = <&pinctrl_gpioleds_som>;
 		compatible = "gpio-leds";
 
-		led_green {
-			label = "phycore:green";
+		phycore-green {
 			gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin-peb-eval-01.dtsi b/arch/arm/boot/dts/imx6ul-phytec-segin-peb-eval-01.dtsi
index e2f38f39a6ad..2f3fd32a1167 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-segin-peb-eval-01.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin-peb-eval-01.dtsi
@@ -21,20 +21,22 @@
 		};
 	};
 
-	user_leds: leds {
+	user_leds: user-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_user_leds>;
 		status = "disabled";
 
-		led_yellow {
-			gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "default-on";
+		user-led1 {
+			gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "gpio";
+			default-state = "on";
 		};
 
-		led_red {
-			gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "default-on";
+		user-led2 {
+			gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "gpio";
+			default-state = "on";
 		};
 	};
 };
-- 
2.7.4
