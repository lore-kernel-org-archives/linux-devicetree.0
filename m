From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH RESENT] powerpc: dts: don't fall back to fsl,pq3-gpio for fsl,mpc8572-gpio devices
Date: Fri, 31 Jul 2015 11:16:06 +0200
Message-ID: <1438334166-12579-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

While the handling of fsl,pq3-gpio and fsl,mpc8572-gpio is done in the
same driver and the two hardly differ, the latter controller needs a
workaround for an erratum in the gpio_get callback. To make this
difference more explicit remove fsl,pq3-gpio from the list of
compatibles for mpc8572 machines.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Hello,

got the parameters for git-send-email wrong and forgot to send this to =
the
powerpc folks.

Best regards
Uwe

 arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi b/arch/power=
pc/boot/dts/fsl/mpc8536si-post.dtsi
index c8b2daa40ac8..41935709ebe8 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
@@ -172,7 +172,7 @@
=20
 	/* mark compat w/8572 to get some erratum treatment */
 	gpio-controller@f000 {
-		compatible =3D "fsl,mpc8572-gpio", "fsl,pq3-gpio";
+		compatible =3D "fsl,mpc8572-gpio";
 	};
=20
 	sata@18000 {
diff --git a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi b/arch/power=
pc/boot/dts/fsl/mpc8572si-post.dtsi
index d44e25a48734..49294cf36b4e 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
@@ -162,7 +162,7 @@
 /include/ "pq3-dma-1.dtsi"
 /include/ "pq3-gpio-0.dtsi"
 	gpio-controller@f000 {
-		compatible =3D "fsl,mpc8572-gpio", "fsl,pq3-gpio";
+		compatible =3D "fsl,mpc8572-gpio";
 	};
=20
 	L2: l2-cache-controller@20000 {
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
