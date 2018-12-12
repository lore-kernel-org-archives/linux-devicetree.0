From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH 1/3] dts: arm64: fsl: lsch2: fix status field of serdes
 controlled devices
Date: Wed, 12 Dec 2018 07:09:54 +0000
Message-ID: <20181212123505.32415-2-pankaj.bansal@nxp.com>
References: <20181212123505.32415-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181212123505.32415-1-pankaj.bansal@nxp.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pankaj Bansal <pankaj.bansal@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch disables that devices that are controlled by serdes
(pcie, sata, ethernet macs) in SOC dtsi files and enables the
interfaces in board dts file.

Actually this practise should be followed for all the devices and
not for only serdes controlled devices.

refer https://elinux.org/Device_Tree_Linux#disabled_nodes

Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
---
 .../boot/dts/freescale/fsl-ls1043a-qds.dts   | 18 +++++++++++++
 .../boot/dts/freescale/fsl-ls1043a-rdb.dts   | 17 +++++++++++++
 .../boot/dts/freescale/fsl-ls1043a.dtsi      |  1 +
 .../boot/dts/freescale/fsl-ls1046a-qds.dts   | 18 +++++++++++++
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts   | 24 ++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1046a.dtsi      |  1 +
 .../dts/freescale/qoriq-fman3-0-10g-0.dtsi   |  1 +
 .../dts/freescale/qoriq-fman3-0-10g-1.dtsi   |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-0.dtsi    |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-1.dtsi    |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-2.dtsi    |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-3.dtsi    |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-4.dtsi    |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-5.dtsi    |  1 +
 14 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index dff3d648172e..384b21f8a606 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -65,6 +65,20 @@
 		compatible = "fsl,ls1043aqds-fpga", "fsl,fpga-qixis";
 		reg = <0x2 0x0 0x0000100>;
 	};
+
+	soc {
+		pcie@3400000 {
+			status = "okay";
+		};
+
+		pcie@3500000 {
+			status = "okay";
+		};
+
+		pcie@3600000 {
+			status = "okay";
+		};
+	};
 };
 
 &i2c0 {
@@ -147,4 +161,8 @@
 	};
 };
 
+&sata {
+	status = "okay";
+};
+
 #include "fsl-ls1043-post.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
index 17ca357e854f..50a744c3c428 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
@@ -25,6 +25,16 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	soc {
+		pcie@3500000 {
+			status = "okay";
+		};
+
+		pcie@3600000 {
+			status = "okay";
+		};
+	};
 };
 
 &i2c0 {
@@ -111,36 +121,43 @@
 	ethernet@e0000 {
 		phy-handle = <&qsgmii_phy1>;
 		phy-connection-type = "qsgmii";
+		status = "okay";
 	};
 
 	ethernet@e2000 {
 		phy-handle = <&qsgmii_phy2>;
 		phy-connection-type = "qsgmii";
+		status = "okay";
 	};
 
 	ethernet@e4000 {
 		phy-handle = <&rgmii_phy1>;
 		phy-connection-type = "rgmii-txid";
+		status = "okay";
 	};
 
 	ethernet@e6000 {
 		phy-handle = <&rgmii_phy2>;
 		phy-connection-type = "rgmii-txid";
+		status = "okay";
 	};
 
 	ethernet@e8000 {
 		phy-handle = <&qsgmii_phy3>;
 		phy-connection-type = "qsgmii";
+		status = "okay";
 	};
 
 	ethernet@ea000 {
 		phy-handle = <&qsgmii_phy4>;
 		phy-connection-type = "qsgmii";
+		status = "okay";
 	};
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr105_phy>;
 		phy-connection-type = "xgmii";
+		status = "okay";
 	};
 
 	mdio@fc000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 70057b4e46e8..eea23b84daee 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -639,6 +639,7 @@
 			interrupts = <0 69 0x4>;
 			clocks = <&clockgen 4 0>;
 			dma-coherent;
+			status = "disabled";
 		};
 
 		msi1: msi-controller1@1571000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index e58a8ca1386c..1c3ccf17a554 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -30,6 +30,20 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	soc {
+		pcie@3400000 {
+			status = "okay";
+		};
+
+		pcie@3500000 {
+			status = "okay";
+		};
+
+		pcie@3600000 {
+			status = "okay";
+		};
+	};
 };
 
 &dspi {
@@ -176,4 +190,8 @@
 	};
 };
 
+&sata {
+	status = "okay";
+};
+
 #include "fsl-ls1046-post.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index a59b48203688..65ea27c8341a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -25,6 +25,20 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	soc {
+		pcie@3400000 {
+			status = "okay";
+		};
+
+		pcie@3500000 {
+			status = "okay";
+		};
+
+		pcie@3600000 {
+			status = "okay";
+		};
+	};
 };
 
 &duart0 {
@@ -120,37 +134,47 @@
 	};
 };
 
