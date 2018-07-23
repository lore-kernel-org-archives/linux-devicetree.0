From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 1/2] dt-bindings: pfuze100: add optional disable switch-regulators binding
Date: Mon, 23 Jul 2018 09:47:46 +0200
Message-ID: <20180723074747.9328-2-m.felsch@pengutronix.de>
References: <20180723074747.9328-1-m.felsch@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723074747.9328-1-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org
Cc: fabio.estevam@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de, Anson.Huang@nxp.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This binding is used to keep the backward compatibility with the current
dtb's [1]. The binding informs the driver that the unused switch regulators
can be disabled.
If it is not specified, the driver doesn't disable the switch regulators.

[1] https://patchwork.kernel.org/patch/10490381/

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

---
Changes in v3:
  - rename dt binding, add -sw suffix
  - fix description

Changes in V2:
  - add more information about the binding
  - rename binding and add vendor prefix

 Documentation/devicetree/bindings/regulator/pfuze100.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index 672c939045ff..c7610718adff 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -4,6 +4,15 @@ Required properties:
 - compatible: "fsl,pfuze100", "fsl,pfuze200", "fsl,pfuze3000", "fsl,pfuze3001"
 - reg: I2C slave address
 
+Optional properties:
+- fsl,pfuze-support-disable-sw: Boolean, if present disable all unused switch
+  regulators to save power consumption. Attention, ensure that all important
+  regulators (e.g. DDR ref, DDR supply) has set the "regulator-always-on"
+  property. If not present, the switched regualtors are always on and can't be
+  disabled. This binding is a workaround to keep backward compatibility with
+  old dtb's which rely on the fact that the switched regulators are always on
+  and don't mark them explicit as "regulator-always-on".
+
 Required child node:
 - regulators: This is the list of child nodes that specify the regulator
   initialization data for defined regulators. Please refer to below doc
-- 
2.18.0
