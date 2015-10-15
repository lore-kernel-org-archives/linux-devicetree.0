From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7,3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND
 device tree nodes
Date: Thu, 15 Oct 2015 09:47:28 +0100
Message-ID: <20151015084727.GG14475@jhogan-linux.le.imgtec.org>
References: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
 <1444148837-10770-4-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1giRMj6yz/+FOIRq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444148837-10770-4-git-send-email-harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Alex Smith <alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--1giRMj6yz/+FOIRq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Harvey,

On Tue, Oct 06, 2015 at 05:27:17PM +0100, Harvey Hunt wrote:
> From: Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>=20
> Add device tree nodes for the NEMC and BCH to the JZ4780 device tree,
> and make use of them in the Ci20 device tree to add a node for the
> board's NAND.
>=20
> Note that since the pinctrl driver is not yet upstream, this includes
> neither pin configuration nor busy/write-protect GPIO pins for the
> NAND. Use of the NAND relies on the boot loader to have left the pins
> configured in a usable state, which should be the case when booted
> from the NAND.
>=20
> Signed-off-by: Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: Alex Smith <alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org>
> Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
> v6 -> v7:
>  - Add nand-ecc-mode to DT.
>  - Add nand-on-flash-bbt to DT.
>=20
> v4 -> v5:
>  - New patch adding DT nodes for the NAND so that the driver can be
>    tested.
>=20
>  arch/mips/boot/dts/ingenic/ci20.dts    | 54 ++++++++++++++++++++++++++++=
++++++
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 26 ++++++++++++++++
>  2 files changed, 80 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ing=
enic/ci20.dts
> index 9fcb9e7..453f1d3 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -42,3 +42,57 @@
>  &uart4 {
>  	status =3D "okay";
>  };
> +
> +&nemc {
> +	status =3D "okay";
> +
> +	nand: nand@1 {
> +		compatible =3D "ingenic,jz4780-nand";

Isn't the NAND a micron part? This doesn't seem right. Is the device
driver and binding already accepted upstream with that compatible
string?

Cheers
James

> +		reg =3D <1 0 0x1000000>;
> +
> +		ingenic,nemc-tAS =3D <10>;
> +		ingenic,nemc-tAH =3D <5>;
> +		ingenic,nemc-tBP =3D <10>;
> +		ingenic,nemc-tAW =3D <15>;
> +		ingenic,nemc-tSTRV =3D <100>;
> +
> +		ingenic,bch-controller =3D <&bch>;
> +		ingenic,ecc-size =3D <1024>;
> +		ingenic,ecc-strength =3D <24>;
> +
> +		nand-ecc-mode =3D "hw";
> +		nand-on-flash-bbt;
> +
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		partition@0 {
> +			label =3D "u-boot-spl";
> +			reg =3D <0x0 0x0 0x0 0x800000>;
> +		};
> +
> +		partition@0x800000 {
> +			label =3D "u-boot";
> +			reg =3D <0x0 0x800000 0x0 0x200000>;
> +		};
> +
> +		partition@0xa00000 {
> +			label =3D "u-boot-env";
> +			reg =3D <0x0 0xa00000 0x0 0x200000>;
> +		};
> +
> +		partition@0xc00000 {
> +			label =3D "boot";
> +			reg =3D <0x0 0xc00000 0x0 0x4000000>;
> +		};
> +
> +		partition@0x8c00000 {
> +			label =3D "system";
> +			reg =3D <0x0 0x4c00000 0x1 0xfb400000>;
> +		};
> +	};
> +};
> +
> +&bch {
> +	status =3D "okay";
> +};
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/=
ingenic/jz4780.dtsi
> index 65389f6..b868b42 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -108,4 +108,30 @@
> =20
>  		status =3D "disabled";
>  	};
> +
> +	nemc: nemc@13410000 {
> +		compatible =3D "ingenic,jz4780-nemc";
> +		reg =3D <0x13410000 0x10000>;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <1>;
> +		ranges =3D <1 0 0x1b000000 0x1000000
> +			  2 0 0x1a000000 0x1000000
> +			  3 0 0x19000000 0x1000000
> +			  4 0 0x18000000 0x1000000
> +			  5 0 0x17000000 0x1000000
> +			  6 0 0x16000000 0x1000000>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_NEMC>;
> +
> +		status =3D "disabled";
> +	};
> +
> +	bch: bch@134d0000 {
> +		compatible =3D "ingenic,jz4780-bch";
> +		reg =3D <0x134d0000 0x10000>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_BCH>;
> +
> +		status =3D "disabled";
> +	};
>  };
> --=20
> 2.6.0
>=20
>=20

--1giRMj6yz/+FOIRq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWH2gfAAoJEGwLaZPeOHZ6XK8P/iNT4kPjiBjkT+UjC9U0a67d
5BZYlIrwtv82JmEoJJ82cwWC8f8Ywj7hCi77Jr0aIcQg8RX0u9gGgjW7yrvEpxe7
5iey4tZbGGl/4xkxwfBuk3TSqZo5RFRi03nI/ZNy8/X9ymqbLW5hcv4H030G2YlW
1DYHHOR7myFV6VXj9+MNHtuNThOhWlsKPJ455dY1j5toRncBa5e/ZOMqVZypwSMO
89a0sOV34rr9/ab3qKuk90tTuvhECyiXKuVTDG2c/9HfhoUq7DgX49x/VjCZ6Eo9
fHMuHYDG7a7iXUTyPR4l7JU1vbZmU87PXJ78lveIEmC2ZRUT9RgJnPjvJT+UzR/P
ZoeHcd/E+Isl5tQshl02vFh2r6YJSQII3jY7e+XpkR0m3yFH3bYbu1+2aKFrB5Xq
LnXRcjvW2r/6EQ2MZp4/FSe2aXNV6Ca6N4pTB7HPfA3CuyGV1o2kpDti/Ce9dV1M
bmxpl9i+RmzsuqbHznqmtY/sAe0Sj7fHSMS81CC5vi/ObO0eJ1IgbsB0mHuCWaCr
21TLUg4dmJOu5Cmj9mHRDngU2I4Fp1bH+uzFvzQQ1viLnkm7pxP2dKD3aX4XSO8g
RKyGGJzGeRvVF9I8fth2ZivExQSG06E+ceIxRjOZaz5I7EBE6/NU9494X3FezxPK
yJ/RNSTz/ks57uV9SUa7
=G5wV
-----END PGP SIGNATURE-----

--1giRMj6yz/+FOIRq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
