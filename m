From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCHv2 3/3] clk: keystone: Add sci-clk driver support
Date: Fri, 2 Sep 2016 16:32:35 -0700
Message-ID: <20160902233235.GM12510@codeaurora.org>
References: <1472733635-22661-1-git-send-email-t-kristo@ti.com>
 <1472733635-22661-4-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472733635-22661-4-git-send-email-t-kristo-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nm-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/01, Tero Kristo wrote:
> +
> +/**
> + * _sci_clk_get - Gets a handle for an SCI clock
> + * @provider: Handle to SCI clock provider
> + * @dev_id: device ID for the clock to register
> + * @clk_id: clock ID for the clock to register
> + * @parse_parents: indicator whether parents for this clock should be handled
> + *
> + * Gets a handle to an existing TI SCI hw clock, or builds a new clock
> + * entry and registers it with the common clock framework. Called from
> + * the common clock framework, when a corresponding of_clk_get call is
> + * executed, or recursively from itself when parsing parent clocks.
> + * Returns a pointer to the hw clock struct, or ERR_PTR value in failure.
> + */
> +static struct clk_hw *_sci_clk_get(struct sci_clk_provider *provider,
> +				   u16 dev_id, u8 clk_id, bool parse_parents)

I still don't get it. We should be registering hw pointers in
probe and handing them out in the xlate function. Not register
hws in the xlate function and then handing them out as well. I
haven't reviewed anything else in this patch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
