From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8998-mtp: Add external SD
Date: Thu, 15 Nov 2018 11:05:59 -0800
Message-ID: <20181115190559.GA17484@hector>
References: <1542302291-6864-1-git-send-email-jhugo@codeaurora.org>
 <1542302291-6864-5-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542302291-6864-5-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: david.brown@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 10:18:11AM -0700, Jeffrey Hugo wrote:
> The externally accessible SD card slot on the MTP is driven by SDCC2.
> Wire it up for use.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 13 +++++++++++++
>  arch/arm64/boot/dts/qcom/msm8998.dtsi     |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> index b4276da..a90b427 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> @@ -241,3 +241,16 @@
>  		};
>  	};
>  };
> +
> +&sdhc2 {
> +	status = "okay";
> +        cd-gpios = <&tlmm 95 GPIO_ACTIVE_LOW>;
> +
> +        vmmc-supply = <&vreg_l21a_2p95>;
> +        vqmmc-supply = <&vreg_l13a_2p95>;
> +
> +        pinctrl-names = "default", "sleep";
> +        pinctrl-0 = <&sdc2_clk_on  &sdc2_cmd_on  &sdc2_data_on  &sdc2_cd_on>;
> +        pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;

Fix to use tabs instead of spaces.


Regards,
Andy
