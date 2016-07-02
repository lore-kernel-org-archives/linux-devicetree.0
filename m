From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: sun4i-lradc: Add binding documentation
Date: Sat, 2 Jul 2016 17:12:55 +0800
Message-ID: <CAGb2v66PzgVqVGxs4FSQkkX=2hX42UmftahOgJmepv4wA-mwnw@mail.gmail.com>
References: <1467406855-9677-1-git-send-email-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467406855-9677-1-git-send-email-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Jul 2, 2016 at 5:00 AM, Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Document the bindings for the Allwinner LRADC.

We already have Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
and I'm pretty sure Hans (CC-ed) argued that this is not a generic ADC
block.

Any plans to reconcile the different bindings?

Thanks
ChenYu

>
> Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
>  .../devicetree/bindings/iio/adc/sun4i-lradc.txt       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/sun4i-lradc.txt
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/sun4i-lradc.txt b/Documentation/devicetree/bindings/iio/adc/sun4i-lradc.txt
> new file mode 100644
> index 000000000000..c75a6067b8a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/sun4i-lradc.txt
> @@ -0,0 +1,19 @@
> +Allwinner sun4i Low Resolution ADC
> +----------------------------------
> +
> +Required properties:
> + - compatible: "allwinner,sun4i-a10-lradc"
> + - reg: mmio address range of the chip
> + - interrupts: interrupt to which the chip is connected
> + - vref-supply: powersupply for the lradc reference voltage
> + - #io-channel-cells = <1>; As ADC has multiple outputs
> +
> +Example:
> +
> +       lradc: lradc@01c22800 {
> +               compatible = "allwinner,sun4i-a10-lradc";
> +               reg = <0x01c22800 0x100>;
> +               interrupts = <31>;
> +               vref-supply = <&reg_vcc3v0>;
> +               #io-channel-cells = <1>;
> +       };
> --
> 2.8.1
>
