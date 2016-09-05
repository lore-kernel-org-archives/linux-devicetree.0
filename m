From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 5/7] ARM64: meson-gxbb: add USB Nodes
Date: Mon, 5 Sep 2016 02:23:33 +0200
Message-ID: <aa1ff8df-ab18-73e3-c39e-a1f75ab3eba0@suse.de>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-6-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160904213152.25837-6-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, jbrunet@baylibre.com, johnyoun@synopsys.com, kishon@ti.com, khilman@baylibre.com, carlo@caione.org, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, sboyd@codeaurora.org, mturquette@baylibre.com, will.deacon@arm.com, robh+dt@kernel.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

Am 04.09.2016 um 23:31 schrieb Martin Blumenstingl:
> Add the nodes for the dwc2 USB controller and the related USB PHYs.
> Currently we force usb0 to host mode because OTG is currently not
> working in our PHY driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 52 +++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 2e8a3d9..02dfc54 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -151,6 +151,34 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> +		usb-phys@c0000000 {
> +			compatible = "simple-bus";
> +			reg = <0x0 0xc0000000 0x0 0x40>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0x0 0x0 0x0 0xc0000000 0x0 0x40>;

Does this correspond to any physical bus or could we drop this layer?

> +
> +			usb0_phy: usb_phy@0 {

phy@0 to avoid the underscore in node name? dash otherwise.
If dropping the bus, *phy@c0000000 obviously.

> +				compatible = "amlogic,meson-gxbb-usb2-phy";
> +				#phy-cells = <0>;
> +				reg = <0x0 0x0 0x0 0x20>;
> +				resets = <&reset 34>;
> +				clocks = <&clkc CLKID_USB &clkc CLKID_USB0>;

<&clkc CLKID_USB>, <&clkc CLKID_USB0> please.

> +				clock-names = "usb_general", "usb";
> +				status = "disabled";
> +			};
> +
> +			usb1_phy: usb_phy@20 {
> +				compatible = "amlogic,meson-gxbb-usb2-phy";
> +				#phy-cells = <0>;
> +				reg = <0x0 0x20 0x0 0x20>;
> +				resets = <&reset 34>;
> +				clocks = <&clkc CLKID_USB &clkc CLKID_USB1>;

Ditto

> +				clock-names = "usb_general", "usb";
> +				status = "disabled";
> +			};
> +		};
> +
>  		cbus: cbus@c1100000 {
>  			compatible = "simple-bus";
>  			reg = <0x0 0xc1100000 0x0 0x100000>;
> @@ -496,6 +524,30 @@
>  			};
>  		};
>  
> +		usb0: usb-controller@c9000000 {

usb@c9000000 by convention.

> +			compatible = "amlogic,meson-gxbb-usb", "snps,dwc2";
> +			reg = <0x0 0xc9000000 0x0 0x40000>;
> +			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clkc CLKID_USB0_DDR_BRIDGE>;
> +			clock-names = "otg";
> +			phys = <&usb0_phy>;
> +			phy-names = "usb2-phy";
> +			dr_mode = "host";
> +			status = "disabled";
> +		};
> +
> +		usb1: usb-controller@c9100000 {

usb@c9100000

> +			compatible = "amlogic,meson-gxbb-usb", "snps,dwc2";
> +			reg = <0x0 0xc9100000 0x0 0x40000>;
> +			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
> +			clock-names = "otg";
> +			phys = <&usb1_phy>;
> +			phy-names = "usb2-phy";
> +			dr_mode = "host";
> +			status = "disabled";
> +		};
> +
>  		ethmac: ethernet@c9410000 {
>  			compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
>  			reg = <0x0 0xc9410000 0x0 0x10000

Thanks for the huge progress you guys have been making.

This patchset will probably clash with Neil's GXL preparations?

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
