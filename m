From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 12/19] drm/sun4i: hdmi: Support the DDC
 clock in the A31's HDMI controller
Date: Fri, 2 Jun 2017 21:31:06 +0200
Message-ID: <20170602193106.c3yagwkglhg45h6y@flea.lan>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-13-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rjl2suipzdxwdmfe"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBF72Y3EQKGQEL2D54TA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170602101024.18940-13-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rjl2suipzdxwdmfe
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Jun 02, 2017 at 06:10:17PM +0800, Chen-Yu Tsai wrote:
> On the A31, the HDMI DDC block is different from the one in the
> other SoCs. As far as the DDC clock goes, it has no pre-divider,
> as it is clocked from a slower parent clock, not the TMDS clock.
> The divider offset from the register value is different. And the
> clock control register is at a different offset.
> 
> This patch adds support for this variant.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi.h         |  1 +
>  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> index 08c514672fd3..c39c2a245339 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
> @@ -178,6 +178,7 @@ struct sun4i_hdmi {
>  };
>  
>  int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *clk);
> +int sun6i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *clk);
>  int sun4i_tmds_create(struct sun4i_hdmi *hdmi);
>  int sun6i_tmds_create(struct sun4i_hdmi *hdmi);
>  
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> index 9a6b6243e977..b1395e7b242c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> @@ -151,3 +151,14 @@ int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *parent)
>  {
>  	return _sun4i_ddc_create(hdmi, parent, &sun4i_variant);
>  }
> +
> +static const struct sun4i_ddc_variant sun6i_variant = {
> +	.reg_offset	= SUN6I_HDMI_DDC_CLK_REG,

This one should be handled through a regmap_field.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--rjl2suipzdxwdmfe--
