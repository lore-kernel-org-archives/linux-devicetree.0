From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: sun8i: v3s: add EHCI/OHCI0 device nodes
Date: Thu, 21 Dec 2017 16:16:07 +0100
Message-ID: <20171221151607.bepvzy5wa4bj34ep@flea.lan>
References: <20171221150537.20304-1-icenowy@aosc.io>
 <20171221150537.20304-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vub4gajdbuxqskvy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171221150537.20304-2-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vub4gajdbuxqskvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 21, 2017 at 11:05:36PM +0800, Icenowy Zheng wrote:
> The USB PHY 0 on V3s SoC can also be routed to a pair of EHCI/OHCI
> controllers.
>=20
> Add the device nodes for the controllers.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-v3s.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v=
3s.dtsi
> index 443b083c6adc..cc315dc742d2 100644
> --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> @@ -264,6 +264,25 @@
>  			#phy-cells =3D <1>;
>  		};
> =20
> +		ehci0: usb@01c1a000 {
> +			compatible =3D "allwinner,sun8i-v3s-ehci", "generic-ehci";
> +			reg =3D <0x01c1a000 0x100>;
> +			interrupts =3D <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
> +			resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;

Why are you taking the OHCI clocks and resets in the OHCI node..

> +			status =3D "disabled";
> +		};
> +
> +		ohci0: usb@01c1a400 {
> +			compatible =3D "allwinner,sun8i-v3s-ohci", "generic-ohci";
> +			reg =3D <0x01c1a400 0x100>;
> +			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
> +				 <&ccu CLK_USB_OHCI0>;
> +			resets =3D <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;

=2E.. And the EHCI clocks and resets in the OHCI node?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vub4gajdbuxqskvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlo70DYACgkQ0rTAlCFN
r3RE/RAAkPRoGo67AeorT4gAVirf1tCVm4EBAA9xnu38hHiNLN7yGgfH8Bm8SZCv
0KJih8xBkYkO6hYBMIoU67CssuUpgHVo16s0oewUhfIrxyhwJft//rrXAuyM4CzA
/RoUAOi53c8OTqKYNDb2UlLKENRgXMAWPGslWFADwpw8fBHYAn90Kcx3wf8MzNdd
Db+dJnVIJsjw3oZcAXF0XVtv4qYtNjJ9PNA060BEEQ+tUMUQV0ddSxE+FQ9a92lC
guc84YrQNYI8gzmPwP4eqWkxL7ep4ri1eHaj6aDIamR5FkBlztI5YNngTI+I/gJZ
UeQIX4VthyL5mqsdDYeopEnYk1w111cjimTKL3AIS9BWBcAFQ9P7mOrCuPUVvgFP
pmidJOJFeFtvkJlgu8yQuEsGC3K6oYCUd5m1XX8+No9jVN+K/RQZegIuwiLh9aRN
JSg3AtyFn6TQZxyu4IV0vFGUXcw2vMfTssftrxkyMeLVypTm007AbQJRnUxff1BQ
sHgZD7ApVVuXgXU2tsbrQflRs8nTk6u5+/BGb3Bl7C8D+gsn6QeEIZQJ9r57a4aW
7n8hw6YqGBlfduDItJh1QHkX5bjIe3k+1EcrulK6Kk2wScyHlKOhMGX4orBdqCq8
sddj/H0nPrhYFKRVbRiQ8gAFbQCjBAlw1dfHNUpgz7zu3D+gO3U=
=OWlW
-----END PGP SIGNATURE-----

--vub4gajdbuxqskvy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
