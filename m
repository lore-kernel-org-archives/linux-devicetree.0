From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: fix ordering in Armada 370 .dtsi
Date: Fri, 14 Nov 2014 21:22:00 +0100
Message-ID: <20141114202200.GI2001@lunn.ch>
References: <1415993776-3469-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415993776-3469-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 14, 2014 at 08:36:16PM +0100, Uwe Kleine-K=F6nig wrote:
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

It is normal to have something in the changelog, even if it is the
same as the subject said differently.

Here you could say something like:

Commit a095b1c78a35f05755 "ARM: mvebu: sort DT nodes by address"
missed placing the system-controller in the correct order.

> ---
>  arch/arm/boot/dts/armada-370.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/ar=
mada-370.dtsi
> index 6b3c23b1e138..7513410f7b89 100644
> --- a/arch/arm/boot/dts/armada-370.dtsi
> +++ b/arch/arm/boot/dts/armada-370.dtsi
> @@ -106,11 +106,6 @@
>  				reg =3D <0x11100 0x20>;
>  			};
> =20
> -			system-controller@18200 {
> -				compatible =3D "marvell,armada-370-xp-system-controller";
> -				reg =3D <0x18200 0x100>;
> -			};
> -
>  			pinctrl {
>  				compatible =3D "marvell,mv88f6710-pinctrl";
>  				reg =3D <0x18000 0x38>;
> @@ -205,6 +200,11 @@
>  				interrupts =3D <91>;
>  			};
> =20
> +			system-controller@18200 {
> +				compatible =3D "marvell,armada-370-xp-system-controller";
> +				reg =3D <0x18200 0x100>;
> +			};
> +
>  			gateclk: clock-gating-control@18220 {
>  				compatible =3D "marvell,armada-370-gating-clock";
>  				reg =3D <0x18220 0x4>;

Humm.

Now we have things in the right order, we see that the
system-controller and the clock-gating-controller overlap.

I know the HW engineers have gone a bit crazy around here, so maybe we
have no choice?

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
