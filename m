From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 2/6] arm64: dts: apq8016-sbc: add support to hdmi audio
 via adv7533
Date: Mon, 9 Jan 2017 14:23:49 +0530
Message-ID: <5888fad6-edfd-1b9a-f9d7-da0e6ed68afc@codeaurora.org>
References: <1483536902-21450-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1483536902-21450-3-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483536902-21450-3-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 01/04/2017 07:04 PM, Srinivas Kandagatla wrote:
> This patch adds support to hdmi audio via adv7533.

Tested-by: Archit Taneja <architt@codeaurora.org>

>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 08bd5eb..5ab277f 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -85,6 +85,7 @@
>  				pinctrl-names = "default","sleep";
>  				pinctrl-0 = <&adv7533_int_active &adv7533_switch_active>;
>  				pinctrl-1 = <&adv7533_int_suspend &adv7533_switch_suspend>;
> +				#sound-dai-cells = <1>;
>
>  				ports {
>  					#address-cells = <1>;
> @@ -285,6 +286,15 @@
>                          qcom,audio-routing =
>                                  "AMIC2", "MIC BIAS Internal2",
>                                  "AMIC3", "MIC BIAS External1";
> +			external-dai-link@0 {
> +				link-name = "ADV7533";
> +				cpu { /* QUAT */
> +					sound-dai = <&lpass MI2S_QUATERNARY>;
> +				};
> +				codec {
> +					sound-dai = <&adv_bridge 0>;
> +				};
> +			};
>
>                          internal-codec-playback-dai-link@0 {            /* I2S - Internal codec */
>                                  link-name = "WCD";
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
