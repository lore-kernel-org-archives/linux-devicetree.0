From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 3/6] clk: sunxi-ng: Add driver for A83T CCU
Date: Thu, 18 May 2017 09:39:43 +0200
Message-ID: <20170518073943.hu4bsz5qggpkvyv2@flea.home>
References: <20170518035809.15487-1-wens@csie.org>
 <20170518035809.15487-4-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hlbj42qvgqygdi2j"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBQE76XEAKGQEDHGAQVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170518035809.15487-4-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hlbj42qvgqygdi2j
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, May 18, 2017 at 11:58:06AM +0800, Chen-Yu Tsai wrote:
> +/*
> + * MMC2 supports both old and new timing modes. When the new timing
> + * mode is active, the output clock rate is halved by two. Here we
> + * treat it as a variable pre-divider. Note that the pre-divider is
> + * _not_ included in the possible factors during a set clock rate
> + * operation. It is only read out.
> + */
> +#define SUN8I_A83T_MMC2_REG	0x090
> +static const struct ccu_mux_var_prediv mmc2_new_timing_predivs[] = {
> +	{ .index = 0, .shift = 30, .width = 1 },
> +	{ .index = 1, .shift = 30, .width = 1 },
> +};
> +static struct ccu_mp mmc2_clk = {
> +	.enable	= BIT(31),
> +	.m	= _SUNXI_CCU_DIV(0, 4),
> +	.p	= _SUNXI_CCU_DIV(16, 2),
> +	.mux	= {
> +		.shift	= 24,
> +		.width	= 2,
> +		.var_predivs	= mmc2_new_timing_predivs,
> +		.n_var_predivs	= ARRAY_SIZE(mmc2_new_timing_predivs),
> +	},
> +	.common		= {
> +		.reg		= 0x090,
> +		.hw.init	= CLK_HW_INIT_PARENTS("mmc2",
> +						      mod0_default_parents,
> +						      &ccu_mp_ops,
> +						      CLK_GET_RATE_NOCACHE),
> +	},
> +};
> +
> +static SUNXI_CCU_PHASE(mmc2_sample_clk, "mmc2-sample", "mmc2",
> +		       0x090, 20, 3, 0);
> +static SUNXI_CCU_PHASE(mmc2_output_clk, "mmc2-output", "mmc2",
> +		       0x090, 8, 3, 0);

I'm sorry to be a pain for this, but we're in the exact same situation
for the A83T than the A33 or the H3. There's no reason we'd do
something different with the MMC clocks only on the A83T.

What I'd like to happen is:
  1) Get the A83T ccu driver in, without *any* of the new mode
     handling.
  2) Work on the new mode for the A33, A83T and H3 (and the other I
     might have forgotten).

This issue really isn't A83 specific, there's no reason to come up
with A83 specific code.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--hlbj42qvgqygdi2j--
