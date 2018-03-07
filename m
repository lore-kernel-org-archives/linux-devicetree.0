From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 1/3] pinctrl: bcm2835: switch to GENERIC_PINCONF
Date: Wed, 7 Mar 2018 12:51:28 +0100 (CET)
Message-ID: <2117034393.275403.1520423489002@email.1und1.de>
References: <431699005.307231.1520086916739@email.1und1.de>
 <1520216960-19880-1-git-send-email-matheus@castello.eng.br>
 <1520216960-19880-2-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520216960-19880-2-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, Matheus Castello <matheus@castello.eng.br>
Cc: eric@anholt.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Matheus,

> Matheus Castello <matheus@castello.eng.br> hat am 5. März 2018 um 03:29 geschrieben:
> 
> 
> To enable support for generic binding in the pinctrl-bcm2835 and use pinctrl
> generic to parse properties the GENERIC_PINCONF have to be selected.
> 
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> ---
>  drivers/pinctrl/bcm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
> index e8c4e4f..0f38d51 100644
> --- a/drivers/pinctrl/bcm/Kconfig
> +++ b/drivers/pinctrl/bcm/Kconfig
> @@ -20,6 +20,7 @@ config PINCTRL_BCM2835
>  	bool
>  	select PINMUX
>  	select PINCONF
> +	select GENERIC_PINCONF
>  	select GPIOLIB_IRQCHIP
> 
>  config PINCTRL_IPROC_GPIO

i think it's okay to fold this change into patch #2.

> --
> 2.7.4
>
