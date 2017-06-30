From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V1 8/9] clk: sprd: add clocks support for SC9860
Date: Thu, 29 Jun 2017 18:41:17 -0700
Message-ID: <20170630014117.GJ22780@codeaurora.org>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
 <20170618015855.27738-9-chunyan.zhang@spreadtrum.com>
 <20170620014137.GK4493@codeaurora.org>
 <CAAfSe-s5oPB_G=sSAqVpYkgxhD=AE3nxv-V7-t0v+qw_AtxH3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAfSe-s5oPB_G=sSAqVpYkgxhD=AE3nxv-V7-t0v+qw_AtxH3g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xiaolong Zhang <xiaolong.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Geng Ren <geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Ben Li <ben.li-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/22, Chunyan Zhang wrote:
> Hi Stephen,
> 
> On 20 June 2017 at 09:41, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> > On 06/18, Chunyan Zhang wrote:
> >> +++ b/include/dt-bindings/clock/sc9860-ccu.h
> >> @@ -0,0 +1,19 @@
> >> +/*
> >> + * Spreadtrum SC9860 platform clocks
> >> + *
> >> + * Copyright (C) 2017, Spreadtrum Communications Inc.
> >> + *
> >> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> + */
> >> +
> >> +#ifndef _DT_BINDINGS_CLK_SC9860_CCU_H_
> >> +#define _DT_BINDINGS_CLK_SC9860_CCU_H_
> >> +
> >> +#define CLK_FAC_1M   2
> >> +#define CLK_EMMC_2X_EN       29
> >> +#define CLK_L0_409M6 60
> >> +#define CLK_EMMC_2X  88
> >> +#define CLK_EMMC_EB  158
> >
> > Why are only a handful exposed in the header file? Not exposing
> > everything is mostly a maintenance nightmare right now.
> 
> No special reason here, my thought simply was that there's no much
> Spreadtrum's device driver in mainline at present, so most of the
> clocks wouldn't be needed for now, I planned to expose only those when
> the device driver they provide clock to, that's saying when we add a
> new device driver we'll expose the clocks this device needs.

Please no. I don't want to get the one-off patch in my inbox to
add more and more ids here "just because" nobody was using the
numbers before. I really don't care that someone has added the
driver for some random device on their SoC now and so they need
to expose the number into a header file. I know some people are
doing this, and it's really not meaningful. I'm much happier if
we're exposing every single clk number to DT and reducing churn
in the include/dt-bindings/ directory. And really, the raw number
could be used in dt, so the enforcement of any sort of ABI needs
to be in the clk driver anyway.

Now if a clk was left out of the clk driver implementation, then
the number could be left out of the header file, but even then it
doesn't really need to be. The clk driver could be implemented in
a way to return an error if the number doesn't map to a clk_hw
structure in the driver. In the future, the clk could be added to
the driver, and then DT wouldn't need to change and consumer
drivers would start to work when various branches are merged
together.

Also, sometimes clk driver authors don't know about all the clks
that they have on their hardware (I doubt this includes you
because you work at the company making the SoC here). In this
case, it's OK to leave out the ids that aren't known to the
binding author because we can't expect more from these people.
And if you know for a fact that a certain clk will never need to
be exposed in the binding, like some random internal clk that
nobody will care to use, then it's also OK to leave that out from
the binding.

> 
> Another reason is, I'm not sure if there are still some clocks I
> haven't listed for SC9860 , so if we need to add a clock in the
> feature, the value of these macros defined in
> "include/dt-bindings/clock/sc9860-ccu.h" may be changed, that means I
> need to change the index of all clocks following the clock inserted
> into.

When modifying a dt-bindings header file to add more clk ids you
should _never_ modify existing numbers. That would be a backwards
incompatible change of the DT binding. If anything, just keep
adding more numbers to the end of the number space. If something
needs to be removed, make that number map to an error or some
no-op clk_hw structure in the clk driver.

> 
> But why will not exposing everything bring trouble to maintenance? :)
> 

Mostly it's because I spend too much time worrying about these
include/dt-bindings files and how they're going to land in Linus'
tree and not enough time reviewing driver and core framework
patches. I'm trying to reduce the time spent worrying about these
header files to a manageable amount.

Hopefully that's helpful. Sorry for the long email.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
