From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2 3/3] Documentation: dt-bindings: add example DT
 binding document
Date: Sat, 24 Oct 2015 11:59:53 -0500
Message-ID: <562BB909.8070200@kernel.org>
References: <1442894358-15606-1-git-send-email-mporter@konsulko.com>
 <1442894358-15606-4-git-send-email-mporter@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442894358-15606-4-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/21/2015 10:59 PM, Matt Porter wrote:
> Add a skeleton DT binding document that serves as the canonical
> example for implementing YAML-based DT bindings documentation.
> The skeleton binding illustrates use of all fields and variations
> described in the dt-binding-format.txt documentation.
> 
> Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/skeleton.yaml | 138 ++++++++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/skeleton.yaml
> 
> diff --git a/Documentation/devicetree/bindings/skeleton.yaml b/Documentation/devicetree/bindings/skeleton.yaml
> new file mode 100644
> index 0000000..d7a27cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/skeleton.yaml
> @@ -0,0 +1,138 @@
> +%YAML 1.2
> +---
> +version: 1
> +
> +id: skel-device
> +
> +title: Skeleton Device
> +
> +maintainer:
> +    -   name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Do we need more than just name and more than 1 maintainer? With both
we'd need to figure out the grouping.

> +
> +description: >
> +    The Skeleton Device binding represents the SK11 device produced by
> +    the Skeleton Corporation. The binding can also support compatible
> +    clones made by second source vendors.
> +
> +# This binding inherits property characteristics from the generic
> +# spi-slave binding
> +
> +inherits:
> +    -   id: spi-slave

I would drop "id" here and inherits is just an array of values.

> +
> +properties:
> +
> +# The compatible property is a reserved name. The type is always "string"
> +# and should not be repeated device binding.

I think we should just always be explicit with type.

> +
> +    -   name: "compatible"
> +        constraint: |
> +            "skel,sk11" || "faux,fx11" , BASE("skel,sk11")
> +        description: FX11 is a clone of the original SK11 device
> +
> +# The reg property is a reserved name. The type is always "int" and
> +# should not be repeated in a device binding. Constraints are defined
> +# only in the context of the parent node's address, size, and ranges
> +# cells. The description is inherited from the spi-slave binding.

Is this a general statement or specific to spi-slave? On I2C devices, we
know the constraints. It may be a single value or a list of strapped values.

> +
> +    -   name: "reg"

We also need to know how many entries and what each entry is. We will
only ever be able to validate the count except cases we have
constraints, but those should only have 1 entry I think. So I would just
add "count" which can be a list of valid counts.


> +
> +# spi-max-frequency needs the device-specific constraint to be supplied
> +
> +    -   name: "spi-max-frequency"
> +        constraint: |
> +            if (compatible == "skel,sk11") c <= 10000000 else c <= 1000000
> +
> +# This property overrides the generic binding description with
> +# a device specific description in order to mention the chip's
> +# h/w cfg strapping pins.
> +
> +    -   name: "spi-cs-high"
> +        description: >
> +            Set if skeleton device configuration pins are set for chip
> +            select polarity high
> +
> +# Device specific properties don't inherit characteristic from a generic
> +# binding so category, type, constraint, and description must be specified
> +# if needed.
> +
> +    -   name: "skel,deprecated1"
> +        category: deprecated
> +        type: int
> +        constraint: |
> +            (c >= 100000) && (c <= 200000)
> +        description: >
> +            First of two deprecated properties.
> +
> +# There are no constraints for properties of empty type
> +
> +    -   name: "skel,deprecated2"
> +        category: deprecated
> +        type: empty
> +        description: >
> +            Second of two deprecated properties.
> +
> +# This example could be auto-generated rather than explicitly included
> +# in the yaml source.
> +
> +example:
> +    -   dts: |
> +            sk11@0 {
> +                compatible = "skel,sk11";
> +                reg = <0>;
> +                spi-max-frequency = <1000000>;
> +                spi-cs-high;
> +            };
> +...
> +
> +---
> +version: 1
> +
> +id: skel-mini
> +
> +title: Skeleton Mini Device
> +
> +maintainer:
> +    -   name: Rogue Developer <rogue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +
> +description: >
> +    The Skeleton Mini Device binding represents the SK47x series devices
> +    produced by the Skeleton Corporation.
> +
> +properties:
> +    -   name: "compatible"
> +        category: required
> +        constraint: |
> +            "skel,sk472" || skel,sk473" || "skel,sk474" , BASE("skel,sk472")
> +        deprecated: "skel,sk47x"
> +        description: >
> +            SK472 is the original part in the family. SK473/4 are later releases
> +            with minor register changes.
> +
> +    -   name: "reg"
> +        category: required
> +        description: Address and size of Skeleton Mini register range.
> +
> +    -   name: "skel,sync-mode"
> +        category: optional
> +        type: empty
> +        description: Enable synchronous transfer mode
> +
> +example:
> +    -   dts: |
> +            sk472@beef0000 {
> +                compatible = "skel,sk472";
> +                reg = <0xbeef0000 0x100>;
> +            };
> +        description: >
> +            Demonstrates an SK472 in normal mode.
> +
> +    -   dts: |
> +            sk474@dead0000 {
> +                compatible = "skel,sk474", "skel,sk472";
> +                reg = <0xdead0000 0x100>;
> +                skel,sync-mode;
> +            };
> +        description: >
> +            Demonstrates an SK474 in synchronous mode.
> +...
> 
