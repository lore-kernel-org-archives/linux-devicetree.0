From: jacopo <jacopo@jmondi.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Thu, 23 Mar 2017 17:02:04 +0100
Message-ID: <20170323160204.GL30223@w540>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWT6vJNmMhYzMEqYRbuT=W=ZuND-WfG812LfH0r0AzM_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWT6vJNmMhYzMEqYRbuT=W=ZuND-WfG812LfH0r0AzM_g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,
   thanks for review

On Wed, Mar 22, 2017 at 11:33:50AM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
> 
> On Mon, Mar 20, 2017 at 5:14 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Add device tree bindings documentation for Renesas RZ/A1 gpio and pin
> 
> for the Renesas ...
> 
> > controller.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 144 +++++++++++++++++++++
> >  1 file changed, 144 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> > new file mode 100644
> > index 0000000..0474860
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> > @@ -0,0 +1,144 @@
> > +Renesas RZ/A1 combined Pin and GPIO controller
> > +
> > +Renesas SoCs of RZ/A1 family feature a combined Pin and GPIO controller
> 
> the RZ/A1 family
> 
> > +hardware controller, named "Ports" in the hardware reference manual.
> 
> bogus "hardware controller"
> 
> > +Sub-nodes
> > +---------
> > +
> > +The child nodes of the pin controller node describe a pin multiplexing
> > +function or a gpio controller alternatively.
> > +
> > +- Pin multiplexing sub-nodes:
> > +  A pin multiplexing sub-node describes how to configure a set of
> > +  (or a single) pin in some desired alternate function mode.
> > +  A single sub-node may define several pin configurations groups.
> > +
> > +  Required properties:
> > +    - renesas,pins
> 
> Just "pins"?
> 

You know, I've been thinking about this, bu the "pins" property
definition in pinctrl-bidings is the following one:

Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
---
- pins takes a list of pin names or IDs as a required argument. The
  specific binding for the hardware defines:
      - Whether the entries are integers or strings, and their
        meaning.
---

And all examples there assume one "pin name" or "ID" per pin.

Now, we use 2 values per each pin (the pin ID and the alternate
function number), so to me this is different from what the generic
binding describes.
Also, pinctrl-single, and pinctrl-imx which have and ABI similar to
the one this driver define, use "pinctrl-single,pins" and "fsl,pins"
respectively as property names.
So either they have to be updated yet, or we should keep using
"renesas,pins" for our own defined ABI.

Maybe Linus or other pinctrl people can give some suggestion here.

Thanks
   j

> > +      describes an array of pin multiplexing configurations.
> > +      When a pin has to be configured in alternate function mode, use this
> > +      property to identify the pin by its global index, and provide its
> > +      alternate function configuration description along with it.
> > +      When multiple pins are required to be configured as part of the same
> > +      alternate function (odds are single-pin alternate functions exist) they
> > +      shall be specified as members of the same argument list of a single
> > +      "renesas-pins" property.
> > +      Helper macros to ease calculating the pin index from its position
> > +      (port where it sits on and pin offset), and alternate function
> > +      configuration options are provided in pin controller header file at:
> 
> the pin ... file
> 
> > +      include/dt-bindings/pinctrl/r7s72100-pinctrl.h
> 
> Hence I'd include that file in this patch, as it's part of the bindings.
> 
> > +  Example:
> > +  A serial communication interface with a TX output pin and a RX input pin.
> 
> an RX
> 
> > +
> > +  &pinctrl {
> > +       scif2_pins: serial2 {
> > +               renesas,pins = <PIN(3, 0) 6>,
> > +                              <PIN(3, 2) 4>;
> 
> Single line?
> 
> > +       };
> > +  }
> > +
> > +  Pin #0 on port #3 is configured in alternate function #6.
> > +  Pin #2 on port #3 is configured in alternate function #4.
> 
> as alternate function
> 
> > +
> > +  Example 2:
> > +  I2c master: both SDA and SCL pins need bi-directional operations
> > +
> > +  &pinctrl {
> > +       i2c2_pins: i2c2 {
> > +               renesas,pins = <PIN(1, 4) (1 | BI_DIR)>,
> > +                              <PIN(1, 5) (1 | BI_DIR)>;
> > +       };
> > +  }
> > +
> > +  Pin #4 on port #1 is configured in alternate function #1.
> > +  Pin #5 on port #1 is configured in alternate function #1.
> 
> as alternate function
> 
> > +  Both need to work in bi-directional mode.
> > +
> > +  Example 3:
> > +  Multi-function timer input and output compare pins.
> > +  The hardware manual prescribes this pins to have input/output direction
> > +  specified by software. Configure TIOC0A as input and TIOC0B as output.
> > +
> > +  &pinctrl {
> > +       tioc0_pins: tioc0 {
> > +               renesas,pins = <PIN(4, 0) (2 | SWIO_IN)>,
> > +                              <PIN(4, 1) (2 | SWIO_OUT)>;
> > +       };
> > +  }
> > +
> > +  Pin #0 on port #4 is configured in alternate function #2 with IO direction
> > +  specified by software as input.
> > +  Pin #1 on port #4 is configured in alternate function #1 with IO direction
> > +  specified by software as output.
> 
> as alternate function
> 
> > +- GPIO controller sub-nodes:
> > +  Each port of r7s72100 pin controller hardware is itself a gpio controller.
> 
> the r7s72100 pin controller hardware
> 
> > +  Different SoCs have different number of available pins per port, but
> 
> numbers of
> 
> > +  generally speaking, each of them can be configured in GPIO ("port") mode
> > +  on this hardware.
> > +  Describe gpio-controllers using sub-nodes with the following properties.
> > +
> > +  Required properties:
> > +    - gpio-controller
> > +      empty property as defined by gpio bindings documentation.
> 
> the gpio bindings documentation
> 
> > +    - #gpio-cells
> > +      number of cells required to identify and configure a GPIO.
> > +      Shall be 2.
> > +    - gpio-ranges
> > +      Describes a gpio controller specifying its specific pin base, the pin
> > +      base in the global pin numbering space, and the number of controlled
> > +      pins, as defined by gpio bindings documentation. Refer to this file
> 
> the gpio bindings documentation
> 
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
