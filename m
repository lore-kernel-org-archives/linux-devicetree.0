From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V2 5/6] rtc: max77xxx: add RTC driver for Maxim MAX77xxx
 series RTC IP
Date: Wed, 13 Jan 2016 09:06:08 +0900
Message-ID: <569594F0.4020007@samsung.com>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com>
 <1452590273-16421-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <1452590273-16421-6-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com
List-Id: devicetree@vger.kernel.org

On 12.01.2016 18:17, Laxman Dewangan wrote:
> Maxim Semiconductor's PMIC MAX77620, MAX77686, MAX20024 have
> same RTC IP on these PMICs.
> 
> Add generic MAX77xxxx series RTC driver which can be used as
> RTC driver for these PMIC and avoids duplication of RTC driver
> for each PMICs. Their MFD driver can be different here.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Changes from V1: 
> - Rename the file to rtc-max77xxx.c and make the generic implementation.
> - Direct regmap apis are used for the register access.
> - Decouped from max77620 driver.
> - Taken care of cleanup comments form V1 version.
> 
>  drivers/rtc/Kconfig        |  10 +
>  drivers/rtc/Makefile       |   1 +
>  drivers/rtc/rtc-max77xxx.c | 500 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 511 insertions(+)
>  create mode 100644 drivers/rtc/rtc-max77xxx.c
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 376322f..4972dd5 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -315,6 +315,16 @@ config RTC_DRV_MAX8997
>  	  This driver can also be built as a module. If so, the module
>  	  will be called rtc-max8997.
>  
> +config RTC_DRV_MAX77XXX
> +	tristate "Maxim MAX77XXX series generic RTC driver"
> +	help
> +	  If you say yes here you will get support for the generic RTC driver
> +	  for Maxim Semiconductor MAX77XXX series of PMIC like MAX77620.
> +	  This also supports the RTC driver for Maxim PMIC MaX20024 which
> +	  is almost same as MAX77620.
> +	  This driver can also be built as a module. If so, the module
> +	  will be called rtc-max77xxx.
> +

That was not the consensus... You still added a new driver - but now
with different name.

That is useless duplication

Please work with existing code. Use existing maxim RTC drivers: either
max77686 or max77802.

There is no need for new one.

Best regards,
Krzysztof

