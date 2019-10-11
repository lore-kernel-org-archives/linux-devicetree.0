From: matthias.bgg@kernel.org
Subject: [PATCH v1 3/3] ARM: dts: bcm2711: Enable GENET support for the RPi4
Date: Fri, 11 Oct 2019 20:48:21 +0200
Message-ID: <20191011184822.866-4-matthias.bgg@kernel.org>
References: <20191011184822.866-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011184822.866-1-matthias.bgg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Matthias Brugger <matthias.bgg@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <wahrenst@gmx.net>, Matthias Brugger <mbrugger@suse.com>, Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

Enable Gigabit Ethernet support on the Raspberry Pi 4
Model B.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 22 ++++++++++++++++++++++
 arch/arm/boot/dts/bcm2711.dtsi        | 18 ++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index cccc1ccd19be..958553d62670 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -97,6 +97,28 @@
 	status = "okay";
 };
 
+&genet {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii";
+	status = "okay";
+	dma-burst-sz = <0x08>;
+
+	mdio@e14 {
+		compatible = "brcm,genet-mdio-v5";
+		reg = <0xe14 0x8>;
+		reg-names = "mdio";
+		#address-cells = <0x0>;
+		#size-cells = <0x1>;
+
+		phy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			/* No PHY interrupt */
+			max-speed = <1000>;
+			reg = <0x1>;
+		};
+	};
+};
+
 /* uart0 communicates with the BT module */
 &uart0 {
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index ac83dac2e6ba..e2e837fcad59 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -305,6 +305,24 @@
 			cpu-release-addr = <0x0 0x000000f0>;
 		};
 	};
+
+	scb {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <1>;
+
+		ranges = <0x0 0x7c000000  0x0 0xfc000000  0x03800000>;
+
+		genet: ethernet@7d580000 {
+			compatible = "brcm,genet-v5";
+			reg = <0x0 0x7d580000 0x10000>;
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+	};
 };
 
 &clk_osc {
-- 
2.23.0
