From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/3] drivers/irqchip: gicv3: add workaround for
 Synquacer pre-ITS
Date: Tue, 17 Oct 2017 20:53:53 -0500
Message-ID: <CAL_Jsq+814HWD6D=FTDJBbgQuMCrkkdWo7qhH3TL6LYgGNQjaw@mail.gmail.com>
References: <20171017165556.30250-1-ard.biesheuvel@linaro.org> <20171017165556.30250-4-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171017165556.30250-4-ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Graeme Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 11:55 AM, Ard Biesheuvel
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

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  arch/arm64/Kconfig                                                    |  8 +++
>  drivers/irqchip/irq-gic-v3-its.c                                      | 72 +++++++++++++++++++-
>  3 files changed, 82 insertions(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
