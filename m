From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v5 2/3] OPP: Add support for bandwidth OPP tables
Date: Tue, 20 Aug 2019 15:34:07 -0700
Message-ID: <CAGETcx8h2v054eS6pZ3iEsM2AGfN45_fqJGsVt+1UhbrK_dbdQ@mail.gmail.com>
References: <20190807223111.230846-1-saravanak@google.com> <20190807223111.230846-3-saravanak@google.com>
 <20190816182131.A692E206C1@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816182131.A692E206C1@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 11:21 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Saravana Kannan (2019-08-07 15:31:10)
> > diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> > index 1813f5ad5fa2..e1750033fef9 100644
> > --- a/drivers/opp/of.c
> > +++ b/drivers/opp/of.c
> > @@ -523,6 +523,35 @@ void dev_pm_opp_of_remove_table(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(dev_pm_opp_of_remove_table);
> >
> > +static int _read_opp_key(struct dev_pm_opp *new_opp, struct device_node *np)
> > +{
> > +       int ret;
> > +       u64 rate;
> > +       u32 bw;
> > +
> > +       ret = of_property_read_u64(np, "opp-hz", &rate);
> > +       if (!ret) {
> > +               /*
> > +                * Rate is defined as an unsigned long in clk API, and so
> > +                * casting explicitly to its type. Must be fixed once rate is 64
> > +                * bit guaranteed in clk API.
> > +                */
> > +               new_opp->rate = (unsigned long)rate;
> > +               return 0;
> > +       }
> > +
> > +       ret = of_property_read_u32(np, "opp-peak-kBps", &bw);
> > +       if (ret)
> > +               return ret;
> > +       new_opp->rate = (unsigned long) bw;
> > +
> > +       ret = of_property_read_u32(np, "opp-avg-kBps", &bw);
> > +       if (!ret)
>
> I would write this as
>
>         if (!of_property_read_u32(np, "opp-avg-kBps", &bw))
>                 new_opp->avg_bw = (unsigned long) bw;
>
> because you don't care about the return value.

Sure, will do.

>
> > +               new_opp->avg_bw = (unsigned long) bw;
> > +
> > +       return 0;
> > +}
> > +
> >  /**
> >   * _opp_add_static_v2() - Allocate static OPPs (As per 'v2' DT bindings)
> >   * @opp_table: OPP table
> > diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
> > index 01a500e2c40a..6bb238af9cac 100644
> > --- a/drivers/opp/opp.h
> > +++ b/drivers/opp/opp.h
> > @@ -56,7 +56,8 @@ extern struct list_head opp_tables;
> >   * @turbo:     true if turbo (boost) OPP
> >   * @suspend:   true if suspend OPP
> >   * @pstate: Device's power domain's performance state.
> > - * @rate:      Frequency in hertz
> > + * @rate:      Frequency in hertz OR Peak bandwidth in kilobytes per second
>
> Why is Peak capitalized?

Because it's another Key? :)

Just kidding. I'll fix it.

> > + * @avg_bw:    Average bandwidth in kilobytes per second
> >   * @level:     Performance level
> >   * @supplies:  Power supplies voltage/current values
> >   * @clock_latency_ns: Latency (in nanoseconds) of switching to this OPP's
> > @@ -78,6 +79,7 @@ struct dev_pm_opp {
> >         bool suspend;
> >         unsigned int pstate;
> >         unsigned long rate;
>
> If you're trying to save space why not make an anonymous union here of
> 'rate' and 'bandwidth'? Then the code doesn't read all weird.

It's not about saving space. It's about having to rewrite all the
helper functions (see subsequent patch in this series) for different
"keys" with zero difference in the actual comparisons/logic. I'm
proposing I rename this to "key" in another email.


-Saravana
