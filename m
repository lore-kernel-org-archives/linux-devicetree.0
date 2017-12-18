From: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/5] media: rc: update sunxi-ir driver to get base clock
 frequency from devicetree
Date: Mon, 18 Dec 2017 11:44:44 +0900
Message-ID: <20171218024444.GA9140@gangnam.samsung>
References: <20171217224547.21481-1-embed3d@gmail.com>
        <CGME20171217224555epcas5p3eb77a28e9f3ba4b189c5f275e2d2a679@epcas5p3.samsung.com>
        <20171217224547.21481-2-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-disposition: inline
In-reply-to: <20171217224547.21481-2-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

just a couple of small nitpicks.

> +	u32 b_clk_freq;

[...]

> +	/* Base clock frequency (optional) */
> +	if (of_property_read_u32(dn, "clock-frequency", &b_clk_freq)) {
> +		b_clk_freq = SUNXI_IR_BASE_CLK;
> +	}
> +

how about you intialize 'b_clk_freq' to 'SUNXI_IR_BASE_CLK' and
just call 'of_property_read_u32' without if statement.
'b_clk_freq' value should not be changed if "clock-frequency"
is not present in the DTS.

This might avoid misinterpretation from static analyzers that
might think that 'b_clk_freq' is used uninitialized.

> +	dev_info(dev, "set base clock frequency to %d Hz.\n", b_clk_freq);

Please use dev_dbg().

Andi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
