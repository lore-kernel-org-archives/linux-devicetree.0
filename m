From: alex.williams@ettus.com
Subject: [PATCH v2 net-next 2/2] net: nixge: Update device-tree bindings with v3.00
Date: Thu, 31 Jan 2019 13:33:28 -0800
Message-ID: <20190131213328.11236-2-alex.williams@ettus.com>
References: <20190131213328.11236-1-alex.williams@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131213328.11236-1-alex.williams@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mdf@kernel.org, mcgrof@kernel.org, keescook@chromium.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Williams <alex.williams@ni.com>
List-Id: devicetree@vger.kernel.org

From: Alex Williams <alex.williams@ni.com>

Now the DMA engine is free to float elsewhere in the system map.

Signed-off-by: Alex Williams <alex.williams@ni.com>
---
 Documentation/devicetree/bindings/net/nixge.txt | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nixge.txt b/Documentation/devicetree/bindings/net/nixge.txt
index e55af7f0881a..44a7358b4399 100644
--- a/Documentation/devicetree/bindings/net/nixge.txt
+++ b/Documentation/devicetree/bindings/net/nixge.txt
@@ -1,8 +1,14 @@
 * NI XGE Ethernet controller
 
 Required properties:
-- compatible: Should be "ni,xge-enet-2.00"
-- reg: Address and length of the register set for the device
+- compatible: Should be "ni,xge-enet-3.00", but can be "ni,xge-enet-2.00" for
+              older device trees with DMA engines co-located in the address map,
+              with the one reg entry to describe the whole device.
+- reg: Address and length of the register set for the device. It contains the
+       information of registers in the same order as described by reg-names.
+- reg-names: Should contain the reg names
+	"dma":  DMA engine control and status region
+        "ctrl": MDIO and PHY control and status region
 - interrupts: Should contain tx and rx interrupt
 - interrupt-names: Should be "rx" and "tx"
 - phy-mode: See ethernet.txt file in the same directory.
@@ -12,8 +18,10 @@ Required properties:
 
 Examples (10G generic PHY):
 	nixge0: ethernet@40000000 {
-		compatible = "ni,xge-enet-2.00";
-		reg = <0x40000000 0x6000>;
+		compatible = "ni,xge-enet-3.00";
+		reg = <0x40000000 0x4000
+		       0x41002000 0x2000>;
+		reg-names = "dma", "ctrl";
 
 		nvmem-cells = <&eth1_addr>;
 		nvmem-cell-names = "address";
-- 
2.14.5
