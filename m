From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v3 13/14] MIPS: ath79: add initial support for Onion Omega
Date: Sat, 23 Jan 2016 23:17:30 +0300
Message-ID: <1453580251-2341-14-git-send-email-antonynpavlov@gmail.com>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453580251-2341-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, "L . D . Pinney" <ldpinney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boken Lin <bl-Jj7zZGp/71Y@public.gmane.org>, Jacky Huang <huangfangcheng-9Onoh4P/yGk@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently only the UART, SPI-flash and LEDs are supported.

Please see https://onion.io/omega for details.

Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: L. D. Pinney <ldpinney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boken Lin <bl-Jj7zZGp/71Y@public.gmane.org>
Cc: Jacky Huang <huangfangcheng-9Onoh4P/yGk@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/mips/ath79/Kconfig          |  5 ++++
 arch/mips/boot/dts/qca/Makefile  |  1 +
 arch/mips/boot/dts/qca/omega.dts | 54 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/arch/mips/ath79/Kconfig b/arch/mips/ath79/Kconfig
index 2797581..5273039 100644
--- a/arch/mips/ath79/Kconfig
+++ b/arch/mips/ath79/Kconfig
@@ -82,6 +82,11 @@ choice
 		select BUILTIN_DTB
 		select SOC_AR933X
 
+	config DTB_ONION_OMEGA
+		bool "Onion Omega"
+		select BUILTIN_DTB
+		select SOC_AR933X
+
 	config DTB_TL_MR3020
 		bool "TL-MR3020"
 		select BUILTIN_DTB
diff --git a/arch/mips/boot/dts/qca/Makefile b/arch/mips/boot/dts/qca/Makefile
index 428ebac5..efecdac 100644
--- a/arch/mips/boot/dts/qca/Makefile
+++ b/arch/mips/boot/dts/qca/Makefile
@@ -1,6 +1,7 @@
 # All DTBs
 dtb-$(CONFIG_DTB_TL_WR1043ND_V1)	+= ar9132_tl_wr1043nd_v1.dtb
 dtb-$(CONFIG_DTB_DRAGINO_MS14)		+= dragino_ms14.dtb
+dtb-$(CONFIG_DTB_ONION_OMEGA)		+= omega.dtb
 dtb-$(CONFIG_DTB_TL_MR3020)		+= tl_mr3020.dtb
 
 obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
diff --git a/arch/mips/boot/dts/qca/omega.dts b/arch/mips/boot/dts/qca/omega.dts
new file mode 100644
index 0000000..9cd9f91
--- /dev/null
+++ b/arch/mips/boot/dts/qca/omega.dts
@@ -0,0 +1,54 @@
+/dts-v1/;
+
+#include "ar9331.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Onion Omega";
+	compatible = "onion,omega";
+
+	aliases {
+		serial0 = &uart;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x4000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		system {
+			label = "onion:amber:system";
+			gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+};
+
+&extosc {
+	clock-frequency = <25000000>;
+};
+
+&uart {
+	status = "okay";
+};
+
+&gpio {
+	status = "okay";
+};
+
+&spi {
+	num-chipselects = <1>;
+	status = "okay";
+
+	/* Winbond 25Q128FVSG SPI flash */
+	spiflash: w25q128@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "winbond,w25q128", "jedec,spi-nor";
+		spi-max-frequency = <104000000>;
+		reg = <0>;
+	};
+};
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
