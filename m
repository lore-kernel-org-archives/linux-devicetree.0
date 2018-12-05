From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v2 08/34] dt-bindings: arm: Convert PMU binding to
 json-schema
Date: Wed, 5 Dec 2018 10:08:59 +0000
Message-ID: <20181205100858.GA14619@arm.com>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-9-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203213223.16986-9-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Dec 03, 2018 at 03:31:57PM -0600, Rob Herring wrote:
> Convert ARM PMU binding to DT schema format using json-schema.

Just a couple of things below.

> diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
> new file mode 100644
> index 000000000000..3ea4abfbf276
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/pmu.yaml
> @@ -0,0 +1,91 @@

[...]

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apm,potenza-pmu
> +              - arm,armv8-pmuv3
> +              - arm,cortex-a73-pmu
> +              - arm,cortex-a72-pmu
> +              - arm,cortex-a57-pmu
> +              - arm,cortex-a53-pmu
> +              - arm,cortex-a35-pmu
> +              - arm,cortex-a17-pmu
> +              - arm,cortex-a15-pmu
> +              - arm,cortex-a12-pmu
> +              - arm,cortex-a9-pmu
> +              - arm,cortex-a8-pmu
> +              - arm,cortex-a7-pmu
> +              - arm,cortex-a5-pmu
> +              - arm,arm11mpcore-pmu
> +              - arm,arm1176-pmu
> +              - arm,arm1136-pmu
> +              - brcm,vulcan-pmu
> +              - cavium,thunder-pmu
> +              - qcom,scorpion-pmu
> +              - qcom,scorpion-mp-pmu
> +              - qcom,krait-pmu
> +      - items:
> +          - const: arm,cortex-a7-pmu
> +          - const: arm,cortex-a15-pmu

What do these last two mean?

> +
> +  interrupts:
> +    # Don't know how many CPUs, so no constraints to specify
> +    description: 1 per-cpu interrupt (PPI) or 1 interrupt per core.
> +
> +  interrupt-affinity:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      When using SPIs, specifies a list of phandles to CPU
> +      nodes corresponding directly to the affinity of
> +      the SPIs listed in the interrupts property.
> +
> +      When using a PPI, specifies a list of phandles to CPU
> +      nodes corresponding to the set of CPUs which have
> +      a PMU of this type signalling the PPI listed in the
> +      interrupts property, unless this is already specified
> +      by the PPI interrupt specifier itself (in which case
> +      the interrupt-affinity property shouldn't be present).
> +
> +      This property should be present when there is more than
> +      a single SPI.
> +
> +  qcom,no-pc-write:
> +    type: boolean
> +    description:
> +      Indicates that this PMU doesn't support the 0xc and 0xd events.
> +
> +  secure-reg-access:
> +    type: boolean
> +    description:
> +      Indicates that the ARMv7 Secure Debug Enable Register
> +      (SDER) is accessible. This will cause the driver to do
> +      any setup required that is only possible in ARMv7 secure
> +      state. If not present the ARMv7 SDER will not be touched,
> +      which means the PMU may fail to operate unless external
> +      code (bootloader or security monitor) has performed the
> +      appropriate initialisation. Note that this property is
> +      not valid for non-ARMv7 CPUs or ARMv7 CPUs booting Linux
> +      in Non-secure state.
> +
> +required:
> +  - compatible

I probably said this before, but I do think that it's a shame to lose the
example binding, especially for something like the PMU where you can
pretty much take an example and bang in your own IRQ numbers to get it
up and running.

Will
