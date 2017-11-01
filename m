From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] irqchip/meson-gpio: add support for Meson8 SoCs
Date: Wed, 1 Nov 2017 16:29:30 -0500
Message-ID: <20171101212930.7i5w7quwejzcvlaf@rob-hp-laptop>
References: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
 <20171029230523.7355-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171029230523.7355-2-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 30, 2017 at 12:05:21AM +0100, Martin Blumenstingl wrote:
> Meson8 uses the same GPIO interrupt controller IP block as the other
> Meson SoCs. A total of 134 pins can be spied on, which is the sum of:
> - 22 pins on bank GPIOX
> - 17 pins on bank GPIOY
> - 30 pins on bank GPIODV
> - 10 pins on bank GPIOH
> - 15 pins on bank GPIOZ
> - 7 pins on bank CARD
> - 19 pins on bank BOOT
> - 14 pins in the AO domain
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt        | 1 +
>  drivers/irqchip/irq-meson-gpio.c                                     | 5 +++++
>  2 files changed, 6 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
