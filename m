From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] clocksource: sunxi: Add new compatibles
Date: Mon, 3 Feb 2014 20:45:05 +0100
Message-ID: <20140203194505.GF25625@lukather>
References: <1391348280-9484-1-git-send-email-maxime.ripard@free-electrons.com>
 <52EFC573.2050302@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O98KdSgI27dgYlM5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52EFC573.2050302-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--O98KdSgI27dgYlM5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

(Adding DT mailing-list in CC)

On Mon, Feb 03, 2014 at 05:36:03PM +0100, Daniel Lezcano wrote:
> On 02/02/2014 02:37 PM, Maxime Ripard wrote:
> >The Allwinner A10 compatibles were following a slightly different compat=
ible
> >patterns than the rest of the SoCs for historical reasons. Add compatibl=
es
> >matching the other pattern to the timer driver for consistency, and keep=
 the
> >older one for backward compatibility.
>=20
> Hi Maxime,
>=20
> is it really needed to keep the old pattern ?

We agreed during the ARM Kernel Summit to consider the DT as a stable
ABI.

While I'd be ok with removing the older ones, that also means that we
would break the boot of newer kernels with older DT, so yes, we
actually need to keep the old compatibles.

> >Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >---
> >  Documentation/devicetree/bindings/timer/allwinner,sun4i-timer.txt | 5 =
+++--
> >  drivers/clocksource/sun4i_timer.c                                 | 4 =
++++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> >diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun4i-tim=
er.txt b/Documentation/devicetree/bindings/timer/allwinner,sun4i-timer.txt
> >index 48aeb78..d9e35ae 100644
> >--- a/Documentation/devicetree/bindings/timer/allwinner,sun4i-timer.txt
> >+++ b/Documentation/devicetree/bindings/timer/allwinner,sun4i-timer.txt
> >@@ -2,7 +2,8 @@ Allwinner A1X SoCs Timer Controller
> >
> >  Required properties:
> >
> >-- compatible : should be "allwinner,sun4i-timer"
> >+- compatible : should be "allwinner,sun4i-a10-timer"
> >+               (Deprecated "allwinner,sun4i-timer")
> >  - reg : Specifies base physical address and size of the registers.
> >  - interrupts : The interrupt of the first timer
> >  - clocks: phandle to the source clock (usually a 24 MHz fixed clock)
> >@@ -10,7 +11,7 @@ Required properties:
> >  Example:
> >
> >  timer {
> >-	compatible =3D "allwinner,sun4i-timer";
> >+	compatible =3D "allwinner,sun4i-a10-timer";
> >  	reg =3D <0x01c20c00 0x400>;
> >  	interrupts =3D <22>;
> >  	clocks =3D <&osc>;
> >diff --git a/drivers/clocksource/sun4i_timer.c b/drivers/clocksource/sun=
4i_timer.c
> >index bf497af..de03895 100644
> >--- a/drivers/clocksource/sun4i_timer.c
> >+++ b/drivers/clocksource/sun4i_timer.c
> >@@ -196,5 +196,9 @@ static void __init sun4i_timer_init(struct device_no=
de *node)
> >  	clockevents_config_and_register(&sun4i_clockevent, rate,
> >  					TIMER_SYNC_TICKS, 0xffffffff);
> >  }
> >+CLOCKSOURCE_OF_DECLARE(sun4i, "allwinner,sun4i-a10-timer",
> >+		       sun4i_timer_init);
> >+
> >+/* Deprecated */
> >  CLOCKSOURCE_OF_DECLARE(sun4i, "allwinner,sun4i-timer",
> >  		       sun4i_timer_init);
> >
>=20
>=20
> --=20
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>=20
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>=20

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--O98KdSgI27dgYlM5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS7/HBAAoJEBx+YmzsjxAgttQP/RXUtW1XsHcey0SiaiaHSZo+
29XA/l8GV3hw24Q39Mv/7PgMaQdXSVcKWiQppj98IRBwF3Wrsa0aTnhLJbWSCDYa
2LrpjGte/nMUDXMDW9JuZdDjns4cpkCaPlApnDhj5xUBYzSTDivdCWVMJEm7nk3s
gVv3nCqKF7CTrmETDOxK2tRGehm90tFC3Ud4OLOIZjRop4wK6/ZLaCbHR7WEEG0/
a8Ac2d5TVEiXRivZ469HvqJJ2uNKc5Gj527Rh8Be4VN0XBWriFBjcIbR68YTMUQv
aGM+vhZe7zcGgNeeEZcCxEJfB6jo7vcs8Al+DmLHww1ae3wSDpitBm0oyauVYpOv
PZxpMh7IQLg4Y5BfmhJer83H+sT31LFK2YhDYBPFQVptd7daVMhpUEiluKTA2C3G
KQM2uXdVcd5sb/JKVwh5KVbz5bAfC/kxA6NeErLn+BrjfoQS0vCvuCa4aD1wp4Kw
6qWuFMMk3rFuUoTJXs3ap6pK4xKGiexU5ZDwADtV71bleT6w33oRAW3P8C5/D6vg
34HstbofRVRPfU16vguAkFzAJ9RstzKh7bONoKlsSvpIaYpZJwW6rGdeEM+M6tXN
VVUFPxkUDdy91fMHAfNYnp4kqQw2zYaGrVUGP8jG3DkibmgYGekIDOqVthwSCA3q
RmP4+Qa/hvg0fHoOqdxh
=ld8n
-----END PGP SIGNATURE-----

--O98KdSgI27dgYlM5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
