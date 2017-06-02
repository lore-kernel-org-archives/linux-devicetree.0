From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 14/19] drm/sun4i: hdmi: Add support for A31's HDMI
 controller
Date: Fri, 2 Jun 2017 21:41:10 +0200
Message-ID: <20170602194110.goale2ssyg5vuqiv@flea.lan>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-15-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6rimx524hikgl7qx"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170602101024.18940-15-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--6rimx524hikgl7qx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2017 at 06:10:19PM +0800, Chen-Yu Tsai wrote:
> The HDMI controller found in the A31 SoCs is slightly different
> from the one already supported, which is found in the A10s:
>=20
>   - Need different initial values for the PLL related registers
>=20
>   - Different behavior of the DDC and TMDS clocks
>=20
>   - Different register layout for the DDC portion
>=20
>   - Separate DDC parent clock
>=20
> This patch adds support for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi.h     |   3 +
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 141 +++++++++++++++++++++++++++=
++++++
>  2 files changed, 144 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/s=
un4i_hdmi.h
> index c63d0bd95963..2589bc92be59 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> @@ -56,10 +56,13 @@
>  #define SUN4I_HDMI_PAD_CTRL0_TXEN		BIT(23)
> =20
>  #define SUN4I_HDMI_PAD_CTRL1_REG	0x204
> +#define SUN4I_HDMI_PAD_CTRL1_UNKNOWN		BIT(24)	/* set on A31 */
>  #define SUN4I_HDMI_PAD_CTRL1_AMP_OPT		BIT(23)
>  #define SUN4I_HDMI_PAD_CTRL1_AMPCK_OPT		BIT(22)
>  #define SUN4I_HDMI_PAD_CTRL1_EMP_OPT		BIT(20)
>  #define SUN4I_HDMI_PAD_CTRL1_EMPCK_OPT		BIT(19)
> +#define SUN4I_HDMI_PAD_CTRL1_PWSCK		BIT(18)
> +#define SUN4I_HDMI_PAD_CTRL1_PWSDT		BIT(17)
>  #define SUN4I_HDMI_PAD_CTRL1_REG_DEN		BIT(15)
>  #define SUN4I_HDMI_PAD_CTRL1_REG_DENCK		BIT(14)
>  #define SUN4I_HDMI_PAD_CTRL1_REG_EMP(n)		(((n) & 7) << 10)
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index 9ded40aaed32..e9abf93eb41c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -293,6 +293,109 @@ static const struct drm_connector_helper_funcs sun4=
i_hdmi_connector_helper_funcs
>  	.get_modes	=3D sun4i_hdmi_get_modes,
>  };
> =20
> +static int sun6i_hdmi_read_sub_block(struct sun4i_hdmi *hdmi,
> +				     unsigned int blk, unsigned int offset,
> +				     u8 *buf, unsigned int count)
> +{
> +	unsigned long reg;
> +	int i;
> +
> +	reg =3D readl(hdmi->base + SUN6I_HDMI_DDC_FIFO_CTRL_REG);
> +	writel(reg | SUN6I_HDMI_DDC_FIFO_CTRL_CLEAR,
> +	       hdmi->base + SUN6I_HDMI_DDC_FIFO_CTRL_REG);
> +	writel(SUN6I_HDMI_DDC_ADDR_SEGMENT(offset >> 8) |
> +	       SUN6I_HDMI_DDC_ADDR_EDDC(DDC_SEGMENT_ADDR << 1) |
> +	       SUN6I_HDMI_DDC_ADDR_OFFSET(offset) |
> +	       SUN6I_HDMI_DDC_ADDR_SLAVE(DDC_ADDR),
> +	       hdmi->base + SUN6I_HDMI_DDC_ADDR_REG);
> +
> +	writel(SUN6I_HDMI_DDC_CMD_EXPLICIT_EDDC_READ |
> +	       SUN6I_HDMI_DDC_CMD_BYTE_COUNT(count),
> +	       hdmi->base + SUN6I_HDMI_DDC_CMD_REG);
> +
> +	reg =3D readl(hdmi->base + SUN6I_HDMI_DDC_CTRL_REG);
> +	writel(reg | SUN6I_HDMI_DDC_CTRL_START_CMD,
> +	       hdmi->base + SUN6I_HDMI_DDC_CTRL_REG);
> +
> +	if (readl_poll_timeout(hdmi->base + SUN6I_HDMI_DDC_CTRL_REG, reg,
> +			       !(reg & SUN6I_HDMI_DDC_CTRL_START_CMD),
> +			       100, 100000))
> +		return -EIO;
> +
> +	for (i =3D 0; i < count; i++)
> +		buf[i] =3D readb(hdmi->base + SUN6I_HDMI_DDC_FIFO_DATA_REG);
> +
> +	return 0;
> +}
> +
> +static int sun6i_hdmi_read_edid_block(void *data, u8 *buf, unsigned int =
blk,
> +				      size_t length)
> +{
> +	struct sun4i_hdmi *hdmi =3D data;
> +	int retry =3D 2, i;
> +
> +	do {
> +		for (i =3D 0; i < length; i +=3D SUN4I_HDMI_DDC_FIFO_SIZE) {
> +			unsigned char offset =3D blk * EDID_LENGTH + i;
> +			unsigned int count =3D min((unsigned int)SUN4I_HDMI_DDC_FIFO_SIZE,
> +						 length - i);
> +			int ret;
> +
> +			ret =3D sun6i_hdmi_read_sub_block(hdmi, blk, offset,
> +							buf + i, count);
> +			if (ret)
> +				return ret;
> +		}
> +	} while (!drm_edid_block_valid(buf, blk, true, NULL) && (retry--));
> +
> +	return 0;
> +}
> +
> +static int sun6i_hdmi_get_modes(struct drm_connector *connector)
> +{
> +	struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(connector);
> +	u32 reg;
> +	struct edid *edid;
> +	int ret;
> +
> +	clk_set_rate(hdmi->ddc_clk, 100000);
> +	clk_prepare_enable(hdmi->ddc_clk);
> +
> +	/* Reset i2c controller */
> +	writel(SUN6I_HDMI_DDC_CTRL_ENABLE | SUN6I_HDMI_DDC_CTRL_RESET |
> +	       SUN6I_HDMI_DDC_CTRL_SDA_ENABLE |
> +	       SUN6I_HDMI_DDC_CTRL_SCL_ENABLE,
> +	       hdmi->base + SUN6I_HDMI_DDC_CTRL_REG);
> +	if (readl_poll_timeout(hdmi->base + SUN6I_HDMI_DDC_CTRL_REG, reg,
> +			       !(reg & SUN6I_HDMI_DDC_CTRL_RESET),
> +			       100, 2000)) {
> +		dev_err(hdmi->dev, "DDC reset timeout: %08x\n", reg);
> +		clk_disable_unprepare(hdmi->ddc_clk);
> +		return -EIO;
> +	}
> +
> +	edid =3D drm_do_get_edid(connector, sun6i_hdmi_read_edid_block, hdmi);
> +
> +	clk_disable_unprepare(hdmi->ddc_clk);
> +
> +	if (!edid)
> +		return 0;
> +
> +	hdmi->hdmi_monitor =3D drm_detect_hdmi_monitor(edid);
> +	DRM_DEBUG_DRIVER("Monitor is %s monitor\n",
> +			 hdmi->hdmi_monitor ? "an HDMI" : "a DVI");
> +
> +	drm_mode_connector_update_edid_property(connector, edid);
> +	ret =3D drm_add_edid_modes(connector, edid);
> +	kfree(edid);
> +
> +	return ret;
> +}
> +
> +static const struct drm_connector_helper_funcs sun6i_hdmi_connector_help=
er_funcs =3D {
> +	.get_modes	=3D sun6i_hdmi_get_modes,
> +};
> +

