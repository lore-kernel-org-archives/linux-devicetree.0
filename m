From: Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: configs: stm32: Enable ARM_MPU
Date: Wed, 13 Dec 2017 10:11:32 +0000
Message-ID: <5d8f2c2f-ca2e-632e-bac6-29299dda724e@arm.com>
References: <1513101746-18030-1-git-send-email-alexandre.torgue@st.com>
 <1513101746-18030-3-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513101746-18030-3-git-send-email-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/12/17 18:02, Alexandre Torgue wrote:
> STM32 MCUs embed a Memory Protection Unit. Enabling this setting will
> allow the Kernel to configure the MPU according to devicetree.

Would it be better to "select ARM_MPU" for machines with Cortex-M7?

Vladimir

> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> 
> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
> index bb358ff..e642bdf9 100644
> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -24,6 +24,7 @@ CONFIG_SET_MEM_PARAM=y
>  CONFIG_DRAM_BASE=0x90000000
>  CONFIG_FLASH_MEM_BASE=0x08000000
>  CONFIG_FLASH_SIZE=0x00200000
> +CONFIG_ARM_MPU=y
>  CONFIG_PREEMPT=y
>  # CONFIG_ATAGS is not set
>  CONFIG_ZBOOT_ROM_TEXT=0x0
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
