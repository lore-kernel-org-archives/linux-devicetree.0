From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] dt-bindings: add Marvell PMU documentation
Date: Wed, 15 Jul 2015 15:39:19 -0500
Message-ID: <CAL_JsqJRyasT49x6JLhy-X0psfT=cUom_RMkFQScqqLzeggUzQ@mail.gmail.com>
References: <20150715185859.GC7557@n2100.arm.linux.org.uk> <E1ZFRtu-0003lu-Ft@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1ZFRtu-0003lu-Ft-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 15, 2015 at 1:59 PM, Russell King
<rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> Add the required DT binding documentation for the Marvell PMU driver.

Looks mostly fine to me.

> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/soc/dove/pmu.txt | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/dove/pmu.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/dove/pmu.txt b/Documentation/devicetree/bindings/soc/dove/pmu.txt
> new file mode 100644
> index 000000000000..edd40b796b74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/dove/pmu.txt
> @@ -0,0 +1,56 @@
> +Device Tree bindings for Marvell PMU
> +
> +Required properties:
> + - compatible: value should be "marvell,dove-pmu".
> +    May also include "simple-bus" if there are child devices, in which
> +    case the ranges node is required.
> + - reg: two base addresses and sizes of the PM controller and PMU.
> + - interrupts: single interrupt number for the PMU interrupt
> + - interrupt-controller: must be specified as the PMU itself is an
> +    interrupt controller.
> + - #interrupt-cells: must be 1.
> + - #reset-cells: must be 1.
> + - domains: sub-node containing domain descriptions
> +
> +Optional properties:
> + - ranges: defines the address mapping for child devices, as per the
> +   standard property of this name.  Required when compatible includes
> +   "simple-bus".

When would this be used? Your example has child devices, but not this.

> +
> +Power domain descriptions are listed as child nodes of the "domains"
> +sub-node.  Each domain has the following properties:
> +
> +Required properties:
> + - #power-domain-cells: must be 0.
> +
> +Optional properties:
> + - marvell,pmu_pwr_mask: specifies the mask value for PMU power register
> + - marvell,pmu_iso_mask: specifies the mask value for PMU isolation register
> + - resets: points to the reset manager (PMU node) and reset index.
> +
> +Example:
> +
> +       pmu: power-management@d0000 {
> +               compatible = "marvell,dove-pmu";
> +               reg = <0xd0000 0x8000>, <0xd8000 0x8000>;
> +               interrupts = <33>;
> +               interrupt-controller;
> +               #interrupt-cells = <1>;
> +               #reset-cells = <1>;
> +
> +               domains {
> +                       vpu_domain: vpu-domain {
> +                               #power-domain-cells = <0>;
> +                               marvell,pmu_pwr_mask = <0x00000008>;
> +                               marvell,pmu_iso_mask = <0x00000001>;
> +                               resets = <&pmu 16>;
> +                       };
> +
> +                       gpu_domain: gpu-domain {
> +                               #power-domain-cells = <0>;
> +                               marvell,pmu_pwr_mask = <0x00000004>;
> +                               marvell,pmu_iso_mask = <0x00000002>;
> +                               resets = <&pmu 18>;
> +                       };
> +               };
> +       };
> --
> 2.1.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
