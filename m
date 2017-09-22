From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] media: V3s: Add support for
 Allwinner CSI.
Date: Fri, 22 Sep 2017 17:08:29 +0800
Message-ID: <20170922170829.33e3813f9504e90cffeca66e@magewell.com>
References: <1501131697-1359-1-git-send-email-yong.deng@magewell.com>
	<1501131697-1359-2-git-send-email-yong.deng@magewell.com>
	<20170922104413.5d7d64e7@dell-desktop.home>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBHFGSPHAKGQE4F5TJGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170922104413.5d7d64e7-K8i4uRanGBt8XcdJbWeDu7NAH6kLmebB@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mylene JOSSERAND <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.orglinux
List-Id: devicetree@vger.kernel.org

Hello Myl=C3=A8ne,

On Fri, 22 Sep 2017 10:44:13 +0200
Mylene JOSSERAND <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hello Yong,
>=20
> Thank you for these drivers!
>=20
> I tested it with an OV5640 camera on an Nanopi M1 plus (Allwinner H3)
> and I noticed that I got a frame correctly displayed only on a half of
> the frame's size.
>=20
> It is related to your "sun6i_csi_set_window" function (see
> below).
>=20
> > Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
> > and CSI1 is used for parallel interface. This is not documented in
> > datasheet but by testing and guess.
> >=20
> > This patch implement a v4l2 framework driver for it.
> >=20
> > Currently, the driver only support the parallel interface. MIPI-CSI2,
> > ISP's support are not included in this patch.
> >=20
> > Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/media/platform/Kconfig                   |   1 +
> >  drivers/media/platform/Makefile                  |   2 +
> >  drivers/media/platform/sun6i-csi/Kconfig         |   9 +
> >  drivers/media/platform/sun6i-csi/Makefile        |   3 +
> >  drivers/media/platform/sun6i-csi/sun6i_csi.c     | 545
> > +++++++++++++++ drivers/media/platform/sun6i-csi/sun6i_csi.h     |
> > 203 ++++++ drivers/media/platform/sun6i-csi/sun6i_csi_v3s.c | 827
> > +++++++++++++++++++++++
> > drivers/media/platform/sun6i-csi/sun6i_csi_v3s.h | 206 ++++++
> > drivers/media/platform/sun6i-csi/sun6i_video.c   | 663
> > ++++++++++++++++++ drivers/media/platform/sun6i-csi/sun6i_video.h
> > |  61 ++ 10 files changed, 2520 insertions(+) create mode 100644
> > drivers/media/platform/sun6i-csi/Kconfig create mode 100644
> > drivers/media/platform/sun6i-csi/Makefile create mode 100644
> > drivers/media/platform/sun6i-csi/sun6i_csi.c create mode 100644
> > drivers/media/platform/sun6i-csi/sun6i_csi.h create mode 100644
> > drivers/media/platform/sun6i-csi/sun6i_csi_v3s.c create mode 100644
> > drivers/media/platform/sun6i-csi/sun6i_csi_v3s.h create mode 100644
> > drivers/media/platform/sun6i-csi/sun6i_video.c create mode 100644
> > drivers/media/platform/sun6i-csi/sun6i_video.h
> >=20
> > diff --git a/drivers/media/platform/Kconfig
> > b/drivers/media/platform/Kconfig index 0c741d1..8371a87 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -143,6 +143,7 @@ source "drivers/media/platform/am437x/Kconfig"
> >  source "drivers/media/platform/xilinx/Kconfig"
> >  source "drivers/media/platform/rcar-vin/Kconfig"
> >  source "drivers/media/platform/atmel/Kconfig"
> > +source "drivers/media/platform/sun6i-csi/Kconfig"
> > =20
>=20
> <snip>
>=20
> > +static void sun6i_csi_set_format(struct sun6i_csi_dev *sdev)
> > +{
> > +	struct sun6i_csi *csi =3D &sdev->csi;
> > +	u32 cfg;
> > +	u32 val;
> > +
> > +	regmap_read(sdev->regmap, CSI_CH_CFG_REG, &cfg);
> > +
> > +	cfg &=3D ~(CSI_CH_CFG_INPUT_FMT_MASK |
> > +		 CSI_CH_CFG_OUTPUT_FMT_MASK | CSI_CH_CFG_VFLIP_EN |
> > +		 CSI_CH_CFG_HFLIP_EN | CSI_CH_CFG_FIELD_SEL_MASK |
> > +		 CSI_CH_CFG_INPUT_SEQ_MASK);
> > +
> > +	val =3D get_csi_input_format(csi->config.code,
> > csi->config.pixelformat);
> > +	cfg |=3D CSI_CH_CFG_INPUT_FMT(val);
> > +
> > +	val =3D get_csi_output_format(csi->config.code,
> > csi->config.field);
> > +	cfg |=3D CSI_CH_CFG_OUTPUT_FMT(val);
> > +
> > +	val =3D get_csi_input_seq(csi->config.code,
> > csi->config.pixelformat);
> > +	cfg |=3D CSI_CH_CFG_INPUT_SEQ(val);
> > +
> > +	if (csi->config.field =3D=3D V4L2_FIELD_TOP)
> > +		cfg |=3D CSI_CH_CFG_FIELD_SEL_FIELD0;
> > +	else if (csi->config.field =3D=3D V4L2_FIELD_BOTTOM)
> > +		cfg |=3D CSI_CH_CFG_FIELD_SEL_FIELD1;
> > +	else
> > +		cfg |=3D CSI_CH_CFG_FIELD_SEL_BOTH;
> > +
> > +	regmap_write(sdev->regmap, CSI_CH_CFG_REG, cfg);
> > +}
> > +
> > +static void sun6i_csi_set_window(struct sun6i_csi_dev *sdev)
> > +{
> > +	struct sun6i_csi_config *config =3D &sdev->csi.config;
> > +	u32 bytesperline_y;
> > +	u32 bytesperline_c;
> > +	int *planar_offset =3D sdev->planar_offset;
> > +
> > +	regmap_write(sdev->regmap, CSI_CH_HSIZE_REG,
> > +		     CSI_CH_HSIZE_HOR_LEN(config->width) |
> > +		     CSI_CH_HSIZE_HOR_START(0));
> > +	regmap_write(sdev->regmap, CSI_CH_VSIZE_REG,
> > +		     CSI_CH_VSIZE_VER_LEN(config->height) |
> > +		     CSI_CH_VSIZE_VER_START(0));
>=20
> In my case, the HOR_LEN and VER_LEN were not correctly configured.
>=20
> They were configured to width and height (640 * 480) but as I was
> using a YUYV format, the pixel's size is 2 bytes so the
> horizontal/vertical lines' lengths were divided by 2.
>=20
> Currently, I fixed that by getting the number of bytes per pixel with
> "v4l2_pixformat_get_bpp()":
>=20
> +       int bytes_pixel;
> +
> +       bytes_pixel =3D v4l2_pixformat_get_bpp(config->pixelformat) / 8;
> =20
>         regmap_write(sdev->regmap, CSI_CH_HSIZE_REG,
> -                    CSI_CH_HSIZE_HOR_LEN(config->width) |
> +                    CSI_CH_HSIZE_HOR_LEN(config->width * bytes_pixel) |
>                      CSI_CH_HSIZE_HOR_START(0));
>         regmap_write(sdev->regmap, CSI_CH_VSIZE_REG,
> -                    CSI_CH_VSIZE_VER_LEN(config->height) |
> +                    CSI_CH_VSIZE_VER_LEN(config->height * bytes_pixel)
>   | CSI_CH_VSIZE_VER_START(0));
>=20
> There is certainly a nicer way to handle that.

The datasheet documents CSI_CH_HSIZE_HOR_LEN and CSI_CH_VSIZE_VER_LEN's=20
unit is pixel. And I had tested the YUYV format on V3s and that's OK.
Another register CSI_CH_BUF_LEN_REG's unit is byte.

>=20
> > +
> > +	planar_offset[0] =3D 0;
> > +	switch(config->pixelformat) {
> > +	case V4L2_PIX_FMT_HM12:
> > +	case V4L2_PIX_FMT_NV12:
> > +	case V4L2_PIX_FMT_NV21:
> > +	case V4L2_PIX_FMT_NV16:
> > +	case V4L2_PIX_FMT_NV61:
> > +		bytesperline_y =3D config->width;
> > +		bytesperline_c =3D config->width;
> > +		planar_offset[1] =3D bytesperline_y * config->height;
> > +		planar_offset[2] =3D -1;
> > +		break;
> > +	case V4L2_PIX_FMT_YUV420:
> > +	case V4L2_PIX_FMT_YVU420:
> > +		bytesperline_y =3D config->width;
> > +		bytesperline_c =3D config->width / 2;
> > +		planar_offset[1] =3D bytesperline_y * config->height;
> > +		planar_offset[2] =3D planar_offset[1] +
> > +				bytesperline_c * config->height / 2;
> > +		break;
> > +	case V4L2_PIX_FMT_YUV422P:
> > +		bytesperline_y =3D config->width;
> > +		bytesperline_c =3D config->width / 2;
> > +		planar_offset[1] =3D bytesperline_y * config->height;
> > +		planar_offset[2] =3D planar_offset[1] +
> > +				bytesperline_c * config->height;
> > +		break;
> > +	default: /* raw */
> > +		bytesperline_y =3D
> > (v4l2_pixformat_get_bpp(config->pixelformat) *
> > +				  config->width) / 8;
> > +		bytesperline_c =3D 0;
> > +		planar_offset[1] =3D -1;
> > +		planar_offset[2] =3D -1;
> > +		break;
> > +	}
> > +
> > +	regmap_write(sdev->regmap, CSI_CH_BUF_LEN_REG,
> > +		     CSI_CH_BUF_LEN_BUF_LEN_C(bytesperline_c) |
> > +		     CSI_CH_BUF_LEN_BUF_LEN_Y(bytesperline_y));
> > +}
> > +
> > +static int get_supported_pixformats(struct sun6i_csi *csi,
> > +				    const u32 **pixformats)
> > +{
> > +	if (pixformats !=3D NULL)
> > +		*pixformats =3D supported_pixformats;
> > +
> > +	return ARRAY_SIZE(supported_pixformats);
> > +}
> > +
> > +static bool is_format_support(struct sun6i_csi *csi, u32 pixformat,
> > +			      u32 mbus_code)
> > +{
> > +	struct sun6i_csi_dev *sdev =3D sun6i_csi_to_dev(csi);
> > +
> > +	return __is_format_support(sdev, pixformat, mbus_code);
> > +}
> > +
> > +static int set_power(struct sun6i_csi *csi, bool enable)
> > +{
> > +	struct sun6i_csi_dev *sdev =3D sun6i_csi_to_dev(csi);
> > +	struct regmap *regmap =3D sdev->regmap;
> > +	int ret;
> > +
> > +	if (!enable) {
> > +		regmap_update_bits(regmap, CSI_EN_REG,
> > CSI_EN_CSI_EN, 0); +
> > +		clk_disable_unprepare(sdev->clk_ram);
> > +		clk_disable_unprepare(sdev->clk_mod);
> > +		clk_disable_unprepare(sdev->clk_ahb);
> > +		reset_control_assert(sdev->rstc_ahb);
> > +		return 0;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(sdev->clk_ahb);
> > +	if (ret) {
> > +		dev_err(sdev->dev, "Enable ahb clk err %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(sdev->clk_mod);
> > +	if (ret) {
> > +		dev_err(sdev->dev, "Enable csi clk err %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(sdev->clk_ram);
> > +	if (ret) {
> > +		dev_err(sdev->dev, "Enable clk_dram_csi clk err
> > %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	if (!IS_ERR_OR_NULL(sdev->rstc_ahb)) {
> > +		ret =3D reset_control_deassert(sdev->rstc_ahb);
> > +		if (ret) {
> > +			dev_err(sdev->dev, "reset err %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	regmap_update_bits(regmap, CSI_EN_REG, CSI_EN_CSI_EN,
> > CSI_EN_CSI_EN); +
> > +	return 0;
> > +}
>=20
> <snip>
>=20
> Thank you in advance!
>=20
> Best regards,
>=20
> --=20
> Myl=C3=A8ne Josserand, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


Thanks,
Yong

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
