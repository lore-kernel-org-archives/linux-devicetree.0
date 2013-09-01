From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH v3 6/7] ARM: dts: imx27 phycore pinctrl
Date: Sun,  1 Sep 2013 09:28:07 +0200
Message-ID: <1378020488-21129-7-git-send-email-mpa@pengutronix.de>
References: <1378020488-21129-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378020488-21129-1-git-send-email-mpa@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Markus Pargmann <mpa@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable pinctrl for phycore devices.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts | 2 ++
 arch/arm/boot/dts/imx27-phytec-phycore-som.dts | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts b/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
index 0fc6551..9bedd2f 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
@@ -33,6 +33,8 @@
 
 &uart2 {
 	fsl,uart-has-rtscts;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2_1 &pinctrl_uart2_rtscts_1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-som.dts b/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
index aa70ad7..23a9c24 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
@@ -120,11 +120,15 @@
 
 &fec {
 	phy-reset-gpios = <&gpio3 30 0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1_1>;
 	status = "okay";
 };
 
 &i2c2 {
 	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2_1>;
 	status = "okay";
 
 	at24@52 {
@@ -151,6 +155,8 @@
 };
 
 &uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1_1 &pinctrl_uart1_rtscts_1>;
 	status = "okay";
 };
 
-- 
1.8.4.rc3
