From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 6/9] coresight: add support for CPU debug module
Date: Thu, 30 Mar 2017 09:59:41 +0800
Message-ID: <20170330015941.GD3038@leoy-linaro>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-7-git-send-email-leo.yan@linaro.org>
 <20170328165010.GA21937@linaro.org>
 <20170329015423.GA5035@leoy-linaro>
 <20170329165535.GB24889@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170329165535.GB24889-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 10:55:35AM -0600, Mathieu Poirier wrote:

[...]

> > So this is why add "idle_constraint" as a central place to control
> > power domain for CPU debug purpose and I also think this is more
> > friendly for hardware design, e.g. some platforms can enable partial
> > low power states to save power and avoid overheat after using this
> > driver.
> > 
> > How about you think for this?
> 
> Like Sudeep pointed out we should concentrate on doing the right thing,
> that is work with EDPRSR.PU, EDPRCR.COREPURQ and EDPRCR.CORENPDRQ.

Agree, and I think we have aligned for this.

> Anything outside of that becomes platform specific and can't be handled in
> this driver.

Sorry I argue a bit for this just want to make things more clear and
if can have better method.

Though the issue is platform specific, but the code is to seek common
method to handle them. So the driver has no any platform specific code.

I read again for Suziki's suggestion: "4) Should document the fact that,
on some platforms, the user may have to disable CPUidle explicitly to
get the driver working. But let us not make it the default. The user
with a not so ideal platform could add "nohlt" and get it working."

So I'm not strong to resist and if this is alignment yet, I should
document well for this but doesn't handle it in driver (keep driver
simple).

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
