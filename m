Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 13/13] ARM: dts: ti: add am57xx-evm FIT description file
Date: Tue, 17 Apr 2018 12:10:15 +0300
Message-ID: <1523956215-28154-14-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Add FIT image description file for am57xx-evm, which contains the
available configurations for the board.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/ti/am57xx-evm.its | 97 +++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/am57xx-evm.its

diff --git a/arch/arm/boot/dts/ti/am57xx-evm.its b/arch/arm/boot/dts/ti/am57xx-evm.its
new file mode 100644
index 0000000..cd5523c
--- /dev/null
+++ b/arch/arm/boot/dts/ti/am57xx-evm.its
@@ -0,0 +1,97 @@
+/dts-v1/;
+
+/ {
+	description = "AM57xx-evm";
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
+			description = "AM57xx-beagle-x15";
+			data = /incbin/("am57xx-beagle-x15.dtb");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83000000>;
+		};
+		fdt@2 {
+			description = "AM57xx-beagle-x15-revc";
+			data = /incbin/("am57xx-beagle-x15-revc.dtb");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83000000>;
+		};
+		fdt@3 {
+			description = "AM57xx-evm-common overlay";
+			data = /incbin/("am57xx-evm-common.dtbo");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83080000>;
+		};
+		fdt@4 {
+			description = "MT9T111 camera support";
+			data = /incbin/("mt9t111.dtbo");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83100000>;
+		};
+		fdt@5 {
+			description = "OV10635 camera support";
+			data = /incbin/("ov10635.dtbo");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83100000>;
+		};
+		fdt@6 {
+			description = "AM57xx-evm overlay";
+			data = /incbin/("am57xx-evm.dtbo");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83090000>;
+		};
+		fdt@7 {
+			description = "AM57xx-evm-reva3 overlay";
+			data = /incbin/("am57xx-evm-reva3.dtbo");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			load = <0x83090000>;
+		};
+	};
+
+	configurations {
+		default = "am57xx-evm";
+		am57xx-evm {
+			description = "AM57xx EVM";
+			kernel = "kernel@1";
+			fdt = "fdt@1", "fdt@3", "fdt@6";
+		};
+		am57xx-evm-reva3 {
+			description = "AM57xx EVM rev A3";
+			kernel = "kernel@1";
+			fdt = "fdt@2", "fdt@3", "fdt@7";
+		};
+		cam-mt9t111 {
+			description = "MT9T111 camera";
+			fdt = "fdt@4";
+		};
+		cam-ov10635 {
+			description = "OV10635 camera";
+			fdt = "fdt@5";
+		};
+	};
+};
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
