From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/2] driver: clocksource: Add nxp system counter timer
 driver support
Date: Wed, 12 Dec 2018 10:48:22 -0800
Message-ID: <dbe836ff-cd29-a693-4d83-a2fee419b424@infradead.org>
References: <1544592770-19996-1-git-send-email-ping.bai@nxp.com>
 <1544592770-19996-2-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544592770-19996-2-git-send-email-ping.bai@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacky Bai <ping.bai@nxp.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 12/11/18 9:28 PM, Jacky Bai wrote:
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index c57b156..7e5f2de 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -579,6 +579,14 @@ config CLKSRC_IMX_TPM
>  	  Enable this option to use IMX Timer/PWM Module (TPM) timer as
>  	  clocksource.
>  
> +config CLKSRC_IMX_SYS_CTR
> +	bool "Clocksource using i.MX system counter" if COMPILE_TEST

Looks like a "make *config" user only gets this prompt if COMPILE_TEST is set.

If COMPILE_TEST is not set, how does this driver become enabled/set?


> +	depends on (ARM || ARM64) && CLKDEV_LOOKUP
> +	select CLKSRC_MMIO
> +	help
> +	  Enable this option to use IMX system counter timer as
> +	  clocksource.
> +
>  config CLKSRC_ST_LPC
>  	bool "Low power clocksource found in the LPC" if COMPILE_TEST
>  	select TIMER_OF if OF

thanks,
-- 
~Randy
