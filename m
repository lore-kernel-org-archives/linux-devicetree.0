From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/6] ARM: configs: stm32: enable ADC driver
Date: Sat, 19 Nov 2016 12:21:55 +0000
Message-ID: <3f6d8fdd-31ed-06a1-22c0-ce6f06dead81@kernel.org>
References: <1479223861-21747-1-git-send-email-fabrice.gasnier@st.com>
 <1479223861-21747-5-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479223861-21747-5-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15/11/16 15:30, Fabrice Gasnier wrote:
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
The driver is now on it's way in.  I'm assuming this and the two device tree patches
will go via the relevant route to arm-soc.

Thanks,

Jonathan
> ---
>  arch/arm/configs/stm32_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
> index 1e5ec2a..5d241e0 100644
> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -57,6 +57,9 @@ CONFIG_LEDS_TRIGGERS=y
>  CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>  CONFIG_DMADEVICES=y
>  CONFIG_STM32_DMA=y
> +CONFIG_IIO=y
> +CONFIG_STM32_ADC_CORE=y
> +CONFIG_STM32_ADC=y
>  # CONFIG_FILE_LOCKING is not set
>  # CONFIG_DNOTIFY is not set
>  # CONFIG_INOTIFY_USER is not set
> 
