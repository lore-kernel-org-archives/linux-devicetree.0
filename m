From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/3] arm64: qcom: Add support for Qualcomm MSM8916
 SoC
Date: Wed, 04 Mar 2015 14:33:31 -0800
Message-ID: <54F7883B.90704@codeaurora.org>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org> <1425503602-24916-2-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1425503602-24916-2-git-send-email-galak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: Abhimanyu Kapur <abhimany@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arm@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de
List-Id: devicetree@vger.kernel.org

On 03/04/15 13:13, Kumar Gala wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1b8e973..4c8b119 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -177,6 +177,15 @@ config ARCH_MEDIATEK
>  	help
>  	  Support for Mediatek MT65xx & MT81xx ARMv8 SoCs
>  
> +config ARCH_QCOM
> +	bool "Qualcomm Platforms"
> +	select ARCH_REQUIRE_GPIOLIB
> +	select COMMON_CLK_QCOM
> +	select PINCTRL
> +	select SOC_BUS

I imagine all we need is select PINCTRL here. SOC_BUS is not used, also
we shouldn't force COMMON_CLK_QCOM to be Y instead of M so please drop
that select. Also we dropped ARCH_REQUIRE_GPIOLIB in arm32 so it would
match if we just relied on ARCH_WANT_GPIOLIB that arm64 has by default

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
