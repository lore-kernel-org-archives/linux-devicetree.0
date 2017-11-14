From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v9 3/7] mailbox: qcom: Move the apcs struct into a
 separate header
Date: Tue, 14 Nov 2017 10:12:12 -0800
Message-ID: <20171114181212.GC11955@codeaurora.org>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-4-georgi.djakov@linaro.org>
 <20171026042811.GL1575@tuxbook>
 <5bad4c4b-362b-ba9f-3072-1cced7a004dd@linaro.org>
 <20171114021255.GY11955@codeaurora.org>
 <20171114044702.GF28761@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171114044702.GF28761@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/13, Bjorn Andersson wrote:
> On Mon 13 Nov 18:12 PST 2017, Stephen Boyd wrote:
> 
> > On 10/27, Georgi Djakov wrote:
> > > Hi Bjorn,
> > > 
> > > Thanks for reviewing!
> > > 
> > > On 10/26/2017 07:28 AM, Bjorn Andersson wrote:
> > > > On Thu 21 Sep 09:49 PDT 2017, Georgi Djakov wrote:
> > > > 
> > > >> Move the structure shared by the APCS IPC device and its subdevices
> > > >> into a separate header file.
> > > >>
> > > > 
> > > > As you're creating the apcs regmap with devm_regmap_init_mmio() you can
> > > > just call dev_get_regmap(dev->parent) in your child to get the handle.
> > > 
> > > Ok, thanks!
> > > 
> > > > 
> > > > But I would prefer that you just add the clock code to the existing
> > > > driver.
> > > 
> > > This will require an ack from Stephen, and i got the impression that he
> > > prefers a separate clk driver [1].
> > > 
> > > Stephen, are you ok with registering the clocks from the apcs mailbox
> > > driver?
> > > 
> > > [1] https://lkml.org/lkml/2017/6/26/750
> > 
> > The parent regmap "trick" was the plan. Is something wrong with
> > that?
> > 
> 
> Not at all, but then this patch (moving apcs context to a shared header
> file) shouldn't be needed, or am I missing something?

Agreed.

> 
> > Not having random clk drivers scattered throughout the tree is
> > sort of nice because it makes for an easier time finding things
> > that are similar. Maybe that's an abuse of the driver model
> > though? Just to get things into some same directory. I'm fine
> > either way.
> > 
> 
> Keeping the clock driver in the clock subsystem does make sense. I see
> now that there is a include of a local header file as well, so that
> would just be messy to keep split.
> 
> I'm fine with the extra driver instance, it's the DT that I don't think
> should describe the fact that we want to keep the clock-part in the
> clock subsystem.
> 
> Do you see any problems spawning the clock driver programmatically and
> then calling of_clk_add_hw_provider() on the parent's of_node?

Nope. We shouldn't need to modify DT to make this work.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
