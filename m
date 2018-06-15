From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 1/2] dt-bindings: pfuze100: add pfuze3001 support
Date: Fri, 15 Jun 2018 13:44:52 +0200
Message-ID: <1529063093-19582-2-git-send-email-stefan.wahren@i2se.com>
References: <1529063093-19582-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529063093-19582-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, linux-imx@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This patch extends binding according to support the pfuze3001 chip.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../devicetree/bindings/regulator/pfuze100.txt     | 77 +++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index f0ada3b..672c939 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -1,7 +1,7 @@
 PFUZE100 family of regulators
 
 Required properties:
-- compatible: "fsl,pfuze100", "fsl,pfuze200", "fsl,pfuze3000"
+- compatible: "fsl,pfuze100", "fsl,pfuze200", "fsl,pfuze3000", "fsl,pfuze3001"
 - reg: I2C slave address
 
 Required child node:
@@ -16,6 +16,8 @@ Required child node:
   sw1ab,sw2,sw3a,sw3b,swbst,vsnvs,vrefddr,vgen1~vgen6,coin
   --PFUZE3000
   sw1a,sw1b,sw2,sw3,swbst,vsnvs,vrefddr,vldo1,vldo2,vccsd,v33,vldo3,vldo4
+  --PFUZE3001
+  sw1,sw2,sw3,vsnvs,vldo1,vldo2,vccsd,v33,vldo3,vldo4
 
 Each regulator is defined using the standard binding for regulators.
 
@@ -303,3 +305,76 @@ Example 3: PFUZE3000
 			};
 		};
 	};
+
+Example 4: PFUZE 3001
+
+	pfuze3001: pmic@8 {
+		compatible = "fsl,pfuze3001";
+		reg = <0x08>;
+
+		regulators {
+			sw1_reg: sw1 {
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sw2_reg: sw2 {
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sw3_reg: sw3 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1650000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			snvs_reg: vsnvs {
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen1_reg: vldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen2_reg: vldo2 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1550000>;
+				regulator-always-on;
+			};
+
+			vgen3_reg: vccsd {
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen4_reg: v33 {
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen5_reg: vldo3 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen6_reg: vldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+	};
-- 
2.7.4
