From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] Documentation: dt-bindings: add example DT
 binding document
Date: Fri, 28 Aug 2015 09:53:06 -0500
Message-ID: <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg@mail.gmail.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com> <1440739433-6799-3-git-send-email-mporter@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440739433-6799-3-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Add a skeleton DT binding document that serves as the canonical
> example for implementing YAML-based DT bindings documentation.
> The skeleton binding illustrates use of all fields and variations
> described in the dt-binding-format.txt documentation.
>
> Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/skeleton.yaml | 98 +++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/skeleton.yaml
>
> diff --git a/Documentation/devicetree/bindings/skeleton.yaml b/Documentation/devicetree/bindings/skeleton.yaml
> new file mode 100644
> index 0000000..175965f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/skeleton.yaml
> @@ -0,0 +1,98 @@
> +%YAML 1.2
> +---
> +id: skel-device
> +
> +title: Skeleton Device
> +
> +maintainer:
> +  - name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

We'd want to tie this into get_maintainers.pl obviously.

> +
> +description: >
> +  The Skeleton Device binding represents the SK11 device produced by
> +  the Skeleton Corporation. The binding can also support compatible
> +  clones made by second source vendors.
> +
> +compatible:
> +  - name: "skel,sk11"
> +  - name: "faux,fx11"

Is this an OR or AND? We need both.

The complicated case is "one of {specific names} followed by {generic name}."

> +    description: A clone of the original sk11 device
> +
> +required:
> +  - name: "reg"

We definitely need type info from the start.

> +    description: chip select address of skeleton device
> +    reference: spi-slave

I would like to not have to list properties if the inherited binding
lists it. The problem is we need to say how many cells and the order
(not a problem here, but for mmio devices).

Perhaps we can list the reference at the top level for the node
instead of for every property.

> +  - name: "spi-max-frequency"
> +    description: >
> +      Maximum SPI clocking speed of skeleton device in Hz, must be
> +      1000000
> +    reference: spi-slave

Rather than listing the property and having constraint in description,
perhaps we could add constraints like this:

- spi-max-frequency-range: 1000000 1000000

Or groups of constraints:

- spi-max-frequency-constraints:
  range: 1000000 1000000
  some-other-constraint: <value>

> +
> +optional:
> +  - name: "spi-cs-high"
> +    description: >
> +      Set if skeleton device configuration straps are set for chip
> +      select polarity high
> +    reference: spi-slave
> +
> +deprecated:
> +  - name: "skel,deprecated1"
> +    description: >
> +      First of two deprecated properties.
> +  - name: "skel,deprecated2"
> +    description: >
> +      Second of two deprecated properties.
> +
> +example:
> +  - dts: |
> +      sk11@0 {
> +              compatible = "skel,sk11";
> +              reg = <0>;
> +              spi-max-frequency = <1000000>;
> +              spi-cs-high;
> +      };

At least in this example, we could generate it. Examples are nice, but
we have dts files full of examples already. I get a fair number of
"fix the example" patches, so maybe we should eliminate the simple
ones.

Rob
