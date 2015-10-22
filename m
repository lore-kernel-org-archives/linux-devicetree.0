From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 04/11] dt-binding: Add new compatible string for gpio
 controller driver
Date: Thu, 22 Oct 2015 13:40:46 -0500
Message-ID: <CAL_JsqJ-Y8qObp9SVGwfUs7An_XaY8J7fVCfiphaNTWtJa77jw@mail.gmail.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com> <1445233398-27129-5-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445233398-27129-5-git-send-email-pramodku@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Kumar <pramodku@broadcom.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 19, 2015 at 12:43 AM, Pramod Kumar <pramodku@broadcom.com> wrote:
> This new compatible string, "brcm,iproc-gpio", should be used for
> all new iproc-based future SoCs.

Can't predict the future and crazy whims of hardware designers.

This is fine for matching, but you should also have a SOC specific string.

> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> index 25a5002..f92b833 100644
> --- a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> @@ -3,8 +3,8 @@ Broadcom Cygnus GPIO/PINCONF Controller
>  Required properties:
>
>  - compatible:
> -    Must be "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio", or
> -    "brcm,cygnus-crmu-gpio"
> +    Must be "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio",
> +"brcm,cygnus-crmu-gpio" or "brcm,iproc-gpio"
>
>  - reg:
>      Define the base and range of the I/O address space that contains the Cygnus
> --
> 1.9.1
>
