From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: sun8i: v3s: add backlight device node for
 Lichee Pi Zero LCD
Date: Mon, 29 May 2017 09:41:17 +0200
Message-ID: <20170529074117.x7pm2k2lbznl2n5j@flea.home>
References: <20170524121320.4171-1-icenowy@aosc.io>
 <20170524121320.4171-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5wqwd53k2xnqrp6s"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170524121320.4171-3-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5wqwd53k2xnqrp6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 24, 2017 at 08:13:20PM +0800, Icenowy Zheng wrote:
> The 40-pin LCD connector on Lichee Pi Zero has backlight pins, which is
> controlled by the PWM0 controller of the V3s SoC, and the controlling
> part is on the board.
>=20
> Add the PWM and backlight device nodes in the device tree file, but
> leave them disabled, as they can only be useful when the LCD is
> attached. The LCD device tree overlay files can enable these controllers
> and make use of them.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts b/arch/arm/boo=
t/dts/sun8i-v3s-licheepi-zero.dts
> index 387fc2aa546d..e0721bf725d1 100644
> --- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> +++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
> @@ -52,6 +52,14 @@
>  		serial0 =3D &uart0;
>  	};
> =20
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm 0 50000 0>;
> +		brightness-levels =3D <0 10 20 30 40 50 60 70 80 90 100>;

This is unlikely, the perceived brightness by the human eye is not
linear, and is actually much closer to a logarithmic function, which
means you should have use an exponential function here in order to
appear that your brightness increase is linear.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5wqwd53k2xnqrp6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZK9CdAAoJEBx+YmzsjxAgnjEP/3kMRCu2TrZGKXooUBafXaVS
CvFj+rGvwL1/7K81G9M8898kJ6nWgM3VQsRp6s371dy3pi59XTS0nhCXrwifrvMu
BEfAAtWDSTAU9xb7NyXJPlOKtwvrx4RSCOSCBFn3i4f/8TvyrBCen6m7RW7MgzUN
XFHX9egPGg1dQi/OIRc0Up0Uc2hFk5msFG71StM6/ICciBXSVirCjGOmhQE+R+Mr
iceZ24OIlP5COroEDKIOJhlvQ+B4wVjtBp089RsLjVEJkEUhuV7YrN38W2v+K1kW
olPt+NN608aUghOadyn1XkrbCIoezY3Cw8/JvSzUTpMmJyL22kBdX9uSVDdtlYp2
U5DoTgbyaela6yQS8vy6U62mwaEMITSBOOrzVHRdkmZux/PT/4BvGQ3BzEK3VLsV
agBse6zkvD07RqrlS89gMxGpJVadmm1p2CcfqKPNgAeTmuGDOmXyQ843ZJxTzRbo
Fs+04KwJuXet0eeqYSTreF6ut8wBUtZwpNVeja7IkGex6wHedqBzqNPh0CxxiEA3
xAL/8Pq5o+s2odoUQxkihOOu+ypRcYVOMbD4BeNaIPp2uJmYRSI48+BveG9ZdVM5
9c3nBP3NgumqRhE9w3W0cjaVDFZ1f8sZ6MNcO1a/hDNQHYJa0Zuhz3lyCdvtzzai
mUYkvwfZgYMUVQ9pn7w0
=qtVZ
-----END PGP SIGNATURE-----

--5wqwd53k2xnqrp6s--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
