From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 01/18] power: reset: Add if statement isntead of multiple
 depends on
Date: Tue, 8 Jul 2014 19:33:24 +0200
Message-ID: <53BC2B64.8070502@atmel.com>
References: <1404743131-24569-1-git-send-email-maxime.ripard@free-electrons.com> <1404743131-24569-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404743131-24569-2-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Boris Brezillon <boris-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Nit-pik: In subject: s/isntead/instead/

On 07/07/2014 16:25, Maxime Ripard :
> All the config option so far are depending on the POWER_RESET symbol
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/power/reset/Kconfig | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index bdcf5173e377..19d546c5edfa 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -6,15 +6,17 @@ menuconfig POWER_RESET
>  
>  	  Say Y here to enable board reset and power off
>  
> +if POWER_RESET
> +
>  config POWER_RESET_AS3722
>  	bool "ams AS3722 power-off driver"
> -	depends on MFD_AS3722 && POWER_RESET
> +	depends on MFD_AS3722
>  	help
>  	  This driver supports turning off board via a ams AS3722 power-off.
>  
>  config POWER_RESET_AXXIA
>  	bool "LSI Axxia reset driver"
> -	depends on POWER_RESET && ARCH_AXXIA
> +	depends on ARCH_AXXIA
>  	help
>  	  This driver supports restart for Axxia SoC.
>  
> @@ -22,7 +24,7 @@ config POWER_RESET_AXXIA
>  
>  config POWER_RESET_GPIO
>  	bool "GPIO power-off driver"
> -	depends on OF_GPIO && POWER_RESET
> +	depends on OF_GPIO
>  	help
>  	  This driver supports turning off your board via a GPIO line.
>  	  If your board needs a GPIO high/low to power down, say Y and
> @@ -30,13 +32,13 @@ config POWER_RESET_GPIO
>  
>  config POWER_RESET_MSM
>  	bool "Qualcomm MSM power-off driver"
> -	depends on POWER_RESET && ARCH_QCOM
> +	depends on ARCH_QCOM
>  	help
>  	  Power off and restart support for Qualcomm boards.
>  
>  config POWER_RESET_QNAP
>  	bool "QNAP power-off driver"
> -	depends on OF_GPIO && POWER_RESET && PLAT_ORION
> +	depends on OF_GPIO && PLAT_ORION
>  	help
>  	  This driver supports turning off QNAP NAS devices by sending
>  	  commands to the microcontroller which controls the main power.
> @@ -54,14 +56,13 @@ config POWER_RESET_RESTART
>  config POWER_RESET_SUN6I
>  	bool "Allwinner A31 SoC reset driver"
>  	depends on ARCH_SUNXI
> -	depends on POWER_RESET
>  	help
>  	  Reboot support for the Allwinner A31 SoCs.
>  
>  config POWER_RESET_VEXPRESS
>  	bool "ARM Versatile Express power-off and reset driver"
>  	depends on ARM || ARM64
> -	depends on POWER_RESET && VEXPRESS_CONFIG
> +	depends on VEXPRESS_CONFIG
>  	help
>  	  Power off and reset support for the ARM Ltd. Versatile
>  	  Express boards.
> @@ -69,7 +70,6 @@ config POWER_RESET_VEXPRESS
>  config POWER_RESET_XGENE
>  	bool "APM SoC X-Gene reset driver"
>  	depends on ARM64
> -	depends on POWER_RESET
>  	help
>  	  Reboot support for the APM SoC X-Gene Eval boards.
>  
> @@ -80,3 +80,4 @@ config POWER_RESET_KEYSTONE
>  	help
>  	  Reboot support for the KEYSTONE SoCs.
>  
> +endif
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
