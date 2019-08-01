From: Avi Fishman <avifishman70@gmail.com>
Subject: [PATCH v1 1/2] dt-binding: net: document NPCM7xx EMC 10/100 DT bindings
Date: Thu,  1 Aug 2019 10:26:10 +0300
Message-ID: <20190801072611.27935-2-avifishman70@gmail.com>
References: <20190801072611.27935-1-avifishman70@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801072611.27935-1-avifishman70@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: venture@google.com, yuenn@google.com, benjaminfair@google.com, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

Added device tree binding documentation for
Nuvoton NPCM7xx Ethernet MAC Controller (EMC) 10/100 RMII

Signed-off-by: Avi Fishman <avifishman70@gmail.com>
---
 .../bindings/net/nuvoton,npcm7xx-emc.txt      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt

diff --git a/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt b/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
new file mode 100644
index 000000000000..a7ac3ca66de9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
@@ -0,0 +1,38 @@
+Nuvoton NPCM7XX 10/100 Ethernet MAC Controller (EMC)
+
+The NPCM7XX provides one or two Ethernet MAC RMII Controllers
+for WAN/LAN applications
+
+Required properties:
+- device_type     : Should be "network"
+- compatible      : "nuvoton,npcm750-emc" for Poleg NPCM7XX.
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the emc interrupts with flags for falling edge.
+                    first interrupt dedicated to Txirq
+                    second interrupt dedicated to Rxirq
+- phy-mode        : Should be "rmii" (see ethernet.txt in the same directory)
+- clocks          : phandle of emc reference clock.
+- resets          : phandle to the reset control for this device.
+- use-ncsi        : Use the NC-SI stack instead of an MDIO PHY
+
+Example:
+
+emc0: eth@f0825000 {
+	device_type = "network";
+	compatible = "nuvoton,npcm750-emc";
+	reg = <0xf0825000 0x1000>;
+	interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+	             <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	phy-mode = "rmii";
+	clocks = <&clk NPCM7XX_CLK_AHB>;
+
+	#use-ncsi; /* add this to support ncsi */
+
+	clock-names = "clk_emc";
+	resets = <&rstc 6>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&r1_pins
+	             &r1err_pins
+	             &r1md_pins>;
+	status = "okay";
+};
-- 
2.18.0
