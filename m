From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] arm64: dts: add baud rate to Juno stdout-path
Date: Thu, 22 Jan 2015 11:21:32 +0000
Message-ID: <d0f44fbb7ffc85806ab00d7e54a64161ef79cad7.1421924801.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Without explicit command-line parameters, the Juno UART ends up running
at 57600 baud in the kernel, which is at odds with the 115200 baud used
by the rest of the firmware. Since commit 7914a7c5651a5161 now lets us
fix this by specifying default options in stdout-path, do so.

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/jun=
o.dts
index cb3073e..d429129 100644
--- a/arch/arm64/boot/dts/arm/juno.dts
+++ b/arch/arm64/boot/dts/arm/juno.dts
@@ -22,7 +22,7 @@
 =09};
=20
 =09chosen {
-=09=09stdout-path =3D &soc_uart0;
+=09=09stdout-path =3D "serial0:115200n8";
 =09};
=20
 =09psci {
--=20
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
