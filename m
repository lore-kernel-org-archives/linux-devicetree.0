From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 6/6] dt-bindings: ARM: Mediatek: Document devicetree
 bindings for clock/reset controllers
Date: Tue, 5 May 2015 22:53:39 -0700
Message-ID: <20150506055339.GB10871@codeaurora.org>
References: <1429778143-2074-1-git-send-email-s.hauer@pengutronix.de>
 <1429778143-2074-7-git-send-email-s.hauer@pengutronix.de>
 <20150501012039.GG32407@codeaurora.org>
 <20150504083852.GJ4946@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150504083852.GJ4946-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, YH Chen <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <Yingjoe.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/04, Sascha Hauer wrote:
> On Thu, Apr 30, 2015 at 06:20:39PM -0700, Stephen Boyd wrote:
> > On 04/23, Sascha Hauer wrote:
> > > +The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> > > +
> > > +Example:
> > > +
> > > +apmixedsys: apmixedsys@10209000 {
> > 
> > apmixedsys: clock-controller@10209000 {
> > 
> > would be more standard. The same comment applies throughout this
> > patch. Otherwise it looks good to me.
> 
> For apmixed this I agree, but the others are also reset controllers, so
> I'm not sure if clock-controller is appropriate. Personally I don't care
> much, I'll change to whatever you like.

I've already applied the patch, so if you like you can send a
follow up. Perhaps power-controller is more appropriate? I'm not
too worried about it though.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
