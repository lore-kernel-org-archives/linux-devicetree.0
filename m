From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
Subject: [PATCH] ARM: dts: vf-colibri-eval-v3: Use enable-gpios for BL_ON
Date: Sat, 9 Jan 2016 12:29:53 +0530
Message-ID: <1452322793-26020-1-git-send-email-bhuvanchandra.dv@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
Cc: devicetree@vger.kernel.org, Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>, linux-kernel@vger.kernel.org, stefan@agner.ch, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use pwm-backlight driver 'enable-gpios' property for backlight on/off
control.

Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
---
 arch/arm/boot/dts/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
index e5949b9..1c0da05 100644
--- a/arch/arm/boot/dts/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/vf-colibri.dtsi
@@ -10,7 +10,10 @@
 / {
 	bl: backlight {
 		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
 		pwms = <&pwm0 0 5000000 0>;
+		enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
 		status = "disabled";
 	};
 };
@@ -169,6 +172,12 @@
 			>;
 		};
 
+		pinctrl_gpio_bl_on: gpio_bl_on {
+			fsl,pins = <
+				VF610_PAD_PTC0__GPIO_45		0x22ef
+			>;
+		};
+
 		pinctrl_i2c0: i2c0grp {
 			fsl,pins = <
 				VF610_PAD_PTB14__I2C0_SCL		0x37ff
-- 
2.7.0
