Return-Path: <SRS0=W32e=OW=gmail.com=dwesterg@kernel.org>
From: dwesterg@gmail.com
Subject: [PATCH v2 net-next 10/10] net: eth: altera: update devicetree bindings documentation
Date: Thu, 13 Dec 2018 09:52:52 -0800
Message-Id: <20181213175252.21143-11-dalon.westergreen@linux.intel.com>
In-Reply-To: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, dinguyen@kernel.org, thor.thayer@linux.intel.com, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, mark.rutland@arm.commark.rutland@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Dalon Westergreen <dalon.westergreen@intel.com>

Update devicetree bindings documentation to include msgdma
prefetcher and ptp bindings.

Signed-off-by: Dalon Westergreen <dalon.westergreen@intel.com>
---
 .../devicetree/bindings/net/altera_tse.txt    | 98 +++++++++++++++----
 1 file changed, 79 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/altera_tse.txt b/Documentation/devicetree/bindings/net/altera_tse.txt
index 0e21df94a53f..d35806942a8f 100644
--- a/Documentation/devicetree/bindings/net/altera_tse.txt
+++ b/Documentation/devicetree/bindings/net/altera_tse.txt
@@ -2,50 +2,79 @@
 
 Required properties:
 - compatible: Should be "altr,tse-1.0" for legacy SGDMA based TSE, and should
-		be "altr,tse-msgdma-1.0" for the preferred MSGDMA based TSE.
+		be "altr,tse-msgdma-1.0" for the preferred MSGDMA based TSE,
+		and "altr,tse-msgdma-2.0" for MSGDMA with prefetcher based
+		implementations.
 		ALTR is supported for legacy device trees, but is deprecated.
 		altr should be used for all new designs.
 - reg: Address and length of the register set for the device. It contains
   the information of registers in the same order as described by reg-names
 - reg-names: Should contain the reg names
-  "control_port": MAC configuration space region
-  "tx_csr":       xDMA Tx dispatcher control and status space region
-  "tx_desc":      MSGDMA Tx dispatcher descriptor space region
-  "rx_csr" :      xDMA Rx dispatcher control and status space region
-  "rx_desc":      MSGDMA Rx dispatcher descriptor space region
-  "rx_resp":      MSGDMA Rx dispatcher response space region
-  "s1":		  SGDMA descriptor memory
 - interrupts: Should contain the TSE interrupts and it's mode.
 - interrupt-names: Should contain the interrupt names
-  "rx_irq":       xDMA Rx dispatcher interrupt
-  "tx_irq":       xDMA Tx dispatcher interrupt
+  "rx_irq":       DMA Rx dispatcher interrupt
+  "tx_irq":       DMA Tx dispatcher interrupt
 - rx-fifo-depth: MAC receive FIFO buffer depth in bytes
 - tx-fifo-depth: MAC transmit FIFO buffer depth in bytes
 - phy-mode: See ethernet.txt in the same directory.
 - phy-handle: See ethernet.txt in the same directory.
 - phy-addr: See ethernet.txt in the same directory. A configuration should
 		include phy-handle or phy-addr.
-- altr,has-supplementary-unicast:
-		If present, TSE supports additional unicast addresses.
-		Otherwise additional unicast addresses are not supported.
-- altr,has-hash-multicast-filter:
-		If present, TSE supports a hash based multicast filter.
-		Otherwise, hash-based multicast filtering is not supported.
-
 - mdio device tree subnode: When the TSE has a phy connected to its local
 		mdio, there must be device tree subnode with the following
 		required properties:
-
 	- compatible: Must be "altr,tse-mdio".
 	- #address-cells: Must be <1>.
 	- #size-cells: Must be <0>.
 
 	For each phy on the mdio bus, there must be a node with the following
 	fields:
-
 	- reg: phy id used to communicate to phy.
 	- device_type: Must be "ethernet-phy".
 
