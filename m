From: Iyappan Subramanian <isubramanian@apm.com>
Subject: [PATCH v1 2/5] Documentation: dts: Update section header for APM X-Gene
Date: Tue, 23 Sep 2014 20:51:25 -0700
Message-ID: <1411530688-2939-3-git-send-email-isubramanian@apm.com>
References: <1411530688-2939-1-git-send-email-isubramanian@apm.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1411530688-2939-1-git-send-email-isubramanian@apm.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: kchudgar@apm.com, patches@apm.com, Iyappan Subramanian <isubramanian@apm.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Iyappan Subramanian <isubramanian@apm.com>
---
 Documentation/devicetree/bindings/net/apm-xgene-enet.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
index ebcad25..60a7857 100644
--- a/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
+++ b/Documentation/devicetree/bindings/net/apm-xgene-enet.txt
@@ -3,7 +3,7 @@ APM X-Gene SoC Ethernet nodes
 Ethernet nodes are defined to describe on-chip ethernet interfaces in
 APM X-Gene SoC.
 
-Required properties:
+Required properties for all the ethernet interfaces:
 - compatible: Should be "apm,xgene-enet"
 - reg: Address and length of the register set for the device. It contains the
   information of registers in the same order as described by reg-names
@@ -15,6 +15,8 @@ Required properties:
 - clocks: Reference to the clock entry.
 - local-mac-address: MAC address assigned to this device
 - phy-connection-type: Interface type between ethernet device and PHY device
+
+Required properties for ethernet interfaces that has external PHY:
 - phy-handle: Reference to a PHY node connected to this device
 
 - mdio: Device tree subnode with the following required properties:
-- 
1.9.1
