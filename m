From: Zoltan HERPAI <wigyori@uid0.hu>
Subject: [PATCH] ARM: sun4i: dt: Add basic board support for LinkSprite pcDuino
Date: Sat, 11 Jan 2014 16:54:52 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1401111509430.13932@trabant.deployis.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
To: maxime.ripard@free-electrons.com
Cc: hdegoede@redhat.com, linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch will add a basic board support DT for the
LinkSprite pcDuino.

Signed-off-by: Zoltan HERPAI <wigyori@uid0.hu>
---
  arch/arm/boot/dts/Makefile              |    1 +
  arch/arm/boot/dts/sun4i-a10-pcduino.dts |   48 +++++++++++++++++++++++++++++++
  2 files changed, 49 insertions(+), 0 deletions(-)
  create mode 100644 arch/arm/boot/dts/sun4i-a10-pcduino.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b663ed7..a2e3620 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -253,6 +253,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += \
  	sun4i-a10-cubieboard.dtb \
  	sun4i-a10-mini-xplus.dtb \
  	sun4i-a10-hackberry.dtb \
+	sun4i-a10-pcduino.dtb \
  	sun5i-a10s-olinuxino-micro.dtb \
  	sun5i-a13-olinuxino.dtb \
  	sun5i-a13-olinuxino-micro.dtb \
diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
new file mode 100644
index 0000000..752f002
--- /dev/null
+++ b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
@@ -0,0 +1,48 @@
+/*
+ * Copyright 2014 Zoltan HERPAI
+ * Zoltan HERPAI <wigyori@uid0.hu>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+/include/ "sun4i-a10.dtsi"
+
+/ {
+	model = "LinkSprite pcDuino";
+	compatible = "pcduino,a10-pcduino", "allwinner,sun4i-a10";
+
+	soc@01c00000 {
+		emac: ethernet@01c0b000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&emac_pins_a>;
+			phy = <&phy1>;
+			status = "okay";
+		};
+
+		mdio@01c0b080 {
+			status = "okay";
+
+			phy1: ethernet-phy@1 {
+				reg = <1>;
+			};
+		};
+
+		uart0: serial@01c28000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins_a>;
+			status = "okay";
+		};
+
+		i2c0: i2c@01c2ac00 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins_a>;
+			status = "okay";
+		};
+	};
+};
-- 
1.7.0.4