+- altr,has-supplementary-unicast:
+		If present, TSE supports additional unicast addresses.
+		Otherwise additional unicast addresses are not supported.
+- altr,has-hash-multicast-filter:
+		If present, TSE supports a hash based multicast filter.
+		Otherwise, hash-based multicast filtering is not supported.
+- altr,has-ptp:
+		If present, TSE supports 1588 timestamping.  Currently only
+		supported with the msgdma prefetcher.
+- altr,tx-poll-cnt:
+		Optional cycle count for Tx prefetcher to poll descriptor
+		list.  If not present, defaults to 128, which at 125MHz is
+		roughly 1usec. Only for "altr,tse-msgdma-2.0".
+- altr,rx-poll-cnt:
+		Optional cycle count for Tx prefetcher to poll descriptor
+		list.  If not present, defaults to 128, which at 125MHz is
+		roughly 1usec. Only for "altr,tse-msgdma-2.0".
+
+Required registers by compatibility string:
+ - "altr,tse-1.0"
+	"control_port": MAC configuration space region
+	"tx_csr":       DMA Tx dispatcher control and status space region
+	"rx_csr" :      DMA Rx dispatcher control and status space region
+	"s1":		DMA descriptor memory
+
+ - "altr,tse-msgdma-1.0"
+	"control_port": MAC configuration space region
+	"tx_csr":       DMA Tx dispatcher control and status space region
+	"tx_desc":      DMA Tx dispatcher descriptor space region
+	"rx_csr" :      DMA Rx dispatcher control and status space region
+	"rx_desc":      DMA Rx dispatcher descriptor space region
+	"rx_resp":      DMA Rx dispatcher response space region
+
+ - "altr,tse-msgdma-2.0"
+	"control_port": MAC configuration space region
+	"tx_csr":       DMA Tx dispatcher control and status space region
+	"tx_pref":      DMA Tx prefetcher configuration space region
+	"rx_csr" :      DMA Rx dispatcher control and status space region
+	"rx_pref":      DMA Rx prefetcher configuration space region
+	"tod_ctrl":     Time of Day Control register only required when
+			timestamping support is enabled.  Timestamping is
+			only supported with the msgdma-2.0 implementation.
+
 Optional properties:
 - local-mac-address: See ethernet.txt in the same directory.
 - max-frame-size: See ethernet.txt in the same directory.
@@ -87,6 +116,11 @@ Example:
 				device_type = "ethernet-phy";
 			};
 
+			phy2: ethernet-phy@2 {
+				reg = <0x2>;
+				device_type = "ethernet-phy";
+			};
+
 		};
 	};
 
@@ -112,3 +146,29 @@ Example:
 		altr,has-hash-multicast-filter;
 		phy-handle = <&phy1>;
 	};
+
+	tse_sub_2_eth_tse_0: ethernet@1,00002000 {
+		compatible = "altr,tse-msgdma-2.0";
+		reg = 	<0x00000001 0x00002000 0x00000400>,
+			<0x00000001 0x00002400 0x00000020>,
+			<0x00000001 0x00002420 0x00000020>,
+			<0x00000001 0x00002440 0x00000020>,
+			<0x00000001 0x00002460 0x00000020>,
+			<0x00000001 0x00002480 0x00000040>;
+		reg-names = "control_port", "rx_csr", "rx_pref","tx_csr", "tx_pref", "tod_ctrl";
+		interrupt-parent = <&hps_0_arm_gic_0>;
+		interrupts = <0 45 4>, <0 44 4>;
+		interrupt-names = "rx_irq", "tx_irq";
+		rx-fifo-depth = <2048>;
+		tx-fifo-depth = <2048>;
+		address-bits = <48>;
+		max-frame-size = <1500>;
+		local-mac-address = [ 00 00 00 00 00 00 ];
+		phy-mode = "sgmii";
+		altr,has-supplementary-unicast;
+		altr,has-hash-multicast-filter;
+		altr,has-ptp;
+		altr,tx-poll-cnt = <128>;
+		altr,rx-poll-cnt = <32>;
+		phy-handle = <&phy2>;
+	};
-- 
2.19.2
