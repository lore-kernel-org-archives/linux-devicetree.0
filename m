From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 10/14] arm64: dts: qcom: qcs404: Add OPP table
Date: Wed, 30 Jan 2019 10:11:12 +0530
Message-ID: <20190130044112.GE4635@vkoul-mobl>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548700381-22376-11-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548700381-22376-11-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, sibis@codeaurora.org, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

On 28-01-19, 19:32, Jorge Ramirez-Ortiz wrote:
> Add a CPU OPP table to qcs404
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 9b5c165..4594fea7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -62,6 +62,21 @@
>  		};
>  	};
>  
> +	cpu_opp_table: cpu_opp_table {

This should be:
        cpu_opp_table: cpu-opp-table

IIRC node names are not supposed to have _ and tags not supposed to have
-, please compile with W=12 to trigger these warnings :)

> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-1094400000 {
> +			opp-hz = /bits/ 64 <1094400000>;
> +		};
> +		opp-1248000000 {
> +			opp-hz = /bits/ 64 <1248000000>;
> +		};
> +		opp-1401600000 {
> +			opp-hz = /bits/ 64 <1401600000>;
> +		};
> +	};
> +
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-qcs404", "qcom,scm";
> -- 
> 2.7.4

-- 
~Vinod
