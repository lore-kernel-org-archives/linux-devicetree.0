From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v4 1/3] regulator: axp20x: add drivevbus support for axp803
Date: Fri, 12 Jan 2018 12:00:16 +0530
Message-ID: <1515738618-3617-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Like axp221, axp223, axp813 the axp803 is also supporting external
regulator to drive the  OTG VBus through N_VBUSEN PMIC pin.

Add support for it.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes for v4:
- rebase on master
Changes for v3:
- Update drivevbus in table of regulators

 Documentation/devicetree/bindings/mfd/axp20x.txt | 3 ++-
 drivers/regulator/axp20x-regulator.c             | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
index 9455503..d1762f3 100644
--- a/Documentation/devicetree/bindings/mfd/axp20x.txt
+++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
@@ -43,7 +43,7 @@ Optional properties:
 			  regulator to drive the OTG VBus, rather then
 			  as an input pin which signals whether the
 			  board is driving OTG VBus or not.
-			  (axp221 / axp223 / axp813 only)
+			  (axp221 / axp223 / axp803/ axp813 only)
 
 - x-powers,master-mode: Boolean (axp806 only). Set this when the PMIC is
 			wired for master mode. The default is slave mode.
@@ -132,6 +132,7 @@ FLDO2		: LDO		: fldoin-supply		: shared supply
 LDO_IO0		: LDO		: ips-supply		: GPIO 0
 LDO_IO1		: LDO		: ips-supply		: GPIO 1
 RTC_LDO		: LDO		: ips-supply		: always on
+DRIVEVBUS	: Enable output	: drivevbus-supply	: external regulator
 
 AXP806 regulators, type, and corresponding input supply names:
 
diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 181622b..91b8ff8 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -721,6 +721,8 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 	case AXP803_ID:
 		regulators = axp803_regulators;
 		nregulators = AXP803_REG_ID_MAX;
+		drivevbus = of_property_read_bool(pdev->dev.parent->of_node,
+						  "x-powers,drive-vbus-en");
 		break;
 	case AXP806_ID:
 		regulators = axp806_regulators;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
