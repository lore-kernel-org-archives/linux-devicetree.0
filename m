Return-Path: <SRS0=d+jh=OV=codeaurora.org=jhugo@kernel.org>
Subject: Re: [PATCH] arm64: dts: apq8096-db820c: Increase load on l21 for
 SDCARD
References: <1544634806-1037-1-git-send-email-loic.poulain@linaro.org>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <8c92dc30-cfbe-00e2-ae70-243455549ecd@codeaurora.org>
Date: Wed, 12 Dec 2018 10:23:30 -0700
MIME-Version: 1.0
In-Reply-To: <1544634806-1037-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Poulain <loic.poulain@linaro.org>, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 12/12/2018 10:13 AM, Loic Poulain wrote:
> In the same way as for msm8974-hammerhead, l21 load, used for SDCARD
> VMMC, needs to be increased in order to prevent any voltage drop issues
> (due to limited current) happening with some SDCARDS or during specific
> operations (e.g. write).
> 
> Fixes: 660a9763c6a9 (arm64: dts: qcom: db820c: Add pm8994 regulator node)
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index 104cad9..c15e2c0 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -634,6 +634,8 @@
>   				l21 {
>   					regulator-min-microvolt = <2950000>;
>   					regulator-max-microvolt = <2950000>;
> +					regulator-allow-set-load;
> +					regulator-system-load = <200000>;
>   				};
>   				l22 {
>   					regulator-min-microvolt = <3300000>;
> 

I'm curious, why not update sdhci-msm to set the load on the regulator?

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
