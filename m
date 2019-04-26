From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
Date: Fri, 26 Apr 2019 11:50:12 +0200
Message-ID: <20190426095012.xzyzevvmom4fzdcd@verge.net.au>
References: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
 <20190425111245.GA7258@vmlxhi-102.adit-jv.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190425111245.GA7258@vmlxhi-102.adit-jv.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tfranzen@de.adit-jv.com, Eugeniu Rosca <roscaeugeniu@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

from my point of view what is required is a review.
I will try to find someone to do so.
I apologise for not doing so earlier.

On Thu, Apr 25, 2019 at 01:12:45PM +0200, Eugeniu Rosca wrote:
> Hi Simon,
> 
> Do we have any chance getting this upstream? If so, would you kindly
> list the acceptance criteria we have to conform to?
> 
> Many thanks.
> 
> On Thu, Apr 11, 2019 at 02:41:03PM +0200, Spyridon Papageorgiou wrote:
> > This patch adds description of TI WL1837 and links interfaces
> > to communicate with the IC, namely the SDIO interface to WLAN.
> > 
> > Signed-off-by: Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>
> > ---
> >  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 49 ++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> > index 7a09576..27851a7 100644
> > --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> > @@ -38,6 +38,18 @@
> >  		regulator-min-microvolt = <5000000>;
> >  		regulator-max-microvolt = <5000000>;
> >  	};
> > +
> > +	wlan_en: regulator-wlan_en {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "wlan-en-regulator";
> > +
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&gpio_exp_74 4 GPIO_ACTIVE_HIGH>;
> > +		startup-delay-us = <70000>;
> > +		enable-active-high;
> > +	};
> >  };
> >  
> >  &can0 {
> > @@ -88,6 +100,13 @@
> >  			line-name = "Audio_Out_OFF";
> >  		};
> >  
> > +		sd-wifi-mux {
> > +			gpio-hog;
> > +			gpios = <5 GPIO_ACTIVE_HIGH>;
> > +			output-low;	/* Connect WL1837 */
> > +			line-name = "SD WiFi mux";
> > +		};
> > +
> >  		hub_pwen {
> >  			gpio-hog;
> >  			gpios = <6 GPIO_ACTIVE_HIGH>;
> > @@ -254,6 +273,12 @@
> >  		function = "scif1";
> >  	};
> >  
> > +	sdhi3_pins: sdhi3 {
> > +		groups = "sdhi3_data4", "sdhi3_ctrl";
> > +		function = "sdhi3";
> > +		power-source = <3300>;
> > +	};
> > +
> >  	usb0_pins: usb0 {
> >  		groups = "usb0";
> >  		function = "usb0";
> > @@ -273,6 +298,30 @@
> >  	status = "okay";
> >  };
> >  
> > +&sdhi3 {
> > +	pinctrl-0 = <&sdhi3_pins>;
> > +	pinctrl-names = "default";
> > +
> > +	vmmc-supply = <&wlan_en>;
> > +	vqmmc-supply = <&wlan_en>;
> > +	bus-width = <4>;
> > +	no-1-8-v;
> > +	non-removable;
> > +	cap-power-off-card;
> > +	keep-power-in-suspend;
> > +	max-frequency = <26000000>;
> > +	status = "okay";
> > +
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	wlcore: wlcore@2 {
> > +		compatible = "ti,wl1837";
> > +		reg = <2>;
> > +		interrupt-parent = <&gpio1>;
> > +		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> > +	};
> > +};
> > +
> >  &usb2_phy0 {
> >  	pinctrl-0 = <&usb0_pins>;
> >  	pinctrl-names = "default";
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Best regards,
> Eugeniu.
> 
