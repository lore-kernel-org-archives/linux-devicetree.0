From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v9 3/7] mailbox: qcom: Move the apcs struct into a
 separate header
Date: Mon, 13 Nov 2017 20:47:02 -0800
Message-ID: <20171114044702.GF28761@minitux>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-4-georgi.djakov@linaro.org>
 <20171026042811.GL1575@tuxbook>
 <5bad4c4b-362b-ba9f-3072-1cced7a004dd@linaro.org>
 <20171114021255.GY11955@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171114021255.GY11955@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, jassisinghbrar@gmail.com, robh+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 13 Nov 18:12 PST 2017, Stephen Boyd wrote:

> On 10/27, Georgi Djakov wrote:
> > Hi Bjorn,
> > 
> > Thanks for reviewing!
> > 
> > On 10/26/2017 07:28 AM, Bjorn Andersson wrote:
> > > On Thu 21 Sep 09:49 PDT 2017, Georgi Djakov wrote:
> > > 
> > >> Move the structure shared by the APCS IPC device and its subdevices
> > >> into a separate header file.
> > >>
> > > 
> > > As you're creating the apcs regmap with devm_regmap_init_mmio() you can
> > > just call dev_get_regmap(dev->parent) in your child to get the handle.
> > 
> > Ok, thanks!
> > 
> > > 
> > > But I would prefer that you just add the clock code to the existing
> > > driver.
> > 
> > This will require an ack from Stephen, and i got the impression that he
> > prefers a separate clk driver [1].
> > 
> > Stephen, are you ok with registering the clocks from the apcs mailbox
> > driver?
> > 
> > [1] https://lkml.org/lkml/2017/6/26/750
> 
> The parent regmap "trick" was the plan. Is something wrong with
> that?
> 

Not at all, but then this patch (moving apcs context to a shared header
file) shouldn't be needed, or am I missing something?

> Not having random clk drivers scattered throughout the tree is
> sort of nice because it makes for an easier time finding things
> that are similar. Maybe that's an abuse of the driver model
> though? Just to get things into some same directory. I'm fine
> either way.
> 

Keeping the clock driver in the clock subsystem does make sense. I see
now that there is a include of a local header file as well, so that
would just be messy to keep split.

I'm fine with the extra driver instance, it's the DT that I don't think
should describe the fact that we want to keep the clock-part in the
clock subsystem.

Do you see any problems spawning the clock driver programmatically and
then calling of_clk_add_hw_provider() on the parent's of_node?

Regards,
Bjorn
