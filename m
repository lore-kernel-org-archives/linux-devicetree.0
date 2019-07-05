From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [RFC PATCH 6/9] dt-bindings: opp: Add qcom-opp bindings with
 properties needed for CPR
Date: Fri, 5 Jul 2019 12:56:01 +0200
Message-ID: <20190705105601.GA22327@centauri>
References: <20190404050931.9812-1-niklas.cassel@linaro.org>
 <20190404050931.9812-7-niklas.cassel@linaro.org>
 <20190409092352.joayvxyo77e6lehl@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190409092352.joayvxyo77e6lehl@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 09, 2019 at 02:53:52PM +0530, Viresh Kumar wrote:
> On 04-04-19, 07:09, Niklas Cassel wrote:
> > Add qcom-opp bindings with properties needed for Core Power Reduction (CPR).
> > 
> > CPR is included in a great variety of Qualcomm SoC, e.g. msm8916 and msm8996,
> > and was first introduced in msm8974.
> > 
> > Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > ---
> >  .../devicetree/bindings/opp/qcom-opp.txt      | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/opp/qcom-opp.txt b/Documentation/devicetree/bindings/opp/qcom-opp.txt
> > new file mode 100644
> > index 000000000000..d24280467db7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/opp/qcom-opp.txt
> > @@ -0,0 +1,24 @@
> > +Qualcomm OPP bindings to describe OPP nodes
> > +
> > +The bindings are based on top of the operating-points-v2 bindings
> > +described in Documentation/devicetree/bindings/opp/opp.txt
> > +Additional properties are described below.
> > +
> > +* OPP Table Node
> > +
> > +Required properties:
> > +- compatible: Allow OPPs to express their compatibility. It should be:
> > +  "operating-points-v2-qcom-level"
> > +
> > +* OPP Node
> > +
> > +Optional properties:
> > +- opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. Even
> > +  though a power domain doesn't need a opp-hz, there can be devices in the
> > +  power domain that need to know the highest supported frequency for each
> > +  corner/level (e.g. CPR), in order to properly initialize the hardware.
> > +
> > +- qcom,opp-fuse-level: A positive value representing the fuse corner/level
> > +  associated with this OPP node. Sometimes several corners/levels shares
> > +  a certain fuse corner/level. A fuse corner/level contains e.g. ref uV,
> > +  min uV, and max uV.
> 
> I know we discussed this sometime back and so you implemented it this way.
> 
> Looking at the implementation of the CPR driver, I now wonder if that was a good
> choice. Technically a single domain can manage many devices, a big and a little
> CPU for example and then we will have different highest frequencies for both of
> them. How will we configure the CPR hardware in such a case ? Isn't the
> programming per-device ?

Hello Viresh,

I just posted this RFC as a real patch series:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=142447

Note that I disregarded your review comment above, because
this patch series only adds support for CPRv2, which is used
in e.g. msm8916 and qcs404.
There does not exist any QCOM SoC with CPRv2 for big little.

For big little, there is CPRv3, which is very different from CPRv2.
CPRv3 will require new and more complex DT bindings.

Right now we don't even have plans to upstream a driver for CPRv3.
Part of the reason is that CPR, for newer QCOM SoCs like sdm845,
is now performed automatically by the Operating State Manager (OSM),
for which we already have a kernel driver: drivers/cpufreq/qcom-cpufreq-hw.c


Kind regards,
Niklas
