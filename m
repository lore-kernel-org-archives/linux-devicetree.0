From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv2 3/3] picoxcell: add the DTS for the PC7302 board
Date: Wed, 24 Aug 2011 15:41:46 +0100
Message-ID: <1314196906-20709-4-git-send-email-jamie@jamieiles.com>
References: <1314196906-20709-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1314196906-20709-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The PC7302 board can be populated with either a PC3X2 or PC3X3 device.
Add DTS files for both variants of the PC7302.

Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts |   87 ++++++++++++++++++++++++
 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts |   93 ++++++++++++++++++++++++++
 2 files changed, 180 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
 create mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts

diff --git a/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts b/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
new file mode 100644
index 0000000..4c9a7ba
--- /dev/null
+++ b/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
@@ -0,0 +1,87 @@
+/*
+ *  Copyright (C) 2011 Picochip, Jamie Iles
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+/include/ "picoxcell-pc3x2.dtsi"
+/ {
+	model = "Picochip PC7302 (PC3X2)";
+	compatible = "picochip,pc7302-pc3x2", "picochip,pc3x2";
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x08000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlyprintk loglevel=9 root=ubi0:rootfs rw rootfstype=ubifs ubi.mtd=5,2048";
+		linux,stdout-path = &uart0;
+	};
+
+	clocks {
+		ref_clk: clock@1 {
+			compatible = "fixed-clock";
+			clock-outputs = "ref";
+			clock-frequency = <20000000>;
+		};
+	};
+
+	rwid-axi {
+		ebi@50000000 {
+			nand: gpio-nand@2,0 {
+				compatible = "gpio-control-nand";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <2 0x0000 0x1000>;
+				bus-clock = <&pclk>, "bus";
+				gpio-control-nand,io-sync-reg =
+					<0x00000000 0x80220000>;
+
+				gpios = <&banka 1 0	/* rdy */
+					 &banka 2 0 	/* nce */
+					 &banka 3 0 	/* ale */
+					 &banka 4 0 	/* cle */
+					 0		/* nwp */>;
+
+				boot@100000 {
+					label = "Boot";
+					reg = <0x100000 0x80000>;
+				};
+
+				redundant-boot@200000 {
+					label = "Redundant Boot";
+					reg = <0x200000 0x80000>;
+				};
+
+				boot-env@300000 {
+					label = "Boot Evironment";
+					reg = <0x300000 0x20000>;
+				};
+
+				redundant-boot-env@320000 {
+					label = "Redundant Boot Environment";
+					reg = <0x300000 0x20000>;
+				};
+
+				kernel@380000 {
+					label = "Kernel";
+					reg = <0x380000 0x800000>;
+				};
+
+				fs@b80000 {
+					label = "File System";
+					reg = <0xb80000 0xf480000>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts b/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
new file mode 100644
index 0000000..381eb6a
--- /dev/null
+++ b/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
@@ -0,0 +1,93 @@
+/*
+ *  Copyright (C) 2011 Picochip, Jamie Iles
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+/include/ "picoxcell-pc3x3.dtsi"
+/ {
+	model = "Picochip PC7302 (PC3X3)";
+	compatible = "picochip,pc7302-pc3x3", "picochip,pc3x3";
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x08000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlyprintk loglevel=9 root=ubi0:rootfs rw rootfstype=ubifs ubi.mtd=5,2048";
+		linux,stdout-path = &uart0;
+	};
+
+	clocks {
+		ref_clk: clock@10 {
+			compatible = "fixed-clock";
+			clock-outputs = "ref";
+			clock-frequency = <20000000>;
+		};
+
+		clkgate: clkgate@800a0048 {
+			clock@4 {
+				picochip,clk-no-disable;
+			};
+		};
+	};
+
+	rwid-axi {
+		ebi@50000000 {
+			nand: gpio-nand@2,0 {
+				compatible = "gpio-control-nand";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <2 0x0000 0x1000>;
+				bus-clock = <&ebi_clk>, "bus";
+				gpio-control-nand,io-sync-reg =
+					<0x00000000 0x80220000>;
+
+				gpios = <&banka 1 0	/* rdy */
+					 &banka 2 0 	/* nce */
+					 &banka 3 0 	/* ale */
+					 &banka 4 0 	/* cle */
+					 0		/* nwp */>;
+
+				boot@100000 {
+					label = "Boot";
+					reg = <0x100000 0x80000>;
+				};
+
+				redundant-boot@200000 {
+					label = "Redundant Boot";
+					reg = <0x200000 0x80000>;
+				};
+
+				boot-env@300000 {
+					label = "Boot Evironment";
+					reg = <0x300000 0x20000>;
+				};
+
+				redundant-boot-env@320000 {
+					label = "Redundant Boot Environment";
+					reg = <0x300000 0x20000>;
+				};
+
+				kernel@380000 {
+					label = "Kernel";
+					reg = <0x380000 0x800000>;
+				};
+
+				fs@b80000 {
+					label = "File System";
+					reg = <0xb80000 0xf480000>;
+				};
+			};
+		};
+	};
+};
-- 
1.7.4.1
