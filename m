From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v2 08/34] dt-bindings: arm: Convert PMU binding to
 json-schema
Date: Thu, 6 Dec 2018 14:37:23 +0000
Message-ID: <20181206143722.GA14887@arm.com>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-9-robh@kernel.org>
 <20181205100858.GA14619@arm.com>
 <CAL_Jsq+YsVB8Ew=cb5W54eirMpAAOR7ApahCbHOtp2m3wpJYSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+YsVB8Ew=cb5W54eirMpAAOR7ApahCbHOtp2m3wpJYSg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 05, 2018 at 09:42:04AM -0600, Rob Herring wrote:
> On Wed, Dec 5, 2018 at 4:08 AM Will Deacon <will.deacon@arm.com> wrote:
> > On Mon, Dec 03, 2018 at 03:31:57PM -0600, Rob Herring wrote:
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - apm,potenza-pmu
> > > +              - arm,armv8-pmuv3
> > > +              - arm,cortex-a73-pmu
> > > +              - arm,cortex-a72-pmu
> > > +              - arm,cortex-a57-pmu
> > > +              - arm,cortex-a53-pmu
> > > +              - arm,cortex-a35-pmu
> > > +              - arm,cortex-a17-pmu
> > > +              - arm,cortex-a15-pmu
> > > +              - arm,cortex-a12-pmu
> > > +              - arm,cortex-a9-pmu
> > > +              - arm,cortex-a8-pmu
> > > +              - arm,cortex-a7-pmu
> > > +              - arm,cortex-a5-pmu
> > > +              - arm,arm11mpcore-pmu
> > > +              - arm,arm1176-pmu
> > > +              - arm,arm1136-pmu
> > > +              - brcm,vulcan-pmu
> > > +              - cavium,thunder-pmu
> > > +              - qcom,scorpion-pmu
> > > +              - qcom,scorpion-mp-pmu
> > > +              - qcom,krait-pmu
> > > +      - items:
> > > +          - const: arm,cortex-a7-pmu
> > > +          - const: arm,cortex-a15-pmu
> >
> > What do these last two mean?
> 
> The first list only allows a single compatible string. This list says
> there are 2 and that the compatible property should be:
> compatible = "arm,cortex-a7-pmu", "arm,cortex-a15-pmu";
> 
> Which shows up here:
> arch/arm/boot/dts/sun6i-a31.dtsi:               compatible =
> "arm,cortex-a7-pmu", "arm,cortex-a15-pmu";
> arch/arm/boot/dts/sun7i-a20.dtsi:               compatible =
> "arm,cortex-a7-pmu", "arm,cortex-a15-pmu";
> 
> Maybe the dts is wrong and should be fixed?

Yes, that's wrong and you could end up with the kernel exposing the wrong
events to userspace. So I think we can fix the .dts and leave the binding
without this.

> > > +required:
> > > +  - compatible
> >
> > I probably said this before, but I do think that it's a shame to lose the
> > example binding, especially for something like the PMU where you can
> > pretty much take an example and bang in your own IRQ numbers to get it
> > up and running.
> 
> I just thought it is so trivial that it didn't add much. I think most
> folks would copy-n-paste from an actual dts file which has all the
> other nodes you just need to update addresses and irq nums.

True... even more of a reason to fix thise sun* .dts files then!

Will
