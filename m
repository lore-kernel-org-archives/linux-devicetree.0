From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: add usb3-phy phandle for dwc3.
Date: Wed, 06 Dec 2017 12:20:06 +0100
Message-ID: <1756641.7q7fHBPi13@diego>
References: <20171206111008.3079-1-enric.balletbo@collabora.com> <20171206111008.3079-2-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171206111008.3079-2-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 6. Dezember 2017, 12:10:07 CET schrieb Enric Balletbo i Serra:
> This patch adds the usb3-phy for both of the two dwc3 controllers on
> rk3399.

This patch adds quite a bit more than the phy phandles though.

The powerdomain addition should definitly be a separate patch
and the usb3-grf clock as well.


Heiko


> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index 17e5e1a..c18ff88 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -397,9 +397,11 @@
>  		#size-cells = <2>;
>  		ranges;
>  		clocks = <&cru SCLK_USB3OTG0_REF>, <&cru SCLK_USB3OTG0_SUSPEND>,
> -			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_GRF>;
> +			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_RKSOC_AXI_PERF>,
> +			 <&cru ACLK_USB3>, <&cru ACLK_USB3_GRF>;
>  		clock-names = "ref_clk", "suspend_clk",
> -			      "bus_clk", "grf_clk";
> +			      "bus_clk", "aclk_usb3_rksoc_axi_perf",
> +			      "aclk_usb3", "grf_clk";
>  		status = "disabled";
> 
>  		usbdrd_dwc3_0: dwc3 {
> @@ -407,14 +409,15 @@
>  			reg = <0x0 0xfe800000 0x0 0x100000>;
>  			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH 0>;
>  			dr_mode = "otg";
> -			phys = <&u2phy0_otg>;
> -			phy-names = "usb2-phy";
> +			phys = <&u2phy0_otg>, <&tcphy0_usb3>;
> +			phy-names = "usb2-phy", "usb3-phy";
>  			phy_type = "utmi_wide";
>  			snps,dis_enblslpm_quirk;
>  			snps,dis-u2-freeclk-exists-quirk;
>  			snps,dis_u2_susphy_quirk;
>  			snps,dis-del-phy-power-chg-quirk;
>  			snps,dis-tx-ipgap-linecheck-quirk;
> +			power-domains = <&power RK3399_PD_USB3>;
>  			status = "disabled";
>  		};
>  	};
> @@ -425,9 +428,11 @@
>  		#size-cells = <2>;
>  		ranges;
>  		clocks = <&cru SCLK_USB3OTG1_REF>, <&cru SCLK_USB3OTG1_SUSPEND>,
> -			 <&cru ACLK_USB3OTG1>, <&cru ACLK_USB3_GRF>;
> +			 <&cru ACLK_USB3OTG1>, <&cru ACLK_USB3_RKSOC_AXI_PERF>,
> +			 <&cru ACLK_USB3>, <&cru ACLK_USB3_GRF>;
>  		clock-names = "ref_clk", "suspend_clk",
> -			      "bus_clk", "grf_clk";
> +			      "bus_clk", "aclk_usb3_rksoc_axi_perf",
> +			      "aclk_usb3", "grf_clk";
>  		status = "disabled";
> 
>  		usbdrd_dwc3_1: dwc3 {
> @@ -435,14 +440,15 @@
>  			reg = <0x0 0xfe900000 0x0 0x100000>;
>  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
>  			dr_mode = "otg";
> -			phys = <&u2phy1_otg>;
> -			phy-names = "usb2-phy";
> +			phys = <&u2phy1_otg>, <&tcphy1_usb3>;
> +			phy-names = "usb2-phy", "usb3-phy";
>  			phy_type = "utmi_wide";
>  			snps,dis_enblslpm_quirk;
>  			snps,dis-u2-freeclk-exists-quirk;
>  			snps,dis_u2_susphy_quirk;
>  			snps,dis-del-phy-power-chg-quirk;
>  			snps,dis-tx-ipgap-linecheck-quirk;
> +			power-domains = <&power RK3399_PD_USB3>;
>  			status = "disabled";
>  		};
>  	};
> @@ -991,6 +997,12 @@
>  				clocks = <&cru HCLK_SDIO>;
>  				pm_qos = <&qos_sdioaudio>;
>  			};
> +			pd_usb3@RK3399_PD_USB3 {
> +				reg = <RK3399_PD_USB3>;
> +				clocks = <&cru ACLK_USB3>;
> +				pm_qos = <&qos_usb_otg0>,
> +					 <&qos_usb_otg1>;
> +			};
>  			pd_vio@RK3399_PD_VIO {
>  				reg = <RK3399_PD_VIO>;
>  				#address-cells = <1>;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
