From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v2 04/13] ARM: dts: ipq4019: Update ipq4019-dk01.1 board
 data
Date: Fri, 16 Mar 2018 15:50:28 +0530
Message-ID: <cd6561684acadd92d2112831abc0abd4@codeaurora.org>
References: <1521193101-4586-1-git-send-email-sricharan@codeaurora.org>
 <1521193101-4586-5-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521193101-4586-5-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-03-16 15:08, Sricharan R wrote:
> Adds missing memory, reserved-memory nodes.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

  Reviewed-by: Abhishek Sahu <absahu@codeaurora.org>

> ---
>  arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 28 
> +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> index e413b21e..ad0fbc9 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
> @@ -20,6 +20,34 @@
>  	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK01.1";
>  	compatible = "qcom,ipq4019";
> 
> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x10000000>; /* 256MB */
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		rsvd1@87000000 {
> +			/* Reserved for other subsystem */
> +			reg = <0x87000000 0x500000>;
> +			no-map;
> +		};
> +
> +		wifi_dump@87500000 {
> +			reg = <0x87500000 0x600000>;
> +			no-map;
> +		};
> +
> +		rsvd2@87B00000 {
> +			/* Reserved for other subsystem */
> +			reg = <0x87B00000 0x500000>;
> +			no-map;
> +		};
> +	};
> +
>  	soc {
>  		rng@22000 {
>  			status = "ok";
