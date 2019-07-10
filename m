From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 11/13] arm64: dts: qcom: qcs404: Add CPR and populate OPP
 table
Date: Wed, 10 Jul 2019 14:33:03 +0530
Message-ID: <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705095726.21433-12-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05-07-19, 11:57, Niklas Cassel wrote:
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
>  	cpu_opp_table: cpu-opp-table {
> -		compatible = "operating-points-v2";
> +		compatible = "operating-points-v2-kryo-cpu";
>  		opp-shared;
>  
>  		opp-1094400000 {
>  			opp-hz = /bits/ 64 <1094400000>;
> -			opp-microvolt = <1224000 1224000 1224000>;
> +			required-opps = <&cpr_opp1>;
>  		};
>  		opp-1248000000 {
>  			opp-hz = /bits/ 64 <1248000000>;
> -			opp-microvolt = <1288000 1288000 1288000>;
> +			required-opps = <&cpr_opp2>;
>  		};
>  		opp-1401600000 {
>  			opp-hz = /bits/ 64 <1401600000>;
> -			opp-microvolt = <1384000 1384000 1384000>;
> +			required-opps = <&cpr_opp3>;
> +		};
> +	};
> +
> +	cpr_opp_table: cpr-opp-table {
> +		compatible = "operating-points-v2-qcom-level";
> +
> +		cpr_opp1: opp1 {
> +			opp-level = <1>;
> +			qcom,opp-fuse-level = <1>;
> +			opp-hz = /bits/ 64 <1094400000>;
> +		};
> +		cpr_opp2: opp2 {
> +			opp-level = <2>;
> +			qcom,opp-fuse-level = <2>;
> +			opp-hz = /bits/ 64 <1248000000>;
> +		};
> +		cpr_opp3: opp3 {
> +			opp-level = <3>;
> +			qcom,opp-fuse-level = <3>;
> +			opp-hz = /bits/ 64 <1401600000>;
>  		};
>  	};

- Do we ever have cases more complex than this for this version of CPR ?

- What about multiple devices with same CPR table, not big LITTLE
  CPUs, but other devices like two different type of IO devices ? What
  will we do with opp-hz in those cases ?

- If there are no such cases, can we live without opp-hz being used
  here and reverse-engineer the highest frequency by looking directly
  at CPUs OPP table ? i.e. by looking at required-opps field.

-- 
viresh
