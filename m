From: Quentin Perret <quentin.perret@linaro.org>
Subject: Re: [PATCH V4 2/2] base/drivers/arch_topology: Default dmips-mhz if
 they are not set in DT
Date: Tue, 27 Nov 2018 09:09:40 +0000
Message-ID: <20181127090940.feegcsxmyxdzbk27@queper01-ThinkPad-T460s>
References: <1543234847-21611-1-git-send-email-daniel.lezcano@linaro.org>
 <1543234847-21611-2-git-send-email-daniel.lezcano@linaro.org>
 <20181127035735.keqirmzjfbw4cq64@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181127035735.keqirmzjfbw4cq64@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, Chris Redpath <chris.redpath@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Li Yang <leoyang.li@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 27 Nov 2018 at 09:27:35 (+0530), Viresh Kumar wrote:
> On 26-11-18, 13:20, Daniel Lezcano wrote:
> > diff --git a/Documentation/devicetree/bindings/arm/cpu-capacity.txt b/Documentation/devicetree/bindings/arm/cpu-capacity.txt
> > index 84262cd..f53a3c9 100644
> > --- a/Documentation/devicetree/bindings/arm/cpu-capacity.txt
> > +++ b/Documentation/devicetree/bindings/arm/cpu-capacity.txt
> > @@ -54,6 +54,12 @@ fall back to the default capacity value for every CPU. If cpufreq is not
> >  available, final capacities are calculated by directly using capacity-dmips-
> >  mhz values (normalized w.r.t. the highest value found while parsing the DT).
> >  
> > +If capacity-dmips-mhz is not specified or if the parsing fails, the
> > +default capacity value will be computed against the highest frequency.
> > +When all CPUs have the same OPP, they will have the same capacity
> > +value otherwise the capacity will be scaled down for CPUs having lower
> > +frequencies.
> 
> I know you added this based on Quentin's feedback, but I wonder if this is
> really required and if it is improving anything at all. This is what the
> documentation says currently without this patch:
> 
> "
> capacity-dmips-mhz is an optional cpu node [1] property: u32 value
> representing CPU capacity expressed in normalized DMIPS/MHz. At boot time, the
> maximum frequency available to the cpu is then used to calculate the capacity
> value internally used by the kernel.
> 
> capacity-dmips-mhz property is all-or-nothing: if it is specified for a cpu
> node, it has to be specified for every other cpu nodes, or the system will
> fall back to the default capacity value for every CPU. If cpufreq is not
> available, final capacities are calculated by directly using capacity-dmips-
> mhz values (normalized w.r.t. the highest value found while parsing the DT).
> "
> 
> So it already clearly says two things:
> - If all CPUs don't have this property, we fallback to default capacity for
>   every CPU.

Which is not what we do with this patch any more. We fallback to
scaling with frequency. So I do think the doc needs updating one way or
another. You could define more clearly what "default capacity" means if
you want and say that is scaled with frequency, that'd be fine by me.

Thanks,
Quentin
