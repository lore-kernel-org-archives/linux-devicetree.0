From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCHv3 5/5] arm: mvebu: Add device tree for db-dxbc2 and
 db-xc3-24g4xg boards
Date: Fri,  6 Jan 2017 17:15:02 +1300
Message-ID: <20170106041517.9589-6-chris.packham@alliedtelesis.co.nz>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170106041517.9589-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170106041517.9589-1-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

These boards are Marvell's evaluation boards for the 98DX4251 and
98DX3336 SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
    Change in v2/v3:
    - None

 arch/arm/boot/dts/db-dxbc2.dts      | 159 ++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/db-xc3-24g4xg.dts | 155 +++++++++++++++++++++++++++++++++++
 2 files changed, 314 insertions(+)
 create mode 100644 arch/arm/boot/dts/db-dxbc2.dts
 create mode 100644 arch/arm/boot/dts/db-xc3-24g4xg.dts

diff --git a/arch/arm/boot/dts/db-dxbc2.dts b/arch/arm/boot/dts/db-dxbc2.dts
new file mode 100644
index 000000000000..f56786cea5f8
--- /dev/null
+++ b/arch/arm/boot/dts/db-dxbc2.dts
@@ -0,0 +1,159 @@
+/*
+ * Device Tree file for DB-DXBC2 board
+ *
+ * Copyright (C) 2016 Allied Telesis Labs
+ *
+ * Based on armada-xp-db.dts
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Note: this Device Tree assumes that the bootloader has remapped the
+ * internal registers to 0xf1000000 (instead of the default
+ * 0xd0000000). The 0xf1000000 is the default used by the recent,
+ * DT-capable, U-Boot bootloaders provided by Marvell. Some earlier
+ * boards were delivered with an older version of the bootloader that
+ * left internal registers mapped at 0xd0000000. If you are in this
+ * situation, you should either update your bootloader (preferred
+ * solution) or the below Device Tree should be adjusted.
+ */
+
+/dts-v1/;
+#include "armada-xp-98dx4251.dtsi"
+
+/ {
+	model = "Marvell Bobcat2 Evaluation Board";
+	compatible = "marvell,db-dxbc2", "marvell,armadaxp-98dx4251", "marvell,armadaxp", "marvell,armada-370-xp";
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlyprintk";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0 0x00000000 0 0x20000000>; /* 512 MB */
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xf1000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
+			  MBUS_ID(0x01, 0x2f) 0 0 0xf0000000 0x1000000
+			  MBUS_ID(0x03, 0x00) 0 0 0xa8000000 0x4000000
+			  MBUS_ID(0x08, 0x00) 0 0 0xac000000 0x100000>;
+
+		devbus-bootcs {
+			status = "okay";
+
+			/* Device Bus parameters are required */
+
+			/* Read parameters */
+			devbus,bus-width    = <16>;
+			devbus,turn-off-ps  = <60000>;
+			devbus,badr-skew-ps = <0>;
+			devbus,acc-first-ps = <124000>;
+			devbus,acc-next-ps  = <248000>;
+			devbus,rd-setup-ps  = <0>;
+			devbus,rd-hold-ps   = <0>;
+
+			/* Write parameters */
+			devbus,sync-enable = <0>;
+			devbus,wr-high-ps  = <60000>;
+			devbus,wr-low-ps   = <60000>;
+			devbus,ale-wr-ps   = <60000>;
+		};
+
+		internal-regs {
+			serial@12000 {
+				status = "okay";
+			};
+			serial@12100 {
+				status = "okay";
+			};
+
+			i2c@11000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			mvsdio@d4000 {
+				pinctrl-0 = <&sdio_pins>;
+				pinctrl-names = "default";
+				status = "okay";
+				/* No CD or WP GPIOs */
+				broken-cd;
+			};
+
+			nand@d0000 {
+				status = "okay";
+				num-cs = <1>;
+				marvell,nand-keep-config;
+				marvell,nand-enable-arbiter;
+				nand-on-flash-bbt;
+				nand-ecc-strength = <4>;
+				nand-ecc-step-size = <512>;
+			};
+		};
+	};
+};
+
+&spi0 {
+	status = "okay";
+
+	spi-flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "m25p64";
+		reg = <0>; /* Chip select 0 */
+		spi-max-frequency = <20000000>;
+		m25p,fast-read;
+
+		partition@u-boot {
+			reg = <0x00000000 0x00100000>;
+			label = "u-boot";
+		};
+		partition@u-boot-env {
+			reg = <0x00100000 0x00040000>;
+			label = "u-boot-env";
+		};
+		partition@unused {
+			reg = <0x00140000 0x00ec0000>;
+			label = "unused";
+		};
+
+	};
+};
diff --git a/arch/arm/boot/dts/db-xc3-24g4xg.dts b/arch/arm/boot/dts/db-xc3-24g4xg.dts
new file mode 100644
index 000000000000..5eb89ffb9a7d
--- /dev/null
+++ b/arch/arm/boot/dts/db-xc3-24g4xg.dts
@@ -0,0 +1,155 @@
+/*
+ * Device Tree file for DB-XC3-24G4XG board
+ *
+ * Copyright (C) 2016 Allied Telesis Labs
+ *
+ * Based on armada-xp-db.dts
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Note: this Device Tree assumes that the bootloader has remapped the
+ * internal registers to 0xf1000000 (instead of the default
+ * 0xd0000000). The 0xf1000000 is the default used by the recent,
+ * DT-capable, U-Boot bootloaders provided by Marvell. Some earlier
+ * boards were delivered with an older version of the bootloader that
+ * left internal registers mapped at 0xd0000000. If you are in this
+ * situation, you should either update your bootloader (preferred
+ * solution) or the below Device Tree should be adjusted.
+ */
+
+/dts-v1/;
+#include "armada-xp-98dx3336.dtsi"
+
+/ {
+	model = "DB-XC3-24G4XG";
+	compatible = "marvell,db-xc3-24g4xg", "marvell,armadaxp-98dx3336", "marvell,armadaxp", "marvell,armada-370-xp";
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlyprintk";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0 0x00000000 0 0x40000000>; /* 1 GB */
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xf1000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
+			  MBUS_ID(0x01, 0x2f) 0 0 0xf0000000 0x1000000
+			  MBUS_ID(0x03, 0x00) 0 0 0xa8000000 0x4000000
+			  MBUS_ID(0x08, 0x00) 0 0 0xac000000 0x100000>;
+
+		devbus-bootcs {
+			status = "okay";
+
+			/* Device Bus parameters are required */
+
+			/* Read parameters */
+			devbus,bus-width    = <16>;
+			devbus,turn-off-ps  = <60000>;
+			devbus,badr-skew-ps = <0>;
+			devbus,acc-first-ps = <124000>;
+			devbus,acc-next-ps  = <248000>;
+			devbus,rd-setup-ps  = <0>;
+			devbus,rd-hold-ps   = <0>;
+
+			/* Write parameters */
+			devbus,sync-enable = <0>;
+			devbus,wr-high-ps  = <60000>;
+			devbus,wr-low-ps   = <60000>;
+			devbus,ale-wr-ps   = <60000>;
+		};
+
+		internal-regs {
+			serial@12000 {
+				status = "okay";
+			};
+			serial@12100 {
+				status = "okay";
+			};
+
+			i2c@11000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			mvsdio@d4000 {
+				status = "disabled";
+			};
+
+			nand@d0000 {
+				status = "okay";
+				num-cs = <1>;
+				marvell,nand-keep-config;
+				marvell,nand-enable-arbiter;
+				nand-on-flash-bbt;
+				nand-ecc-strength = <4>;
+				nand-ecc-step-size = <512>;
+			};
+		};
+	};
+};
+
+&spi0 {
+	status = "okay";
+
+	spi-flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "m25p64";
+		reg = <0>; /* Chip select 0 */
+		spi-max-frequency = <20000000>;
+		m25p,fast-read;
+
+		partition@u-boot {
+			reg = <0x00000000 0x00100000>;
+			label = "u-boot";
+		};
+		partition@u-boot-env {
+			reg = <0x00100000 0x00040000>;
+			label = "u-boot-env";
+		};
+		partition@unused {
+			reg = <0x00140000 0x00ec0000>;
+			label = "unused";
+		};
+
+	};
+};
-- 
2.11.0.24.ge6920cf
