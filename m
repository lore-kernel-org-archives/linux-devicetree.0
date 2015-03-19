From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 2/2] pinctrl: driver for Conexant Digicolor CX92755 pin
 mapping
Date: Thu, 19 Mar 2015 11:12:01 +0200
Message-ID: <20150319091201.GA2415@tarshish>
References: <1e256c7c4e35bb5bed79a2d2f1c8497b3b73ab74.1426519305.git.baruch@tkos.co.il>
 <2c75fb4c925dc318fd7c5db73315a7ac5822c8ce.1426519305.git.baruch@tkos.co.il>
 <CACRpkdY2bZf7eZn_jhb3r96SNk4W4miUa-thr1X5wPPZ1mfZUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY2bZf7eZn_jhb3r96SNk4W4miUa-thr1X5wPPZ1mfZUQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jonathan Ben Avraham <yba@tkos.co.il>, Mike Green <Mike.Green@conexant.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Wed, Mar 18, 2015 at 01:33:02PM +0100, Linus Walleij wrote:
> On Mon, Mar 16, 2015 at 4:21 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> 
> > This adds pinctrl and gpio driver to the CX92755 SoC "General Purpose Pin
> > Mapping" hardware block. The CX92755 is one SoC from the Conexant Digicolor
> > series. Pin mapping hardware supports configuring pins as either GPIO, or up to
> > 3 other "client select" functions. This driver adds support for pin muxing
> > using the generic device tree binding, and a basic gpiolib driver for the GPIO
> > functionality.
> >
> > This driver does not currently support GPIO interrupts, and pad configuration.
> >
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> (...)
> 
> > +struct dc_pinmap {
> > +       void __iomem            *regs;
> > +       struct device           *dev;
> > +       struct pinctrl_dev      *pctl;
> > +
> > +       struct pinctrl_pin_desc *pins;
> 
> Instead of storing just an array of pinctrl_pin_desc
> use the .pins in struct pinctrl_desc and store a pointer
> to your struct pinctrl_desc in this state container.

Good point. Will do.

> > +       const char              *pin_names[PINS_COUNT];
> 
> This duplicates names that should already be in the
> .pins array in struct pinctrl_desc, don't do that.

The .get_function_groups callback in pinmux_ops expect a char array pointer in 
*groups. That is currently implemented as

	*groups = pmap->pin_names;
	*num_groups = PINS_COUNT;

How can I implement that without a persistent char pointers array, where all I 
have is the .name fields scattered in a big pinctrl_pin_desc array?

> > +       struct gpio_chip        chip;
> > +       spinlock_t              lock;
> > +};
> 
> > +static const char *dc_get_group_name(struct pinctrl_dev *pctldev,
> > +                                    unsigned selector)
> > +{
> > +       struct dc_pinmap *pmap = pinctrl_dev_get_drvdata(pctldev);
> > +
> > +       return pmap->pin_names[selector];
> > +}
> 
> Add some comment explaining that you have exactly one group per pin.

OK.

> You are also re-implementing the .pins field in struct pinctrl_desc
> where each pin is described by a struct pinctrl_pin_desc with
> special macros available to define them and all.
> 
> If you want to have one group per pin named like this
> why not just
> 
> return pmap->desc->pins[selector].name;
> 
> ?

I had to have the char pointers array anyway, as explained above. If you have 
a better suggestion to that problem I will happily implement it as you suggest 
here.

Thanks for reviewing, and for applying all my other little documentation 
update patches.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
