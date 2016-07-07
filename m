From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 13/14] clk: sunxi-ng: Add H3 clocks
Date: Wed, 06 Jul 2016 19:33:08 -0700
Message-ID: <146785878822.73491.15164592643568518865@resonance>
References: <20160629190535.11855-1-maxime.ripard@free-electrons.com>
 <20160629190535.11855-14-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160629190535.11855-14-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Quoting Maxime Ripard (2016-06-29 12:05:34)
> +static void __init sun8i_h3_ccu_setup(struct device_node *node)
> +{
> +       void __iomem *reg;
> +       u32 val;
> +
> +       reg = of_io_request_and_map(node, 0, of_node_full_name(node));
> +       if (IS_ERR(reg)) {
> +               pr_err("%s: Could not map the clock registers\n",
> +                      of_node_full_name(node));
> +               return;
> +       }
> +
> +       /* Force the PLL-Audio-1x divider to 4 */
> +       val = readl(reg + SUN8I_H3_PLL_AUDIO_REG);
> +       val &= ~GENMASK(4, 0);
> +       writel(val | 3, reg + SUN8I_H3_PLL_AUDIO_REG);
> +
> +       sunxi_ccu_probe(node, reg, &sun8i_h3_ccu_desc);
> +}
> +CLK_OF_DECLARE(sun8i_h3_ccu, "allwinner,sun8i-h3-ccu",
> +              sun8i_h3_ccu_setup);

There are several examples of drivers that split the clocks between
"early" CLK_OF_DECLARE clocks and "late" module clocks. If you really
need early clocks (which is less likely on a 64-bit platform with
architected timers), it would be nice to pair that with a proper
platform_driver (using builtin_platform_driver most likely).

Otherwise that is my only nitpick with this series. Looks good!

Best regards,
Mike
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
