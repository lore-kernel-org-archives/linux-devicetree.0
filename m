From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 14/14] MIPS: Add basic support for the TL-WR1043ND version 1
Date: Sat, 18 Apr 2015 18:13:27 +0200
Message-ID: <1429373607-9226-3-git-send-email-albeu@free.fr>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
 <1429373607-9226-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429373607-9226-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a DTS for TL-WR1043ND version 1 and allow to have it built in the
kernel to circumvent the broken u-boot found on these boards.
Currently only the UART, LEDs and buttons are supported.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 arch/mips/ath79/Kconfig                      |  5 ++
 arch/mips/boot/dts/Makefile                  |  1 +
 arch/mips/boot/dts/ar9132_tl_wr1043nd_v1.dts | 83 ++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 arch/mips/boot/dts/ar9132_tl_wr1043nd_v1.dts

diff --git a/arch/mips/ath79/Kconfig b/arch/mips/ath79/Kconfig
index 1d38c6a..0df05d0 100644
--- a/arch/mips/ath79/Kconfig
+++ b/arch/mips/ath79/Kconfig
@@ -79,6 +79,11 @@ choice
 
 	config DTB_ATH79_NONE
 		bool "None"
+
+	config DTB_TL_WR1043ND_V1
+		bool "TL-WR1043ND Version 1"
+		select BUILTIN_DTB
+		select SOC_AR913X
 endchoice
 
 endmenu
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 4f49fa4..d40aae2 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_DTB_RT305X_EVAL)		+= rt3052_eval.dtb
 dtb-$(CONFIG_DTB_RT3883_EVAL)		+= rt3883_eval.dtb
 dtb-$(CONFIG_DTB_MT7620A_EVAL)		+= mt7620a_eval.dtb
 dtb-$(CONFIG_MIPS_SEAD3)		+= sead3.dtb
+dtb-$(CONFIG_DTB_TL_WR1043ND_V1)	+= ar9132_tl_wr1043nd.dtb
 
 obj-y		+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
diff --git a/arch/mips/boot/dts/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/ar9132_tl_wr1043nd_v1.dts
new file mode 100644
index 0000000..ab36c7c
--- /dev/null
+++ b/arch/mips/boot/dts/ar9132_tl_wr1043nd_v1.dts
@@ -0,0 +1,83 @@
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+#include "ar9132.dtsi"
+
+/ {
+	compatible = "tplink,tl-wr1043nd-v1", "qca,ar9132";
+	model = "TP-Link TL-WR1043ND Version 1";
+
+	alias {
+		serial0 = "/ahb/apb/uart@18020000";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x2000000>;
+	};
+
+	extosc: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	ahb {
+		apb {
+			uart@18020000 {
+				status = "okay";
+			};
+
+			pll-controller@18050000 {
+				clocks = <&extosc>;
+			};
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		poll-interval = <20>;
+		button@0 {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio 3 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+
+		button@1 {
+			label = "qss";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&gpio 7 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led@0 {
+			label = "tp-link:green:usb";
+			gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led@1 {
+			label = "tp-link:green:system";
+			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led@2 {
+			label = "tp-link:green:qss";
+			gpios = <&gpio 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		led@3 {
+			label = "tp-link:green:wlan";
+			gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
-- 
2.0.0
