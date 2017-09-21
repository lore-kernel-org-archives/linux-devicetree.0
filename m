From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] media: V3s: Add support for
 Allwinner CSI.
Date: Thu, 21 Sep 2017 15:45:00 +0200
Message-ID: <1506001500.29217.6.camel@megous.com>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
	 <1501131697-1359-2-git-send-email-yong.deng@magewell.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-kphSqY0HhqCrOsOL2YT7"
Return-path: <linux-sunxi+bncBDXLF6FR5INBB2MER7HAKGQENRAVDJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1501131697-1359-2-git-send-email-yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S.
 Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinu
List-Id: devicetree@vger.kernel.org


--=-kphSqY0HhqCrOsOL2YT7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yong,

I noticed one issue in the register macros. See below.

Yong Deng p=C3=AD=C5=A1e v =C4=8Ct 27. 07. 2017 v 13:01 +0800:
> Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
> and CSI1 is used for parallel interface. This is not documented in
> datasheet but by testing and guess.
>=20
> This patch implement a v4l2 framework driver for it.
>=20
> Currently, the driver only support the parallel interface. MIPI-CSI2,
> ISP's support are not included in this patch.
>=20
> Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> ---
>=20

[snip]

> +
> +#define CSI_CH_INT_EN_REG		0x70
> +#define CSI_CH_INT_EN_VS_INT_EN			BIT(7)
> +#define CSI_CH_INT_EN_HB_OF_INT_EN		BIT(6)
> +#define CSI_CH_INT_EN_MUL_ERR_INT_EN		BIT(5)
> +#define CSI_CH_INT_EN_FIFO2_OF_INT_EN		BIT(4)
> +#define CSI_CH_INT_EN_FIFO1_OF_INT_EN		BIT(3)
> +#define CSI_CH_INT_EN_FIFO0_OF_INT_EN		BIT(2)
> +#define CSI_CH_INT_EN_FD_INT_EN			BIT(1)
> +#define CSI_CH_INT_EN_CD_INT_EN			BIT(0)
> +
> +#define CSI_CH_INT_STA_REG		0x74
> +#define CSI_CH_INT_STA_VS_PD			BIT(7)
> +#define CSI_CH_INT_STA_HB_OF_PD			BIT(6)
> +#define CSI_CH_INT_STA_MUL_ERR_PD		BIT(5)
> +#define CSI_CH_INT_STA_FIFO2_OF_PD		BIT(4)
> +#define CSI_CH_INT_STA_FIFO1_OF_PD		BIT(3)
> +#define CSI_CH_INT_STA_FIFO0_OF_PD		BIT(2)
> +#define CSI_CH_INT_STA_FD_PD			BIT(1)
> +#define CSI_CH_INT_STA_CD_PD			BIT(0)
> +
> +#define CSI_CH_FLD1_VSIZE_REG		0x74

This register should be 0x78 according to the V3s manual. Though it's
not used in your driver yet, so it is not yet causing any issues.

