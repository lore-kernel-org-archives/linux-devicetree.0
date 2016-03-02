From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v12 08/14] arm64: dts: mt8173: Add display subsystem
 related nodes
Date: Wed, 2 Mar 2016 11:21:22 +0100
Message-ID: <56D6BEA2.3050001@gmail.com>
References: <1456845630-2786-1-git-send-email-p.zabel@pengutronix.de>
 <1456845630-2786-9-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456845630-2786-9-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 01/03/16 16:20, Philipp Zabel wrote:
> From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> This patch adds the device nodes for the DISP function blocks
> comprising the display subsystem.
>
> Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Changes since v10:
>   - reordered nodes by address
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 235 +++++++++++++++++++++++++++++++
>   1 file changed, 235 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 8048811..4ff666d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -26,6 +26,23 @@
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>
> +	aliases {
> +		ovl0 = &ovl0;
> +		ovl1 = &ovl1;
> +		rdma0 = &rdma0;
> +		rdma1 = &rdma1;
> +		rdma2 = &rdma2;
> +		wdma0 = &wdma0;
> +		wdma1 = &wdma1;
> +		color0 = &color0;
> +		color1 = &color1;
> +		split0 = &split0;
> +		split1 = &split1;
> +		dpi0 = &dpi0;
> +		dsi0 = &dsi0;
> +		dsi1 = &dsi1;
> +	};
> +
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> @@ -295,6 +312,26 @@
>   			#clock-cells = <1>;
>   		};
>
> +		mipi_tx0: mipi-dphy@10215000 {
> +			compatible = "mediatek,mt8173-mipi-tx";
> +			reg = <0 0x10215000 0 0x1000>;
> +			clocks = <&clk26m>;
> +			clock-output-names = "mipi_tx0_pll";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		mipi_tx1: mipi-dphy@10216000 {
> +			compatible = "mediatek,mt8173-mipi-tx";
> +			reg = <0 0x10216000 0 0x1000>;
> +			clocks = <&clk26m>;
> +			clock-output-names = "mipi_tx1_pll";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		gic: interrupt-controller@10220000 {
>   			compatible = "arm,gic-400";
>   			#interrupt-cells = <3>;
> @@ -441,6 +478,14 @@
>   			status = "disabled";
>   		};
>
> +		hdmiddc0: i2c@11012000 {
> +			compatible = "mediatek,mt8173-hdmi-ddc";
> +			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
> +			reg = <0 0x11012000 0 0x1C>;
> +			clocks = <&pericfg CLK_PERI_I2C5>;
> +			clock-names = "ddc-i2c";
> +		};
> +
>   		i2c6: i2c@11013000 {
>   			compatible = "mediatek,mt8173-i2c";
>   			reg = <0 0x11013000 0 0x70>,
> @@ -576,7 +621,183 @@
>   		mmsys: clock-controller@14000000 {
>   			compatible = "mediatek,mt8173-mmsys", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
> +			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   			#clock-cells = <1>;
> +
> +			/* FIXME - remove iommus here */
> +			iommus = <&iommu M4U_PORT_DISP_OVL0>,
> +				 <&iommu M4U_PORT_DISP_OVL1>;
> +		};

Do we need this iommus?
Sorry I wasn't able to follow this series, but it looks suspicious here :)

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
