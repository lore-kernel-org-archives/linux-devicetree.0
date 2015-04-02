From: "chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [4/4] powerpc/85xx: support sleep feature on QorIQ SoCs with RCPM
Date: Thu, 2 Apr 2015 11:18:11 +0000
Message-ID: <1427973492199.86521@freescale.com>
References: <1427365095-26396-4-git-send-email-chenhui.zhao@freescale.com>,<20150331023507.GD5667@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150331023507.GD5667-vONcSABrMOVpTrP2zolEsF6hYfS7NtTn@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org



________________________________________
From: Wood Scott-B07421
Sent: Tuesday, March 31, 2015 10:35
To: Zhao Chenhui-B35336
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jin Zhengxiong-R64188
Subject: Re: [4/4] powerpc/85xx: support sleep feature on QorIQ SoCs with RCPM

On Thu, Mar 26, 2015 at 06:18:15PM +0800, chenhui zhao wrote:
> In sleep mode, the clocks of e500 cores and unused IP blocks is
> turned off. The IP blocks which are allowed to wake up the processor
> are still running.
>
> The sleep mode is equal to the Standby state in Linux. Use the
> command to enter sleep mode:
>   echo standby > /sys/power/state
>
> Signed-off-by: Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/powerpc/Kconfig                   |  3 +-
>  arch/powerpc/platforms/85xx/Kconfig    |  5 +++
>  arch/powerpc/platforms/85xx/Makefile   |  1 +
>  arch/powerpc/platforms/85xx/qoriq_pm.c | 59 ++++++++++++++++++++++++++++++++++
>  arch/powerpc/platforms/86xx/Kconfig    |  1 +
>  5 files changed, 67 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/platforms/85xx/qoriq_pm.c
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9846c83..162eb53 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -233,7 +233,7 @@ config ARCH_HIBERNATION_POSSIBLE
>  config ARCH_SUSPEND_POSSIBLE
>       def_bool y
>       depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
> -                (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
> +                FSL_SOC_BOOKE || PPC_86xx || PPC_PSERIES \
>                  || 44x || 40x
>
>  config PPC_DCR_NATIVE
> @@ -747,7 +747,6 @@ config FSL_PCI
>
>  config FSL_PMC
>       bool
> -     default y
>       depends on SUSPEND && (PPC_85xx || PPC_86xx)

Get rid of this depends line if you're going to use select instead.

> +static int qoriq_suspend_valid(suspend_state_t state)
> +{
> +     unsigned int pm_modes;
> +
> +     pm_modes = qoriq_pm_ops->get_pm_modes();
> +
> +     if ((state == PM_SUSPEND_STANDBY) && (pm_modes & FSL_PM_SLEEP))
> +             return 1;

Unnecessary parentheses around ==

-Scott

[chenhui] OK--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
