From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 06/19] ARM: multi_v7_defconfig: Remove stih41x phy Kconfig
 symbol.
Date: Tue, 18 Oct 2016 09:53:19 +0200
Message-ID: <ad2367f8-7c92-201a-59ec-1f0fc661d818@st.com>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-7-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473859677-9231-7-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi

On 09/14/2016 03:27 PM, Peter Griffin wrote:
> This IP is only found on STiH415/6 silicon and support
> for these SoCs is being removed from the kernel.
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: <kishon-l0cyMroinI0@public.gmane.org>

Acked-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

Applied on sti-defconfig-for-4.10 branch

Thanks 

> ---
>  arch/arm/configs/multi_v7_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 949ab7f..b26a541 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -855,7 +855,6 @@ CONFIG_PHY_ROCKCHIP_USB=m
>  CONFIG_PHY_QCOM_APQ8064_SATA=m
>  CONFIG_PHY_MIPHY28LP=y
>  CONFIG_PHY_RCAR_GEN2=m
> -CONFIG_PHY_STIH41X_USB=y
>  CONFIG_PHY_STIH407_USB=y
>  CONFIG_PHY_SUN4I_USB=y
>  CONFIG_PHY_SUN9I_USB=y
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
