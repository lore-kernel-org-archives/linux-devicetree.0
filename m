From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 4/5] ARM: dts: imx: Remove #address/#size-cells from stmpe
 nodes
Date: Mon, 23 Apr 2018 10:46:13 -0300
Message-ID: <1524491174-16878-4-git-send-email-festevam@gmail.com>
References: <1524491174-16878-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524491174-16878-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

Remove unnecessary #address-cells/#size-cells to fix the following
DTC warnings:

arch/arm/boot/dts/imx6q-novena.dtb: Warning (avoid_unnecessary_addr_size): /soc/aips-bus@2100000/i2c@21a0000/stmpe811@44: unnecessary #address-cells/#size-cells without "ranges" or child "reg"

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 arch/arm/boot/dts/imx53-m53.dtsi       | 2 --
 arch/arm/boot/dts/imx6q-novena.dts     | 2 --
 arch/arm/boot/dts/imx6qdl-apalis.dtsi  | 2 --
 arch/arm/boot/dts/imx6qdl-colibri.dtsi | 2 --
 arch/arm/boot/dts/imx6ul-isiot.dtsi    | 2 --
 5 files changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-m53.dtsi b/arch/arm/boot/dts/imx53-m53.dtsi
index 3da6dd5..ce45f08 100644
--- a/arch/arm/boot/dts/imx53-m53.dtsi
+++ b/arch/arm/boot/dts/imx53-m53.dtsi
@@ -53,8 +53,6 @@
 
 	stmpe610@41 {
 		compatible = "st,stmpe610";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0x41>;
 		id = <0>;
 		blocks = <0x5>;
diff --git a/arch/arm/boot/dts/imx6q-novena.dts b/arch/arm/boot/dts/imx6q-novena.dts
index 52f3937..fcd824d 100644
--- a/arch/arm/boot/dts/imx6q-novena.dts
+++ b/arch/arm/boot/dts/imx6q-novena.dts
@@ -268,8 +268,6 @@
 	touch: stmpe811@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		irq-gpio = <&gpio5 13 GPIO_ACTIVE_HIGH>;
 		id = <0>;
 		blocks = <0x5>;
diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index 8206683..64fbee6 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -331,8 +331,6 @@
 		compatible = "st,stmpe811";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch_int>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0x41>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
index e4eb300..76035db 100644
--- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
@@ -262,8 +262,6 @@
 		compatible = "st,stmpe811";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch_int>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0x41>;
 		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio6>;
diff --git a/arch/arm/boot/dts/imx6ul-isiot.dtsi b/arch/arm/boot/dts/imx6ul-isiot.dtsi
index 921e12c..cd99285 100644
--- a/arch/arm/boot/dts/imx6ul-isiot.dtsi
+++ b/arch/arm/boot/dts/imx6ul-isiot.dtsi
@@ -153,8 +153,6 @@
 	stmpe811: gpio-expander@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_stmpe>;
 		interrupt-parent = <&gpio1>;
-- 
2.7.4
