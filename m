From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iommu: Convert Arm SMMUv3 to DT schema
Date: Fri, 20 Sep 2019 09:40:06 -0500
Message-ID: <CAL_JsqJCZDb_C-fHm6KfDQAZ=Gek8pbJfBHMv=6xaf74-h9aYA@mail.gmail.com>
References: <20190920134829.16432-1-robh@kernel.org> <20190920134829.16432-2-robh@kernel.org>
 <8e9f4a42-defa-8dfe-2547-174395ef8b5d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e9f4a42-defa-8dfe-2547-174395ef8b5d@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Linux IOMMU <iommu@lists.linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2019 at 9:17 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 20/09/2019 14:48, Rob Herring wrote:
> > Convert the Arm SMMv3 binding to the DT schema format.
> >
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Robin Murphy <Robin.Murphy@arm.com>
> > Cc: iommu@lists.linux-foundation.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >   .../devicetree/bindings/iommu/arm,smmu-v3.txt |  77 -------------
> >   .../bindings/iommu/arm,smmu-v3.yaml           | 103 ++++++++++++++++++
> >   2 files changed, 103 insertions(+), 77 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/iommu/arm,smmu-v3.txt
> >   create mode 100644 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> > new file mode 100644
> > index 000000000000..1c97bcfbf82b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> > @@ -0,0 +1,103 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM SMMUv3 Architecture Implementation
> > +
> > +maintainers:
> > +  - Will Deacon <will@kernel.org>
> > +  - Robin Murphy <Robin.Murphy@arm.com>
> > +
> > +description: |+
> > +  The SMMUv3 architecture is a significant departure from previous
> > +  revisions, replacing the MMIO register interface with in-memory command
> > +  and event queues and adding support for the ATS and PRI components of
> > +  the PCIe specification.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^iommu@[0-9a-f]*"
> > +  compatible:
> > +    const: arm,smmu-v3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  interrupt-names:
> > +    oneOf:
> > +      - const: combined
> > +        description:
> > +          The combined interrupt is optional, and should only be provided if the
> > +          hardware supports just a single, combined interrupt line.
> > +          If provided, then the combined interrupt will be used in preference to
> > +          any others.
> > +      - items:
> > +          - const: eventq     # Event Queue not empty
> > +          - const: priq       # PRI Queue not empty
> > +          - const: cmdq-sync  # CMD_SYNC complete
> > +          - const: gerror     # Global Error activated
> > +      - items:
> > +          - const: eventq
> > +          - const: gerror
> > +          - const: priq
> > +      - items:
> > +          - const: eventq
> > +          - const: gerror
> > +      - items:
> > +          - const: eventq
> > +          - const: priq
>
> This looks a bit off - in the absence of MSIs, at least "gerror" and
> "eventq" should be mandatory; "cmdq-sync" should probably also be from a
> binding perspective, but Linux doesn't care about it. PRI is an optional
> feature of the architecture, so that IRQ should always be optional. If
> we do have MSIs, then technically the implementation is allowed to not
> support wired IRQs at all, although in practice is likely to have at
> least "gerror" to signal the double-fault condition of a GERROR MSI
> write aborting.

Well, now I'm not sure where I came up with the last case, it can be
dropped. These are the cases we have:

arch/arm64/boot/dts/arm/fvp-base-revc.dts:
interrupt-names = "eventq", "priq", "cmdq-sync", "gerror";
arch/arm64/boot/dts/hisilicon/hip07.dtsi:
interrupt-names = "eventq", "gerror", "priq";
arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:
interrupt-names = "eventq", "gerror";

I'm fine if we leave warnings and expect dts files to be fixed.

In an ideal world we'd have this with optional irq on the end:

      - minItems: 3
        maxItems: 4
        items:
          - const: eventq     # Event Queue not empty
          - const: cmdq-sync  # CMD_SYNC complete
          - const: gerror     # Global Error activated
          - const: priq       # PRI Queue not empty


A less invasive approach would be:

      - items:
          - const: eventq     # Event Queue not empty
          - const: priq       # PRI Queue not empty
          - const: cmdq-sync  # CMD_SYNC complete
          - const: gerror     # Global Error activated
      - minItems: 2
        maxItems: 4
        items:
          - const: eventq
          - const: gerror
          - const: priq
          - const: cmdq-sync

Rob
