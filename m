From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V3] bcma: use device from DT (brcm,bus-chipcommon) for SoC GPIO chip
Date: Tue, 30 Sep 2014 12:22:26 +0200
Message-ID: <1412072546-3529-1-git-send-email-zajec5@gmail.com>
References: <1411892641-5662-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411892641-5662-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This will allow us to define GPIO-attached devices (LEDs, buttons) in
the the device tree.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
This is based on top of
[PATCH v6] bcma: register bcma as device tree driver
that I hope will reach wireless-next git tree.

V2: Describe axi chilren and make gpio a child of chipcommon core.
V3: Make chipcommon a GPIO controller (avoid extra sub-child)
    Speed up finding OF node in driver_gpio.c
---
 Documentation/devicetree/bindings/bus/bcma.txt | 13 +++++++++++++
 drivers/bcma/driver_gpio.c                     |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/bcma.txt b/Documenta=
tion/devicetree/bindings/bus/bcma.txt
index e9070c1..0538692 100644
--- a/Documentation/devicetree/bindings/bus/bcma.txt
+++ b/Documentation/devicetree/bindings/bus/bcma.txt
@@ -9,6 +9,11 @@ Required properties:
 The cores on the AXI bus are automatically detected by bcma with the
 memory ranges they are using and they get registered afterwards.
=20
+The top-level axi bus may contain children representing attached cores
+(devices). This is needed since some hardware details can't be auto
+detected (e.g. IRQ numbers). Also some of the cores may be responsible
+for extra things, e.g. ChipCommon providing access to the GPIO chip.
+
 Example:
=20
 	axi@18000000 {
@@ -17,4 +22,12 @@ Example:
 		ranges =3D <0x00000000 0x18000000 0x00100000>;
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
+
+		chipcommon {
+			compatible =3D "brcm,bus-chipcommon";
+			reg =3D <0x00000000 0x1000>;
+
+			gpio-controller;
+			#gpio-cells =3D <2>;
+		};
 	};
diff --git a/drivers/bcma/driver_gpio.c b/drivers/bcma/driver_gpio.c
index 8ea497c..28bdbe5 100644
--- a/drivers/bcma/driver_gpio.c
+++ b/drivers/bcma/driver_gpio.c
@@ -218,6 +218,12 @@ int bcma_gpio_init(struct bcma_drv_cc *cc)
 #if IS_BUILTIN(CONFIG_BCM47XX)
 	chip->to_irq		=3D bcma_gpio_to_irq;
 #endif
+#if IS_BUILTIN(CONFIG_OF)
+	if (cc->core->bus->hosttype =3D=3D BCMA_HOSTTYPE_SOC)
+		chip->of_node	=3D of_find_compatible_node(
+					bus->host_pdev->dev.of_node, NULL,
+					"brcm,bus-chipcommon");
+#endif
 	switch (cc->core->bus->chipinfo.id) {
 	case BCMA_CHIP_ID_BCM5357:
 	case BCMA_CHIP_ID_BCM53572:
--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
