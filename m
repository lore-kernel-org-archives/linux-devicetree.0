From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v9 3/4] arm/dts/ls1021a: Add DCU dts node
Date: Tue, 14 Jul 2015 12:59:53 +0200
Message-ID: <20150714105952.GK12465@ulmo.nvidia.com>
References: <1436784692-40560-1-git-send-email-jianwei.wang@freescale.com>
 <1436784692-40560-3-git-send-email-jianwei.wang@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0429601989=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1436784692-40560-3-git-send-email-jianwei.wang@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jianwei Wang <jianwei.wang@freescale.com>
Cc: devicetree@vger.kernel.org, Xiubo Li <lixiubo@cmss.chinamobile.com>, daniel.vetter@ffwll.ch, Alison Wang <b18965@freescale.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Jianwei Wang <b52261@freescale.com>, scottwood@freescale.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0429601989==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="08ATZu8fEq0x2T3M"
Content-Disposition: inline


--08ATZu8fEq0x2T3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2015 at 06:51:31PM +0800, Jianwei Wang wrote:
> Add DCU node, DCU is a display controller of Freescale
> named 2D-ACE.
>=20
> Signed-off-by: Alison Wang <b18965@freescale.com>
> Signed-off-by: Xiubo Li <lixiubo@cmss.chinamobile.com>
> Signed-off-by: Jianwei Wang <b52261@freescale.com>
> Reviewed-by: Alison Wang <alison.wang@freescale.com>
> ---
>  .../devicetree/bindings/drm/fsl-dcu/fsl,dcu.txt      | 20 ++++++++++++++=
++++++
>  MAINTAINERS                                          |  1 +
>  arch/arm/boot/dts/ls1021a.dtsi                       | 10 ++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/fsl-dcu/fsl,dcu=
=2Etxt
>=20
> diff --git a/Documentation/devicetree/bindings/drm/fsl-dcu/fsl,dcu.txt b/=
Documentation/devicetree/bindings/drm/fsl-dcu/fsl,dcu.txt
> new file mode 100644
> index 0000000..eb61ea5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/fsl-dcu/fsl,dcu.txt

That's not the proper location for this file. DRM is a Linux-specific
subsystem and hence shouldn't be used in anything devicetree-related.
Documentation/devicetree/bindings/video would be a better location.

Yes, I know other DRM drivers put their binding in the drm subdirectory
but that just makes them equally wrong. I'll make a note to move these
around at some point.

Also the binding really belongs in the same patch as the driver, or a
separate patch altogether.

And, no need for the extra fsl-dcu subdirectory if you have only a
single document in it.

> @@ -0,0 +1,20 @@
> +Device Tree bindings for Freescale DCU DRM Driver
> +
> +Required properties:
> +- compatible:           Should be one of
> +	* "fsl,ls1021a-dcu".
> +	* "fsl,vf610-dcu".
> +- reg:                  Address and length of the register set for dcu.
> +- clocks:               From common clock binding: handle to dcu clock.
> +- clock-names:          From common clock binding: Shall be "dcu".
> +- panel:		The phandle to panel node.

This isn't a standard property and hence should be prefixed by the
vendor prefix. That is: "fsl,panel".

Also the above uses a weird mix of spaces and tabs for padding. Please
be more consistent.

> +
> +Examples:
> +dcu: dcu@2ce0000 {
> +	compatible =3D "fsl,ls1021a-dcu";
> +	reg =3D <0x0 0x2ce0000 0x0 0x10000>;
> +	clocks =3D <&platform_clk 0>;
> +	clock-names =3D "dcu";
> +	big-endian;

This property isn't mentioned above. I know it's pretty obvious what it
does, but might still be worth briefly describing what it is. I'm also
wondering if that's not something that could be inferred from the
compatible string.

> +	panel =3D <&panel>;
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e191ded..fffb8c9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3410,6 +3410,7 @@ M:	Alison Wang <alison.wang@freescale.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  F:	drivers/gpu/drm/fsl-dcu/
> +F:      Documentation/devicetree/bindings/drm/fsl-dcu/

You might want to shuffle around some of these hunks, so that this
particular hunk is included in the driver patch along with the binding
and the panel patch doesn't remove it only for it to be readded here.

Thierry

>  F:      Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.txt
> =20
>  DRM DRIVERS FOR NVIDIA TEGRA
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.d=
tsi
> index c70bb27..6d6e3e2 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -383,6 +383,16 @@
>  				 <&platform_clk 1>;
>  		};
> =20
> +		dcu: dcu@2ce0000 {
> +			compatible =3D "fsl,ls1021a-dcu";
> +			reg =3D <0x0 0x2ce0000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&platform_clk 0>;
> +			clock-names =3D "dcu";
> +			big-endian;
> +			status =3D "disabled";
> +		};
> +
>  		mdio0: mdio@2d24000 {
>  			compatible =3D "gianfar";
>  			device_type =3D "mdio";
> --=20
> 2.1.0.27.g96db324
>=20

--08ATZu8fEq0x2T3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVpOuoAAoJEN0jrNd/PrOhrjsP/RrwBlqgnrZp6U9HP8sCcOON
XXffFcBRWLGfrpLbu/0oio7ERFGoBMd28Nqq96yZNCiUFl7qSnUJwcHjwwqW94zH
e9TxVwE2+UavcUglLW3XHV9wFatcSJvICBeBSoFBjp8mo4q8yhUDLgdEgbLlhE/E
dHhgI95kPLKyhrZUIDGXw6DTpswDCpQMLJDUGghs6D/G0jAmcA4NzSWDgL0XM2En
XwvkPGO2+9l1P570p0ikDd1WXYKHXa9Z49TcQXmxSjmzj/v8+D3IELqgLT0PD6oZ
OvIvThrKA3QUJHHANhbJQYVQUIAuScbQc+wqQBN39rvZjzn/tf+XzRm5llGX1hpR
73DBzwUsTtyJ3pRHT5uA0Lh3ZROdroYYk5DTMYKRmDTfSkxZnYG6ISvB0wEf/M9b
ZX+9P9xPjW67c4Enm/8R6Gq369GHbL1riwuLHN5xP0x+de68rbTe5RENqOP9H3Xk
xD9L63rcKDMoT8eJadaLbH84tEkayfJzniz2TvkM0YeEAiSg4QSmDP75QDaWT5Pg
T3HPSHhQSdanlAvzXKH9m0AJK+D9gGexObq3XVDHQmgvTxLxprgMDK1iQoOxKVlv
Tw5Xy/1GZn9QXq8DA3WwKxosQkQxTbr8zNqa9oi74cqty27AaN53RNwE+/i9yrBO
CluUgcfdMB6ylmUGwy+o
=7WJn
-----END PGP SIGNATURE-----

--08ATZu8fEq0x2T3M--

--===============0429601989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0429601989==--
