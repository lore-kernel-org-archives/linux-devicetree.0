From: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Subject: [PATCH v2 2/4] dt-bindings: net: qcom: Add binding for shared mdio bus
Date: Mon, 17 Sep 2018 16:53:29 +0800
Message-ID: <1537174411-34510-3-git-send-email-dongsheng.wang@hxt-semitech.com>
References: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
Sender: netdev-owner@vger.kernel.org
To: timur@kernel.org, andrew@lunn.ch
Cc: davem@davemloft.net, Wang Dongsheng <dongsheng.wang@hxt-semitech.com>, yu.zheng@hxt-semitech.com, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This property copy from "ibm,emac.txt" to describe a shared MIDO bus.
Since emac include MDIO, so If the motherboard has more than one PHY
connected to an MDIO bus, this property will point to the MAC device
that has the MDIO bus.

Signed-off-by: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
---
V2: s/Since QDF2400 emac/Since emac/
---
 Documentation/devicetree/bindings/net/qcom-emac.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom-emac.txt b/Documentation/devicetree/bindings/net/qcom-emac.txt
index 346e6c7f47b7..50db71771358 100644
--- a/Documentation/devicetree/bindings/net/qcom-emac.txt
+++ b/Documentation/devicetree/bindings/net/qcom-emac.txt
@@ -24,6 +24,9 @@ Internal PHY node:
 The external phy child node:
 - reg : The phy address
 
+Optional properties:
+- mdio-device : Shared MIDO bus.
+
 Example:
 
 FSM9900:
@@ -86,6 +89,7 @@ soc {
 		reg = <0x0 0x38800000 0x0 0x10000>,
 		      <0x0 0x38816000 0x0 0x1000>;
 		interrupts = <0 256 4>;
+		mdio-device = <&emac1>;
 
 		clocks = <&gcc 0>, <&gcc 1>, <&gcc 3>, <&gcc 4>, <&gcc 5>,
 			 <&gcc 6>, <&gcc 7>;
-- 
2.18.0
