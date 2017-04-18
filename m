From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 02/12] arm64: allwinner: a64: add NMI controller on A64
Date: Tue, 18 Apr 2017 09:00:16 +0200
Message-ID: <20170418070016.qsng3qtk76bqxyc5@lukather>
References: <20170417115747.7300-1-icenowy@aosc.io>
 <20170417115747.7300-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gjtkzvfpdhuo5m42"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170417115747.7300-3-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gjtkzvfpdhuo5m42
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 07:57:37PM +0800, Icenowy Zheng wrote:
> Allwinner A64 SoC features a NMI controller, which is usually connected
> to the AXP PMIC.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> Changes in v2:
> - Added Chen-Yu's ACK.
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index 05ec9fc5e81f..53c18ca372ea 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -403,6 +403,14 @@
>  				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		nmi_intc: interrupt-controller@01f00c0c {
> +			compatible =3D "allwinner,sun6i-a31-sc-nmi";
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			reg =3D <0x01f00c0c 0x38>;

The base address is not correct, and there's uncertainty on whether
this is this particular controller or not. Did you even test this?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gjtkzvfpdhuo5m42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY9bl7AAoJEBx+YmzsjxAgn3gQAKop8hYTP0yO7/lygPlFzzX0
qJzMHV7yYfLjWRR6yYR8bBKPmVMRI0GAEAvOwbAIiBEDz2lepY5Ktl8X9QR2JKo7
u9Zudahxw0FGzVgdYQGweEfTdhyKy301C/EPOS0KZ+vB7sus3L48ajkt+6RZrh+E
/lBa06B2fGPGnlT4aEQPAAIZSbPQAJsH8FXkLzy8iVLJpjw2yhO+Va3+J+8Wnj+3
u++Iou96PT4+0xRigkqGlxynp+Fi0e77Dm7zxuepUBOsMWmQF6Nxnk4AMeo7E3Kx
9wgdFnLArvPPkDW09Cr5Q6lSgVIHLb+/ltcFVL7saWJAtRb6T0fc1FssMWsDXMYt
ZOHlrevAzbc+q6o6hbkLz/QYh9OxAO9YI9mu24KaB17jsFeKz1ferRU+6jbDz2Ix
kZ6UItgyj+WFLGg7FQMp9ESfhTmv1urXR/3iaOvQ61KpLBqS+kJDE1ordCT/FEzL
O2yeTgPHgoaRhnnQQ/AezKayfkoKlLJvqZOrLvksHG3kuBrNJ0DVJIgZBTB+OJKY
fB8hMjhjrBdphHrfeMZAzCMDKSqVOeTCAlJRI8kZUIPzYqkgHMlrhR51tYUPHm+v
OjblBEoPs2nNiH+gw3lVlj8Afr5JCbPJQTZKPlyAiOGvsyUxxjtNvhXZ5+3+vlkl
ExiXiiYMspu4r7zh8xH8
=lIbv
-----END PGP SIGNATURE-----

--gjtkzvfpdhuo5m42--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
