From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 4/5] clk: sunxi-ng: Add A31/A31s clocks
Date: Mon, 15 Aug 2016 20:07:44 +0200
Message-ID: <20160815200744.fc1ad630f927692eec1e5694@free.fr>
References: <1471248795-17951-1-git-send-email-wens@csie.org>
	<1471248795-17951-5-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471248795-17951-5-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 15 Aug 2016 16:13:14 +0800
Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:

> +/*
> + * The Audio PLL is supposed to have 4 outputs: 3 fixed factors from
> + * the base (2x, 4x and 8x), and one variable divider (the one true
> + * pll audio).
> + *
> + * We don't have any need for the variable divider for now, so we just
> + * hardcode it to match with the clock names
> + */
> +#define SUN6I_A31_PLL_AUDIO_REG	0x008
> +
> +static SUNXI_CCU_NM_WITH_GATE_LOCK(pll_audio_base_clk, "pll-audio-base",
> +				   "osc24M", 0x008,
> +				   8, 7,	/* N */
> +				   0, 5,	/* M */
> +				   BIT(31),	/* gate */
> +				   BIT(28),	/* lock */
> +				   0);
> +

FYI, as in many other SoCs (A83T/H3/..), the multipliers/dividers from
the base clock (24MHz) do not give an exact rate for standard audio
(44.1kHz and 48kHz). Sigma-Delta Modulation must be used.

-- 
Ken ar c'hentañ	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
