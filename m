From: Huang Shijie <shijie.huang-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] arm64: dts: Juno: fix the wrong memory map sizes for the I2C/EHCI/OHCI
Date: Mon, 17 Aug 2015 10:05:25 +0800
Message-ID: <1439777125-9409-1-git-send-email-shijie.huang@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Huang Shijie <shijie.huang-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>From the "Juno ARM Development Platform Soc Techinical Reference Mannual(r1=
p0)",
we get the following memory map sizes (3-25):
=09I2C      : 0x7ffa0000  0x7ffa00ff       (256B)
=09USB OHCI : 0x7ffb0000  0x7ffb0fff       (4KB)
=09USB EHCI : 0x7ffc0000  0x7ffc0fff       (4KB)

This patch fixes the wrong memory map sizes for them.

Signed-off-by: Huang Shijie <shijie.huang-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/a=
rm/juno-base.dtsi
index e3ee960..7b2715f 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -74,7 +74,7 @@
=20
 =09i2c@7ffa0000 {
 =09=09compatible =3D "snps,designware-i2c";
-=09=09reg =3D <0x0 0x7ffa0000 0x0 0x1000>;
+=09=09reg =3D <0x0 0x7ffa0000 0x0 0x100>;
 =09=09#address-cells =3D <1>;
 =09=09#size-cells =3D <0>;
 =09=09interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
@@ -95,14 +95,14 @@
=20
 =09ohci@7ffb0000 {
 =09=09compatible =3D "generic-ohci";
-=09=09reg =3D <0x0 0x7ffb0000 0x0 0x10000>;
+=09=09reg =3D <0x0 0x7ffb0000 0x0 0x1000>;
 =09=09interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 =09=09clocks =3D <&soc_usb48mhz>;
 =09};
=20
 =09ehci@7ffc0000 {
 =09=09compatible =3D "generic-ehci";
-=09=09reg =3D <0x0 0x7ffc0000 0x0 0x10000>;
+=09=09reg =3D <0x0 0x7ffc0000 0x0 0x1000>;
 =09=09interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 =09=09clocks =3D <&soc_usb48mhz>;
 =09};
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
