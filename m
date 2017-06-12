From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 11/13] ARM: dts: meson: add USB support on Meson8 and
 Meson8b
Date: Mon, 12 Jun 2017 09:36:54 +0200
Message-ID: <8824aaae-9fd3-91f1-8101-bfb6fdf72b3e@baylibre.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170611101644.28581-12-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170611101644.28581-12-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/11/2017 12:16 PM, Martin Blumenstingl wrote:
> This adds the DWC2 USB controller nodes and the corresponding USB2 PHY
> nodes to meson.dtsi (as the same - or at least a very similar) IP block
> is used on all SoCs (at the same physical address).
> Additionally meson8.dtsi and meson8b.dtsi add the required clocks to the
> DWC2 and USB2 PHY nodes, otherwise the DWC2 controller cannot be
> initialized by the dwc2 driver.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  arch/arm/boot/dts/meson.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/meson8.dtsi  | 24 ++++++++++++++++++++++++
>  arch/arm/boot/dts/meson8b.dtsi | 26 ++++++++++++++++++++++++++
>  3 files changed, 88 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index a210084398dc..1a7a72005954 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -130,6 +130,20 @@
>  				status = "disabled";
>  			};
>  
> +			usb0_phy: phy@8800 {
> +				compatible = "amlogic,meson-mx-usb2-phy";
> +				#phy-cells = <0>;
> +				reg = <0x8800 0x20>;
> +				status = "disabled";
> +			};
> +
> +			usb1_phy: phy@8820 {
> +				compatible = "amlogic,meson-mx-usb2-phy";
> +				#phy-cells = <0>;
> +				reg = <0x8820 0x20>;
> +				status = "disabled";
> +			};
> +
>  			spifc: spi@8c80 {
>  				compatible = "amlogic,meson6-spifc";
>  				reg = <0x8c80 0x80>;
> @@ -182,6 +196,30 @@
>  			};
>  		};
>  
> +		usb0: usb@c9040000 {
> +			compatible = "snps,dwc2";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0xc9040000 0x40000>;
> +			interrupts = <0 30 1>;

Same as patch 8

> +			phys = <&usb0_phy>;
> +			phy-names = "usb2-phy";
> +			dr_mode = "host";
> +			status = "disabled";
> +		};
> +
> +		usb1: usb@c90c0000 {
> +			compatible = "snps,dwc2";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0xc90c0000 0x40000>;
> +			interrupts = <0 31 1>;

Same as patch 8

> +			phys = <&usb1_phy>;
> +			phy-names = "usb2-phy";
> +			dr_mode = "host";
> +			status = "disabled";
> +		};
> +
>  		ethmac: ethernet@c9410000 {
>  			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
>  			reg = <0xc9410000 0x10000
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index a80181ddd416..7bfce6d8d0af 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -291,3 +291,27 @@
>  &uart_C {
>  	clocks = <&clkc CLKID_CLK81>;
>  };
> +
> +&usb0 {
> +	compatible = "amlogic,meson8-usb", "snps,dwc2";
> +	clocks = <&clkc CLKID_USB0_DDR_BRIDGE>;
> +	clock-names = "otg";
> +};
> +
> +&usb1 {
> +	compatible = "amlogic,meson8-usb", "snps,dwc2";
> +	clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
> +	clock-names = "otg";
> +};
> +
> +&usb0_phy {
> +	compatible = "amlogic,meson8-usb2-phy", "amlogic,meson-mx-usb2-phy";
> +	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
> +	clock-names = "usb_general", "usb";
> +};
> +
> +&usb1_phy {
> +	compatible = "amlogic,meson8-usb2-phy", "amlogic,meson-mx-usb2-phy";
> +	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
> +	clock-names = "usb_general", "usb";
> +};
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index 52aa3f68a6bd..aa4664713b66 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -205,3 +205,29 @@
>  &uart_C {
>  	clocks = <&clkc CLKID_CLK81>;
>  };
> +
> +&usb0 {
> +	compatible = "amlogic,meson8b-usb", "snps,dwc2";
> +	clocks = <&clkc CLKID_USB0_DDR_BRIDGE>;
> +	clock-names = "otg";
> +};
> +
> +&usb1 {
> +	compatible = "amlogic,meson8b-usb", "snps,dwc2";
> +	clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
> +	clock-names = "otg";
> +};
> +
> +&usb0_phy {
> +	compatible = "amlogic,meson8b-usb2-phy", "amlogic,meson-mx-usb2-phy";
> +	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
> +	clock-names = "usb_general", "usb";
> +	resets = <&reset RESET_USB_OTG>;
> +};
> +
> +&usb1_phy {
> +	compatible = "amlogic,meson8b-usb2-phy", "amlogic,meson-mx-usb2-phy";
> +	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
> +	clock-names = "usb_general", "usb";
> +	resets = <&reset RESET_USB_OTG>;
> +};
> 

Apart from that :
Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
