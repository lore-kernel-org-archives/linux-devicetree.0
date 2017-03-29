From: jacopo <jacopo@jmondi.org>
Subject: Re: [PATCH v3 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl
 header
Date: Wed, 29 Mar 2017 17:56:54 +0200
Message-ID: <20170329155654.GD6247@w540>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-4-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdZ4Z6c2YDu-e6kZ8-K7Dv_tRGxZj0vAqgPBx7rWwmHU-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ4Z6c2YDu-e6kZ8-K7Dv_tRGxZj0vAqgPBx7rWwmHU-g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,
    another reply to your email, please don't feel assaulted :)

On Wed, Mar 29, 2017 at 03:22:23PM +0200, Linus Walleij wrote:
> On Fri, Mar 24, 2017 at 4:22 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> 
> > Add dt-bindings for Renesas r7s72100 pin controller header file.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> > +/*
> > + * Pin is bi-directional.
> > + * An alternate function that needs both input/output functionalities shall
> > + * be configured as bidirectional.
> > + * Eg. SDA/SCL pins of an I2c interface.
> > + */
> > +#define BI_DIR                 (1 << 3)
> 
> Any specific reason why this should not simply be added to
> include/linux/pinctrl/pinconf-generic.h
> as PIN_CONFIG_BIDIRECTIONAL and parsed in
> drivers/pinctrl/pinconf-generic.c
> from the (new) DT property "bidirectional" simply?
> 

I can try to give you a few reasons why I don't see those flags fit in
the pin configuration flags definition.

*) those flags are used during pin multiplexing procedure only and that
procedure has a specific order to be respected:

You can have a look here:
https://www.spinics.net/lists/linux-renesas-soc/msg12793.html
In "rza1_alternate_function_conf()" function, we need to set bidir
before setting every other register.
The same applies some lines below:, the PIPC, PMC and PM register set order
has to be respected, and depends on those BIDIR and SWIO_* parameters.
This implies those configuration cannot be applied after pin muxing,
certainly not in pin_config[_group]_set() whose invocation time
is independent from pin_mux_set()'s one.

One way forward would be, every time we mux a pin, look for a pinconf group
that includes the pin we're muxing. That would happen for each pin,
for no added benefits imo.

*) as Geert already pointed out, we may need dedicated subnodes to
specify those pin configuration flags, not only because of what Chris
said, but because pinconf_generic_dt_subnode_to_map() wants "pins" or
"groups" to be there in the subnode, and in our pin multiplexing
sub-nodes we only have "pinmux" property (say: we cannot specify
pin_conf flags in the same sub-node where we describe pin
multiplexing, we always need a dedicated sub-node).
Chris and Geert gave some examples in their replies on how that would
like, and how it makes the bindings a little more complex.

*) those flags, according to Chris, won't be used in RZ/A2, and
reasonably not in any other RZ device. Do we want to add them to the
generic bindings, being them so specific to this hardware platform?

One thing I suggest considering is to get rid of those flags, at
least in bindings, and introduce 3 variants for each pin multiplexing
function identifier.

Say:
include/dt-bindings/pinctrl/r7s72100-pinctrl.h:
#define MUX_1               (1 << 16)
#define MUX_1_BIDIR         (1 << 16 | 1 << 24)
#define MUX_1_SWIO_IN       (1 << 16 | 2 << 24)
#define MUX_1_SWIO_OUT      (1 << 16 | 3 << 24)
...
#define MUX_8               (8 << 16)
#define MUX_8_BIDIR         (8 << 16 | 1 << 24)
....

this way we get rid of those extra flag values and squeeze pin id
and mux function id in a single integer, part of the "pinmux"
arguments list.

i2c_pins {
    pinmux = <(PIN(1, 6) | MUX_1_BIDIR)>,
             <(PIN(1, 7) | MUX_2_BIDIR)>;
};

The driver will parse the bits from [31:24] to find out if it needs
to enable some special multiplexing property, and performs
multiplexing as it is doing right now.

> > +/*
> > + * Flags used to ask software to drive the pin I/O direction overriding the
> > + * alternate function configuration.
> > + * Some alternate functions require software to force I/O direction of a pin,
> > + * overriding the designated one.
> > + * Refer to the HW manual to know when this flag shall be used.
> > + */
> > +#define SWIO_IN                        (1 << 4)
> > +#define SWIO_OUT               (1 << 5)
> 
> What is wrong in doing this with generic pin config using
> PIN_CONFIG_INPUT_ENABLE and PIN_CONFIG_OUTPUT
> (ignoring the argument)?
> 
> In the device tree use input-enable and add a new output-enable
> (with unspecified value) with proper description and DT bindings?
> 
> And if you think these have no general applicability, by the end
> of the day they are *still* pin config, not magic flags we can choose to
> toss in with the muxing, so you can do what the Qualcomm driver
> does and add custom pin configurations extending the generic
> pin config, see drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> qcom,pull-up-strength etc.
> 

I see, but that custom pin configuration flag can be applied
independently from pin muxing procedure and it can be applied to pins
while they're configured in GPIO mode.
Our "flags" are not of that nature, and only apply to some register
setting during pinmux, as I hopefully tried to clarify above.

Thanks for time and patience in this long email thread.
    j

> Yours,
> Linus Walleij
