From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v5 2/3] OPP: Add support for bandwidth OPP tables
Date: Wed, 21 Aug 2019 10:53:30 +0530
Message-ID: <20190821052330.7zufh7hhurq7ictp@vireshk-i7>
References: <20190807223111.230846-1-saravanak@google.com>
 <20190807223111.230846-3-saravanak@google.com>
 <20190820061300.wa2dirylb7fztsem@vireshk-i7>
 <CAGETcx9BV9qj17LY30vgAaLtz+3rXt_CPpu4wB_AQCC5M7qOdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGETcx9BV9qj17LY30vgAaLtz+3rXt_CPpu4wB_AQCC5M7qOdA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Georgi Djakov <georgi.djakov@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.or>
List-Id: devicetree@vger.kernel.org

On 20-08-19, 15:27, Saravana Kannan wrote:
> On Mon, Aug 19, 2019 at 11:13 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 07-08-19, 15:31, Saravana Kannan wrote:
> > > Not all devices quantify their performance points in terms of frequency.
> > > Devices like interconnects quantify their performance points in terms of
> > > bandwidth. We need a way to represent these bandwidth levels in OPP. So,
> > > add support for parsing bandwidth OPPs from DT.
> > >
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > ---
> > >  drivers/opp/of.c  | 41 ++++++++++++++++++++++++++++++++---------
> > >  drivers/opp/opp.h |  4 +++-
> > >  2 files changed, 35 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> > > index 1813f5ad5fa2..e1750033fef9 100644
> > > --- a/drivers/opp/of.c
> > > +++ b/drivers/opp/of.c
> > > @@ -523,6 +523,35 @@ void dev_pm_opp_of_remove_table(struct device *dev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(dev_pm_opp_of_remove_table);
> > >
> > > +static int _read_opp_key(struct dev_pm_opp *new_opp, struct device_node *np)
> > > +{
> > > +     int ret;
> > > +     u64 rate;
> > > +     u32 bw;
> > > +
> > > +     ret = of_property_read_u64(np, "opp-hz", &rate);
> > > +     if (!ret) {
> > > +             /*
> > > +              * Rate is defined as an unsigned long in clk API, and so
> > > +              * casting explicitly to its type. Must be fixed once rate is 64
> > > +              * bit guaranteed in clk API.
> > > +              */
> > > +             new_opp->rate = (unsigned long)rate;
> > > +             return 0;
> > > +     }
> > > +
> >
> > Please read opp-level also here and do error handling.
> 
> Can you please explain what's the reasoning? opp-level doesn't seem to
> be a "key" based on looking at the code.

Because opp-level is the thing that distinguishes OPPs for power domains, those
nodes don't have opp-hz or bw.

> > > +     ret = of_property_read_u32(np, "opp-peak-kBps", &bw);
> > > +     if (ret)
> > > +             return ret;
> > > +     new_opp->rate = (unsigned long) bw;
> > > +
> > > +     ret = of_property_read_u32(np, "opp-avg-kBps", &bw);
> > > +     if (!ret)
> > > +             new_opp->avg_bw = (unsigned long) bw;
> >
> > If none of opp-hz/level/peak-kBps are available, print error message here
> > itself..
> 
> But you don't print any error for opp-level today. Seems like it's optional?

Yeah, probably it should have been there. It will be better to do it now as we
are creating a separate routine for that.

> >
> > > +
> > > +     return 0;
> >
> > You are returning 0 on failure as well here.
> 
> Thanks.
> 
> > > +}
> > > +
> > >  /**
> > >   * _opp_add_static_v2() - Allocate static OPPs (As per 'v2' DT bindings)
> > >   * @opp_table:       OPP table
> > > @@ -560,22 +589,16 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
> > >       if (!new_opp)
> > >               return ERR_PTR(-ENOMEM);
> > >
> > > -     ret = of_property_read_u64(np, "opp-hz", &rate);
> > > +     ret = _read_opp_key(new_opp, np);
> > >       if (ret < 0) {
> > >               /* "opp-hz" is optional for devices like power domains. */
> > >               if (!opp_table->is_genpd) {
> > > -                     dev_err(dev, "%s: opp-hz not found\n", __func__);
> > > +                     dev_err(dev, "%s: opp-hz or opp-peak-kBps not found\n",
> > > +                             __func__);
> > >                       goto free_opp;
> > >               }
> > >
> > >               rate_not_available = true;
> >
> > Move all above as well to read_opp_key().
> 
> Ok. I didn't want to print an error at the API level and instead print
> at the caller level. But if that's what you want, that's fine by me.

That would be fine, you can keep the print message here (but a generic one, like
key missing).

> > > -     } else {
> > > -             /*
> > > -              * Rate is defined as an unsigned long in clk API, and so
> > > -              * casting explicitly to its type. Must be fixed once rate is 64
> > > -              * bit guaranteed in clk API.
> > > -              */
> > > -             new_opp->rate = (unsigned long)rate;
> > >       }
> > >
> > >       of_property_read_u32(np, "opp-level", &new_opp->level);
> > > diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
> > > index 01a500e2c40a..6bb238af9cac 100644
> > > --- a/drivers/opp/opp.h
> > > +++ b/drivers/opp/opp.h
> > > @@ -56,7 +56,8 @@ extern struct list_head opp_tables;
> > >   * @turbo:   true if turbo (boost) OPP
> > >   * @suspend: true if suspend OPP
> > >   * @pstate: Device's power domain's performance state.
> > > - * @rate:    Frequency in hertz
> > > + * @rate:    Frequency in hertz OR Peak bandwidth in kilobytes per second
> > > + * @avg_bw:  Average bandwidth in kilobytes per second
> >
> > Please add separate entry for peak_bw here.
> >
> > I know you reused rate because you don't want to reimplement the helpers we
> > have. Maybe we can just update them to return peak_bw when opp-hz isn't present.
> 
> How about I just rename this to "key"? That makes a lot more sense
> than trying to save 3 different keys and going through them one at a
> time.

I would still like to keep separate fields for now. We are still in continuous
development and don't know how things will be going forward. We may end up
having bw and hz in the OPP table as well. Over that I like to have separate
fields for readability.

Thanks.

-- 
viresh
