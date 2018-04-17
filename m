Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 12/13] ARM: dts: ti: add dra71-evm FIT description file
Date: Tue, 17 Apr 2018 12:10:14 +0300
Message-ID: <1523956215-28154-13-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Add FIT image description file for dra71-evm, and the available
configurations for it.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/ti/dra71-evm.its | 62 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/dra71-evm.its

diff --git a/arch/arm/boot/dts/ti/dra71-evm.its b/arch/arm/boot/dts/ti/dra71-evm.its
new file mode 100644
index 0000000..8dc53cb
--- /dev/null
+++ b/arch/arm/boot/dts/ti/dra71-evm.its
@@ -0,0 +1,62 @@
+/dts-v1/;
+
+/ {
+	description = "DRA71x-evm";
+	#address-cells = <1>;
+
+	images {
+		kernel@1 {
+			description = "Linux kernel";
+			data = /incbin/("../../zImage");
+			type = "kernel";
+			arch = "arm";
+			os = "linux";
+			compression = "none";
+			load = <0x82000000>;
+			entry = <0x82000000>;
+		};
+		fdt@1 {
+			description = "DRA71x-evm";
+			data = /incbin/("dra71-evm.dtb");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83000000>;
+		};
+		fdt@2 {
+			description = "DRA71x-evm LCD";
+			data = /incbin/("dra71-evm-lcd-auo-g101evn01.0.dtbo");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83100000>;
+		};
+		fdt@3 {
+			description = "DRA71x-evm NAND";
+			data = /incbin/("dra71-evm-nand.dtbo");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83200000>;
+		};
+	};
+
+	configurations {
+		default = "dra71-evm";
+		dra71-evm {
+			description = "DRA71x-evm";
+			kernel = "kernel@1";
+			fdt = "fdt@1";
+		};
+		dra71-evm-lcd-auo-g101evn01.0 {
+			description = "DRA71x-evm with LCD overlay";
+			kernel = "kernel@1";
+			fdt = "fdt@1", "fdt@2";
+		};
+		dra71-evm-nand {
+			description = "DRA71x-evm with NAND overlay";
+			kernel = "kernel@1";
+			fdt = "fdt@1", "fdt@3";
+		};
+	};
+};
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
