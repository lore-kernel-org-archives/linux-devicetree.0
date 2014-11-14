From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] ARM: mvebu: fix ordering in Armada 370 .dtsi
Date: Fri, 14 Nov 2014 21:43:33 +0100
Message-ID: <20141114204333.GS27002@pengutronix.de>
References: <1415993776-3469-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415993776-3469-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit a095b1c78a35 ("ARM: mvebu: sort DT nodes by address")
missed placing the system-controller in the correct order.             =
                                                                       =
                          =20

=46ixes: a095b1c78a35 ("ARM: mvebu: sort DT nodes by address")
Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Hello Andrew,

I guess your question concerning overlapping ranges doesn't stop this
patch from being useful, does it?

Also thanks for the suggested wording which I nearly took as is.

Best regards
Uwe

 arch/arm/boot/dts/armada-370.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/arma=
da-370.dtsi
index 6b3c23b1e138..7513410f7b89 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -106,11 +106,6 @@
 				reg =3D <0x11100 0x20>;
 			};
=20
-			system-controller@18200 {
-				compatible =3D "marvell,armada-370-xp-system-controller";
-				reg =3D <0x18200 0x100>;
-			};
-
 			pinctrl {
 				compatible =3D "marvell,mv88f6710-pinctrl";
 				reg =3D <0x18000 0x38>;
@@ -205,6 +200,11 @@
 				interrupts =3D <91>;
 			};
=20
+			system-controller@18200 {
+				compatible =3D "marvell,armada-370-xp-system-controller";
+				reg =3D <0x18200 0x100>;
+			};
+
 			gateclk: clock-gating-control@18220 {
 				compatible =3D "marvell,armada-370-gating-clock";
 				reg =3D <0x18220 0x4>;
--=20
2.1.3

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
