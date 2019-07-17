From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 0/6] Introduce Bandwidth OPPs for interconnect paths
Date: Wed, 17 Jul 2019 13:34:49 -0700
Message-ID: <CAGETcx-tbjVzRKW8D-564zgNOhrA_z-NC1q5U70bhoUDBhp6VA@mail.gmail.com>
References: <20190703011020.151615-1-saravanak@google.com> <20190717103220.f7cys267hq23fbsb@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190717103220.f7cys267hq23fbsb@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, daidavid1@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2019 at 3:32 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 02-07-19, 18:10, Saravana Kannan wrote:
> > Interconnects and interconnect paths quantify their performance levels in
> > terms of bandwidth and not in terms of frequency. So similar to how we have
> > frequency based OPP tables in DT and in the OPP framework, we need
> > bandwidth OPP table support in the OPP framework and in DT. Since there can
> > be more than one interconnect path used by a device, we also need a way to
> > assign a bandwidth OPP table to an interconnect path.
> >
> > This patch series:
> > - Adds opp-peak-KBps and opp-avg-KBps properties to OPP DT bindings
> > - Adds interconnect-opp-table property to interconnect DT bindings
> > - Adds OPP helper functions for bandwidth OPP tables
> > - Adds icc_get_opp_table() to get the OPP table for an interconnect path
> >
> > So with the DT bindings added in this patch series, the DT for a GPU
> > that does bandwidth voting from GPU to Cache and GPU to DDR would look
> > something like this:
> >
> > gpu_cache_opp_table: gpu_cache_opp_table {
> >       compatible = "operating-points-v2";
> >
> >       gpu_cache_3000: opp-3000 {
> >               opp-peak-KBps = <3000>;
> >               opp-avg-KBps = <1000>;
> >       };
> >       gpu_cache_6000: opp-6000 {
> >               opp-peak-KBps = <6000>;
> >               opp-avg-KBps = <2000>;
> >       };
> >       gpu_cache_9000: opp-9000 {
> >               opp-peak-KBps = <9000>;
> >               opp-avg-KBps = <9000>;
> >       };
> > };
> >
> > gpu_ddr_opp_table: gpu_ddr_opp_table {
> >       compatible = "operating-points-v2";
> >
> >       gpu_ddr_1525: opp-1525 {
> >               opp-peak-KBps = <1525>;
> >               opp-avg-KBps = <452>;
> >       };
> >       gpu_ddr_3051: opp-3051 {
> >               opp-peak-KBps = <3051>;
> >               opp-avg-KBps = <915>;
> >       };
> >       gpu_ddr_7500: opp-7500 {
> >               opp-peak-KBps = <7500>;
> >               opp-avg-KBps = <3000>;
> >       };
> > };
>
> Who is going to use the above tables and how ?

In this example the GPU driver would use these. It'll go through these
and then decide what peak and average bw to pick based on whatever
criteria.

> These are the maximum
> BW available over these paths, right ?

I wouldn't call them "maximum" because there can't be multiple
maximums :) But yes, these are the meaningful bandwidth from the GPU's
perspective to use over these paths.

>
> > gpu_opp_table: gpu_opp_table {
> >       compatible = "operating-points-v2";
> >       opp-shared;
> >
> >       opp-200000000 {
> >               opp-hz = /bits/ 64 <200000000>;
> >       };
> >       opp-400000000 {
> >               opp-hz = /bits/ 64 <400000000>;
> >       };
> > };
>
> Shouldn't this link back to the above tables via required-opp, etc ?
> How will we know how much BW is required by the GPU device for all the
> paths ?

If that's what the GPU driver wants to do, then yes. But the GPU
driver could also choose to scale the bandwidth for these paths based
on multiple other signals. Eg: bus port busy percentage, measure
bandwidth, etc.

Or they might even decide to pick the BW OPP that matches the index of
their GPU OPP. It's up to them how they actually do the heuristic.

-Saravana