+&sata {
+	status = "okay";
+};
+
 #include "fsl-ls1046-post.dtsi"
 
 &fman0 {
 	ethernet@e4000 {
 		phy-handle = <&rgmii_phy1>;
 		phy-connection-type = "rgmii";
+		status = "okay";
 	};
 
 	ethernet@e6000 {
 		phy-handle = <&rgmii_phy2>;
 		phy-connection-type = "rgmii";
+		status = "okay";
 	};
 
 	ethernet@e8000 {
 		phy-handle = <&sgmii_phy1>;
 		phy-connection-type = "sgmii";
+		status = "okay";
 	};
 
 	ethernet@ea000 {
 		phy-handle = <&sgmii_phy2>;
 		phy-connection-type = "sgmii";
+		status = "okay";
 	};
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr106_phy>;
 		phy-connection-type = "xgmii";
+		status = "okay";
 	};
 
 	ethernet@f2000 { /* 10GEC2 */
 		fixed-link = <0 1 1000 0 0>;
 		phy-connection-type = "xgmii";
+		status = "okay";
 	};
 
 	mdio@fc000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 9a2106e60e19..49a363abf2ad 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -599,6 +599,7 @@
 			reg-names = "ahci", "sata-ecc";
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen 4 1>;
+			status = "disabled";
 		};
 
 		msi1: msi-controller@1580000 {
diff --git a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi
index dbd2fc3ba790..515be7448e3e 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi
@@ -27,6 +27,7 @@ fman@1a00000 {
 		reg = <0xf0000 0x1000>;
 		fsl,fman-ports = <&fman0_rx_0x10 &fman0_tx_0x30>;
 		pcsphy-handle = <&pcsphy6>;
+		status = "disabled";
 	};
 
 	mdio@f1000 {
diff --git a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi
index 6fc5d2560057..3fc43b0faa3f 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi
@@ -27,6 +27,7 @@ fman@1a00000 {
 		reg = <0xf2000 0x1000>;
 		fsl,fman-ports = <&fman0_rx_0x11 &fman0_tx_0x31>;
 		pcsphy-handle = <&pcsphy7>;
+		status = "disabled";
 	};
 
 	mdio@f3000 {
diff --git a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi
index 4e02276fcf99..fa16a914e53b 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi
@@ -26,6 +26,7 @@ fman@1a00000 {
 		fsl,fman-ports = <&fman0_rx_0x08 &fman0_tx_0x28>;
 		ptp-timer = <&ptp_timer0>;
 		pcsphy-handle = <&pcsphy0>;
+		status = "disabled";
 	};
 
 	mdio@e1000 {
diff --git a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi
index 0312fa43fa77..8813d433d891 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi
@@ -26,6 +26,7 @@ fman@1a00000 {
 		fsl,fman-ports = <&fman0_rx_0x09 &fman0_tx_0x29>;
 		ptp-timer = <&ptp_timer0>;
 		pcsphy-handle = <&pcsphy1>;
+		status = "disabled";
 	};
 
 	mdio@e3000 {
diff --git a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi
index af2df07971dd..65663d449430 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi
@@ -26,6 +26,7 @@ fman@1a00000 {
 		fsl,fman-ports = <&fman0_rx_0x0a &fman0_tx_0x2a>;
 		ptp-timer = <&ptp_timer0>;
 		pcsphy-handle = <&pcsphy2>;
+		status = "disabled";
 	};
 
 	mdio@e5000 {
diff --git a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi
index 4ac98dc8b227..8ae370f11518 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi
@@ -26,6 +26,7 @@ fman@1a00000 {
 		fsl,fman-ports = <&fman0_rx_0x0b &fman0_tx_0x2b>;
 		ptp-timer = <&ptp_timer0>;
 		pcsphy-handle = <&pcsphy3>;
+		status = "disabled";
 	};
 
 	mdio@e7000 {
diff --git a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi
index bd932d8b0160..3ff5a97e0a58 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi
@@ -26,6 +26,7 @@ fman@1a00000 {
 		fsl,fman-ports = <&fman0_rx_0x0c &fman0_tx_0x2c>;
 		ptp-timer = <&ptp_timer0>;
 		pcsphy-handle = <&pcsphy4>;
+		status = "disabled";
 	};
 
 	mdio@e9000 {
diff --git a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-5.dtsi b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-5.dtsi
index 7de1c5203f3e..4e9bd0b25499 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-5.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-fman3-0-1g-5.dtsi
@@ -26,6 +26,7 @@ fman@1a00000 {
 		fsl,fman-ports = <&fman0_rx_0x0d &fman0_tx_0x2d>;
 		ptp-timer = <&ptp_timer0>;
 		pcsphy-handle = <&pcsphy5>;
+		status = "disabled";
 	};
 
 	mdio@eb000 {
-- 
2.17.1
