From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: uniphier: add USB3 controller reset support
Date: Wed, 04 Jul 2018 10:09:38 +0900
Message-ID: <20180704100938.8235.4A936039@socionext.com>
References: <1530259891-18822-2-git-send-email-hayashi.kunihiko@socionext.com> <20180703233747.GA850@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703233747.GA850@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, 3 Jul 2018 17:37:47 -0600 <robh@kernel.org> wrote:

> On Fri, Jun 29, 2018 at 05:11:30PM +0900, Kunihiko Hayashi wrote:
> > Add DT bindings for reset control of USB3 controller implemented in
> > UniPhier SoCs.
> > 
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > ---
> >  .../devicetree/bindings/reset/uniphier-reset.txt   | 45 ++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/uniphier-reset.txt b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> > index 93efed6..f21d81c 100644
> > --- a/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> > +++ b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> > @@ -118,3 +118,48 @@ Example:
> >  
> >  		other nodes ...
> >  	};
> > +
> > +
> > +USB3 controller reset
> > +---------------------
> > +
> > +Required properties:
> > +- compatible: Should be
> > +    "socionext,uniphier-pro4-usb3-reset" - for Pro4 SoC
> > +    "socionext,uniphier-pxs2-usb3-reset" - for PXs2 SoC
> > +    "socionext,uniphier-ld20-usb3-reset" - for LD20 SoC
> > +    "socionext,uniphier-pxs3-usb3-reset" - for PXs3 SoC
> > +- #reset-cells: Should be 1.
> > +- reg: Specifies offset and length of the register set for the device.
> > +- clocks: A list of phandles to the clock gate for USB3 glue layer.
> > +	According to the clock-names, appropriate clocks are required.
> > +- clock-names: Should contain
> > +    "gio", "link" - for Pro4 SoC
> > +    "link"        - for others
> > +- resets: A list of phandles to the reset control for USB3 glue layer.
> > +	According to the reset-names, appropriate resets are required.
> > +- reset-names: Should contain
> > +    "gio", "link" - for Pro4 SoC
> > +    "link"        - for others
> > +
> > +Example:
> > +
> > +	usb-glue@65b00000 {
> > +		compatible = "socionext,uniphier-ld20-dwc3-glue",
> > +			     "simple-mfd";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges = <0 0x65b00000 0x400>;
> > +
> > +		usb_rst: reset@0 {
> > +			compatible = "socionext,uniphier-ld20-usb3-reset";
> 
> This looks weird. You have a reset controller within the USB block? And 
> then a parent reset controller too?

Yes, this reset control is included in USB3 glue layer, and this is necessary 
to enable USB3 core. The following diagram shows those relationships.

	USB3 block
	|
	+---USB3 glue layer
	|   |
	|   +--- usb3-reset
	|   |
	|   +--- usb3-regluator
	|   |
	|   +--- usb3-phy
	|
	+---USB3 core

The system reset, as parent reset controller, is necessary to enable
the entire USB3 block including the glue layer.

> > +			reg = <0x0 0x4>;
> > +			#reset-cells = <1>;
> > +			clock-names = "link";
> > +			clocks = <&sys_clk 14>;
> > +			clock-names = "link";
> > +			resets = <&sys_rst 14>;
> > +		};
> > +
> > +		other nodes ...
> 
> What other nodes?

As mentioned above, the glue layer consists of reset, regulator, and phy.
I assume that the "other nodes" mean that these nodes are placed.

Thank you,

---
Best Regards,
Kunihiko Hayashi
