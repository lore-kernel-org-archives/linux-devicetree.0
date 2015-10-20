Return-Path: <ck.hu@mediatek.com>
Message-ID: <1445321536.19417.5.camel@mtksdaap41>
Subject: RE: [RFC 1/2] Dcumentation: bridge: Add documentation for ps8640 DT
 properties
From: CK Hu <ck.hu@mediatek.com>
Date: Tue, 20 Oct 2015 14:12:16 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, "; Pawel Moll" <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, "; David Airlie" <airlied@linux.ie>, Matthias, "Jitao Shi  <jitao.shi@mediatek.com>, ; Thierry Reding" <treding@nvidia.com>, "; Ajay Kumar" <ajaykumar.rs@samsung.com>, "; Inki Dae" <inki.dae@samsung.com>, Rahul, "Sean Paul  <seanpaul@chromium.org>, ; Vincent Palatin" <vpalatin@chromium.org>, "; Andy Yan" <andy.yan@rock-chips.com>, "; Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha, Yingjoe, Eddie Huang <eddie.huang@mediatek.com>, "; Cawa Cheng" <cawa.cheng@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Hi, Mark:

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland@arm.com]
> Sent: Friday, October 16, 2015 9:05 PM
> > +++ b/Documentation/devicetree/bindings/video/bridge/ps8640.txt
> > @@ -0,0 +1,48 @@
> > +ps8640-bridge bindings
> > +
> > +Required properties:
> > +	- compatible: "parade,ps8640"
> > +	- reg: first i2c address of the bridge
> 
> Ther can be multiple addresses?

It means that the reg is the first page address of the continuous pages.

> 
> > +	- power-gpios: OF device-tree gpio specification for power pin.
> > +	- reset-gpios: OF device-tree gpio specification for reset pin.
> > +	- mode-sel-gpios: OF device-tree gpio specification for mode-sel
pin.
> > +	- ps8640-1v2-supply: OF device-tree regulator specification for
1v2.
> > +	- ps8640-3v3-supply: OF device-tree regulator specification for
3v3.
> 
> There's no need for the "ps8640-" prefix on these two. Please drop it.

OK, we will fix it in next patch.

> 
> > +Optional properties:
> > +	- video interfaces: Device node can contain video interface port
> > +			    nodes for panel according to [1].
> 
> Replace this part with:
> 
> The device node can contain video interface port nodes per the
> video-interfaces binding [1].

OK, we will fix it in next patch.

> 
> Thanks,
> Mark.
> 
> > +
> > +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +Example:
> > +	edp-bridge@18 {
> > +		compatible = "parade,ps8640";
> > +		reg = <0x18>;
> > +		power-gpios = <&pio 116 GPIO_ACTIVE_HIGH>;
> > +		reset-gpios = <&pio 115 GPIO_ACTIVE_HIGH>;
> > +		mode-sel-gpios = <&pio 92 GPIO_ACTIVE_HIGH>;
> > +		ps8640-1v2-supply = <&ps8640_fixed_1v2>;
> > +		ps8640-3v3-supply = <&mt6397_vgp2_reg>;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				ps8640_in: endpoint {
> > +					remote-endpoint = <&dsi0_out>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +
> > +				ps8640_out: endpoint {
> > +					remote-endpoint = <&panel_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> > --
> > 1.7.9.5
> >
