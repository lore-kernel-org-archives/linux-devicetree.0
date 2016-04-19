From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 05/13] ARM: dts: db600c: add pmic regulator supplies
Date: Tue, 19 Apr 2016 12:10:25 -0700
Message-ID: <571682A1.9010000@codeaurora.org>
References: <1460453642-5809-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1460453642-5809-6-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460453642-5809-6-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/12/2016 02:33 AM, Srinivas Kandagatla wrote:
> This patch adds pmic regulator supplies connected on the board.
> Rest of the invidual regulators would be added as and when required by
> the devices.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts | 62 +++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
> index 57d4500..6695b00 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
> @@ -9,7 +9,69 @@
>  		serial1 = &gsbi1_serial;
>  	};
>  
> +	regulators {
> +		compatible = "simple-bus";
> +		vph: regulator-fixed@1 {
> +			compatible = "regulator-fixed";
> +			regulator-min-microvolt = <4500000>;
> +			regulator-max-microvolt = <4500000>;
> +			regulator-name = "VPH";
> +			regulator-type = "voltage";
> +			regulator-boot-on;
> +		};
> +	};

Just curious why we added the vph supply? Is that for some framework
requirement? We haven't done this on other boards, although we probably
should if there's a good reason for it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
