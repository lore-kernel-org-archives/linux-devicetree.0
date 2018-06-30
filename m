Return-Path: <SRS0=Ekl+=JQ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 6/7] mmc: pxamci: remove pxa-mmc,gpio-power from devicetree bindings
Date: Sat, 30 Jun 2018 20:14:04 +0200
Message-Id: <20180630181405.17630-7-daniel@zonque.org>
In-Reply-To: <20180630181405.17630-1-daniel@zonque.org>
References: <20180630181405.17630-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Devicetree-enabled boards should use proper regulators to control the
power of cards, not GPIOs, so let's remove this property. The regulator
properties are supported by the MMC core and are described in the
generic MMC document:

  Documentation/devicetree/bindings/mmc/mmc.txt

Note that devicetree support for PXA platforms hasn't fully landed yet,
so this binding does not have any users at this point.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 Documentation/devicetree/bindings/mmc/pxa-mmc.txt | 2 +-
 drivers/mmc/host/pxamci.c                         | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/pxa-mmc.txt b/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
index f2687752597e..5f5c2bec2b8c 100644
--- a/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
@@ -8,7 +8,6 @@ Required properties:
 
 Optional properties:
 - marvell,detect-delay-ms: sets the detection delay timeout in ms.
-- marvell,gpio-power: GPIO spec for the card power enable pin
 
 In addition to the properties described in this docuent, the details
 described in mmc.txt are supported.
@@ -19,6 +18,7 @@ mmc0: mmc@41100000 {
 	compatible = "marvell,pxa-mmc";
 	reg = <0x41100000 0x1000>;
 	interrupts = <23>;
+	vmmc-supply = <&mmc_regulator>;
 	cd-gpios = <&gpio 23 0>;
 	wp-gpios = <&gpio 24 0>;
 };
diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index e046e684b3f9..1e7703116763 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -607,9 +607,6 @@ static int pxamci_of_init(struct platform_device *pdev,
 		return -ENOMEM;
 
 	/* pxa-mmc specific */
-	pdata->gpio_power =
-		of_get_named_gpio(np, "pxa-mmc,gpio-power", 0);
-
 	if (of_property_read_u32(np, "pxa-mmc,detect-delay-ms", &tmp) == 0)
 		pdata->detect_delay_ms = tmp;
 
-- 
2.17.1
