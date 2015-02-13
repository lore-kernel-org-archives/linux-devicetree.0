From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: Add L2 cache topology to ARM Ltd boards/models
Date: Fri, 13 Feb 2015 02:52:51 +0000
Message-ID: <20150213025251.GA14864@e102568-lin.cambridge.arm.com>
References: <1421841750-26722-1-git-send-email-sudeep.holla@arm.com>
 <20150121164632.GK5044@leverpostej>
 <20150212140702.GF1522@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150212140702.GF1522@leverpostej>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "ksankaran-qTEPVZfXA3Y@public.gmane.org" <ksankaran-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, "suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org" <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Thomas Lendacky <Thomas.Lendacky-5C7GfCeVMHo@public.gmane.org>, Joel Schopp <Joel.Schopp-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Thu, Feb 12, 2015 at 02:07:02PM +0000, Mark Rutland wrote:
> Hi,
> 
> On Wed, Jan 21, 2015 at 04:46:32PM +0000, Mark Rutland wrote:
> > On Wed, Jan 21, 2015 at 12:02:30PM +0000, Sudeep Holla wrote:
> > > Commit 5d425c18653731af6 ("arm64: kernel: add support for cpu cache
> > > information") adds cacheinfo support for ARM64. Since there's no
> > > architectural way of detecting the cpus that share particular cache,
> > > device tree can be used and the core cacheinfo already supports the
> > > same.
> > 
> > This still leaves the possibility that misleading information is exposed
> > for systems from other vendors. I've made a quick attempt to Cc the
> > authors of other arm64 dts here.
> > 
> > Given that in the absence of these nodes we can't derive a complete view
> > of the cache hierarchy, shouldn't we only expose the cacheinfo when we
> > have these nodes and can therefore produce correct values?
> 
> I'm still rather concerned about exposing misleading cache info in this
> manner. Is there no way we can limit the exposure of this information to
> those cases where we actually have the information?

The shared cache(s) cpu map information (DT) is retrieved in core code, your
concern is valid but should be addressed in a way that does not break
other archs (eg totally removing cache info if missing DT cache nodes).

> Do we know if/how this will work for ACPI systems?

Yes, there will be bindings, as for the how, that's not publicly
available information.

Thanks,
Lorenzo

> 
> Thanks,
> Mark.
> 
> > I can imagine that future dts are likely to appear without these nodes,
> > and I imagine that we won't spot all of those cases. We also have
> > existing DTBs to take into account.
> > 
> > Thanks,
> > Mark.
> > 
> > > 
> > > This patch adds the L2 cache topology on Juno board, FVP/RTSM and
> > > foundation models.
> > > 
> > > Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> > > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > > Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > > ---
> > >  arch/arm64/boot/dts/arm/foundation-v8.dts  |  8 ++++++++
> > >  arch/arm64/boot/dts/arm/juno.dts           | 14 ++++++++++++++
> > >  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts |  8 ++++++++
> > >  3 files changed, 30 insertions(+)
> > > 
> > > Hi Arnd/Olof,
> > > 
> > > Though this patch and commit 5d425c18653731af6 ("arm64: kernel: add
> > > support for cpu cache information") which is in -next(via arm64) are
> > > dependent to provide desired functionality, then can go indepedently
> > > if you think there could be conflicts if this change is taken via arm64.
> > > If not, Catalin can pick up with your acks after the review.
> > > 
> > > Regards,
> > > Sudeep
> > > 
> > > diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64/boot/dts/arm/foundation-v8.dts
> > > index 27f32962e55c..4eac8dcea423 100644
> > > --- a/arch/arm64/boot/dts/arm/foundation-v8.dts
> > > +++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
> > > @@ -34,6 +34,7 @@
> > >  			reg = <0x0 0x0>;
> > >  			enable-method = "spin-table";
> > >  			cpu-release-addr = <0x0 0x8000fff8>;
> > > +			next-level-cache = <&L2_0>;
> > >  		};
> > >  		cpu@1 {
> > >  			device_type = "cpu";
> > > @@ -41,6 +42,7 @@
> > >  			reg = <0x0 0x1>;
> > >  			enable-method = "spin-table";
> > >  			cpu-release-addr = <0x0 0x8000fff8>;
> > > +			next-level-cache = <&L2_0>;
> > >  		};
> > >  		cpu@2 {
> > >  			device_type = "cpu";
> > > @@ -48,6 +50,7 @@
> > >  			reg = <0x0 0x2>;
> > >  			enable-method = "spin-table";
> > >  			cpu-release-addr = <0x0 0x8000fff8>;
> > > +			next-level-cache = <&L2_0>;
> > >  		};
> > >  		cpu@3 {
> > >  			device_type = "cpu";
> > > @@ -55,6 +58,11 @@
> > >  			reg = <0x0 0x3>;
> > >  			enable-method = "spin-table";
> > >  			cpu-release-addr = <0x0 0x8000fff8>;
> > > +			next-level-cache = <&L2_0>;
> > > +		};
> > > +
> > > +		L2_0: l2-cache0 {
> > > +			compatible = "cache";
> > >  		};
> > >  	};
> > >  
> > > diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
> > > index cb3073e4e7a8..15dafbb24426 100644
> > > --- a/arch/arm64/boot/dts/arm/juno.dts
> > > +++ b/arch/arm64/boot/dts/arm/juno.dts
> > > @@ -39,6 +39,7 @@
> > >  			reg = <0x0 0x0>;
> > >  			device_type = "cpu";
> > >  			enable-method = "psci";
> > > +			next-level-cache = <&A57_L2>;
> > >  		};
> > >  
> > >  		A57_1: cpu@1 {
> > > @@ -46,6 +47,7 @@
> > >  			reg = <0x0 0x1>;
> > >  			device_type = "cpu";
> > >  			enable-method = "psci";
> > > +			next-level-cache = <&A57_L2>;
> > >  		};
> > >  
> > >  		A53_0: cpu@100 {
> > > @@ -53,6 +55,7 @@
> > >  			reg = <0x0 0x100>;
> > >  			device_type = "cpu";
> > >  			enable-method = "psci";
> > > +			next-level-cache = <&A53_L2>;
> > >  		};
> > >  
> > >  		A53_1: cpu@101 {
> > > @@ -60,6 +63,7 @@
> > >  			reg = <0x0 0x101>;
> > >  			device_type = "cpu";
> > >  			enable-method = "psci";
> > > +			next-level-cache = <&A53_L2>;
> > >  		};
> > >  
> > >  		A53_2: cpu@102 {
> > > @@ -67,6 +71,7 @@
> > >  			reg = <0x0 0x102>;
> > >  			device_type = "cpu";
> > >  			enable-method = "psci";
> > > +			next-level-cache = <&A53_L2>;
> > >  		};
> > >  
> > >  		A53_3: cpu@103 {
> > > @@ -74,6 +79,15 @@
> > >  			reg = <0x0 0x103>;
> > >  			device_type = "cpu";
> > >  			enable-method = "psci";
> > > +			next-level-cache = <&A53_L2>;
> > > +		};
> > > +
> > > +		A57_L2: l2-cache0 {
> > > +			compatible = "cache";
> > > +		};
> > > +
> > > +		A53_L2: l2-cache1 {
> > > +			compatible = "cache";
> > >  		};
> > >  	};
> > >  
> > > diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> > > index efc59b3baf63..20addabbd127 100644
> > > --- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> > > +++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> > > @@ -37,6 +37,7 @@
> > >  			reg = <0x0 0x0>;
> > >  			enable-method = "spin-table";
> > >  			cpu-release-addr = <0x0 0x8000fff8>;
> > > +			next-level-cache = <&L2_0>;
> > >  		};
> > >  		cpu@1 {
> > >  			device_type = "cpu";
> > > @@ -44,6 +45,7 @@
> > >  			reg = <0x0 0x1>;
> > >  			enable-method = "spin-table";
> > >  			cpu-release-addr = <0x0 0x8000fff8>;
> > > +			next-level-cache = <&L2_0>;
> > >  		};
> > >  		cpu@2 {
> > >  			device_type = "cpu";
> > > @@ -51,6 +53,7 @@
> > >  			reg = <0x0 0x2>;
> > >  			enable-method = "spin-table";
> > >  			cpu-release-addr = <0x0 0x8000fff8>;
> > > +			next-level-cache = <&L2_0>;
> > >  		};
> > >  		cpu@3 {
> > >  			device_type = "cpu";
> > > @@ -58,6 +61,11 @@
> > >  			reg = <0x0 0x3>;
> > >  			enable-method = "spin-table";
> > >  			cpu-release-addr = <0x0 0x8000fff8>;
> > > +			next-level-cache = <&L2_0>;
> > > +		};
> > > +
> > > +		L2_0: l2-cache0 {
> > > +			compatible = "cache";
> > >  		};
> > >  	};
> > >  
> > > -- 
> > > 1.9.1
> > > 
> > > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
