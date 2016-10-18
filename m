From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH 05/19] ARM: multi_v7_defconfig: Remove miphy365 phy.
Date: Tue, 18 Oct 2016 11:22:06 +0200
Message-ID: <91306f3f-1dc9-fe8c-1a08-5e47d20c5f70@st.com>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
 <1473859677-9231-6-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473859677-9231-6-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, devicetree@vger.kernel.org
Cc: lee.jones@linaro.org, kishon@ti.com
List-Id: devicetree@vger.kernel.org

Hi

On 09/14/2016 03:27 PM, Peter Griffin wrote:
> This IP is only found on STiH415/6 silicon and support
> for these SoCs is being removed from the kernel.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Cc: <kishon@ti.com>

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Applied on STi-defconfig-for-4.10 branch

Thanks

> ---
>  arch/arm/configs/multi_v7_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 2c8665c..949ab7f 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -854,7 +854,6 @@ CONFIG_PHY_ROCKCHIP_DP=m
>  CONFIG_PHY_ROCKCHIP_USB=m
>  CONFIG_PHY_QCOM_APQ8064_SATA=m
>  CONFIG_PHY_MIPHY28LP=y
> -CONFIG_PHY_MIPHY365X=y
>  CONFIG_PHY_RCAR_GEN2=m
>  CONFIG_PHY_STIH41X_USB=y
>  CONFIG_PHY_STIH407_USB=y
> 
