Return-Path: <SRS0=Syxf=JG=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] dt-bindings: w1-gpio: Remove unneeded unit address
Date: Wed, 20 Jun 2018 15:47:26 -0300
Message-Id: <1529520446-8042-1-git-send-email-festevam@gmail.com>
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

Remove unneeded unit address from onewire node, so that dtc does not
complain that unit address is present without a corresponding reg entry,
when such use is made on a real dts file.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Fixed typo in commit log "dtc does not complain"

 Documentation/devicetree/bindings/w1/w1-gpio.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/w1/w1-gpio.txt b/Documentation/devicetree/bindings/w1/w1-gpio.txt
index 6e09c35..3709190 100644
--- a/Documentation/devicetree/bindings/w1/w1-gpio.txt
+++ b/Documentation/devicetree/bindings/w1/w1-gpio.txt
@@ -15,7 +15,7 @@ Optional properties:
 
 Examples:
 
-	onewire@0 {
+	onewire {
 		compatible = "w1-gpio";
 		gpios = <&gpio 126 0>, <&gpio 105 0>;
 	};
-- 
2.7.4
