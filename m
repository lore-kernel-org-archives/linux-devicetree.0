From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] drivers/irqchip: gicv3: add workaround for
 Synquacer pre-ITS
Date: Thu, 12 Oct 2017 16:34:46 -0500
Message-ID: <CAL_Jsq+5L=gOzb=NzPJ8CSpqAbnwN3=LWvN2f07=AejwFMbOGg@mail.gmail.com>
References: <20171012183247.23679-1-ard.biesheuvel@linaro.org> <20171012183247.23679-3-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171012183247.23679-3-ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Graeme Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 1:32 PM, Ard Biesheuvel
<ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The Socionext Synquacer SoC's implementation of GICv3 has a so-called
> 'pre-ITS', which maps 32-bit writes targeted at a separate window of
> size '4 << device_id_bits' onto writes to GITS_TRANSLATER with device
> ID taken from bits [device_id_bits + 1:2] of the window offset.
> Writes that target GITS_TRANSLATER directly are reported as originating
> from device ID #0.
>
> So add a workaround for this. Given that this breaks isolation, clear
> the IRQ_DOMAIN_FLAG_MSI_REMAP flag as well.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt |  4 ++
>  arch/arm64/Kconfig                                                    |  8 +++
>  drivers/irqchip/irq-gic-v3-its.c                                      | 63 +++++++++++++++++++-
>  3 files changed, 72 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> index 4c29cdab0ea5..0798a61bbf99 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> @@ -75,6 +75,10 @@ These nodes must have the following properties:
>  - reg: Specifies the base physical address and size of the ITS
>    registers.
>
> +Optional:
> +- socionext,synquacer-pre-its: (u32, u32) tuple describing the host address
> +  and size of the pre-ITS window, as implemented on the Socionext Synquacer SoC

Sounds like a separate h/w block to me and addresses should be in
"reg". I would suggest you define a separate node for the pre-its
block and then use of_find_compatible_node() from the GIC driver to
retrieve the node and whatever you need from it. Or do an SoC specific
compatible string for the GIC and let that imply whatever information
you need. Then the next quirk doesn't need a DT update.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
