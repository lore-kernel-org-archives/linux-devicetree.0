From: kernel@martin.sperl.org
Subject: [PATCH] ARM: dts: add minimal device tree for compute model 3
Date: Fri, 24 Nov 2017 12:18:13 +0000
Message-ID: <20171124121813.11318-1-kernel@martin.sperl.org>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, eric@anholt.net
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel@martin.sperl.org>

Add a minimal working device tree for the compute model 3
for both arm and arm64.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 arch/arm/boot/dts/Makefile                       |  1 +
 arch/arm/boot/dts/bcm2837-rpi-cm3.dts            | 38 ++++++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/Makefile            |  1 +
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3.dts |  2 ++
 4 files changed, 42 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-cm3.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index eff87a344566..b24a682c450d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -75,6 +75,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2835-rpi-a-plus.dtb \
 	bcm2836-rpi-2-b.dtb \
 	bcm2837-rpi-3-b.dtb \
+	bcm2837-rpi-cm3.dtb \
 	bcm2835-rpi-zero.dtb \
 	bcm2835-rpi-zero-w.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
diff --git a/arch/arm/boot/dts/bcm2837-rpi-cm3.dts b/arch/arm/boot/dts/bcm2837-rpi-cm3.dts
new file mode 100644
index 000000000000..f387bd8bd707
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2837-rpi-cm3.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2837.dtsi"
+#include "bcm2835-rpi.dtsi"
+#include "bcm283x-rpi-usb-host.dtsi"
+
+/ {
+	compatible = "raspberrypi,3-compute-model", "brcm,bcm2837";
+	model = "Raspberry Pi Compute Module 3";
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+
+	leds {
+		act {
+			gpios = <&gpio 47 0>;
+		};
+	};
+};
+
+&hdmi {
+	hpd-gpios = <&gpio 46 GPIO_ACTIVE_LOW>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_gpio14>;
+	status = "okay";
+};
+
+/* SDHOST is used to drive the SD card */
+&sdhost {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhost_gpio48>;
+	status = "okay";
+	bus-width = <4>;
+};
diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 3df2db7f8878..aecf58f503ae 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_BCM2835) += bcm2837-rpi-3-b.dtb
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2837-rpi-cm3.dtb
 
 dts-dirs	+= northstar2
 dts-dirs	+= stingray
diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3.dts b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3.dts
new file mode 100644
index 000000000000..a1bba71462ed
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3.dts
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "arm/bcm2837-rpi-cm3.dts"
-- 
2.11.0
