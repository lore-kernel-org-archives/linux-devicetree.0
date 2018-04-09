From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 5/7] arm64: dts: msm8996: Add rpmpd device node
Date: Mon, 09 Apr 2018 09:03:18 -0700
Message-ID: <152328979897.180276.15963925877442657158@swboyd.mtv.corp.google.com>
References: <20180316040824.21472-1-rnayak@codeaurora.org>
 <20180316040824.21472-6-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316040824.21472-6-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2018-03-15 21:08:22)
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 0a6f7952bbb1..43757a078146 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -297,6 +297,52 @@
>                                 #clock-cells = <1>;
>                         };
>  
> +                       rpmpd: qcom,rpmpd {

power-controller? power-domain-controller? power-domains? Or something
like that.

> +                               compatible = "qcom,rpmpd-msm8996";
> +                               #power-domain-cells = <1>;
> +                               operating-points-v2 = <&rpmpd_opp_table>, /* cx */
> +                                                     <&rpmpd_opp_table>, /* cx_ao */
> +                                                     <&rpmpd_opp_table>, /* cx_vfc */
> +                                                     <&rpmpd_opp_table>, /* mx */
> +                                                     <&rpmpd_opp_table>, /* mx_ao */
> +                                                     <&rpmpd_opp_table>, /* sscx */
> +                                                     <&rpmpd_opp_table>; /* sscx_vfc */
> +                       };
> +
> +                       rpmpd_opp_table: opp-table {

This should go into the root of the tree? Otherwise it may be populated
by the RPMh platform populate code which would be odd. We should go and
update the platform populate code to always ignore operating-points-v2
compatible nodes too.

> +                               compatible = "operating-points-v2", "operating-points-v2-qcom";

This is backwards? I thought more specific compatible went first.
