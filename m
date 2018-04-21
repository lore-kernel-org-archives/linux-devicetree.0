From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v5 2/3] pinctrl: bcm2835: Add support for generic
 pinctrl binding
Date: Sat, 21 Apr 2018 12:30:02 +0200 (CEST)
Message-ID: <1775241593.21185.1524306602836@email.1und1.de>
References: <f500b25c-eea0-9f01-7d7b-5a9dd90c50fa@castello.eng.br>
 <1523422726-7910-1-git-send-email-matheus@castello.eng.br>
 <1523422726-7910-3-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523422726-7910-3-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, eric@anholt.net
List-Id: devicetree@vger.kernel.org

Hi Matheus,

> Matheus Castello <matheus@castello.eng.br> hat am 11. April 2018 um 06:58 geschrieben:
> 
> 
> To keep driver up to date we add generic pinctrl binding support, which covers
> the features used in this driver and has additional node properties that this
> SoC has compatibility, so enabling future implementations of these properties
> without the need to create new node properties in the device trees.
> 
> The logic of this change maintain the old brcm legacy binding support in order
> to keep the ABI stable.
> 
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> ---
> 
> A brief explanation of what I did:
> 
> Add pinconf-generic header for use the defines and pinctrl-generic API.
> 
> Add dt-bindings pinctrl bcm2835 header to use functions selections and
> pulls definitions, which functions definitions where duplicated in the
> enum bcm2835_fsel, I removed the duplicate defines from enum.
> 
> In the bcm2835_pctl_dt_node_to_map_pull I used the generic macro for
> pack the legacy param and arguments, since it will be unpacked along with
> generic properties that is packed with this same macro.
> 
> In bcm2835_pctl_dt_node_to_map I thougt it was better, and simpler, to use
> pinctrl-generic parse code instead of parsing it inside the driver, so code
> first check for generic binding parse, if something is parsed then it is
> assumed that are using the new generic style, and when nothing is found then
> parse continues to search for legacy properties.
> 
> In the bcm2835_pinconf_set was changed the unpack legacy by the generic, and
> was added a switch for the parameter tests, since pinctrl generic uses 3
> properties to define the states of the pull instead of one with arguments, that
> was the reason too that bcm2835_pull_config_set function was added, for reuse
> the code that set state of pull.
> 
>  drivers/pinctrl/bcm/Kconfig           |  1 +
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 87 ++++++++++++++++++++++-------------
>  2 files changed, 55 insertions(+), 33 deletions(-)
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
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 785c366..010c565 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -36,11 +36,13 @@
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/platform_device.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> +#include <dt-bindings/pinctrl/bcm2835.h>
> 
>  #define MODULE_NAME "pinctrl-bcm2835"
>  #define BCM2835_NUM_GPIOS 54
> @@ -75,10 +77,6 @@ enum bcm2835_pinconf_param {
>  	BCM2835_PINCONF_PARAM_PULL,

Since we use bcm2835_pinconf_param and pin_config_param in bcm2835_pinconf_set, there are potential conflicts. According to include/linux/pinctrl/pinconf-generic.h:

 * @PIN_CONFIG_END: this is the last enumerator for pin configurations, if
 *	you need to pass in custom configurations to the pin controller, use
 *	PIN_CONFIG_END+1 as the base offset.

Please adjust BCM2835_PINCONF_PARAM_PULL accordingly.

Sorry for not notice this before.

Stefan
