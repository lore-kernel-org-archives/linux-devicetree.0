From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Mon, 05 Feb 2018 11:09:11 +0100
Message-ID: <1517825351.3175.3.camel@pengutronix.de>
References: <20180201174923.7385-1-l.stach@pengutronix.de>
         <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "A . s . Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, linux-imx-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 05.02.2018, 00:09 -0600 schrieb Rob Herring:
> On Thu, Feb 01, 2018 at 06:49:21PM +0100, Lucas Stach wrote:
> > This adds the binding for the i.MX8MQ pin controller, in the same
> > fashion as earlier i.MX SoCs.
> > 
> > > > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > v2: switch to generic pinconf properties
> > ---
> >  .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 39 ++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
> > new file mode 100644
> > index 000000000000..5c5d2d835d05
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
> > @@ -0,0 +1,39 @@
> > +* Freescale IMX8MQ IOMUX Controller
> > +
> > +Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> > +for common binding part and usage.
> > +
> > +=== Pin Controller Node ===
> > +
> > +Required properties:
> > +- compatible: "fsl,imx8mq-iomuxc"
> > +- reg: Must contain the base physical address and size of the iomuxc registers.
> > +
> > +=== Pin Configuration Node ===
> > +Required properties:
> > +- pinmux: Array of integersy, representing a group of pins mux setting.
> > > > +	The format is pinmux = <PIN_FUNC_ID>, PIN_FUNC_ID is a pin working on
> > > > +	a specific function.
> > +
> > > > +	Refer to imx8mq-pinfunc.h in device tree source folder for all available
> > > > +	imx8mq PIN_FUNC_ID.
> > +
> > +Optional Properties:
> > +- drive-strength		Integer: controls Drive Strength
> 
> I thought drive-strength is supposed to be be in mA. We should not have 
> differing units in common properties. 
> 
> There was an Atmel binding the other day that this came up.

I know it's in the common binding, but it's going to be very hard to
support. The drive-strength in mA really depends on external loading of
the pin and the pin voltage, at least for the most widespread
controllers that only switch between resistors, instead of driving the
pin by a current regulator.
So we would need much more information, which doesn't really seem
practical.

I would much prefer if we just remove unit from the common binding and
let the drivers define it in a way that fits their hardware
description.

It's the same thing with the slew-rate really, but the common binding
didn't make the mistake to define a single unit there, with many
pincontrollers being really vague about how fast the slew really is,
but some may actually define it in uS or whatever else makes sense.

Regards,
Lucas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
