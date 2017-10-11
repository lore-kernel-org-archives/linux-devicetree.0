From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: apq8096-db820c: always enable regulator
 LS expansion
Date: Tue, 10 Oct 2017 23:09:37 -0700
Message-ID: <20171011060937.GN1165@minitux>
References: <20170814113420.30866-1-srinivas.kandagatla@linaro.org>
 <20170814113420.30866-3-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170814113420.30866-3-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 14 Aug 04:34 PDT 2017, srinivas.kandagatla@linaro.org wrote:

> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> 1.8v regulator on LS expansion should be left as always to comply
> with 96boards spec.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index 18c61693529e..0c10bbe55317 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -189,9 +189,15 @@
>  					regulator-min-microvolt = <1300000>;
>  					regulator-max-microvolt = <1300000>;
>  				};
> +
> +				/**
> +				 * 1.8v required on LS expansion
> +				 * for mezzanine boards
> +				 */
>  				s4 {
>  					regulator-min-microvolt = <1800000>;
>  					regulator-max-microvolt = <1800000>;
> +					regulator-always-on;
>  				};
>  				s5 {
>  					regulator-min-microvolt = <2150000>;
> -- 
> 2.11.0
> 
