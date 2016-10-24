From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: multi_v7_defconfig: Remove
 CONFIG_ST_THERMAL_MEMMAP Kconfig symbol
Date: Mon, 24 Oct 2016 11:14:08 +0100
Message-ID: <20161024101408.GA10440@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1477065443-10668-1-git-send-email-patrice.chotard@st.com>
 <1477065443-10668-4-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477065443-10668-4-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Patrice,

On Fri, 21 Oct 2016, patrice.chotard-qxv4g6HH51o@public.gmane.org wrote:

> From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
> 
> Driver code has been already removed, see
> http://www.spinics.net/lists/devicetree/msg143322.html
> Remove the multi_v7_defconfig part
> 
> Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
> Cc: <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 15b2f99..45e252b 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -450,7 +450,6 @@ CONFIG_RCAR_THERMAL=y
>  CONFIG_ARMADA_THERMAL=y
>  CONFIG_DAVINCI_WATCHDOG=m
>  CONFIG_EXYNOS_THERMAL=m
> -CONFIG_ST_THERMAL_MEMMAP=y

Are you sure you want to remove this?

This Kconfig symbol is still used for the stih407 family
thermal parts in drivers/thermal/st/st_thermal_memmap.c?

My patch only removed the stih415/6 parts from the driver.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
