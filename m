From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 0/6] Introduce Bandwidth OPPs for interconnect paths
Date: Thu, 18 Jul 2019 21:12:39 -0700
Message-ID: <CAGETcx_-=b3An9YdxLUnZap=0iaeczvWTEnw65FMLU8BwA3HfQ@mail.gmail.com>
References: <20190703011020.151615-1-saravanak@google.com> <20190717103220.f7cys267hq23fbsb@vireshk-i7>
 <CAGETcx-tbjVzRKW8D-564zgNOhrA_z-NC1q5U70bhoUDBhp6VA@mail.gmail.com> <20190718053746.64drmonk72vwnt4s@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718053746.64drmonk72vwnt4s@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2019 at 10:37 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> I know you have explained lots of things earlier as well, but they are
> available over multiple threads and I don't know where to reply now :)
>
> Lets have proper discussion (once again) here and be done with it.
> Sorry for the trouble of explaining things again.
>
> On 17-07-19, 13:34, Saravana Kannan wrote:
> > On Wed, Jul 17, 2019 at 3:32 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > On 02-07-19, 18:10, Saravana Kannan wrote:
> > > > gpu_cache_opp_table: gpu_cache_opp_table {
> > > >       compatible = "operating-points-v2";
> > > >
> > > >       gpu_cache_3000: opp-3000 {
> > > >               opp-peak-KBps = <3000>;
> > > >               opp-avg-KBps = <1000>;
> > > >       };
> > > >       gpu_cache_6000: opp-6000 {
> > > >               opp-peak-KBps = <6000>;
> > > >               opp-avg-KBps = <2000>;
> > > >       };
> > > >       gpu_cache_9000: opp-9000 {
> > > >               opp-peak-KBps = <9000>;
> > > >               opp-avg-KBps = <9000>;
> > > >       };
> > > > };
> > > >
> > > > gpu_ddr_opp_table: gpu_ddr_opp_table {
> > > >       compatible = "operating-points-v2";
> > > >
> > > >       gpu_ddr_1525: opp-1525 {
> > > >               opp-peak-KBps = <1525>;
> > > >               opp-avg-KBps = <452>;
> > > >       };
> > > >       gpu_ddr_3051: opp-3051 {
> > > >               opp-peak-KBps = <3051>;
> > > >               opp-avg-KBps = <915>;
> > > >       };
> > > >       gpu_ddr_7500: opp-7500 {
> > > >               opp-peak-KBps = <7500>;
> > > >               opp-avg-KBps = <3000>;
> > > >       };
> > > > };
> > >
> > > Who is going to use the above tables and how ?
> >
> > In this example the GPU driver would use these. It'll go through these
> > and then decide what peak and average bw to pick based on whatever
> > criteria.
>
> Are you saying that the GPU driver will decide which bandwidth to
> choose while running at a particular frequency (say 2 GHz) ? And that
> it can choose 1525 or 3051 or 7500 from the ddr path ?
>
> Will it be possible to publicly share how we derive to these decisions
> ?

GPU is just an example. So I can't really speak for how a random GPU
driver might decide the bandwidth to pick.

But one obvious way is to start at the lowest bandwidth and check the
bus port busy%. If it's > 80% busy, it'll pick the next bandwidth,
etc. So, something like what cpufreq ondemand or conservative governor
used to do.

> The thing is I don't like these separate OPP tables which will not be
> used by anyone else, but just GPU (or a single device).

The BW OPP table isn't always a secondary OPP table. It can be a
primary OPP table too. For example, if you have a bandwidth monitoring
device/HW IP that can measure for a path and make requests for that
path, it'll have a BW OPP table and it'll pick from one of those BW
OPP levels based on the hardware measurements. It will have it's own
device driver. This is basically no different from a device being the
only user of a freq OPP table.

> I would like
> to put this data in the GPU OPP table only. What about putting a
> range in the GPU OPP table for the Bandwidth if it can change so much
> for the same frequency.

