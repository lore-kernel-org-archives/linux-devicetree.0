From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 net-next 4/7] dt-bindings: net: Add lantiq,xrx200-net DT bindings
Date: Sat,  1 Sep 2018 14:04:07 +0200
Message-ID: <20180901120407.9912-1-hauke@hauke-m.de>
References: <20180901114535.9070-1-hauke@hauke-m.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180901114535.9070-1-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the binding for the PMAC core between the CPU and the GSWIP
switch found on the xrx200 / VR9 Lantiq / Intel SoC.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/net/lantiq,xrx200-net.txt   | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt

diff --git a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
new file mode 100644
index 000000000000..8a2fe5200cdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.txt
@@ -0,0 +1,21 @@
+Lantiq xRX200 GSWIP PMAC Ethernet driver
+==================================
+
+Required properties:
+
+- compatible	: "lantiq,xrx200-net" for the PMAC of the embedded
+		: GSWIP in the xXR200
+- reg		: memory range of the PMAC core inside of the GSWIP core
+- interrupts	: TX and RX DMA interrupts. Use interrupt-names "tx" for
+		: the TX interrupt and "rx" for the RX interrupt.
+
+Example:
+
+eth0: eth@E10B308 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "lantiq,xrx200-net";
+	reg = <0xE10B308 0x30>;
+	interrupts = <73>, <72>;
+	interrupt-names = "tx", "rx";
+};
-- 
2.11.0
