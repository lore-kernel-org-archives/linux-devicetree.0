From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: adc: add driver for the ti-adc084s021 chip
Date: Fri, 28 Apr 2017 08:52:48 -0500
Message-ID: <20170428135248.du6smmzktqldj4u4@rob-hp-laptop>
References: <1492786703-5149-1-git-send-email-marten.lindahl@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1492786703-5149-1-git-send-email-marten.lindahl-VrBV9hrLPhE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl-VrBV9hrLPhE@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?iso-8859-1?Q?M=E5rten?= Lindahl <martenli-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 21, 2017 at 04:58:23PM +0200, Mårten Lindahl wrote:
> From: Mårten Lindahl <martenli-VrBV9hrLPhE@public.gmane.org>
> 
> This adds support for the Texas Instruments ADC084S021 ADC chip.
> 
> Signed-off-by: Mårten Lindahl <martenli-VrBV9hrLPhE@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/ti-adc084s021.txt  |  25 ++

It's preferred to put bindings in a separate patch.

>  drivers/iio/adc/Kconfig                            |  12 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/ti-adc084s021.c                    | 342 +++++++++++++++++++++
>  4 files changed, 380 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
>  create mode 100644 drivers/iio/adc/ti-adc084s021.c
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt b/Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
> new file mode 100644
> index 0000000..921eb46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti-adc084s021.txt
> @@ -0,0 +1,25 @@
> +* Texas Instruments' ADC084S021
> +
> +Required properties:
> + - compatible        : Must be "ti,adc084s021"
> + - reg               : SPI chip select number for the device
> + - vref-supply       : The regulator supply for ADC reference voltage
> + - spi-max-frequency : Definition as per Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Optional properties:
> + - spi-cpol          : SPI inverse clock polarity, as per spi-bus bindings
> + - spi-cpha          : SPI shifted clock phase (CPHA), as per spi-bus bindings
> + - spi-cs-high       : SPI chip select active high, as per spi-bus bindings

How are these optional? A given device should have specific properties 
required here.

Also, no need to define them, "per spi-bus bindings" is enough.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
