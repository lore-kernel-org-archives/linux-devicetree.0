Return-Path: <SRS0=yC7f=GE=linaro.org=bjorn.andersson@kernel.org>
Date: Tue, 13 Mar 2018 19:52:44 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V4 4/6] arm64: dts: smem enablement for msm8992
Message-ID: <20180314025244.GD11034@tuxbook-pro>
References: <20170127195831.GH8801@codeaurora.org>
 <1485755073-6416-1-git-send-email-jeremymc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485755073-6416-1-git-send-email-jeremymc@redhat.com>
To: Jeremy McNicoll <jeremymc@redhat.com>
Cc: sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-clk@vger.kernel.org, andy.gross@linaro.org, robh@kernel.org, arnd@arndb.de, riteshh@codeaurora.org, git@kchr.de, ulf.hansson@linaro.org, jszhang@marvell.com
List-ID: <devicetree@vger.kernel.org>

On Sun 29 Jan 21:44 PST 2017, Jeremy McNicoll wrote:

> SMEM allows various subsystems/processors to share
> memory/data (heap format) in order to enable various
> peripherals.
> 

Fyi, the sfpb_mutex is actually called tcsr_mutex, but downstream kept
the old name...

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
> ---
> 
>  [ Moved sfpb_mutex and smem outside sock as they didn't have
>   'reg' entries.  Everything else is exactly the same. ]
> 
>  arch/arm64/boot/dts/qcom/msm8992.dtsi | 42 +++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> index 13fb6f7..1715787 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> @@ -79,6 +79,19 @@
>  		regulator-always-on;
>  	};
>  
> +	sfpb_mutex: hwmutex {
> +		compatible = "qcom,sfpb-mutex";
> +		syscon = <&sfpb_mutex_regs 0x0 0x100>;
> +		#hwlock-cells = <1>;
> +	};
> +
> +	smem {
> +		compatible = "qcom,smem";
> +		memory-region = <&smem_region>;
> +		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +		hwlocks = <&sfpb_mutex 3>;
> +	};
> +
>  	soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> @@ -93,6 +106,11 @@
>  				<0xf9002000 0x1000>;
>  		};
>  
> +		apcs: syscon@f900d000 {
> +			compatible = "syscon";
> +			reg = <0xf900d000 0x2000>;
> +		};
> +
>  		timer@f9020000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> @@ -183,12 +201,36 @@
>  			#power-domain-cells = <1>;
>  			reg = <0xfc400000 0x2000>;
>  		};
> +
> +		rpm_msg_ram: memory@fc428000 {
> +			compatible = "qcom,rpm-msg-ram";
> +			reg = <0xfc428000 0x4000>;
> +		};
> +
> +		sfpb_mutex_regs: syscon@fd484000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "syscon";
> +			reg = <0xfd484000 0x400>;
> +		};
>  	};
>  
>  	memory {
>  		device_type = "memory";
>  		reg = <0 0 0 0>; // bootloader will update
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		smem_region: smem@6a00000 {
> +			reg = <0x0 0x6a00000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +
>  };
>  
>  
> -- 
> 2.6.1
> 
