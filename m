From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] Documentation: bindings: brcmstb: Document write-pairing
Date: Thu, 17 Sep 2015 08:35:42 -0500
Message-ID: <CAL_JsqKTzio6DUtM5LpTjiLqaxexYNTs7HydLtgkevtSSnkZWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 1:14 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Document the hif-cpubiuctrl node a bit more, and add a documentation
> entry for the optional "brcm,write-pairing" property.
>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> Changes in v2:
>
> - added a description of what the BIU stands for and what write pairing is
> - fixed the compatible string description
>
>  .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt     | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
> index 430608ec09f0..8ac28eb4a5a1 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt
> @@ -20,6 +20,25 @@ system control is required:
>      - compatible: "brcm,bcm<chip_id>-hif-cpubiuctrl", "syscon"
>      - compatible: "brcm,bcm<chip_id>-hif-continuation", "syscon"
>
> +hif-cpubiuctrl node
> +-------------------
> +SoCs with Broadcom Brahma15 ARM-based CPUs have a specific Bus Interface Unit
> +(BIU) block which controls and interfaces the CPU complex to the different
> +Memory Controller Ports (MCP), one per memory controller (MEMC). This BIU block
> +offers a feature called Write Pairing which consists in collapsing two adjacent
> +cache lines into a single (bursted) write transaction towards the memory
> +controller (MEMC) to maximize write bandwidth.
> +
> +Required properties:
> +
> +    - compatible: must be "brcm,bcm7445-hif-cpubiuctrl", "syscon"
> +
> +Optional properties:
> +
> +    - brcm,write-pairing:
> +       Boolean property, which when present indicates that the chip
> +       supports write-pairing.
> +
>  example:
>      rdb {
>          #address-cells = <1>;
> @@ -35,6 +54,7 @@ example:
>          hif_cpubiuctrl: syscon@3e2400 {
>              compatible = "brcm,bcm7445-hif-cpubiuctrl", "syscon";
>              reg = <0x3e2400 0x5b4>;
> +            brcm,write-pairing;
>          };
>
>          hif_continuation: syscon@452000 {
> --
> 2.1.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
