From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 06/16] ARM: davinci: da850: use clk->set_parent for
 async3
Date: Mon, 11 Apr 2016 16:19:30 +0530
Message-ID: <570B813A.1030907@ti.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-7-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458863503-31121-7-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 25 March 2016 05:21 AM, David Lechner wrote:
> The da850 family of processors has an async3 clock domain that can be
> muxed to either pll0_sysclk2 or pll1_sysclk2. Now that the davinci clocks
> have a set_parent callback, we can use this to control the async3 mux
> instead of a stand-alone function.
> 
> This adds a new async3_clk and sets the appropriate child clocks. The
> default is use to pll1_sysclk2 since it is not affected by processor
> frequency scaling.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>

> +static int da850_async3_set_parent(struct clk *clk, struct clk *parent)
> +{
> +	u32 val;
> +
> +	val = readl(DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP3_REG));
> +
> +	/* Set the Async3 clock domain mux based on the parent clock. */
> +	if (parent == &pll0_sysclk2)
> +		val &= ~CFGCHIP3_ASYNC3_CLKSRC;
> +	else if (parent == &pll1_sysclk2)
> +		val |= CFGCHIP3_ASYNC3_CLKSRC;
> +	else {
> +		pr_err("Bad parent on async3 clock mux.\n");
> +		return -EINVAL;
> +	}

Since else has braces, need braces on all arm of the if-else construct.

Applied this patch with this fixed locally. checkpatch complains about
this too when --strict option is passed.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
