From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 08/34] dt-bindings: arm: Convert PMU binding to json-schema
Date: Wed, 5 Dec 2018 09:42:04 -0600
Message-ID: <CAL_Jsq+YsVB8Ew=cb5W54eirMpAAOR7ApahCbHOtp2m3wpJYSg@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-9-robh@kernel.org>
 <20181205100858.GA14619@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205100858.GA14619@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 4:08 AM Will Deacon <will.deacon@arm.com> wrote:
>
> Hi Rob,
>
> On Mon, Dec 03, 2018 at 03:31:57PM -0600, Rob Herring wrote:
> > Convert ARM PMU binding to DT schema format using json-schema.
>
> Just a couple of things below.
>
> > diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
> > new file mode 100644
> > index 000000000000..3ea4abfbf276
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/pmu.yaml
> > @@ -0,0 +1,91 @@
>
> [...]
>
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - apm,potenza-pmu
> > +              - arm,armv8-pmuv3
> > +              - arm,cortex-a73-pmu
> > +              - arm,cortex-a72-pmu
> > +              - arm,cortex-a57-pmu
> > +              - arm,cortex-a53-pmu
> > +              - arm,cortex-a35-pmu
> > +              - arm,cortex-a17-pmu
> > +              - arm,cortex-a15-pmu
> > +              - arm,cortex-a12-pmu
> > +              - arm,cortex-a9-pmu
> > +              - arm,cortex-a8-pmu
> > +              - arm,cortex-a7-pmu
> > +              - arm,cortex-a5-pmu
> > +              - arm,arm11mpcore-pmu
> > +              - arm,arm1176-pmu
> > +              - arm,arm1136-pmu
> > +              - brcm,vulcan-pmu
> > +              - cavium,thunder-pmu
> > +              - qcom,scorpion-pmu
> > +              - qcom,scorpion-mp-pmu
> > +              - qcom,krait-pmu
> > +      - items:
> > +          - const: arm,cortex-a7-pmu
> > +          - const: arm,cortex-a15-pmu
>
> What do these last two mean?

The first list only allows a single compatible string. This list says
there are 2 and that the compatible property should be:
compatible = "arm,cortex-a7-pmu", "arm,cortex-a15-pmu";

Which shows up here:
arch/arm/boot/dts/sun6i-a31.dtsi:               compatible =
"arm,cortex-a7-pmu", "arm,cortex-a15-pmu";
arch/arm/boot/dts/sun7i-a20.dtsi:               compatible =
"arm,cortex-a7-pmu", "arm,cortex-a15-pmu";

Maybe the dts is wrong and should be fixed?

> > +  interrupts:
> > +    # Don't know how many CPUs, so no constraints to specify
> > +    description: 1 per-cpu interrupt (PPI) or 1 interrupt per core.
> > +
> > +  interrupt-affinity:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      When using SPIs, specifies a list of phandles to CPU
> > +      nodes corresponding directly to the affinity of
> > +      the SPIs listed in the interrupts property.
> > +
> > +      When using a PPI, specifies a list of phandles to CPU
> > +      nodes corresponding to the set of CPUs which have
> > +      a PMU of this type signalling the PPI listed in the
> > +      interrupts property, unless this is already specified
> > +      by the PPI interrupt specifier itself (in which case
> > +      the interrupt-affinity property shouldn't be present).
> > +
> > +      This property should be present when there is more than
> > +      a single SPI.
> > +
> > +  qcom,no-pc-write:
> > +    type: boolean
> > +    description:
> > +      Indicates that this PMU doesn't support the 0xc and 0xd events.
> > +
> > +  secure-reg-access:
> > +    type: boolean
> > +    description:
> > +      Indicates that the ARMv7 Secure Debug Enable Register
> > +      (SDER) is accessible. This will cause the driver to do
> > +      any setup required that is only possible in ARMv7 secure
> > +      state. If not present the ARMv7 SDER will not be touched,
> > +      which means the PMU may fail to operate unless external
> > +      code (bootloader or security monitor) has performed the
> > +      appropriate initialisation. Note that this property is
> > +      not valid for non-ARMv7 CPUs or ARMv7 CPUs booting Linux
> > +      in Non-secure state.
> > +
> > +required:
> > +  - compatible
>
> I probably said this before, but I do think that it's a shame to lose the
> example binding, especially for something like the PMU where you can
> pretty much take an example and bang in your own IRQ numbers to get it
> up and running.

I just thought it is so trivial that it didn't add much. I think most
folks would copy-n-paste from an actual dts file which has all the
other nodes you just need to update addresses and irq nums.

Rob
