From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 RESEND 2/3] Documentation: gpio: Add APM X-Gene standby
 GPIO controller DTS binding
Date: Tue, 13 Jan 2015 10:25:49 +0100
Message-ID: <CACRpkdbcdf7Ub9uYbeqUe1La1dnVeWCxK8N7=iVZuBtuKHFHFA@mail.gmail.com>
References: <1418793050-26927-1-git-send-email-yvo@apm.com>
	<1418793050-26927-3-git-send-email-yvo@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1418793050-26927-3-git-send-email-yvo@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Y Vo <yvo@apm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 17, 2014 at 6:10 AM, Y Vo <yvo@apm.com> wrote:
> Documentation for APM X-Gene standby GPIO controller DTS binding.
>
> Signed-off-by: Y Vo <yvo@apm.com>
> ---
>  .../devicetree/bindings/gpio/gpio-xgene-sb.txt     | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
> new file mode 100644
> index 0000000..3215e4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
> @@ -0,0 +1,31 @@
> +APM X-Gene Standby GPIO controller bindings
> +
> +This is a gpio controller in standby domain.
> +
> +There are 20 GPIO pins from 0..21. There is no GPIO_DS14 and GPIO_DS15.
> +Only GPIO_DS8..GPIO_DS13 support interrupt. IRQ mapping 0x28..0x2d.
> +
> +Required properties:
> +- compatible: "apm,xgene-gpio-sb" for X-Gene Standby GPIO controller
> +- reg: Physical base address and size of the controller's registers
> +- #gpio-cells: Should be two.
> +       - first cell is the pin number
> +       - second cell is used to specify the gpio polarity:
> +               0 = active high
> +               1 = active low
> +- gpio-controller: Marks the device node as a GPIO controller.
> +- interrupts: Shall contains the interrupts.

>From the example it seems it must contain exactly 6 interrupts?
Then state this.

> +Example:
> +       sbgpio: sbgpio@17001000 {
> +               compatible = "apm,xgene-gpio-sb";
> +               reg = <0x0 0x17001000 0x0 0x400>;
> +               #gpio-cells = <2>;
> +               gpio-controller;
> +               interrupts =    <0x0 0x28 0x1>,
> +                               <0x0 0x29 0x1>,
> +                               <0x0 0x2a 0x1>,
> +                               <0x0 0x2b 0x1>,
> +                               <0x0 0x2c 0x1>,
> +                               <0x0 0x2d 0x1>;
> +       };

Yours,
Linus Walleij
