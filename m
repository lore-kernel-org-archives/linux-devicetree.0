From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH v3] arm64: dts: add LX2160AQDS board support
Date: Wed, 17 Oct 2018 10:32:45 +0000
Message-ID: <20181017160430.22381-1-pankaj.bansal@nxp.com>
References: <20181005081053.27105-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181005081053.27105-1-pankaj.bansal@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Pankaj Bansal <pankaj.bansal@nxp.com>, Rob Herring <robh+dt@kernel.org>, Vabhav Sharma <vabhav.sharma@nxp.com>, Sriram Dash <sriram.dash@nxp.com>
List-Id: devicetree@vger.kernel.org

The LX2160A QorIQ Development System (QDS) is a test, evaluation, and
development platform, supporting QorIQ LX2160A processor.

Signed-off-by: Sriram Dash <sriram.dash@nxp.com>
Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
---

Notes:
    V3:
     - Updated temperature sensor regulator name in board device tree
     - Added esdhc controller nodes in board device tree
     - Added aliases for uart/crypto nodes
    V2:
     - Sorted the nodes alphabetically
     - Sorted the files' in Makefile alphabetically
     - Added newline between property list and sub nodes
     - Added and defined vcc-supply property to temperature sensor node in  device tree
    
    This patch is dependent on below patches
     [1] https://lore.kernel.org/patchwork/project/lkml/list/?series=369563

 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 .../boot/dts/freescale/fsl-lx2160a-qds.dts   | 112 +++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 445b72bd5a36..46b1479b7a6b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -13,4 +13,5 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-rdb.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
new file mode 100644
index 000000000000..99a22abbe725
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Device Tree file for LX2160AQDS
+//
+// Copyright 2018 NXP
+
+/dts-v1/;
+
+#include "fsl-lx2160a.dtsi"
+
+/ {
+	model = "NXP Layerscape LX2160AQDS";
+	compatible = "fsl,lx2160a-qds", "fsl,lx2160a";
+
+	aliases {
+		crypto = &crypto;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	sb_3v3: regulator-sb3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "MC34717-3.3VSB";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&crypto {
+	status = "okay";
+};
+
+&esdhc0 {
+	status = "okay";
+};
+
+&esdhc1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9547";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			power-monitor@40 {
+				compatible = "ti,ina220";
+				reg = <0x40>;
+				shunt-resistor = <500>;
+			};
+
+			power-monitor@41 {
+				compatible = "ti,ina220";
+				reg = <0x41>;
+				shunt-resistor = <1000>;
+			};
+		};
+
+		i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+
+			temperature-sensor@4c {
+				compatible = "nxp,sa56004";
+				reg = <0x4c>;
+				vcc-supply = <&sb_3v3>;
+			};
+
+			temperature-sensor@4d {
+				compatible = "nxp,sa56004";
+				reg = <0x4d>;
+				vcc-supply = <&sb_3v3>;
+			};
+
+			rtc@51 {
+				compatible = "nxp,pcf2129";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
-- 
2.17.1
