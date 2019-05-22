From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/9] arm64: dts: qcom: msm8916: Add entry-method
 property for the idle-states node
Date: Tue, 21 May 2019 20:30:40 -0700
Message-ID: <20190522033040.GJ3137@builder>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <0374669560d13bba30dfa33cd10a0ad8a65b604b.1558430617.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0374669560d13bba30dfa33cd10a0ad8a65b604b.1558430617.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, agross@kernel.org, niklas.cassel@linaro.org, marc.w.gonzalez@free.fr, sibis@codeaurora.org, daniel.lezcano@linaro.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 21 May 02:35 PDT 2019, Amit Kucheria wrote:

> The idle-states binding documentation[1] mentions that the
> 'entry-method' property is required on 64-bit platforms and must be set
> to "psci".
> 
> [1] Documentation/devicetree/bindings/arm/idle-states.txt (see
> idle-states node)
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Picked up

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 0803ca8c02da..82ea5b8b37a2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -158,6 +158,8 @@
>  		};
>  
>  		idle-states {
> +			entry-method = "psci";
> +
>  			CPU_SPC: spc {
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x40000002>;
> -- 
> 2.17.1
> 
