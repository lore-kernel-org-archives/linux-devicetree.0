From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 1/2] dt-bindings: pfuze100: add optional pfuze-disable-sw binding
Date: Thu, 12 Jul 2018 13:02:39 +0200
Message-ID: <20180712110240.3006-2-m.felsch@pengutronix.de>
References: <20180712110240.3006-1-m.felsch@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712110240.3006-1-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: fabio.estevam@nxp.com, Anson.Huang@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This binding is used to keep the backward compatibility with the current
dtb's [1]. The binding informs the driver that the unused switch regulators
can be disabled.
If it is not specified, the driver doesn't disable the switch regulators.

[1] https://patchwork.kernel.org/patch/10490381/

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/regulator/pfuze100.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index 672c939045ff..1f17ab7c7123 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -4,6 +4,14 @@ Required properties:
 - compatible: "fsl,pfuze100", "fsl,pfuze200", "fsl,pfuze3000", "fsl,pfuze3001"
 - reg: I2C slave address
 
+Optional properties:
+- pfuze-disable-sw: Disable all unused switch regulators to save power
+  consumption. Attention, some platforms are using the switch regulators as DDR
+  ref or supply voltage. Mark these regulators as "regulator-always-on" to skip
+  disabling these regulators. If not specified, the driver simualtes the
+  disabling. This means the state of the regulator is set to 'disabled' but the
+  driver don't disable the regulator.
+
 Required child node:
 - regulators: This is the list of child nodes that specify the regulator
   initialization data for defined regulators. Please refer to below doc
-- 
2.18.0
