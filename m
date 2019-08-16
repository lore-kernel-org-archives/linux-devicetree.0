From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v5 0/3] Introduce Bandwidth OPPs for interconnects
Date: Thu, 15 Aug 2019 18:54:19 -0700
Message-ID: <CAGETcx_pzFj1TSoyCTGgZn_yZGZBMT2c_d74wLA5gBqhmhH8Gw@mail.gmail.com>
References: <20190807223111.230846-1-saravanak@google.com> <b8a6020f-eda5-0c3d-b365-a294c28b9650@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b8a6020f-eda5-0c3d-b365-a294c28b9650@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vincent Guittot <vincent.guittot@linaro.org>, "Sweeney, Sean" <seansw@qti.qualcomm.com>, David Dai <daidavid1@codeaurora.org>, adharmap@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Evan Green <evgreen@chromium.org>, Android Kernel Team <kernel-team@android.com>, Linux PM <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 9:19 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> Hi,
>
> On 8/8/19 01:31, Saravana Kannan wrote:
> > Interconnects and interconnect paths quantify their performance levels in
> > terms of bandwidth and not in terms of frequency. So similar to how we have
> > frequency based OPP tables in DT and in the OPP framework, we need
> > bandwidth OPP table support in DT and in the OPP framework.
> >
> > So with the DT bindings added in this patch series, the DT for a GPU
> > that does bandwidth voting from GPU to Cache and GPU to DDR would look
> > something like this:
> >
> > gpu_cache_opp_table: gpu_cache_opp_table {
> >       compatible = "operating-points-v2";
> >
> >       gpu_cache_3000: opp-3000 {
> >               opp-peak-KBps = <3000000>;
> >               opp-avg-KBps = <1000000>;
> >       };
> >       gpu_cache_6000: opp-6000 {
> >               opp-peak-KBps = <6000000>;
> >               opp-avg-KBps = <2000000>;
> >       };
> >       gpu_cache_9000: opp-9000 {
> >               opp-peak-KBps = <9000000>;
> >               opp-avg-KBps = <9000000>;
> >       };
> > };
> >
> > gpu_ddr_opp_table: gpu_ddr_opp_table {
> >       compatible = "operating-points-v2";
> >
> >       gpu_ddr_1525: opp-1525 {
> >               opp-peak-KBps = <1525000>;
> >               opp-avg-KBps = <452000>;
> >       };
> >       gpu_ddr_3051: opp-3051 {
> >               opp-peak-KBps = <3051000>;
> >               opp-avg-KBps = <915000>;
> >       };
> >       gpu_ddr_7500: opp-7500 {
> >               opp-peak-KBps = <7500000>;
> >               opp-avg-KBps = <3000000>;
> >       };
> > };
> >
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
> >
> > gpu@7864000 {
> >       ...
> >       operating-points-v2 = <&gpu_opp_table>, <&gpu_cache_opp_table>, <&gpu_ddr_opp_table>;
> >       ...
> > };
> >
> > v1 -> v3:
> > - Lots of patch additions that were later dropped
> > v3 -> v4:
> > - Fixed typo bugs pointed out by Sibi.
> > - Fixed bug that incorrectly reset rate to 0 all the time
> > - Added units documentation
> > - Dropped interconnect-opp-table property and related changes
> > v4->v5:
> > - Replaced KBps with kBps
> > - Minor documentation fix
> >
> > Cheers,
> > Saravana
> >
> > Saravana Kannan (3):
> >   dt-bindings: opp: Introduce opp-peak-kBps and opp-avg-kBps bindings
> >   OPP: Add support for bandwidth OPP tables
> >   OPP: Add helper function for bandwidth OPP tables
> >
> >  Documentation/devicetree/bindings/opp/opp.txt | 15 ++++--
> >  .../devicetree/bindings/property-units.txt    |  4 ++
> >  drivers/opp/core.c                            | 51 +++++++++++++++++++
> >  drivers/opp/of.c                              | 41 +++++++++++----
> >  drivers/opp/opp.h                             |  4 +-
> >  include/linux/pm_opp.h                        | 19 +++++++
> >  6 files changed, 121 insertions(+), 13 deletions(-)
> >
>
> For the series:
> Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

Thanks Georgi.

Rob and Viresh, We've settled on one format. Can you pull this series in please?

Do you need me to resent the series with the Ack? Or can you put that
in if you pull in this series?

Thanks,
Saravana
