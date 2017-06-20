From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] clk: Hi3660: register fixed_rate_clks with
 CLK_OF_DECLARE_DRIVER
Date: Tue, 20 Jun 2017 08:09:10 +0800
Message-ID: <20170620000910.GF31883@leoy-ThinkPad-T440>
References: <1495428748-11153-1-git-send-email-leo.yan@linaro.org>
 <1495428748-11153-2-git-send-email-leo.yan@linaro.org>
 <20170619233655.GR20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170619233655.GR20170-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 19, 2017 at 04:36:55PM -0700, Stephen Boyd wrote:
> On 05/22, Leo Yan wrote:
> > The timer will register into system at very early phase at kernel boot;
> > if timer needs to use clock, the clock should be get ready in function
> > of_clk_init() so later the timer driver probe can retrieve clock
> > successfully. This is finished in below flow on arm64:
> > 
> >   start_kernel()
> >     `-> time_init()
> >           `-> of_clk_init(NULL)    => register timer's clock
> >           `-> clocksource_probe()  => register timer
> > 
> > On Hi3660 the sp804 timer uses clock "osc32k", this clock is registered
> > as platform driver rather than CLK_OF_DECLARE_DRIVER method. As result,
> > sp804 timer probe returns failure due if cannot bind clock properly.
> > 
> > To fix the failure, this patch is to split crgctrl clocks into two
> > subsets. One part is for fixed_rate_clks which includes pre-defined
> > fixed rate clocks, and "osc32k" clock is in this category; So we change
> > their registration to CLK_OF_DECLARE_DRIVER method, as result the clocks
> > can be registered ahead with function of_clk_init() and timer driver can
> > bind timer clock successfully; the rest of the crgctrl clocks are still
> > registered by the probe of the platform driver.
> > 
> > This patch also adds checking for all crgctrl clocks registration and
> > print out log if any clock has failure.
> > 
> > Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> 
> Applied to clk-next

Thanks!

> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
