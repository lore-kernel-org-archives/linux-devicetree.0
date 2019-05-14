From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCHv1 3/8] arm64: dts: qcom: msm8916: Add entry-method
 property for the idle-states node
Date: Tue, 14 May 2019 18:12:05 +0200
Message-ID: <20190514161205.GB1824@centauri.ideon.se>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <030b5d9c6dc2e872466b7132e4fd65c473f9883f.1557486950.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <030b5d9c6dc2e872466b7132e4fd65c473f9883f.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2019 at 04:59:41PM +0530, Amit Kucheria wrote:
> The idle-states binding documentation[1] mentions that the
> 'entry-method' property is required on 64-bit platforms and must be set
> to "psci".
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 0803ca8c02da..ded1052e5693 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -158,6 +158,8 @@
>  		};
>  
>  		idle-states {
> +			entry-method="psci";
> +

Please add a space before and after "=".

With that:
Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>

>  			CPU_SPC: spc {
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x40000002>;
> -- 
> 2.17.1
> 
