From: jacopo <jacopo@jmondi.org>
Subject: Re: [PATCH v2 1/7] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Thu, 23 Mar 2017 15:19:55 +0100
Message-ID: <20170323141955.GK30223@w540>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdW=MKvjXOXOAL7LE7=R1v4jWGko6mMq_r_u9PRqYC2w2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW=MKvjXOXOAL7LE7=R1v4jWGko6mMq_r_u9PRqYC2w2Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,
   thanks for detailed review

On Wed, Mar 22, 2017 at 11:26:58AM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
> 
> On Mon, Mar 20, 2017 at 5:14 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Add combined gpio and pin controller driver for Renesas RZ/A1
> > r7s72100 SoC.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/drivers/pinctrl/pinctrl-rza1.c
> 
> > +/*
> > + * This pincontroller/gpio combined driver support Renesas devices of RZ/A1
> > + * family.
> > + * This includes SoCs which are sub- or super- sets of this particular line,
> > + * as RZ/A1H (r7s721000), RZ/A1M (r7s721001) and RZ/A1L (r7s721002) are.
> 
> RZ/A1M = r7s721010, RZ/A1L = r7s721020
> 
> > +#define RZA1_ADDR(mem, reg, port)      ((mem) + (reg) + ((port) * 4))
> 
> 
> > +
> > +#define RZA1_NPORTS                    12
> > +#define RZA1_PINS_PER_PORT             16
> > +#define RZA1_NPINS                     (RZA1_PINS_PER_PORT * RZA1_NPORTS)
> > +#define RZA1_PIN_TO_PORT(pin)          ((pin) / RZA1_PINS_PER_PORT)
> > +#define RZA1_PIN_TO_OFFSET(pin)                ((pin) % RZA1_PINS_PER_PORT)
> > +
> > +/*
> > + * Be careful here: the pin configuration subnodes in device tree enumerates
> 
> enumerate
> 
> > + * alternate functions from 1 to 8; subtract 1 before using macros so to match
> > + * registers configuration which expects numbers from 0 to 7 instead.
> 
> register configuration
> 
> > + */
> > +#define MUX_FUNC_OFFS                  3
> > +#define MUX_FUNC_MASK                  (BIT(MUX_FUNC_OFFS) - 1)
> > +#define MUX_FUNC_PFC_MASK              BIT(0)
> > +#define MUX_FUNC_PFCE_MASK             BIT(1)
> > +#define MUX_FUNC_PFCEA_MASK            BIT(2)
> > +#define MUX_CONF_BIDIR                 BIT(0)
> > +#define MUX_CONF_SWIO_INPUT            BIT(1)
> > +#define MUX_CONF_SWIO_OUTPUT           BIT(2)
> > +
> > +/**
> > + * rza1_pin_conf - describes a pin position, id, mux config and output value
> > + *
> > + * Use uint32_t to match types used in of_device nodes argument lists.
> > + *
> > + * @id: the pin identifier from 0 to RZA1_NPINS
> > + * @port: the port where pin sits on
> > + * @offset: pin offset in the port
> > + * @mux: alternate function configuration settings
> > + * @value: output value to set the pin to
> > + */
> > +struct rza1_pin_conf {
> > +       uint32_t id;
> > +       uint32_t port;
> > +       uint32_t offset;
> > +       uint32_t mux_conf;
> > +       uint32_t value;
> 
> In the kernel, we tend to use u32 instead of uint32_t.
> But many of these fields can be smaller than 32 bits, right, saving some
> memory (important when running with built-in RAM only).
> 

I'll move these to u8 (and u16 where appropriate) and fix all the
above grammar comments

> > +/**
> > + * rza1_pinctrl - RZ pincontroller device
> > + *
> > + * @dev: parent device structure
> > + * @mutex: protect [pinctrl|pinmux]_generic functions
> > + * @base: logical address base
> > + * @nports: number of pin controller ports
> > + * @ports: pin controller banks
> > + * @ngpiochips: number of gpio chips
> > + * @gpio_ranges: gpio ranges for pinctrl core
> > + * @pins: pin array for pinctrl core
> > + * @desc: pincontroller desc for pinctrl core
> > + * @pctl: pinctrl device
> > + */
> > +struct rza1_pinctrl {
> > +       struct device *dev;
> > +
> > +       struct mutex mutex;
> > +
> > +       void __iomem *base;
> > +
> > +       unsigned int nport;
> > +       struct rza1_port *ports;
> > +
> > +       unsigned int ngpiochips;
> > +
> > +       struct pinctrl_gpio_range *gpio_ranges;
> > +       struct pinctrl_pin_desc *pins;
> > +       struct pinctrl_desc desc;
> > +       struct pinctrl_dev *pctl;
> 
> It's a good idea not to mix pointers and integers, as the pointers will
> be 64-bit on 64-bit platforms, leading to gaps due to alignment rules.
> Not super-important here, as (for now) this driver is meant for 32-bit SoCs.
> 

I grouped this variables "logically", and even if I understand your
concerns, there will be a single "struct rza1_pinctrl" per driver
instance, so I hope we can tollerate some padding bytes in favour of more
clearness. Also, as you said, there are no 64-bits RZ platforms atm.

> > +/**
> > + * rza1_set_bit() - un-locked set/clear a single bit in pin configuration
> > + *                 registers
> > + */
> > +static inline void rza1_set_bit(const struct rza1_port *port,
> > +                               unsigned int reg, unsigned int offset,
> > +                               bool set)
> 
> I think "reg" and "set" still fit on the previous lines (many more cases
> in other functions).
> 
> I'd call "offset" "bit" (and "reg" "offset"?)

I'll s/offset/bit and s/offset/pin where appropriate

> 
> > +{
> > +       void __iomem *mem = RZA1_ADDR(port->base, reg, port->id);
> 
> I think this would be easier to read without using the RZA1_ADDR() macro.
> 

Don't know... I can change this if you prefer... there's nothing nasty
hidden behind this macro...

> > +       u16 val = ioread16(mem);
> > +
> > +       if (set)
> > +               val |= BIT(offset);
> > +       else
> > +               val &= ~BIT(offset);
> > +
> > +       iowrite16(val, mem);
> > +}
> > +
> > +static inline int rza1_get_bit(struct rza1_port *port,
> > +                              unsigned int reg, unsigned int offset)
> > +{
> > +       void __iomem *mem = RZA1_ADDR(port->base, reg, port->id);
> > +
> > +       return ioread16(mem) & BIT(offset);
> 
> Same comments as for rza1_set_bit().
> 
> > +}
> > +
> > +/**
> > + * rza1_pin_reset() - reset a pin to default initial state
> > + *
> > + * Reset pin state disabling input buffer and bi-directional control,
> > + * and configure it as input port.
> > + * Note that pin is now configured with direction as input but with input
> > + * buffer disabled. This implies the pin value cannot be read in this state.
> > + *
> > + * @port: port where pin sits on
> > + * @offset: pin offset
> > + */
> > +static void rza1_pin_reset(struct rza1_port *port,
> > +                          unsigned int offset)
> 
> The above fits on a single line.
> 
> "pin" instead of "offset"?
> 
> > +{
> > +       spin_lock(&port->lock);
> 
> spin_lock_irqsave()? (everywhere)
> 

Quoting spinlock.txt:

----
If you have a case where you have to protect a data structure across
several CPU's and you want to use spinlocks you can potentially use
cheaper versions of the spinlocks. IFF you know that the spinlocks are
never used in interrupt handlers, you can use the non-irq versions:

    spin_lock(&lock);
        ...
            spin_unlock(&lock);
----

And there's nothing  preventing an interrupt handling routine to
set/change a gpio value, so I'll change these to the _irqsave version, thanks.

> > +       rza1_set_bit(port, PIBC_REG, offset, 0);
> > +       rza1_set_bit(port, PBDC_REG, offset, 0);
> > +
> > +       rza1_set_bit(port, PM_REG, offset, 1);
> > +       rza1_set_bit(port, PMC_REG, offset, 0);
> > +       rza1_set_bit(port, PIPC_REG, offset, 0);
> > +       spin_unlock(&port->lock);
> 
> spin_unlock_irqrestore()? (everywhere)
> 
> > +}
> > +
> > +static inline int rza1_pin_get_direction(struct rza1_port *port,
> > +                                        int offset)
> 
> The above fits on a single line.
> 
> "pin" instead of "offset" (many more below)?
> 
> > +/**
> > + * rza1_pin_conf_validate() - make sure a single bit it set in mux_conf mask
> 
> is set
> 
> > + */
> > +static inline int rza1_pin_conf_validate(u8 mux_conf)
> > +{
> > +       do {
> > +               if (mux_conf & BIT(0))
> > +                       break;
> > +       } while ((mux_conf >>= 1));
> > +
> > +       return (mux_conf >> 1);
> 
> Please study <linux/bitops.h> to find a better way to do this ;-)
> 

Did my homework and I'm thinking of replacing this function with
something like:
    if (ffs(mask) != fls(mask))) { }

Is this what you were suggesting?

> > +/**
> > + * rza1_gpio_get() - read a gpio pin value
> > + *
> > + * Read gpio pin value through PPR register.
> > + * Requires bi-directional mode to work when reading value of a pin
> 
> the value
> 
> > + * in output mode
> 
> 
> > +/**
> > + * rza1_pinmux_set() - retrieve pins from a group and apply them mux settings
> 
> their
> 
> > + *
> > + * @pctldev: pin controller device
> > + * @selector: function selector
> > + * @group: group selector
> > + */
> > +static int rza1_pinmux_set(struct pinctrl_dev *pctldev, unsigned int selector,
> > +                          unsigned int group)
> > +{
> > +       int i;
> > +       struct group_desc *grp;
> > +       struct function_desc *func;
> > +       struct rza1_pin_conf *pin_confs;
> > +       struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
> 
> Reverse Christmas tree ordering (longest line first)?
> 
> 
> 
> > +/**
> > + * rza1_parse_pmx_function() - parse and register a pin mux function
> > + *
> > + * Pins for RZ SoC pin controller described by "renesas-pins" property.
> > + *
> > + * First argument in the list identifies the pin, while the second one
> > + * describes the requested alternate function number and additional
> > + * configuration parameter to be applied to the selected function.
> > + *
> > + * @rza1_pctl: RZ/A1 pin controller device
> > + * @np: of pmx sub-node
> > + */
> > +static int rza1_parse_pmx_function(struct rza1_pinctrl *rza1_pctl,
> > +                                  struct device_node *np)
> > +{
> > +       int ret;
> > +       int of_pins;
> 
> npins?
> 
> > +       unsigned int i;
> > +       unsigned int *grpins;
> > +       const char *grpname;
> > +       const char **fngrps;
> > +       struct rza1_pin_conf *pin_confs;
> > +       struct pinctrl_dev *pctldev = rza1_pctl->pctl;
> > +       char const *prop_name = "renesas,pins";
> 
> const char *prop_name
> 
> Reverse Christmas tree ordering (longest line first)? (more below)

or const char const * to make sure also the content is never changed. But
that's an overkill maybe?

Thanks
   j
> 
> > +
> > +       of_pins = pinctrl_count_index_with_args(np, prop_name);
> > +       if (of_pins <= 0) {
> > +               dev_err(rza1_pctl->dev, "Missing %s property\n", prop_name);
> > +               return -ENOENT;
> > +       }
> > +
> > +       /*
> > +        * Functions are made of 1 group only;
> > +        * in facts, functions and groups are identical for this pin controller
> 
> in fact
> 
> > +        * except that functions carry an array of per-pin configurations
> 
> configuration
> 
> > +        * settings.
> > +        */
> > +       pin_confs = devm_kcalloc(rza1_pctl->dev, of_pins, sizeof(*pin_confs),
> > +                                GFP_KERNEL);
> > +       grpins = devm_kcalloc(rza1_pctl->dev, of_pins, sizeof(*grpins),
> > +                             GFP_KERNEL);
> > +       fngrps = devm_kzalloc(rza1_pctl->dev, sizeof(*fngrps), GFP_KERNEL);
> > +
> > +       if (!pin_confs || !grpins || !fngrps)
> > +               return -ENOMEM;
> > +
> > +       /* Collect pin positions and mux settings to store them in function */
> > +       for (i = 0; i < of_pins; ++i) {
> > +               struct rza1_pin_conf *pin_conf = &pin_confs[i];
> > +               struct of_phandle_args of_pins_args;
> > +
> > +               ret = pinctrl_parse_index_with_args(np, prop_name, i,
> > +                                                   &of_pins_args);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               if (of_pins_args.args_count < RZA1_PINMUX_OF_ARGS) {
> > +                       dev_err(rza1_pctl->dev,
> > +                               "Wrong arguments number for %s property\n",
> 
> number of arguments
> 
> 
> > +/**
> > + * rza1_parse_gpiochip() - parse and register a gpio chip and pin range
> > + *
> > + * The gpio controller subnode shall provide a "gpio-ranges" list property as
> > + * defined by gpio device tree binding documentation.
> > + * Gpio chips and pin ranges are here collected, but ranges are registered
> > + * later, after pin controller has been registered too. Only gpiochips are
> 
> after the pin controller
> 
> > + * registered here.
> > + *
> > + * @rza1_pctl: RZ/A1 pin controller device
> > + * @np: of gpio-controller node
> > + * @chip: gpio chip to register to gpiolib
> > + * @range: pin range to register to pinctrl core
> > + */
> > +static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
> > +                              struct device_node *np,
> > +                              struct gpio_chip *chip,
> > +                              struct pinctrl_gpio_range *range)
> > +{
> > +       int ret;
> > +       u32 pinctrl_base;
> > +       unsigned int gpioport;
> > +       struct of_phandle_args of_args;
> > +       const char *list_name = "gpio-ranges";
> > +
> > +       of_parse_phandle_with_fixed_args(np, list_name, 3, 0, &of_args);
> 
> This function can fail.
> 
> > +
> > +       /*
> > +        * Find out on which port this gpio-chip maps to inspecting the second
> 
> by inspecting
> 
> > +        * argument of "gpio-ranges" property.
> 
> the "gpio-ranges" property.
> 
> > +        */
> > +       pinctrl_base = of_args.args[1];
> > +       gpioport = RZA1_PIN_TO_PORT(pinctrl_base);
> > +       if (gpioport > RZA1_NPORTS) {
> > +               dev_err(rza1_pctl->dev,
> > +                       "Invalid values in property %s\n", list_name);
> > +               return -EINVAL;
> > +       }
> > +
> > +       *chip           = rza1_gpiochip_template;
> > +       chip->base      = -1;
> > +       chip->label     = kasprintf(GFP_KERNEL, "%s-%d", np->name, gpioport);
> 
> devm_kasprintf()?
> 
> "%s-%u"
> 
> > +       chip->ngpio     = of_args.args[2];
> > +       chip->of_node   = np;
> > +       chip->parent    = rza1_pctl->dev;
> > +
> > +       range->id       = gpioport;
> > +       range->name     = kasprintf(GFP_KERNEL, "%s-%d", np->name, gpioport);
> 
> Reuse chip->label?
> 
> 
> > +/**
> > + * rza1_pinctrl_register() - Enumerate pins, ports, gpiochips and functions and
> > + *                          register to pinctrl and gpio cores
> > + *
> > + * @rza1_pctl: RZ/A1 pin controller device
> > + */
> > +static int rza1_pinctrl_register(struct rza1_pinctrl *rza1_pctl)
> > +{
> 
> > +       for (i = 0; i < RZA1_NPINS; ++i) {
> > +               unsigned int port = RZA1_PIN_TO_PORT(i);
> > +               unsigned int offset = RZA1_PIN_TO_OFFSET(i);
> > +
> > +               pins[i].number = i;
> > +               pins[i].name = kasprintf(GFP_KERNEL, "P%u-%u", port, offset);
> 
> devm_kasprintf()
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
