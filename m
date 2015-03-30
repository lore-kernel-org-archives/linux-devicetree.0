From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/7] clk: Add basic infrastructure for Pistachio clocks
Date: Mon, 30 Mar 2015 16:59:56 -0700
Message-ID: <5519E37C.9010201@codeaurora.org>
References: <1424836567-7252-1-git-send-email-abrestic@chromium.org> <1424836567-7252-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424836567-7252-3-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/24/15 19:56, Andrew Bresticker wrote:
> +
> +void pistachio_clk_force_enable(struct pistachio_clk_provider *p,
> +				unsigned int *clk_ids, unsigned int num)
> +{
> +	unsigned int i;
> +	int err;
> +
> +	for (i = 0; i < num; i++) {
> +		struct clk *clk = p->clk_data.clks[clk_ids[i]];
> +
> +		if (IS_ERR(clk))
> +			continue;
> +
> +		err = clk_prepare_enable(clk);
> +		if (err)
> +			pr_err("Failed to enable clock %s: %d\n",
> +			       __clk_get_name(clk), err);
> +	}
> +}
>

Is this to workaround some problems in the framework where clocks are
turned off? Or is it that these clocks are already on before we boot
Linux and we need to make sure the framework knows that?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
