From: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v4 16/18] ARM: STi: DT: STiH407: Add uniperif player dt
 nodes
Date: Tue, 31 May 2016 11:14:48 +0200
Message-ID: <574D5608.3080800@st.com>
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
 <1464192412-16386-18-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464192412-16386-18-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/25/2016 06:06 PM, Peter Griffin wrote:
> This patch adds the DT nodes for the uniperif player
> IP blocks found on STiH407 family silicon.
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 76 +++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> index 60f95b6..7ca149b 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -755,5 +755,81 @@
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_spdif_out >;
>  		};
> +
> +		sti_uni_player0: sti-uni-player@0 {
> +			compatible = "st,sti-uni-player";
> +			status = "disabled";
> +			#sound-dai-cells = <0>;
> +			st,syscfg = <&syscfg_core>;
> +			clocks = <&clk_s_d0_flexgen CLK_PCM_0>;
> +			assigned-clocks = <&clk_s_d0_flexgen CLK_PCM_0>;
> +			assigned-clock-parents = <&clk_s_d0_quadfs 0>;
This does not work properly. You need to declare parent like this:
assigned-clocks = <&clk_s_d0_quadfs 0>, <&clk_s_d0_flexgen CLK_PCM_0>;
assigned-clock-parents = <0>, <&clk_s_d0_quadfs 0>;

> +			assigned-clock-rates = <50000000>;
> +			reg = <0x8D80000 0x158>;
> +			interrupts = <GIC_SPI 84 IRQ_TYPE_NONE>;
> +			dmas = <&fdma0 2 0 1>;
> +			dai-name = "Uni Player #0 (HDMI)";
> +			dma-names = "tx";
> +			st,uniperiph-id = <0>;
> +			st,version = <5>;
> +			st,mode = "HDMI";
> +		};
> +
> +		sti_uni_player1: sti-uni-player@1 {
> +			compatible = "st,sti-uni-player";
> +			status = "disabled";
> +			#sound-dai-cells = <0>;
> +			st,syscfg = <&syscfg_core>;
> +			clocks = <&clk_s_d0_flexgen CLK_PCM_1>;
> +			assigned-clocks = <&clk_s_d0_flexgen CLK_PCM_1>;
> +			assigned-clock-parents = <&clk_s_d0_quadfs 1>;
assigned-clocks = <&clk_s_d0_quadfs 1>, <&clk_s_d0_flexgen CLK_PCM_1>;
assigned-clock-parents = <0>, <&clk_s_d0_quadfs 1>;

> +			assigned-clock-rates = <50000000>;
> +			reg = <0x8D81000 0x158>;
> +			interrupts = <GIC_SPI 85 IRQ_TYPE_NONE>;
> +			dmas = <&fdma0 3 0 1>;
> +			dai-name = "Uni Player #1 (PIO)";
> +			dma-names = "tx";
> +			st,uniperiph-id = <1>;
> +			st,version = <5>;
> +			st,mode = "PCM";
> +		};
> +
> +		sti_uni_player2: sti-uni-player@2 {
> +			compatible = "st,sti-uni-player";
> +			status = "disabled";
> +			#sound-dai-cells = <0>;
> +			st,syscfg = <&syscfg_core>;
> +			clocks = <&clk_s_d0_flexgen CLK_PCM_2>;
> +			assigned-clocks = <&clk_s_d0_flexgen CLK_PCM_2>;
> +			assigned-clock-parents = <&clk_s_d0_quadfs 2>;
assigned-clocks = <&clk_s_d0_quadfs 2>, <&clk_s_d0_flexgen CLK_PCM_2>;
assigned-clock-parents = <0>, <&clk_s_d0_quadfs 2>;
> +			assigned-clock-rates = <50000000>;
> +			reg = <0x8D82000 0x158>;
> +			interrupts = <GIC_SPI 86 IRQ_TYPE_NONE>;
> +			dmas = <&fdma0 4 0 1>;
> +			dai-name = "Uni Player #1 (DAC)";
> +			dma-names = "tx";
> +			st,uniperiph-id = <2>;
> +			st,version = <5>;
> +			st,mode = "PCM";
> +		};
> +
> +		sti_uni_player3: sti-uni-player@3 {
> +			compatible = "st,sti-uni-player";
> +			status = "disabled";
> +			#sound-dai-cells = <0>;
> +			st,syscfg = <&syscfg_core>;
> +			clocks = <&clk_s_d0_flexgen CLK_SPDIFF>;
> +			assigned-clocks = <&clk_s_d0_flexgen CLK_SPDIFF>;
> +			assigned-clock-parents = <&clk_s_d0_quadfs 3>;
> +			assigned-clock-rates = <50000000>;
assigned-clocks = <&clk_s_d0_quadfs 3>, <&clk_s_d0_flexgen CLK_SPDIFF>;
assigned-clock-parents = <0>, <&clk_s_d0_quadfs 3>;

Regards,
Arnaud
> +			reg = <0x8D85000 0x158>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_NONE>;
> +			dmas = <&fdma0 7 0 1>;
> +			dma-names = "tx";
> +			dai-name = "Uni Player #1 (PIO)";
> +			st,uniperiph-id = <3>;
> +			st,version = <5>;
> +			st,mode = "SPDIF";
> +		};
>  	};
>  };
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
