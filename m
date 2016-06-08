From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: dts: sun7i: Enable NAND on Wexler TAB7200
Date: Thu, 9 Jun 2016 00:03:14 +0200
Message-ID: <20160608220314.GL14179@lukather>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
 <1465208664-9366-8-git-send-email-mamlinav@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="96dIhm/ZjrNld+BP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465208664-9366-8-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--96dIhm/ZjrNld+BP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 06, 2016 at 01:24:24PM +0300, Aleksei Mamlin wrote:
> Enable the NFC and describe the NAND flash connected to this controller.
>=20
> Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 41 ++++++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/bo=
ot/dts/sun7i-a20-wexler-tab7200.dts
> index 2f6b21a..42aff91 100644
> --- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> @@ -159,6 +159,47 @@
>  	status =3D "okay";
>  };
> =20
> +&nfc {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&nand_pins_a>, <&nand_cs0_pins_a>, <&nand_rb0_pins_a>;
> +	status =3D "okay";
> +
> +	nand@0 {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		reg =3D <0>;
> +		allwinner,rb =3D <0>;
> +
> +		nand-ecc-mode =3D "hw";
> +		nand-on-flash-bbt;
> +
> +		boot0@0 {
> +			label =3D "boot0";
> +			reg =3D /bits/ 64 <0x0 0x200000>;
> +		};
> +
> +		boot0-rescue@200000 {
> +			label =3D "boot0-rescue";
> +			reg =3D /bits/ 64 <0x200000 0x200000>;
> +		};
> +
> +		uboot@400000 {
> +			label =3D "uboot";
> +			reg =3D /bits/ 64 <0x400000 0x200000>;
> +		};
> +
> +		uboot-rescue@600000 {
> +			label =3D "uboot-rescue";
> +			reg =3D /bits/ 64 <0x600000 0x200000>;
> +		};
> +
> +		main@800000 {
> +			label =3D "main";
> +			reg =3D /bits/ 64 <0x800000 0xff800000>;
> +		};
> +	};
> +};

This feels a bit premature. The two boards you're using have an MLC
NAND which is not supported yet. Until there's proper MLC support in
the kernel, I'm not sure we want to enable that for end-users when we
know that things will get wrong.

However, after discussing this with Boris, I appreciate that we don't
have any example available because of this policy for people that want
to opt-in anyway.

What we could do is to still mark the status as disabled in the DTS,
with a big fat warning as comment just before, so that it requires
user action, and that user will have been warned.

Would that work for you?
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--96dIhm/ZjrNld+BP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWJYhAAoJEBx+YmzsjxAgLfQP/0HPkxn+J+NzmjBHQdmguO8X
xax0/uJehyI1Q18Y/OT/IkXvMjFn+Fvll++oYEFWJw2/ZcHiIBdROYPsU+ffjzVW
btemYklOjucqwtde+nk17YoC7phbi4rlBrNdjR+lNNiWFfXgQ8cqho7trz7w8IyI
5/b+wFAOaBgu3Guy3sUeNsdMzQuAhbfMags0qs+Br5N7hQPo7NqQVpQES3EZkzZh
QhcvZ3qH/IQ/1MM2iKu2dVEQIydj3ljUY4nILAadpp4rvkJf/PgamhikeSwvmJNL
8NVlPGMyU8qIzUM2b9Gptr5eszwmYpKX5VJ5Xv3lLwQ8z72Qpo99p6AiAJcDrbSG
Md25Lns3ffO2S9eD07mltOjGhs+GdvAuBPtKWkF7F5uyaeOGPrcliy+HGvJC13d8
I1DaSOOkZgjRORpehUBr5k/UKGnflzuzTKW8txK7zzzbgzNswYpYGe6F+/AdRgvh
aFbH5hYAT189CMU9ZDkVjUEWxhy2Tye0BT/z6CRSxrqNtsStXrrLrWlLZR7DdyiX
NbmgDLeO0ttQfr3y1azFrD9bo8PiSeAjdCj8OMuiRSYNwRltfrgmjVPb9fhK9b77
1HHYI7jhIFYGFUotHzC208tr45dKEbrev14SoOAM8S4iAWOL/B/SXd51gC9Y4+jj
fyx3o5d+TvYG5E5MH9qY
=EKDT
-----END PGP SIGNATURE-----

--96dIhm/ZjrNld+BP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
