From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v7 2/9] ARM: multi_v7_defconfig: Enable
 support for ST's LPC Watchdog
Date: Thu, 30 Apr 2015 13:16:53 +0200
Message-ID: <55420F25.2080205@st.com>
References: <1428590854-14095-1-git-send-email-lee.jones@linaro.org> <1428590854-14095-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428590854-14095-3-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, david.paris-qxv4g6HH51o@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 04/09/2015 04:47 PM, Lee Jones wrote:
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   arch/arm/configs/multi_v7_defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index b7e6b6fb..138e68a 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -324,6 +324,7 @@ CONFIG_WATCHDOG=y
>   CONFIG_XILINX_WATCHDOG=y
>   CONFIG_ARM_SP805_WATCHDOG=y
>   CONFIG_ORION_WATCHDOG=y
> +CONFIG_ST_LPC_WATCHDOG=y
>   CONFIG_SUNXI_WATCHDOG=y
>   CONFIG_MESON_WATCHDOG=y
>   CONFIG_MFD_AS3711=y
Applied to sti_defconfig-for_v4.2.

Thanks!
Maxime
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
