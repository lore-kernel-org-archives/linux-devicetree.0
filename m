From: "=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?=" <vokac.m@gmail.com>
Subject: [PATCH net-next v3 1/7] net: dsa: qca8k: Add QCA8334 binding documentation
Date: Wed, 23 May 2018 08:20:18 +0200
Message-ID: <1527056424-14528-2-git-send-email-michal.vokac@ysoft.com>
References: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, michal.vokac@ysoft.com
List-Id: devicetree@vger.kernel.org

Add support for the four-port variant of the Qualcomm QCA833x switch.

The CPU port default link settings can be reconfigured using
a fixed-link sub-node.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v3:
 - Correct fixed-link node documentation term: s/property/node.
 - Add "Reviewed-by" tag from Rob and Andrew.

Changes in v2:
 - Add commit message and document fixed-link binding.

 .../devicetree/bindings/net/dsa/qca8k.txt          | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.txt b/Documentation/devicetree/bindings/net/dsa/qca8k.txt
index 9c67ee4..bbcb255 100644
--- a/Documentation/devicetree/bindings/net/dsa/qca8k.txt
+++ b/Documentation/devicetree/bindings/net/dsa/qca8k.txt
@@ -2,7 +2,10 @@
 
 Required properties:
 
-- compatible: should be "qca,qca8337"
+- compatible: should be one of:
+    "qca,qca8334"
+    "qca,qca8337"
+
 - #size-cells: must be 0
 - #address-cells: must be 1
 
@@ -14,6 +17,20 @@ port and PHY id, each subnode describing a port needs to have a valid phandle
 referencing the internal PHY connected to it. The CPU port of this switch is
 always port 0.
 
+A CPU port node has the following optional node:
+
+- fixed-link            : Fixed-link subnode describing a link to a non-MDIO
+                          managed entity. See
+                          Documentation/devicetree/bindings/net/fixed-link.txt
+                          for details.
+
+For QCA8K the 'fixed-link' sub-node supports only the following properties:
+
+- 'speed' (integer, mandatory), to indicate the link speed. Accepted
+  values are 10, 100 and 1000
+- 'full-duplex' (boolean, optional), to indicate that full duplex is
+  used. When absent, half duplex is assumed.
+
 Example:
 
 
@@ -53,6 +70,10 @@ Example:
 					label = "cpu";
 					ethernet = <&gmac1>;
 					phy-mode = "rgmii";
+					fixed-link {
+						speed = 1000;
+						full-duplex;
+					};
 				};
 
 				port@1 {
-- 
2.7.4
