Return-Path: <SRS0=vDlE=VB=mentor.com=Harish_Kandiga@kernel.org>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
From: Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <9c9b8966-851a-d056-8322-f3e03f5297ad@mentor.com>
Date: Thu, 4 Jul 2019 10:31:48 +0530
MIME-Version: 1.0
In-Reply-To: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On 28/06/19 3:00 PM, Harish Jenny K N wrote:
> Document the device tree binding for the inverter gpio
> controller to configure the polarity of the gpio pins
> used by the consumers.
>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> ---
>  .../devicetree/bindings/gpio/gpio-inverter.txt     | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-inverter.txt b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> new file mode 100644
> index 0000000..8bb6b2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
> @@ -0,0 +1,29 @@
> +GPIO-INVERTER
> +======
> +This binding defines the gpio-inverter. The gpio-inverter is a driver that
> +allows to properly describe the gpio polarities on the hardware.
> +
> +Please refer to gpio.txt for generic information regarding GPIO bindings.
> +
> +Required properties:
> +- compatible : "gpio-inverter".
> +- gpio-controller: Marks the port as GPIO controller.
> +- #gpio-cells: One. This is the pin number.
> +- inverted-gpios: Array of GPIO pins required from consumers, whose polarity
> +  has to be inverted in the driver.
> +Note: gpio flag should be set as GPIO_ACTIVE_HIGH. Using GPIO_ACTICE_LOW will
> +cause double inversion.
> +
> +Optional properties:
> +- gpio-line-names: Refer to gpio.txt for details regarding this property.
> +
> +Example:
> +
> +gpio_inv: gpio-inv {
> +	compatible = "gpio-inverter";
> +	gpio-controller;
> +	#gpio-cells = <1>;
> +	inverted-gpios = <&gpio5 24 GPIO_ACTIVE_HIGH>,
> +	<&gpio7 0 GPIO_ACTIVE_HIGH>, <&gpio7 1 GPIO_ACTIVE_HIGH>;
> +	gpio-line-names = "JTAG_DNL_EN", "lvds-pwrdwn", "lcd-on";
> +};
> --
> 2.7.4
>

Can anyone of DT people please review this ?

Just to let you know that Linus Walleij has reviewed the gpio inverter driver and needs some review from the DT people before he applies it.

Thanks in advance.


Best Regards,

Harish Jenny K N
