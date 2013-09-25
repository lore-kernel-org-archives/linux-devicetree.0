From: <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dts: socfpga: Add support for Altera's SOCFPGA Arria V board
Date: Wed, 25 Sep 2013 15:41:57 -0500
Message-ID: <1380141717-18050-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Add support for a new SOCFPGA board that has an Arria V FPGA along with
dual ARM Cortex-A9 cores.

Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
 arch/arm/boot/dts/Makefile           |    3 +-
 arch/arm/boot/dts/socfpga_arria5.dts |   71 ++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/socfpga_arria5.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e95af3f..e15419c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -211,7 +211,8 @@ dtb-$(CONFIG_ARCH_SHMOBILE) += emev2-kzm9d.dtb \
 	r8a73a4-ape6evm-reference.dtb \
 	sh7372-mackerel.dtb
 dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += emev2-kzm9d-reference.dtb
-dtb-$(CONFIG_ARCH_SOCFPGA) += socfpga_cyclone5.dtb \
+dtb-$(CONFIG_ARCH_SOCFPGA) += socfpga_arria5.dtb \
+	socfpga_cyclone5.dtb \
 	socfpga_vt.dtb
 dtb-$(CONFIG_ARCH_SPEAR13XX) += spear1310-evb.dtb \
 	spear1340-evb.dtb
diff --git a/arch/arm/boot/dts/socfpga_arria5.dts b/arch/arm/boot/dts/socfpga_arria5.dts
new file mode 100644
index 0000000..ea163a5
--- /dev/null
+++ b/arch/arm/boot/dts/socfpga_arria5.dts
@@ -0,0 +1,71 @@
+/*
+ *  Copyright (C) 2013 Altera Corporation <www.altera.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+/dts-v1/;
+/include/ "socfpga.dtsi"
+
+/ {
+	model = "Altera SOCFPGA Arria V";
+	compatible = "altr,socfpga-arria5", "altr,socfpga";
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+	};
+
+	memory {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x40000000>; /* 1 GB */
+	};
+
+	soc {
+		clkmgr@ffd04000 {
+			clocks {
+				osc1 {
+					clock-frequency = <25000000>;
+				};
+			};
+		};
+
+		serial0@ffc02000 {
+			clock-frequency = <100000000>;
+		};
+
+		serial1@ffc03000 {
+			clock-frequency = <100000000>;
+		};
+
+		sysmgr@ffd08000 {
+			cpu1-start-addr = <0xffd080c4>;
+		};
+
+		timer0@ffc08000 {
+			clock-frequency = <100000000>;
+		};
+
+		timer1@ffc09000 {
+			clock-frequency = <100000000>;
+		};
+
+		timer2@ffd00000 {
+			clock-frequency = <25000000>;
+		};
+
+		timer3@ffd01000 {
+			clock-frequency = <25000000>;
+		};
+	};
+};
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
