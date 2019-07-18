Return-Path: <SRS0=tkW+=VP=linaro.org=viresh.kumar@kernel.org>
Date: Thu, 18 Jul 2019 11:07:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 0/6] Introduce Bandwidth OPPs for interconnect paths
Message-ID: <20190718053746.64drmonk72vwnt4s@vireshk-i7>
References: <20190703011020.151615-1-saravanak@google.com>
 <20190717103220.f7cys267hq23fbsb@vireshk-i7>
 <CAGETcx-tbjVzRKW8D-564zgNOhrA_z-NC1q5U70bhoUDBhp6VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx-tbjVzRKW8D-564zgNOhrA_z-NC1q5U70bhoUDBhp6VA@mail.gmail.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

I know you have explained lots of things earlier as well, but they are
available over multiple threads and I don't know where to reply now :)

Lets have proper discussion (once again) here and be done with it.
Sorry for the trouble of explaining things again.

On 17-07-19, 13:34, Saravana Kannan wrote:
> On Wed, Jul 17, 2019 at 3:32 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 02-07-19, 18:10, Saravana Kannan wrote:
> > > gpu_cache_opp_table: gpu_cache_opp_table {
> > >       compatible = "operating-points-v2";
> > >
> > >       gpu_cache_3000: opp-3000 {
> > >               opp-peak-KBps = <3000>;
> > >               opp-avg-KBps = <1000>;
> > >       };
> > >       gpu_cache_6000: opp-6000 {
> > >               opp-peak-KBps = <6000>;
> > >               opp-avg-KBps = <2000>;
> > >       };
> > >       gpu_cache_9000: opp-9000 {
> > >               opp-peak-KBps = <9000>;
> > >               opp-avg-KBps = <9000>;
> > >       };
> > > };
> > >
> > > gpu_ddr_opp_table: gpu_ddr_opp_table {
> > >       compatible = "operating-points-v2";
> > >
> > >       gpu_ddr_1525: opp-1525 {
> > >               opp-peak-KBps = <1525>;
> > >               opp-avg-KBps = <452>;
> > >       };
> > >       gpu_ddr_3051: opp-3051 {
> > >               opp-peak-KBps = <3051>;
> > >               opp-avg-KBps = <915>;
> > >       };
> > >       gpu_ddr_7500: opp-7500 {
> > >               opp-peak-KBps = <7500>;
> > >               opp-avg-KBps = <3000>;
> > >       };
> > > };
> >
> > Who is going to use the above tables and how ?
> 
> In this example the GPU driver would use these. It'll go through these
> and then decide what peak and average bw to pick based on whatever
> criteria.

Are you saying that the GPU driver will decide which bandwidth to
choose while running at a particular frequency (say 2 GHz) ? And that
it can choose 1525 or 3051 or 7500 from the ddr path ?

Will it be possible to publicly share how we derive to these decisions
?

The thing is I don't like these separate OPP tables which will not be
used by anyone else, but just GPU (or a single device). I would like
to put this data in the GPU OPP table only. What about putting a
range in the GPU OPP table for the Bandwidth if it can change so much
for the same frequency.

> > These are the maximum
> > BW available over these paths, right ?
> 
> I wouldn't call them "maximum" because there can't be multiple
> maximums :) But yes, these are the meaningful bandwidth from the GPU's
> perspective to use over these paths.
> 
> >
> > > gpu_opp_table: gpu_opp_table {
> > >       compatible = "operating-points-v2";
> > >       opp-shared;
> > >
> > >       opp-200000000 {
> > >               opp-hz = /bits/ 64 <200000000>;
> > >       };
> > >       opp-400000000 {
> > >               opp-hz = /bits/ 64 <400000000>;
> > >       };
> > > };
> >
> > Shouldn't this link back to the above tables via required-opp, etc ?
> > How will we know how much BW is required by the GPU device for all the
> > paths ?
> 
> If that's what the GPU driver wants to do, then yes. But the GPU
> driver could also choose to scale the bandwidth for these paths based
> on multiple other signals. Eg: bus port busy percentage, measure
> bandwidth, etc.

Lets say that the GPU is running at 2 GHz right now and based on above
inputs it wants to increase the bandwidth to 7500 for ddr path, now
does it make sense to run at 4 GHz instead of 2 so we utilize the
bandwidth to the best of our ability and waste less power ?

If something like that is acceptable, then what about keeping the
bandwidth fixed for frequencies and rather scale the frequency of the
GPU on the inputs your provided (like bus port busy percentage, etc).

The current proposal makes me wonder on why should we try to reuse OPP
tables for providing these bandwidth values as the OPP tables for
interconnect paths isn't really a lot of data, only bandwidth all the
time and there is no linking from the device's OPP table as well.

-- 
viresh
