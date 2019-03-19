From: Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: net: dsa: qca8k: fix example
Date: Tue, 19 Mar 2019 20:54:17 +0100
Message-ID: <20190319195419.12746-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

In the example, the phy at phy@0 is clashing with
the switch0@0 at the same address. Usually, the switches
are accessible through pseudo PHYs which in case of the
qca8k are located at 0x10 - 0x18.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/qca8k.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.txt b/Documentation/devicetree/bindings/net/dsa/qca8k.txt
index bbcb255c3150..5eda99e6c86e 100644
--- a/Documentation/devicetree/bindings/net/dsa/qca8k.txt
+++ b/Documentation/devicetree/bindings/net/dsa/qca8k.txt
@@ -55,12 +55,12 @@ Example:
 			reg = <4>;
 		};
 
-		switch0@0 {
+		switch@10 {
 			compatible = "qca,qca8337";
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			reg = <0>;
+			reg = <0x10>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.20.1
