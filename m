From: Adrian Alonso <aalonso@freescale.com>
Subject: [PATCH v4 8/8] pinctrl: freescale: imx: imx7d iomuxc-lpsr devicetree
 bindings
Date: Fri, 18 Sep 2015 11:29:58 -0500
Message-ID: <1442593798-11501-8-git-send-email-aalonso@freescale.com>
References: <1442593798-11501-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1442593798-11501-1-git-send-email-aalonso@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: devicetree@vger.kernel.org, Frank.Li@freescale.com, nitin.garg@freescale.com, Anson.Huang@freescale.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, yibin.gong@freescale.com
List-Id: devicetree@vger.kernel.org

Add iomuxc-lpsr devicetree bindings documentation
Provide documentation context as well an example on
pheriperals that could use pad from either iomuxc controller
supported by iMX7D SoC

Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
Changes for V2: New patch on imx7d iomuxc-lpsr patch series
Changes for V3: Add shared input select register notes
Changes for V4: Resend

 .../bindings/pinctrl/fsl,imx7d-pinctrl.txt         | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
index 8bbf25d..19697bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
@@ -1,10 +1,33 @@
 * Freescale i.MX7 Dual IOMUX Controller
 
+iMX7D supports two iomuxc controllers, fsl,imx7d-iomuxc controller is similar
+as previous iMX SoC generation and fsl,imx7d-iomuxc-lpsr which provides low
+power state rentetion capabilities on gpios that are part of iomuxc-lpsr
+(GPIO1_IO7..GPIO1_IO0). While iomuxc-lpsr provides its own set of registers for
+mux and pad control settings it shares the input select register from iomuxc
+for daisy chain settings, the input-sel phandle and SHARE_INPUT_SELECT_REG flag
+extends fsl,imx-pinctrl driver to support iomuxc-lpsr controller.
+
+iomuxc_lpsr: iomuxc-lpsr@302c0000 {
+	compatible = "fsl,imx7d-iomuxc-lpsr";
+	reg = <0x302c0000 0x10000>;
+	input-sel = <&iomuxc>;
+};
+
+iomuxc: iomuxc@30330000 {
+	compatible = "fsl,imx7d-iomuxc";
+	reg = <0x30330000 0x10000>;
+};
+
+Pheriparials using pads from iomuxc-lpsr support low state retention power
+state, under LPSR mode GPIO's state of pads are retain.
+
 Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
 and usage.
 
 Required properties:
 - compatible: "fsl,imx7d-iomuxc"
+- compatible: "fsl,imx7d-iomuxc-lpsr"
 - fsl,pins: each entry consists of 6 integers and represents the mux and config
   setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
   input_val> are specified using a PIN_FUNC_ID macro, which can be found in
@@ -25,3 +48,37 @@ PAD_CTL_DSE_X1                  (0 << 0)
 PAD_CTL_DSE_X2                  (1 << 0)
 PAD_CTL_DSE_X3                  (2 << 0)
 PAD_CTL_DSE_X4                  (3 << 0)
+
+Examples:
+While iomuxc-lpsr is intended to be used by dedicated peripherals to take
+advantages of LPSR power mode, is also possible that an IP to use pads from
+any of the iomux controllers. For example the I2C1 IP can use SCL pad from
+iomuxc-lpsr controller and SDA pad from iomuxc controller as:
+
+i2c1: i2c@30a20000 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1_1 &pinctrl_i2c1_2>;
+	status = "okay";
+};
+
+iomuxc-lpsr@302c0000 {
+	compatible = "fsl,imx7d-iomuxc-lpsr";
+	reg = <0x302c0000 0x10000>;
+
+	pinctrl_i2c1_1: i2c1grp-1 {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO04__I2C1_SCL 0x4000007f
+		>;
+	};
+};
+
+iomuxc@30330000 {
+	compatible = "fsl,imx7d-iomuxc";
+	reg = <0x30330000 0x10000>;
+
+	pinctrl_i2c1_2: i2c1grp-2 {
+		fsl,pins = <
+			MX7D_PAD_I2C1_SCL__I2C1_SCL 0x4000007f
+		>;
+	};
+};
-- 
2.1.4
