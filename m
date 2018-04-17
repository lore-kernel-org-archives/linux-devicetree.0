From: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
Subject: [PATCH net-next 1/3] net: phy: Add binding for vendor specific C45 MDIO address space
Date: Tue, 17 Apr 2018 04:02:31 -0500
Message-ID: <20180417090233.21548-2-vicentiu.galanopulo@nxp.com>
References: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
Reply-To: vicentiu.galanopulo@nxp.com
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch, robh@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org
Cc: alexandru.marginean@nxp.com, madalin.bucur@nxp.com, vicentiu.galanopulo@nxp.com
List-Id: devicetree@vger.kernel.org

The extra property enables the discovery on the MDIO bus
of the PHYs which have a vendor specific address space
for accessing the C45 MDIO registers.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
---
 Documentation/devicetree/bindings/net/phy.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
index d2169a5..82692e2 100644
--- a/Documentation/devicetree/bindings/net/phy.txt
+++ b/Documentation/devicetree/bindings/net/phy.txt
@@ -61,6 +61,11 @@ Optional Properties:
 - reset-deassert-us: Delay after the reset was deasserted in microseconds.
   If this property is missing the delay will be skipped.
 
+- dev-addr: If set, it indicates the device address of the PHY to be used
+  when accessing the C45 PHY registers over MDIO. It is used for vendor specific
+  register space addresses that do no conform to standard address for the MDIO
+  registers (e.g. MMD30)
+
 Example:
 
 ethernet-phy@0 {
@@ -72,4 +77,5 @@ ethernet-phy@0 {
 	reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	reset-assert-us = <1000>;
 	reset-deassert-us = <2000>;
+	dev-addr = <0x1e>;
 };
-- 
2.7.4
