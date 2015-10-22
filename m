From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 05/11] dt-binding: Add ngpios property to GPIO controller node
Date: Thu, 22 Oct 2015 13:43:46 -0500
Message-ID: <CAL_Jsq+Xwf7==J1LLnUDtj-cgJWRizbKXcYtwfEe5iv8VS-Uwg@mail.gmail.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com> <1445233398-27129-6-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445233398-27129-6-git-send-email-pramodku@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Kumar <pramodku@broadcom.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 19, 2015 at 12:43 AM, Pramod Kumar <pramodku@broadcom.com> wrote:
> Add ngpios property to the gpio controller's DT node so that controller
> driver extracts total number of gpio lines present in controller
> from DT and removes dependency on driver.
>
> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> index f92b833..655a8d7 100644
> --- a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> @@ -10,6 +10,9 @@ Required properties:
>      Define the base and range of the I/O address space that contains the Cygnus
>  GPIO/PINCONF controller registers
>
> +- ngpios:
> +    Total number of GPIOs the controller provides

This must be optional for compatibility and the driver needs to handle
it not present.

> +
>  - #gpio-cells:
>      Must be two. The first cell is the GPIO pin number (within the
>  controller's pin space) and the second cell is used for the following:
> @@ -57,6 +60,7 @@ Example:
>                 compatible = "brcm,cygnus-ccm-gpio";
>                 reg = <0x1800a000 0x50>,
>                       <0x0301d164 0x20>;
> +               ngpios = <24>;
>                 #gpio-cells = <2>;
>                 gpio-controller;
>                 interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> @@ -78,6 +82,7 @@ Example:
>         gpio_asiu: gpio@180a5000 {
>                 compatible = "brcm,cygnus-asiu-gpio";
>                 reg = <0x180a5000 0x668>;
> +               ngpios = <146>;
>                 #gpio-cells = <2>;
>                 gpio-controller;
>                 interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> --
> 1.9.1
>
