From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 2/4] dt-bindings: gpio: add raspberry pi GPIO expander
 binding
Date: Tue, 2 Jan 2018 19:26:00 +0100 (CET)
Message-ID: <860502005.181510.1514917560724@email.1und1.de>
References: <cover.1514898134.git.baruch@tkos.co.il>
 <4ca1795c6e09eb89f481cdec55180b4f1165bbfd.1514898134.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <4ca1795c6e09eb89f481cdec55180b4f1165bbfd.1514898134.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.org>, Linus Walleij <linus.walleij@linaro.org>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

Hi Baruch,

> Baruch Siach <baruch@tkos.co.il> hat am 2. Januar 2018 um 14:19 geschrieben:
> 
> 
> The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware over
> I2C. The firmware mailbox interface allows the ARM core to control the
> GPIO lines.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../bindings/gpio/brcm,bcm2835-expgpio.txt         | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm2835-expgpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm2835-expgpio.txt b/Documentation/devicetree/bindings/gpio/brcm,bcm2835-expgpio.txt
> new file mode 100644
> index 000000000000..55257f31a9be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm2835-expgpio.txt
> @@ -0,0 +1,24 @@
> +Raspberry Pi GPIO expander
> +
> +The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware. The
> +firmware exposes a mailbox interface that allows the ARM core to control the
> +GPIO lines on the expander.
> +
> +Required properties:
> +
> +- compatible : Should be "brcm,bcm2835-expgpio"

from my understand this driver is specific to the Raspberry Pi and it's vendor is the Raspberry Pi Foundation. So i prefer Eric's suggestion of "raspberrypi,firmware-gpio", which also applies to the filename.

> +- gpio-controller : Marks the device node as a gpio controller
> +- #gpio-cells : Should be two.  The first cell is the pin number, and
> +  the second cell is used to specify the gpio polarity:
> +  0 = active high
> +  1 = active low
> +- firmware : Reference to the RPi firmware device node
> +
> +Example:
> +
> +expgpio: expgpio {
> +	compatible = "brcm,bcm2835-expgpio";
> +	gpio-controller;
> +	#gpio-cells = <2>;
> +	firmware = <&firmware>;
> +};
> -- 
> 2.15.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
