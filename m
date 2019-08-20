From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v5 2/3] OPP: Add support for bandwidth OPP tables
Date: Tue, 20 Aug 2019 15:36:38 -0700
Message-ID: <CAGETcx-xQika2MgTgA3Gft3u2_uXgvoYThXwEpW_G03QTEh-yQ@mail.gmail.com>
References: <20190807223111.230846-1-saravanak@google.com> <20190807223111.230846-3-saravanak@google.com>
 <20190820061300.wa2dirylb7fztsem@vireshk-i7> <CAGETcx9BV9qj17LY30vgAaLtz+3rXt_CPpu4wB_AQCC5M7qOdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGETcx9BV9qj17LY30vgAaLtz+3rXt_CPpu4wB_AQCC5M7qOdA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Georgi Djakov <georgi.djakov@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.or>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 3:27 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Mon, Aug 19, 2019 at 11:13 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 07-08-19, 15:31, Saravana Kannan wrote:

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
>
> >
> > > +
> > > +     return 0;
> >
> > You are returning 0 on failure as well here.
>
> Thanks.

Wait, no. This is not actually a failure. opp-avg-kBps is optional. So
returning 0 is the right thing to do. If the mandatory properties
aren't present an error is returned before you get to th end.

-Saravana