Every thing here can be handled through regfield without having to
duplicate the logic.

>  static enum drm_connector_status
>  sun4i_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
> @@ -367,6 +470,43 @@ static const struct sun4i_hdmi_variant sun5i_variant=
 =3D {
>  				  SUN4I_HDMI_PLL_CTRL_PLL_EN,
>  };
> =20
> +static const struct sun4i_hdmi_variant sun6i_variant =3D {
> +	.connector_helpers	=3D &sun6i_hdmi_connector_helper_funcs,
> +	.ddc_create		=3D sun6i_ddc_create,
> +	.tmds_create		=3D sun6i_tmds_create,
> +	.has_ddc_parent_clk	=3D true,
> +	.has_reset_control	=3D true,
> +	.pad_ctrl0_init_val	=3D 0xff |

What is this 0xff for?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6rimx524hikgl7qx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZMb9WAAoJEBx+YmzsjxAgrQgQAMEvZjK3oFiOp8+l2F57PHjR
s+h8tG8HoSgT7VBud2ZmMx2tOyVIm5jBstG4Nf2SYjUKJzlgmewDEr6ojWwHS9iH
CqthMdIo7IzTxe9szgfM6m3g2gTxGv2Mg7GAkSKFZTO/cds/10+nt9fN4QKyyxtD
5aLavNFh0aOzG0B/9idfdxuzq/aS4rTnhKEdWyyw4wTr3cwnhq5RPwveIYim1ZEL
uGxjVDfWchONsGfVHjq3jG+PGGq3raIZ7V1NWRXALBIWoIfflB2txmZd+SAr+U28
Xt4Lhf1xkfYQatoJqElExeUSQ62UHOgNsdWMV25jr/+PBbdNTpZYw0mT/mAlRToJ
USZgQ60HTRfFIj1vfm/E1D/w/y4E2HdTS/qhgdUWfgJV3YrvLLWWaI1Vam22ySEZ
m2P9lPeQvgaW9H/AYqxwH5Say5LO+/eCbtenOC2GeDuwFQm9ZFeisPCM6wIBCoN5
tjaxFC8Le1o6P7uiEOdHSjFYicH4msBwCP78iR0X6UPURQAMCFzaJwHZyMmBIW/Z
vi4W6iKD0PKjxkqoYleTRVaBMBWTxpQqPvnNT+cZWenKoTkiwpUWgxhkpevjjsGz
6jDgqv5u70zZq0sfcrnCAO/Wez8i8w2NMkelTmVP78sZyP3A0nHH2FxZ1DkmC8dJ
UKbeDKQe9kMRqDAc5cBw
=dXN6
-----END PGP SIGNATURE-----

--6rimx524hikgl7qx--
