Return-Path: <SRS0=O932=OV=linaro.org=bjorn.andersson@kernel.org>
Date: Wed, 12 Dec 2018 11:46:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: apq8096-db820c: Increase load on l21 for
 SDCARD
Message-ID: <20181212194611.GH1578@tuxbook-pro>
References: <1544634806-1037-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544634806-1037-1-git-send-email-loic.poulain@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed 12 Dec 09:13 PST 2018, Loic Poulain wrote:

> In the same way as for msm8974-hammerhead, l21 load, used for SDCARD
> VMMC, needs to be increased in order to prevent any voltage drop issues
> (due to limited current) happening with some SDCARDS or during specific
> operations (e.g. write).
> 
> Fixes: 660a9763c6a9 (arm64: dts: qcom: db820c: Add pm8994 regulator node)
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I agree with Jeff, that the sdhci-msm (or mmc framework even) should
take care of this. But I suggest we merge this for now, regardless.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index 104cad9..c15e2c0 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -634,6 +634,8 @@
>  				l21 {
>  					regulator-min-microvolt = <2950000>;
>  					regulator-max-microvolt = <2950000>;
> +					regulator-allow-set-load;
> +					regulator-system-load = <200000>;
>  				};
>  				l22 {
>  					regulator-min-microvolt = <3300000>;
> -- 
> 2.7.4
> 
