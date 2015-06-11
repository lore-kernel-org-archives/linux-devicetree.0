From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 0/5] Add Mediatek MT8173 subsystem clocks support
Date: Thu, 11 Jun 2015 16:52:12 -0700
Message-ID: <20150611235212.GI29640@codeaurora.org>
References: <1432192376-6712-1-git-send-email-jamesjj.liao@mediatek.com>
 <20150528132452.GI26575@pengutronix.de>
 <1432867649.15597.46.camel@mtksdaap41>
 <20150529062345.GY6325@pengutronix.de>
 <20150604210212.GM676@codeaurora.org>
 <1433468737.14416.7.camel@mtksdaap41>
 <20150606005912.GC29237@codeaurora.org>
 <20150608074858.GK6325@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150608074858.GK6325-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/08, Sascha Hauer wrote:
> On Fri, Jun 05, 2015 at 05:59:12PM -0700, Stephen Boyd wrote:
> > 
> > And similar things could be done for the reset driver.
> 
> The problem I see with this approach is that we scatter the code for a
> otherwise simple driver over a bunch of directories. We would have
> 
> drivers/clk/mediatek/vencsys.c
> drivers/reset/mediatek/vencsys.c
> drivers/soc/mediatek/vencsys.c
> 
> The same must be added for vdecsys, imgsys and vencltsys. That will make
> 12 drivers and three maintainers for 12 registers.  I think this will be
> a pain to maintain, hence my suggestion to put the vencsys code into a
> single file and not split this up into more subsystem specific files.
> 

I probably don't have enough information here, but why is it a
pain to maintain? It seems more like a pain to setup the first
time and then little to no pain to maintain because we clearly
split functionality based on subsystem. No merge conflicts, clear
division of functionality, etc. But again, I don't think it
matters much either way given that reset and clk drivers are
combined sometimes and don't always reside in drivers/clk or
drivers/reset either.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
