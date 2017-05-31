From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v2 4/6] regulator: pfuze100: add fsl,pmic_stby_poweroff property
Date: Wed, 31 May 2017 08:14:55 +0200
Message-ID: <20170531061457.23744-5-o.rempel@pengutronix.de>
References: <20170531061457.23744-1-o.rempel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170531061457.23744-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@rempel-privat.de
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the new optional "fsl,pmic_stby_poweroff" property.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: kernel@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/regulator/pfuze100.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index 444c47831a40..216519c4a50d 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -4,6 +4,10 @@ Required properties:
 - compatible: "fsl,pfuze100", "fsl,pfuze200", "fsl,pfuze3000"
 - reg: I2C slave address
 
+Optional properties:
+- fsl,pmic_stby_poweroff: if present, configure the PMIC to shutdown all
+  power rails when PMIC_STBY_REQ line is asserted during the power off sequence.
+
 Required child node:
 - regulators: This is the list of child nodes that specify the regulator
   initialization data for defined regulators. Please refer to below doc
-- 
2.11.0
