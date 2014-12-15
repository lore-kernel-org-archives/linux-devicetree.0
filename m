From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 7/8] rtc: st: add new driver for ST's LPC RTC
Date: Mon, 15 Dec 2014 06:17:59 -0800
Message-ID: <548EED97.60604@roeck-us.net>
References: <1418642738-17407-1-git-send-email-lee.jones@linaro.org> <1418642738-17407-8-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418642738-17407-8-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/15/2014 03:25 AM, Lee Jones wrote:
> ST's Low Power Controller (LPC) controls two devices; watchdog and RTC.
> Only one of the devices can be used at any one time.  This is enforced
> by the correlating MFD driver.  This portion of the driver-set controls
> the Real Time Clock.
>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   drivers/rtc/Kconfig      |  13 ++
>   drivers/rtc/Makefile     |   1 +
>   drivers/rtc/rtc-st-lpc.c | 330 +++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 344 insertions(+)
>   create mode 100644 drivers/rtc/rtc-st-lpc.c
>
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index a168e96..aa4bd90 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1355,6 +1355,18 @@ config RTC_DRV_SIRFSOC
>   	  Say "yes" here to support the real time clock on SiRF SOC chips.
>   	  This driver can also be built as a module called rtc-sirfsoc.
>
> +config RTC_DRV_ST_LPC
> +	tristate "STMicroelectronics LPC RTC"
> +	depends on ARCH_STI
> +	depends on OF
> +	select MFD_ST_LPC
> +	help
> +	  Say Y here to include STMicroelectronics Low Power Controller
> +	  (LPC) based RTC support.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called rtc-st-lpc.
> +
>   config RTC_DRV_MOXART
>   	tristate "MOXA ART RTC"
>   	depends on ARCH_MOXART || COMPILE_TEST
> @@ -1390,4 +1402,5 @@ config RTC_DRV_HID_SENSOR_TIME
>   	  rtc-hid-sensor-time.
>
>
> +

Hi Lee,

Yet another empty line ?

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