I don't think the range is going to work. If a GPU is doing purely
computational work, it's not unreasonable for it to vote for the
lowest bandwidth for any GPU frequency.

>
> > > These are the maximum
> > > BW available over these paths, right ?
> >
> > I wouldn't call them "maximum" because there can't be multiple
> > maximums :) But yes, these are the meaningful bandwidth from the GPU's
> > perspective to use over these paths.
> >
> > >
> > > > gpu_opp_table: gpu_opp_table {
> > > >       compatible = "operating-points-v2";
> > > >       opp-shared;
> > > >
> > > >       opp-200000000 {
> > > >               opp-hz = /bits/ 64 <200000000>;
> > > >       };
> > > >       opp-400000000 {
> > > >               opp-hz = /bits/ 64 <400000000>;
> > > >       };
> > > > };
> > >
> > > Shouldn't this link back to the above tables via required-opp, etc ?
> > > How will we know how much BW is required by the GPU device for all the
> > > paths ?
> >
> > If that's what the GPU driver wants to do, then yes. But the GPU
> > driver could also choose to scale the bandwidth for these paths based
> > on multiple other signals. Eg: bus port busy percentage, measure
> > bandwidth, etc.
>
> Lets say that the GPU is running at 2 GHz right now and based on above
> inputs it wants to increase the bandwidth to 7500 for ddr path, now
> does it make sense to run at 4 GHz instead of 2 so we utilize the
> bandwidth to the best of our ability and waste less power ?

This is kinda hard to explain, but I'll try.

Firstly, the GPU power increase might be so high that you might not
want to do this anyway.

Also, what you are proposing *might* improve the perf/mW (efficiency)
but it doesn't decrease the actual power consumption. So, this doesn't
really work towards saving power for mobile devices.

Also, if the GPU is generating a lot of traffic to DDR and you
increase the GPU frequency, it's only going to generate even more
traffic. So you'll end up in a positive feedback loop that maxes out
the frequency and bandwidth. Definitely not something you want for a
mobile device.

> If something like that is acceptable, then what about keeping the
> bandwidth fixed for frequencies and rather scale the frequency of the
> GPU on the inputs your provided (like bus port busy percentage, etc).

I don't think it's acceptable.

> The current proposal makes me wonder on why should we try to reuse OPP
> tables for providing these bandwidth values as the OPP tables for
> interconnect paths isn't really a lot of data, only bandwidth all the
> time and there is no linking from the device's OPP table as well.

I think everyone is getting too tied up on mapping device frequency to
bandwidth requests. That's useful for a limited set of cases. But it
doesn't work for a lot of use cases.

Couple of benefits of using BW OPPs instead of with listing bandwidth
values as part of frequency OPP tables:
- Works better when the interconnect path has more useful levels that
the device frequency levels. I think this might even be true on the
SDM845 for GPU and DDR. The link from freq OPP to BW OPP could list
the minimum bandwidth level to use for a particular device freq and
then let the hardware monitoring heuristic take it higher from there.
- Works even if no freq to bandwidth mapping heuristic is used but the
device needs to skip certain bandwidth levels based on the platform's
power/perf reasons.
- More scalable as more properties are added to BW OPP levels. Traffic
priority is one natural extension of the BW OPP "rows". Explicit
latency is another possibility.
- Currently devices that have use case specific bandwidth levels
(that's not computed at runtime) have no way of capturing their use
case level bandwidth needs in DT. Everyone is inventing their own
scheme. Having BW OPP table would allow them capture all the use case
specific bandwidth levels in DT and then pick one using the
index/phandle/etc. We could even allow naming OPP rows and pick it
that way. Not saying this is a main reason for BW OPP tables or we
should do this, but this is a possibility to consider.

Long story short, BW OPP tables make a lot of sense for anyone who has
actually done bandwidth scaling on a commercial platform.

If people are getting too tied up about the interconnect-opp-table we
can just drop that. I just added that to avoid having any implicit
ordering of tables in the operation-points-v2 property vs
interconnects property and call it out more explicitly. But it's not a
hill worth dying on.

-Saravana
