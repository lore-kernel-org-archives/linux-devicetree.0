From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845: Add clocks and iommus to
 WCN3990 WLAN node
Date: Fri, 01 Feb 2019 14:27:42 +0530
Message-ID: <f8a085407b751b26316ff91ebcae99f3@codeaurora.org>
References: <20190131051438.12867-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131051438.12867-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-01-31 10:44, Bjorn Andersson wrote:
> From: Douglas Anderson <dianders@chromium.org>
> 
> When commit be7019103469 ("dts: arm64/sdm845: Add WCN3990 WLAN module
> device node") was posted upstream no clocks were specified.  However,
> when the pack was picked into the Chrome OS kernel tree (allegedly
> directly from the mailing list post) it had clock properties.
> 
> I presume that the clock should be there, so let's add it.

Tested-by: Sibi Sankar <sibis@codeaurora.org>

> 
> Fixes: be7019103469 ("dts: arm64/sdm845: Add WCN3990 WLAN module device 
> node")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> [bjorn: Add also the required iommus property]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Hijacking Doug's fixup patch to also add the missing iommus property. 
> Without
> this the MTP reboots once the ath10k is trying to exercise the 
> copyengine.
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index cba09899282e..58f034664336 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2422,6 +2422,8 @@
>  			reg = <0 0x18800000 0 0x800000>;
>  			reg-names = "membase";
>  			memory-region = <&wlan_msa_mem>;
> +			clock-names = "cxo_ref_clk_pin";
> +			clocks = <&rpmhcc RPMH_RF_CLK2>;
>  			interrupts =
>  				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
>  				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
> @@ -2435,6 +2437,7 @@
>  				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
>  				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
>  				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&apps_smmu 0x0040 0x1>;
>  		};
>  	};

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
