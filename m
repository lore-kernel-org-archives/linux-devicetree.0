From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 00/15] clk: sunxi: introduce "modern" clock support
Date: Mon, 20 Jun 2016 18:48:16 -0700
Message-ID: <20160621014816.GT1521@codeaurora.org>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160607204154.31967-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/07, Maxime Ripard wrote:
> 
> The current code has been tested on the H3 and an Orange Pi PC,
> including making sure that MMC still works, so the general approach
> seems ok.
> 
> Let me know what you think,

Overall this looks pretty good. Thanks for taking the time to
rework the driver.

The macro nesting is sort of concerning, but if you're willing to
live with a maze of macros I'm not too worried. Also, I don't see
why we have to use the ccu_common structure everywhere even when
we're not gaining from it, but it's not a huge problem either
way. The non-mmio clks could be split off from the mmio list and
then registered in two lists, or there could be mmio list that
sets up the base address and then a larger list of clk_hw
pointers that we just run through and register.

It would be great if we could squeeze some more code reuse out of
the basic types too, but I'm not sure if there's much more that
can be done. Sometimes I'm seeing the same code multiple times
for handling muxes with parents and dividers or muxes without
dividers, etc. But that seems like future work that isn't going
to block anything here.

Finally, can you please use the clk_hw_register() APIs that we've
recently added. That will save us some time converting a new
driver over to use the new style of registering clks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
