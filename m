From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/3] Meson8 GPIO interrupt support
Date: Tue, 31 Oct 2017 11:13:57 +0100
Message-ID: <7h1sljmxp6.fsf@baylibre.com>
References: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
        <8637605bly.fsf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8637605bly.fsf-5wv7dgnIgG8@public.gmane.org> (Marc Zyngier's message of "Tue, 31 Oct
        2017 01:50:49 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> writes:

> On Mon, Oct 30 2017 at 12:05:20 am GMT, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> This is a simple follow-up of two series from Jerome:
>> - "irqchip: meson: add support for the gpio interrupt controller"
>> - "ARM: meson: enable gpio interrupt controller"
>>
>> This fills in the missing bits to have GPIO interrupt support on Meson8,
>> which includes:
>> - a new binding in the driver with the correct IRQ number
>> - enabling the GPIO interrupt controller in meson8.dts
>> - enabling the GPIO interrupt controller via Kconfig for MACH_MESON8
>>
>>
>> Martin Blumenstingl (3):
>>   irqchip/meson-gpio: add support for Meson8 SoCs
>>   ARM: dts: meson8: enable the GPIO interrupt controller
>>   ARM: meson: enable MESON_IRQ_GPIO also for MACH_MESON8
>>
>>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt        | 1 +
>>  arch/arm/boot/dts/meson8.dtsi                                        | 5 +++++
>>  arch/arm/mach-meson/Kconfig                                          | 1 +
>>  drivers/irqchip/irq-meson-gpio.c                                     | 5 +++++
>>  4 files changed, 12 insertions(+)
>
> Kevin, Carlos: Are you OK with this one? It seems pretty minor, and I'm
> happy to queue it if I get an Ack for it. If you'd rather get it through
> via armsoc, let me know.

Can you take the drivers/irqchip and bindings patch (PATCH 1/3) and I'll
take the rest to avoid conflicts with a bunch of other moving parts we
have in arch/arm.

For the driver, feel free to add

Acked-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Kevin


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
