Return-Path: <SRS0=1b4G=JP=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 6/7] mmc: pxamci: remove pxa-mmc,gpio-power from devicetree bindings
Date: Fri, 29 Jun 2018 16:47:37 +0200
Message-Id: <20180629144738.446-7-daniel@zonque.org>
In-Reply-To: <20180629144738.446-1-daniel@zonque.org>
References: <20180629144738.446-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Devicetree-enabled boards should use proper regulators to control the
power of cards, not GPIOs, so let's remove this property. The regulator
properties are are supported by the MMC core and are described in the
generic MMC document:

  Documentation/devicetree/bindings/mmc/mmc.txt

Note that devicetree support for PXA platforms hasn't fully landed yet,
so this binding does not have any users at this point.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 Documentation/devicetree/bindings/mmc/pxa-mmc.txt | 1 -
 drivers/mmc/host/pxamci.c                         | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/pxa-mmc.txt b/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
index b7025de7dced..359b13977f24 100644
--- a/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/pxa-mmc.txt
@@ -8,7 +8,6 @@ Required properties:
 
 Optional properties:
 - marvell,detect-delay-ms: sets the detection delay timeout in ms.
-- marvell,gpio-power: GPIO spec for the card power enable pin
 
 This file documents differences between the core properties in mmc.txt
 and the properties used by the pxa-mmc driver.
diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index e15708aa77a2..c01d69904e2a 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -612,9 +612,6 @@ static int pxamci_of_init(struct platform_device *pdev,
 		of_get_named_gpio(np, "wp-gpios", 0);
 
 	/* pxa-mmc specific */
-	pdata->gpio_power =
-		of_get_named_gpio(np, "pxa-mmc,gpio-power", 0);
-
 	if (of_property_read_u32(np, "pxa-mmc,detect-delay-ms", &tmp) == 0)
 		pdata->detect_delay_ms = tmp;
 
-- 
2.17.1
