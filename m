From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/7] Documentation: Rename gpio controller name from
 cygnus to iproc
Date: Fri, 20 Nov 2015 09:34:37 -0600
Message-ID: <20151120153437.GA7645@rob-hp-laptop>
References: <1447905139-16002-1-git-send-email-pramodku@broadcom.com>
 <1447905139-16002-7-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447905139-16002-7-git-send-email-pramodku@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Kumar <pramodku@broadcom.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 19, 2015 at 09:22:18AM +0530, Pramod Kumar wrote:
> Renamed gpio controller's driver name from cygnus to iproc to make it
> more generic so that all iProc based SoCs having the same gpio controller
> could use this.
> 
> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>

Where's my ack?

> ---
>  .../bindings/pinctrl/{brcm,cygnus-gpio.txt => brcm,iproc-gpio.txt}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/pinctrl/{brcm,cygnus-gpio.txt => brcm,iproc-gpio.txt} (97%)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
> similarity index 97%
> rename from Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> rename to Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
> index 8b1e5d1..e427792 100644
> --- a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
> @@ -1,4 +1,4 @@
> -Broadcom Cygnus GPIO/PINCONF Controller
> +Broadcom iProc GPIO/PINCONF Controller
>  
>  Required properties:
>  
> @@ -7,7 +7,7 @@ Required properties:
>      "brcm,cygnus-crmu-gpio" or "brcm,iproc-gpio"
>  
>  - reg:
> -    Define the base and range of the I/O address space that contains the Cygnus
> +    Define the base and range of the I/O address space that contains SoC
>  GPIO/PINCONF controller registers
>  
>  - ngpios:
> -- 
> 1.9.1
> 
