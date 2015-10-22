From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 01/11] dt-bindings: pinctrl: Optional DT property to
 support pin mappings
Date: Thu, 22 Oct 2015 13:45:03 -0500
Message-ID: <CAL_JsqJaJO+ytBrZvwHkPjM9-Wr8MHMK-uTV93QLium3JL_A3Q@mail.gmail.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com> <1445233398-27129-2-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1445233398-27129-2-git-send-email-pramodku@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pramod Kumar <pramodku@broadcom.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 19, 2015 at 12:43 AM, Pramod Kumar <pramodku@broadcom.com> wrote:
> If GPIO controller's pins are muxed, pin-controller subsystem
> need to be intimated by defining mapping between gpio and
> pinmux controller. This patch adds required properties to
> define this mapping via DT.
>
> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt         | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> index 6540ca5..25a5002 100644
> --- a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> @@ -26,9 +26,13 @@ Optional properties:
>  - interrupt-controller:
>      Specifies that the node is an interrupt controller
>
> -- pinmux:
> -    Specifies the phandle to the IOMUX device, where pins can be individually
> -muxed to GPIO
> +- gpio-ranges:
> +    Specifies the mapping between gpio controller and pin-controllers pins.
> +    This requires 4 fields in cells defined as -
> +    1. Phandle of pin-controller.
> +    2. GPIO base pin offset.
> +    3  Pin-control base pin offset.
> +    4. number of gpio pins which are linearly mapped from pin base.
>
>  Supported generic PINCONF properties in child nodes:
>
> @@ -78,6 +82,8 @@ Example:
>                 gpio-controller;
>                 interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>                 interrupt-controller;
> +               gpio-ranges = <&pinctrl 0 42 1>,
> +                               <&pinctrl 1 44 3>;
>         };
>
>         /*
> --
> 1.9.1
>