> +#define CSI_CH_HSIZE_REG		0x80
> +#define CSI_CH_HSIZE_HOR_LEN_MASK		GENMASK(28, 16)
> +#define CSI_CH_HSIZE_HOR_LEN(len)		((len << 16) & CSI_CH_HSIZE_HOR_LEN_M=
ASK)
> +#define CSI_CH_HSIZE_HOR_START_MASK		GENMASK(12, 0)
> +#define CSI_CH_HSIZE_HOR_START(start)		((start << 0) & CSI_CH_HSIZE_HOR_=
START_MASK)
> +
> +#define CSI_CH_VSIZE_REG		0x84
> +#define CSI_CH_VSIZE_VER_LEN_MASK		GENMASK(28, 16)
> +#define CSI_CH_VSIZE_VER_LEN(len)		((len << 16) & CSI_CH_VSIZE_VER_LEN_M=
ASK)
> +#define CSI_CH_VSIZE_VER_START_MASK		GENMASK(12, 0)
> +#define CSI_CH_VSIZE_VER_START(start)		((start << 0) & CSI_CH_VSIZE_VER_=
START_MASK)
> +
> +#define CSI_CH_BUF_LEN_REG		0x88
> +#define CSI_CH_BUF_LEN_BUF_LEN_C_MASK		GENMASK(29, 16)
> +#define CSI_CH_BUF_LEN_BUF_LEN_C(len)		((len << 16) & CSI_CH_BUF_LEN_BUF=
_LEN_C_MASK)
> +#define CSI_CH_BUF_LEN_BUF_LEN_Y_MASK		GENMASK(13, 0)
> +#define CSI_CH_BUF_LEN_BUF_LEN_Y(len)		((len << 0) & CSI_CH_BUF_LEN_BUF_=
LEN_Y_MASK)
> +
> +#define CSI_CH_FLIP_SIZE_REG		0x8c
> +#define CSI_CH_FLIP_SIZE_VER_LEN_MASK		GENMASK(28, 16)
> +#define CSI_CH_FLIP_SIZE_VER_LEN(len)		((len << 16) & CSI_CH_FLIP_SIZE_V=
ER_LEN_MASK)
> +#define CSI_CH_FLIP_SIZE_VALID_LEN_MASK		GENMASK(12, 0)
> +#define CSI_CH_FLIP_SIZE_VALID_LEN(len)		((len << 0) & CSI_CH_FLIP_SIZE_=
VALID_LEN_MASK)
> +
> +#define CSI_CH_FRM_CLK_CNT_REG		0x90
> +#define CSI_CH_ACC_ITNL_CLK_CNT_REG	0x94
> +#define CSI_CH_FIFO_STAT_REG		0x98
> +#define CSI_CH_PCLK_STAT_REG		0x9c
> +
> +/*
> + * csi input data format
> + */
> +enum csi_input_fmt
> +{
> +	CSI_INPUT_FORMAT_RAW		=3D 0,
> +	CSI_INPUT_FORMAT_YUV422		=3D 3,
> +	CSI_INPUT_FORMAT_YUV420		=3D 4,
> +};
> +
> +/*
> + * csi output data format
> + */
> +enum csi_output_fmt
> +{
> +	/* only when input format is RAW */
> +	CSI_FIELD_RAW_8			=3D 0,
> +	CSI_FIELD_RAW_10		=3D 1,
> +	CSI_FIELD_RAW_12		=3D 2,
> +	CSI_FIELD_RGB565		=3D 4,
> +	CSI_FIELD_RGB888		=3D 5,
> +	CSI_FIELD_PRGB888		=3D 6,
> +	CSI_FRAME_RAW_8			=3D 8,
> +	CSI_FRAME_RAW_10		=3D 9,
> +	CSI_FRAME_RAW_12		=3D 10,
> +	CSI_FRAME_RGB565		=3D 12,
> +	CSI_FRAME_RGB888		=3D 13,
> +	CSI_FRAME_PRGB888		=3D 14,
> +
> +	/* only when input format is YUV422/YUV420 */

Other limitation is that when input is YUV420 output can only be YUV420
and not YUV422.

> +	CSI_FIELD_PLANAR_YUV422		=3D 0,
> +	CSI_FIELD_PLANAR_YUV420		=3D 1,
> +	CSI_FRAME_PLANAR_YUV420		=3D 2,
> +	CSI_FRAME_PLANAR_YUV422		=3D 3,
> +	CSI_FIELD_UV_CB_YUV422		=3D 4,
> +	CSI_FIELD_UV_CB_YUV420		=3D 5,
> +	CSI_FRAME_UV_CB_YUV420		=3D 6,
> +	CSI_FRAME_UV_CB_YUV422		=3D 7,
> +	CSI_FIELD_MB_YUV422		=3D 8,
> +	CSI_FIELD_MB_YUV420		=3D 9,
> +	CSI_FRAME_MB_YUV420		=3D 10,
> +	CSI_FRAME_MB_YUV422		=3D 11,
> +	CSI_FIELD_UV_CB_YUV422_10	=3D 12,
> +	CSI_FIELD_UV_CB_YUV420_10	=3D 13,
> +};
> +

thank you and regards,
  Ondrej

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--=-kphSqY0HhqCrOsOL2YT7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEmrE4sgaRYhzUz5ICbmQmxnfP7/EFAlnDwlwACgkQbmQmxnfP
7/H0ig//bXHHy3pjn4HPZ9tC0sk+WaXmcixQ5fGPEfzhKqcb5pcbVHdym2OHwEZK
/MSDRI/Szf2hnABt6yY634KQpbbp0ftdOOQr1mjZmrsWo1B0CP3rvOa2d9sHge+a
bX19buOesPSMJhXfL92vrN1/908POJO2eaDuixgz5CcJTc2aFFU0GSsxJ2u4XmTV
w/gPpIJnKs7J6dc6oN2dLrPDO58tNxUI03fxBbtjKRAKAha+7u703+N9M7wsHqi0
WAsjE80rPpu7WjN40jUR2RS+2aP+Ca7ufnvFPxLLlNPfwkrQlWWhczXXFE76GvPZ
2eNHb1UH+LVfpVA19UJq42X72tO+oxsSnKxCYbWkFbtaRivjwGn+UxO/vsYbJVET
LNxoYO5QgMuR/noroVwR17DxOBtxIX7LoKLPIVIeDSubjkhcwnTB8rviwXVwqurR
ypUTHpJJU02VVkdurjD9jA9rvybD2j4u50hUucL/TEXAb44T7TZxxHPkKjRhVkOO
lbtZOHfXnjNvGdp/TJwNkogXjMceiiI8I46hs507cRwmBfYXcRrDzJo1fji0A1L5
0WAEKgP+ZY19i6XsvIb7JOC64A55QiWeSfX7SPq0mZyC48eSbSL2qqFE2ghQxoKD
UIvClfMLSh2OqOL3Taov4EPUGaR43Y2K6/NrvejHjDntwyhlw68=
=eWHq
-----END PGP SIGNATURE-----

--=-kphSqY0HhqCrOsOL2YT7--
