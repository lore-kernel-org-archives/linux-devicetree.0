From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v9 06/19] ARM: STi: DT: STiH407: Add FDMA driver dt nodes.
Date: Wed, 14 Sep 2016 13:59:39 +0200
Message-ID: <4a816a43-607a-784a-935c-d83c9436f285@st.com>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
 <1473081421-16555-7-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473081421-16555-7-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter

On 09/05/2016 03:16 PM, Peter Griffin wrote:
> These nodes are required to get the fdma driver working
> on STiH407 based silicon.
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 52 +++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> index d294e82..45cab30 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -821,5 +821,57 @@
>  			clock-frequency	= <600000000>;
>  			st,syscfg	= <&syscfg_core 0x224>;
>  		};
> +
> +		/* fdma audio */
> +		fdma0: dma-controller@8e20000 {
> +			compatible = "st,stih407-fdma-mpe31-11", "st,slim-rproc";
> +			reg = <0x8e20000 0x8000>,
> +			      <0x8e30000 0x3000>,
> +			      <0x8e37000 0x1000>,
> +			      <0x8e38000 0x8000>;
> +			reg-names = "slimcore", "dmem", "peripherals", "imem";
> +			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +			interrupts = <GIC_SPI 5 IRQ_TYPE_NONE>;
> +			dma-channels = <16>;
> +			#dma-cells = <3>;
> +		};
> +
> +		/* fdma app */
> +		fdma1: dma-controller@8e40000 {
> +			compatible = "st,stih407-fdma-mpe31-12", "st,slim-rproc";
> +			reg = <0x8e40000 0x8000>,
> +			      <0x8e50000 0x3000>,
> +			      <0x8e57000 0x1000>,
> +			      <0x8e58000 0x8000>;
> +			reg-names = "slimcore", "dmem", "peripherals", "imem";
> +			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
> +				<&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
> +				<&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
> +				<&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_NONE>;
> +			dma-channels = <16>;
> +			#dma-cells = <3>;
> +		};
> +
> +		/* fdma free running */
> +		fdma2: dma-controller@8e60000 {
> +			compatible = "st,stih407-fdma-mpe31-13", "st,slim-rproc";
> +			reg = <0x8e60000 0x8000>,
> +			      <0x8e70000 0x3000>,
> +			      <0x8e77000 0x1000>,
> +			      <0x8e78000 0x8000>;
> +			reg-names = "slimcore", "dmem", "peripherals", "imem";
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_NONE>;
> +			dma-channels = <16>;
> +			#dma-cells = <3>;
> +			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
> +				<&clk_s_c0_flexgen CLK_EXT2F_A9>,
> +				<&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
> +				<&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +		};
>  	};
>  };
> 

Applied for STi next

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
