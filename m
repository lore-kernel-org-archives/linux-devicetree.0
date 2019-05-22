From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add CPU topology
Date: Tue, 21 May 2019 21:03:53 -0700
Message-ID: <20190522040353.GP3137@builder>
References: <20190114184255.258318-1-mka@chromium.org>
 <CAHLCerP+F9AP97+qVCMqwu-OMJXRhwZrXd33Wk-vj5eyyw-KyA@mail.gmail.com>
 <CAHLCerPZ0Y-rkeMa_7BJWtR4g5af2vwfPY9FgOuvpUTJG3rf7g@mail.gmail.com>
 <155786856719.14659.2902538189660269078@swboyd.mtv.corp.google.com>
 <CAHLCerP69Jw27VyO+ek4Fe3-2fDiOejtz6XZPykPSRA2G1831w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHLCerP69Jw27VyO+ek4Fe3-2fDiOejtz6XZPykPSRA2G1831w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu 16 May 04:54 PDT 2019, Amit Kucheria wrote:

> (cc'ing Andy's correct email address)
> 
> On Wed, May 15, 2019 at 2:46 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Amit Kucheria (2019-05-13 04:54:12)
> > > On Mon, May 13, 2019 at 4:31 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> > > >
> > > > On Tue, Jan 15, 2019 at 12:13 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > >
> > > > > The 8 CPU cores of the SDM845 are organized in two clusters of 4 big
> > > > > ("gold") and 4 little ("silver") cores. Add a cpu-map node to the DT
> > > > > that describes this topology.
> > > >
> > > > This is partly true. There are two groups of gold and silver cores,
> > > > but AFAICT they are in a single cluster, not two separate ones. SDM845
> > > > is one of the early examples of ARM's Dynamiq architecture.
> > > >
> > > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > >
> > > > I noticed that this patch sneaked through for this merge window but
> > > > perhaps we can whip up a quick fix for -rc2?
> > > >
> > >
> > > And please find attached a patch to fix this up. Andy, since this
> > > hasn't landed yet (can we still squash this into the original patch?),
> > > I couldn't add a Fixes tag.
> > >
> >
> > I had the same concern. Thanks for catching this. I suspect this must
> > cause some problem for IPA given that it can't discern between the big
> > and little "power clusters"?
> 
> Both EAS and IPA, I believe. It influences the scheduler's view of the
> the topology.
> 
> > Either way,
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Thanks.
> 
> Andy/Bjorn, can we squeeze this in for -rc2 as a bugfix?
> 

Yes, I've picked this up among a few other fixes.

Regards,
Bjorn
