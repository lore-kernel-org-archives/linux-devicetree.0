From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 1/2 v2] ARM: dts: Add Aspeed SoC USB controllers to
 device-tree
Date: Mon, 15 Jan 2018 09:59:42 -0600
Message-ID: <1516031982.5522.3.camel@aj.id.au>
References: <1515738064.31850.100.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-IA/JPr0xn4k1xvczLxYG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515738064.31850.100.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Joel Stanley <joel.stanley-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-IA/JPr0xn4k1xvczLxYG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-01-12 at 17:21 +1100, Benjamin Herrenschmidt wrote:
> This adds the USB controllers to the DT template of the
> AST24xx and AST25xx SoCs.
>=20
> This patch doesn't enable them by default on any board specific
> .dts yet. This will be done when we have the necessary clock/reset
> and pinmux support. In the meantime though, this will work if
> u-boot configures things properly.
>=20
> For the AST2400 I only added pinmux definition for port 1
> which is dual USB1/USB2. There are additional USB1 only ports
> that might require more work but I don't have HW to test at
> hand so I'm leaving that to whoever cares.
>=20
> Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> ---
>=20
> v2: Previous patch was missing actually adding the nodes
>     (which was an old patch in my tree I had forgotten to
>     merge).
>=20
>  arch/arm/boot/dts/aspeed-g4.dtsi | 27 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 40 ++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 67 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index b0d8431a3700..e55f2ad5de59 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -103,6 +103,23 @@
>  			status =3D "disabled";
>  		};
> =20
> +		ehci0: usb@1e6a1000 {
> +			compatible =3D "aspeed,ast2400-ehci", "generic-ehci";
> +			reg =3D <0x1e6a1000 0x100>;
> +			interrupts =3D <5>;
> +			clocks =3D <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> +			status =3D "disabled";
> +		};
> +
> +		uhci: usb@1e6b0000 {
> +			compatible =3D "aspeed,ast2400-uhci", "generic-uhci";
> +			reg =3D <0x1e6b0000 0x100>;
> +			interrupts =3D <14>;
> +			#ports =3D <3>;

I tried to find the documentation for the #ports property, but it seems
to not exist. Couldn't find any users either, but maybe I didn't look
broadly enough. It is tested for in drivers/usb/host/uhci-platform.c
though, so I guess it's functional.

> +			clocks =3D <&syscon ASPEED_CLK_GATE_USBUHCICLK>;
> +			status =3D "disabled";
> +		};
> +
>  		apb {
>  			compatible =3D "simple-bus";
>  			#address-cells =3D <1>;
> @@ -1227,6 +1244,16 @@
>  		groups =3D "USBCKI";
>  	};
> =20
> +	pinctrl_usb2h_default: usb2h_default {
> +		function =3D "USB2H1";
> +		groups =3D "USB2H1";
> +	};
> +
> +	pinctrl_usb2d_default: usb2d_default {
> +		function =3D "USB2D1";
> +		groups =3D "USB2D1";
> +	};
> +
>  	pinctrl_vgabios_rom_default: vgabios_rom_default {
>  		function =3D "VGABIOS_ROM";
>  		groups =3D "VGABIOS_ROM";
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 40de3b66c33f..655258edee24 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -138,6 +138,31 @@
>  			status =3D "disabled";
>  		};
> =20
> +		ehci0: usb@1e6a1000 {
> +			compatible =3D "aspeed,ast2500-ehci", "generic-ehci";
> +			reg =3D <0x1e6a1000 0x100>;
> +			interrupts =3D <5>;
> +			clocks =3D <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> +			status =3D "disabled";
> +		};
> +
> +		ehci1: usb@1e6a3000 {
> +			compatible =3D "aspeed,ast2500-ehci", "generic-ehci";
> +			reg =3D <0x1e6a3000 0x100>;
> +			interrupts =3D <13>;
> +			clocks =3D <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
> +			status =3D "disabled";
> +		};
> +
> +		uhci: usb@1e6b0000 {
> +			compatible =3D "aspeed,ast2500-uhci", "generic-uhci";
> +			reg =3D <0x1e6b0000 0x100>;
> +			interrupts =3D <14>;
> +			#ports =3D <2>;
> +			clocks =3D <&syscon ASPEED_CLK_GATE_USBUHCICLK>;
> +			status =3D "disabled";
> +		};
> +
>  		apb {
>  			compatible =3D "simple-bus";
>  			#address-cells =3D <1>;
> @@ -1358,6 +1383,21 @@
>  		groups =3D "USBCKI";
>  	};
> =20
> +	pinctrl_usb2ah_default: usb2ah_default {
> +		function =3D "USB2AH";
> +		groups =3D "USB2AH";
> +	};
> +
> +	pinctrl_usb11bhid_default: usb11bhid_default {
> +		function =3D "USB11BHID";
> +		groups =3D "USB11BHID";
> +	};
> +
> +	pinctrl_usb2bh_default: usb2bh_default {
> +		function =3D "USB2BH";
> +		groups =3D "USB2BH";
> +	};
> +
>  	pinctrl_vgabiosrom_default: vgabiosrom_default {
>  		function =3D "VGABIOSROM";
>  		groups =3D "VGABIOSROM";

Reviewed-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--=-IA/JPr0xn4k1xvczLxYG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaXM/uAAoJEJ0dnzgO5LT5p1kP/j7tVxyxm+ZFqj6nNh91dSXg
5YH4fexcU3me980C7+jUDb2jFRaVEE3ZdXI1s4QFjalw9nDP0F9g89hgrTLlrOOw
vygJL36hqJRxxscPXA4vCPpKg92Ec+zPLbxDF0YYA861T5DFAQ8tTQ7kjVicNq47
2JEfKdA6Qig6wUrE0BtdLchuiN/o+wPn/Hr+Q0XOYFY6nfm7ZEGwE9e4qBKPzB0M
0+9A/UPbOdoHLg+ACbB6Sqw+3EoTOCV69KBWsNBZmZv8CC1+/a3tz+oO6ob5fmno
O1ryuv8US+WdOsQXTf0WV5bgSppRkgd9ZPJajMtwR5zl18MhACrIlFOvPpt2I/mk
DMAcozQ1hMptYwrSMlbR7Vl+dXavbvXW81mRhRHv7/n8TGJ3Er/9kKtizAwsusWF
pX22n7YUJEUL+iWoryTXyikjj7RfsgCyLIHtkGEeeWjLe2adVhlFCjJW0jaNwl+I
byfdrnUYHv/uWGOhhBBs0/jk3gWbIPZ8HjuZcAqBwhT3wHqT0RBvDT2m55OxPQ+X
J/VI8MWRIJd/h9sck8GzZd3059qS+5GO/J3cOa4P0OzqOn+HgjpNhh1eLGa9MU80
zy4Djec7+ccJTrMAtgiOW5TnyV0CTmdJoWlVyx6+A3ohDmejEcqRE/mtNHHvGL9J
Onp2OlTn3QnHIrV5Ps9Z
=arQx
-----END PGP SIGNATURE-----

--=-IA/JPr0xn4k1xvczLxYG--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
