From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: qcom: Add apq8064 CoreSight components
Date: Thu, 17 Nov 2016 12:04:49 -0700
Message-ID: <20161117190449.GB7884@linaro.org>
References: <20161117153609.11705-1-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161117153609.11705-1-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iivanov.xz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 17, 2016 at 05:36:09PM +0200, Georgi Djakov wrote:
> From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Add initial set of CoreSight components found on Qualcomm's
> 8064 chipset.
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064-coresight.dtsi | 196 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/qcom-apq8064.dtsi           |  11 +-
>  2 files changed, 203 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/boot/dts/qcom-apq8064-coresight.dtsi
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-coresight.dtsi b/arch/arm/boot/dts/qcom-apq8064-coresight.dtsi
> new file mode 100644
> index 000000000000..9395fddb1bf0
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-apq8064-coresight.dtsi
> @@ -0,0 +1,196 @@
> +/*
> + * Copyright (c) 2015, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +&soc {
> +
> +	etb@1a01000 {
> +		compatible = "coresight-etb10", "arm,primecell";
> +		reg = <0x1a01000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_QDSS_CLK>;
> +		clock-names = "apb_pclk";
> +
> +		port {
> +			etb_in: endpoint {
> +				slave-mode;
> +				remote-endpoint = <&replicator_out0>;
> +			};
> +		};
> +	};
> +
> +	tpiu@1a03000 {
> +		compatible = "arm,coresight-tpiu", "arm,primecell";
> +		reg = <0x1a03000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_QDSS_CLK>;
> +		clock-names = "apb_pclk";
> +
> +		port {
> +			tpiu_in: endpoint {
> +				slave-mode;
> +				remote-endpoint = <&replicator_out1>;
> +			};
> +		};
> +	};
> +
> +	replicator {
> +		compatible = "arm,coresight-replicator";
> +
> +		clocks = <&rpmcc RPM_QDSS_CLK>;
> +		clock-names = "apb_pclk";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				replicator_out0: endpoint {
> +					remote-endpoint = <&etb_in>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				replicator_out1: endpoint {
> +					remote-endpoint = <&tpiu_in>;
> +				};
> +			};
> +			port@2 {
> +				reg = <0>;
> +				replicator_in: endpoint {
> +					slave-mode;
> +					remote-endpoint = <&funnel_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@1a04000 {
> +		compatible = "arm,coresight-funnel", "arm,primecell";
> +		reg = <0x1a04000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_QDSS_CLK>;
> +		clock-names = "apb_pclk";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/*
> +			 * Not described input ports:
> +			 * 2 - connected to STM component
> +			 * 3 - not-connected
> +			 * 6 - not-connected
> +			 * 7 - not-connected
> +			 */
> +			port@0 {
> +				reg = <0>;
> +				funnel_in0: endpoint {
> +					slave-mode;
> +					remote-endpoint = <&etm0_out>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				funnel_in1: endpoint {
> +					slave-mode;
> +					remote-endpoint = <&etm1_out>;
> +				};
> +			};
> +			port@4 {
> +				reg = <4>;
> +				funnel_in4: endpoint {
> +					slave-mode;
> +					remote-endpoint = <&etm2_out>;
> +				};
> +			};
> +			port@5 {
> +				reg = <5>;
> +				funnel_in5: endpoint {
> +					slave-mode;
> +					remote-endpoint = <&etm3_out>;
> +				};
> +			};
> +			port@8 {
> +				reg = <0>;
> +				funnel_out: endpoint {
> +					remote-endpoint = <&replicator_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@1a1c000 {
> +		compatible = "arm,coresight-etm3x", "arm,primecell";
> +		reg = <0x1a1c000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_QDSS_CLK>;
> +		clock-names = "apb_pclk";
> +
> +		cpu = <&CPU0>;
> +
> +		port {
> +			etm0_out: endpoint {
> +				remote-endpoint = <&funnel_in0>;
> +			};
> +		};
> +	};
> +
> +	etm@1a1d000 {
> +		compatible = "arm,coresight-etm3x", "arm,primecell";
> +		reg = <0x1a1d000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_QDSS_CLK>;
> +		clock-names = "apb_pclk";
> +
> +		cpu = <&CPU1>;
> +
> +		port {
> +			etm1_out: endpoint {
> +				remote-endpoint = <&funnel_in1>;
> +			};
> +		};
> +	};
> +
> +	etm@1a1e000 {
> +		compatible = "arm,coresight-etm3x", "arm,primecell";
> +		reg = <0x1a1e000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_QDSS_CLK>;
> +		clock-names = "apb_pclk";
> +
> +		cpu = <&CPU2>;
> +
> +		port {
> +			etm2_out: endpoint {
> +				remote-endpoint = <&funnel_in4>;
> +			};
> +		};
> +	};
> +
> +	etm@1a1f000 {
> +		compatible = "arm,coresight-etm3x", "arm,primecell";
> +		reg = <0x1a1f000 0x1000>;
> +
> +		clocks = <&rpmcc RPM_QDSS_CLK>;
> +		clock-names = "apb_pclk";
> +
> +		cpu = <&CPU3>;
> +
> +		port {
> +			etm3_out: endpoint {
> +				remote-endpoint = <&funnel_in5>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 268bd470c865..18469c632e2f 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -4,6 +4,7 @@
>  #include <dt-bindings/clock/qcom,gcc-msm8960.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/soc/qcom,gsbi.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -27,7 +28,7 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		cpu@0 {
> +		CPU0: cpu@0 {
>  			compatible = "qcom,krait";
>  			enable-method = "qcom,kpss-acc-v1";
>  			device_type = "cpu";
> @@ -38,7 +39,7 @@
>  			cpu-idle-states = <&CPU_SPC>;
>  		};
>  
> -		cpu@1 {
> +		CPU1: cpu@1 {
>  			compatible = "qcom,krait";
>  			enable-method = "qcom,kpss-acc-v1";
>  			device_type = "cpu";
> @@ -49,7 +50,7 @@
>  			cpu-idle-states = <&CPU_SPC>;
>  		};
>  
> -		cpu@2 {
> +		CPU2: cpu@2 {
>  			compatible = "qcom,krait";
>  			enable-method = "qcom,kpss-acc-v1";
>  			device_type = "cpu";
> @@ -60,7 +61,7 @@
>  			cpu-idle-states = <&CPU_SPC>;
>  		};
>  
> -		cpu@3 {
> +		CPU3: cpu@3 {
>  			compatible = "qcom,krait";
>  			enable-method = "qcom,kpss-acc-v1";
>  			device_type = "cpu";
> @@ -1418,4 +1419,6 @@
>  		};
>  	};
>  };
> +
> +#include "qcom-apq8064-coresight.dtsi"
>  #include "qcom-apq8064-pins.dtsi"

Acked-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
