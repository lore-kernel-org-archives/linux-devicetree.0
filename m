From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 4/4] ARM: debug: qcom: Add APQ8084 DEBUG_LL UART support
Date: Wed, 21 May 2014 17:18:52 +0200
Message-ID: <4365639.JcFl1cP048@wuerfel>
References: <1400684225-21381-1-git-send-email-gdjakov@mm-sol.com> <1400684225-21381-5-git-send-email-gdjakov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1400684225-21381-5-git-send-email-gdjakov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <gdjakov@mm-sol.com>
Cc: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sboyd@codeaurora.org, rvaswani@codeaurora.org, davidb@codeaurora.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 21 May 2014 17:57:05 Georgi Djakov wrote:
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index eab8ecb..91d5184 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -101,6 +101,15 @@ choice
>                 bool "Kernel low-level debugging on 9263 and 9g45"
>                 depends on HAVE_AT91_DBGU1
>  
> +       config DEBUG_APQ8084_UART
> +               bool "Kernel low-level debugging messages via APQ8084 UART"
> +               depends on ARCH_QCOM
> +               select MSM_HAS_DEBUG_UART_HS
> +               select DEBUG_MSM_UART
> +               help
> +                 Say Y here if you want the debug print routines to direct
> +                 their output to the serial port on Qualcomm APQ8084 devices.
> +
>         config DEBUG_BCM2835
>                 bool "Kernel low-level debugging on BCM2835 PL011 UART"
>                 depends on ARCH_BCM2835
> diff --git a/arch/arm/include/debug/msm.S b/arch/arm/include/debug/msm.S
> index 9d653d4..178636d 100644
> --- a/arch/arm/include/debug/msm.S
> +++ b/arch/arm/include/debug/msm.S
> @@ -36,6 +36,11 @@
>  #define MSM_DEBUG_UART_PHYS    MSM_UART3_PHYS
>  #endif
>  
> +#ifdef CONFIG_DEBUG_APQ8084_UART
> +#define MSM_DEBUG_UART_BASE    0xFA75E000
> +#define MSM_DEBUG_UART_PHYS    0xF995E000
> +#endif
> +
>  #ifdef CONFIG_DEBUG_MSM8660_UART
>  #define MSM_DEBUG_UART_BASE    0xF0040000
>  #define MSM_DEBUG_UART_PHYS    0x19C40000
> 

Maybe we should move debug/msm.S over to use
CONFIG_DEBUG_UART_PHYS/CONFIG_DEBUG_UART_VIRT now?

	Arnd
