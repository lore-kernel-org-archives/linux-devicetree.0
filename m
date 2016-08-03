From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 09/11] ARM: dts: NSP: Add new DT file for bcm988312hr
Date: Wed,  3 Aug 2016 14:39:04 -0400
Message-ID: <1470249546-12440-10-git-send-email-jon.mason@broadcom.com>
References: <1470249546-12440-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470249546-12440-1-git-send-email-jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Create a new device tree file for the Broadcom Northstar Plus
bcm988312hr SVK.  This SVK has 2GB RAM, 5 ports Ethernet, 2 eSATA, 2 PCI
slots, and 1 UART.  Also, it has the ability to reboot via GPIO.  To be
added in the future is support for the USB.

Signed-off-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile        |   1 +
 arch/arm/boot/dts/bcm988312hr.dts | 182 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm988312hr.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7c04e31..190528d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -103,6 +103,7 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
 	bcm958525er.dtb \
 	bcm958525xmc.dtb \
 	bcm958625hr.dtb \
+	bcm988312hr.dtb \
 	bcm958625k.dtb
 dtb-$(CONFIG_ARCH_BERLIN) += \
 	berlin2-sony-nsz-gs7.dtb \
diff --git a/arch/arm/boot/dts/bcm988312hr.dts b/arch/arm/boot/dts/bcm988312hr.dts
new file mode 100644
index 0000000..104afe9
--- /dev/null
+++ b/arch/arm/boot/dts/bcm988312hr.dts
@@ -0,0 +1,182 @@
+/*
+ *  BSD LICENSE
+ *
+ *  Copyright(c) 2016 Broadcom.  All rights reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions
+ *  are met:
+ *
+ *    * Redistributions of source code must retain the above copyright
+ *      notice, this list of conditions and the following disclaimer.
+ *    * Redistributions in binary form must reproduce the above copyright
+ *      notice, this list of conditions and the following disclaimer in
+ *      the documentation and/or other materials provided with the
+ *      distribution.
+ *    * Neither the name of Broadcom Corporation nor the names of its
+ *      contributors may be used to endorse or promote products derived
+ *      from this software without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/dts-v1/;
+
+#include "bcm-nsp.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "NorthStar Plus SVK (BCM988312HR)";
+	compatible = "brcm,bcm88312", "brcm,nsp";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x60000000 0x80000000>;
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
+		priority = <200>;
+	};
+};
+
+/* USB 2/3 support needed to be complete */
+
+&amac0 {
+	status = "okay";
+};
+
+&nand {
+	nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-on-flash-bbt;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		nand-ecc-strength = <24>;
+		nand-ecc-step-size = <1024>;
+
+		brcm,nand-oob-sector-size = <27>;
+
+		partition@0 {
+			label = "nboot";
+			reg = <0x00000000 0x00200000>;
+			read-only;
+		};
+		partition@200000 {
+			label = "nenv";
+			reg = <0x00200000 0x00400000>;
+		};
+		partition@600000 {
+			label = "nsystem";
+			reg = <0x00600000 0x00a00000>;
+		};
+		partition@1000000 {
+			label = "nrootfs";
+			reg = <0x01000000 0x03000000>;
+		};
+		partition@4000000 {
+			label = "ncustfs";
+			reg = <0x04000000 0x3c000000>;
+		};
+	};
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_sel>;
+	nand_sel: nand_sel {
+		function = "nand";
+		groups = "nand_grp";
+	};
+};
+
+&sata_phy0 {
+	status = "okay";
+};
+
+&sata_phy1 {
+	status = "okay";
+};
+
+&sata {
+	status = "okay";
+};
+
+&srab {
+	compatible = "brcm,bcm88312-srab", "brcm,nsp-srab";
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			label = "port0";
+			reg = <0>;
+		};
+
+		port@1 {
+			label = "port1";
+			reg = <1>;
+		};
+
+		port@2 {
+			label = "port2";
+			reg = <2>;
+		};
+
+		port@3 {
+			label = "port3";
+			reg = <3>;
+		};
+
+		port@4 {
+			label = "port4";
+			reg = <4>;
+		};
+
+		port@5 {
+			ethernet = <&amac0>;
+			label = "cpu";
+			reg = <5>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
