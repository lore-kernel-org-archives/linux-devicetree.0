From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/6] arm64: dts: msm8992 SoC and LG Bullhead (Nexus 5X)
 support
Date: Thu, 27 Oct 2016 17:11:53 -0700
Message-ID: <20161028001153.GJ26139@codeaurora.org>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-2-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477394221-30963-2-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/25, Jeremy McNicoll wrote:
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5dd05de..439e40e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,6 +1,8 @@
> -dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb

This is unrelated. Perhaps make another patch to "correct" it.

>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
>  
>  always		:= $(dtb-y)
>  subdir-y	:= $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> new file mode 100644
> index 0000000..8bbf4f3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> @@ -0,0 +1,191 @@
> +
> +	soc: soc {

Do we need the soc phandle? If it isn't used we should leave it
out.

> +
> +		clock_gcc: qcom,gcc@fc400000 {

s/qcom,gcc/clock-controller/

Also we typically just give it a "gcc" phandle to be terse.

> +			compatible = "qcom,gcc-8994";

qcom,gcc-msm8994

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +			reg = <0xfc400000 0x2000>;
> +		};
> +	};
> +
> +	memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		device_type = "memory";
> +		reg = <0 0 0 0>; // bootloader will update
> +	};
> +
> +	clocks {
> +		xo_board: xo_board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +			clock-output-names = "xo_board";
> +		};
> +
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32768>;
> +			clock-output-names = "sleep_clk";

clock-output-names can be removed because we use the same string
as the node name.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
