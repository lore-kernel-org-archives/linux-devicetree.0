From: Iyappan Subramanian <isubramanian@apm.com>
Subject: [PATCH net-next v1 1/3] Documentation: dts: xgene: Update interrupt field description
Date: Wed, 25 Mar 2015 12:19:10 -0700
Message-ID: <1427311152-30333-2-git-send-email-isubramanian@apm.com>
References: <1427311152-30333-1-git-send-email-isubramanian@apm.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1427311152-30333-1-git-send-email-isubramanian@apm.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kchudgar@apm.com, patches@apm.com, Iyappan Subramanian <isubramanian@apm.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Iyappan Subramanian <isubramanian@apm.com>
Signed-off-by: Keyur Chudgar <kchudgar@apm.com>
---
 Documentation/devicetree/bindings/net/apm-xgene-enet.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
index dc7961b..f55aa28 100644
--- a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
+++ b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
@@ -14,7 +14,10 @@ Required properties for all the ethernet interfaces:
   - "enet_csr": Ethernet control and status register address space
   - "ring_csr": Descriptor ring control and status register address space
   - "ring_cmd": Descriptor ring command register address space
-- interrupts: Ethernet main interrupt
+- interrupts: Two interrupt specifiers can be specified.
+  - First is the Rx interrupt.  This irq is mandatory.
+  - Second is the Tx completion interrupt.
+    This is supported only on SGMII based 1GbE and 10GbE interfaces.
 - port-id: Port number (0 or 1)
 - clocks: Reference to the clock entry.
 - local-mac-address: MAC address assigned to this device
-- 
1.9.1
