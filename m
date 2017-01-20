From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v3 5/7] NFC: trf7970a: Remove support for 'vin-voltage-override' DT property
Date: Fri, 20 Jan 2017 12:17:43 -0700
Message-ID: <20170120191745.29255-6-mgreer@animalcreek.com>
References: <20170120191745.29255-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120191745.29255-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The 'vin-voltage-override' DT property is used by the trf7970a
driver to override the voltage presented to the driver by the
regulator subsystem.  This is unnecessary as properly specifying
the regulator chain via DT properties will accomplish the same
thing.  Therefore, remove support for 'vin-voltage-override'.

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 Documentation/devicetree/bindings/net/nfc/trf7970a.txt |  2 --
 drivers/nfc/trf7970a.c                                 | 11 +----------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
index 32b35a07abe4..07008d334536 100644
--- a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+++ b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
@@ -13,7 +13,6 @@ Optional SoC Specific Properties:
 - pinctrl-names: Contains only one value - "default".
 - pintctrl-0: Specifies the pin control groups used for this controller.
 - autosuspend-delay: Specify autosuspend delay in milliseconds.
-- vin-voltage-override: Specify voltage of VIN pin in microvolts.
 - irq-status-read-quirk: Specify that the trf7970a being used has the
   "IRQ Status Read" erratum.
 - en2-rf-quirk: Specify that the trf7970a being used has the "EN2 RF"
@@ -38,7 +37,6 @@ Example (for ARM-based BeagleBone with TRF7970A on SPI1):
 		ti,enable-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>,
 				  <&gpio2 5 GPIO_ACTIVE_LOW>;
 		vin-supply = <&ldo3_reg>;
-		vin-voltage-override = <5000000>;
 		autosuspend-delay = <30000>;
 		irq-status-read-quirk;
 		en2-rf-quirk;
diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 6fd85be49365..bc3c71daaea5 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -1979,12 +1979,6 @@ static int trf7970a_get_autosuspend_delay(struct device_node *np)
 	return autosuspend_delay;
 }
 
-static int trf7970a_get_vin_voltage_override(struct device_node *np,
-		u32 *vin_uvolts)
-{
-	return of_property_read_u32(np, "vin-voltage-override", vin_uvolts);
-}
-
 static int trf7970a_probe(struct spi_device *spi)
 {
 	struct device_node *np = spi->dev.of_node;
@@ -2064,10 +2058,7 @@ static int trf7970a_probe(struct spi_device *spi)
 		goto err_destroy_lock;
 	}
 
-	ret = trf7970a_get_vin_voltage_override(np, &uvolts);
-	if (ret)
-		uvolts = regulator_get_voltage(trf->regulator);
-
+	uvolts = regulator_get_voltage(trf->regulator);
 	if (uvolts > 4000000)
 		trf->chip_status_ctrl = TRF7970A_CHIP_STATUS_VRS5_3;
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
