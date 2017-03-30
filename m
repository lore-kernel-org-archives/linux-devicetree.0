From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Thu, 30 Mar 2017 10:33:30 +0200
Message-ID: <CACRpkdY-jXQENDvWoHDYYAg0e0xmwHAU3uj1D4ZP3tvTHXmgow@mail.gmail.com>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490368934-12494-4-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdZ4Z6c2YDu-e6kZ8-K7Dv_tRGxZj0vAqgPBx7rWwmHU-g@mail.gmail.com> <20170329155654.GD6247@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170329155654.GD6247@w540>
Sender: linux-kernel-owner@vger.kernel.org
To: jacopo <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 5:56 PM, jacopo <jacopo@jmondi.org> wrote:

> I can try to give you a few reasons why I don't see those flags fit in
> the pin configuration flags definition.
>
> *) those flags are used during pin multiplexing procedure only and that
> procedure has a specific order to be respected:
>
> You can have a look here:
> https://www.spinics.net/lists/linux-renesas-soc/msg12793.html
> In "rza1_alternate_function_conf()" function, we need to set bidir
> before setting every other register.
> The same applies some lines below:, the PIPC, PMC and PM register set order
> has to be respected, and depends on those BIDIR and SWIO_* parameters.
> This implies those configuration cannot be applied after pin muxing,
> certainly not in pin_config[_group]_set() whose invocation time
> is independent from pin_mux_set()'s one.

But now you are mixing up syntax and semantics.

You are describing what steps are necessary on this hardware to
apply a certain setting. That is fine, if you didn't need any specific
semantics there, you could be using pinctrl-single which will just
hammer stuff into registers, one register per pin. You have a pin
controller driver exactly beacause your hardware has semantics.

How this is described in the device tree or a board file is a different
thing from how you write your driver.

I understand why i makes for easier code, but does it make for more
generic and understandable device trees for people maintaining
several systems? I don't think so.

> One way forward would be, every time we mux a pin, look for a pinconf group
> that includes the pin we're muxing. That would happen for each pin,
> for no added benefits imo.

The benefit is clearly abstraction, standardization and readability of the
device tree. I, as developer, understand what is going on electrically,
having seen this on other systems, and being able to access generic
documentation on generic pin config properties.

> *) as Geert already pointed out, we may need dedicated subnodes to
> specify those pin configuration flags, not only because of what Chris
> said, but because pinconf_generic_dt_subnode_to_map() wants "pins" or
> "groups" to be there in the subnode, and in our pin multiplexing
> sub-nodes we only have "pinmux" property (say: we cannot specify
> pin_conf flags in the same sub-node where we describe pin
> multiplexing, we always need a dedicated sub-node).
> Chris and Geert gave some examples in their replies on how that would
> like, and how it makes the bindings a little more complex.

Very little more complex, and actually it could be argued that this
is exactly why subnodes exist: to be able to have different pin config
on pins. I think it is very readable.

> *) those flags, according to Chris, won't be used in RZ/A2, and
> reasonably not in any other RZ device. Do we want to add them to the
> generic bindings, being them so specific to this hardware platform?

I have seen so much stuff that people say is "necessarily different"
for their platform. It turns our that silicon IO and solid state physics
isn't that much different between systems. The same things invariably
pop up in several chips.

Hell this was what people said about this whole subsystem from the
beginning: pin control is so necessarily different that there is no point
in trying to create an abstraction for it.

If I had listened to that kind of advice we wouldn't be where we are today.

And that said, I have already pointed out that two of them already
exist in the pin control subsystem (PIN_CONFIG*). Because other SoCs
are doing similar things.

> One thing I suggest considering is to get rid of those flags, at
> least in bindings, and introduce 3 variants for each pin multiplexing
> function identifier.
>
> Say:
> include/dt-bindings/pinctrl/r7s72100-pinctrl.h:
> #define MUX_1               (1 << 16)
> #define MUX_1_BIDIR         (1 << 16 | 1 << 24)
> #define MUX_1_SWIO_IN       (1 << 16 | 2 << 24)
> #define MUX_1_SWIO_OUT      (1 << 16 | 3 << 24)
> ...
> #define MUX_8               (8 << 16)
> #define MUX_8_BIDIR         (8 << 16 | 1 << 24)
> ....

I understand they can be made more beautiful, but in my view
that is putting make up on a pig, I want generic pin config for these
things.


>> What is wrong in doing this with generic pin config using
>> PIN_CONFIG_INPUT_ENABLE and PIN_CONFIG_OUTPUT
>> (ignoring the argument)?
>>
>> In the device tree use input-enable and add a new output-enable
>> (with unspecified value) with proper description and DT bindings?
>>
>> And if you think these have no general applicability, by the end
>> of the day they are *still* pin config, not magic flags we can choose to
>> toss in with the muxing, so you can do what the Qualcomm driver
>> does and add custom pin configurations extending the generic
>> pin config, see drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> qcom,pull-up-strength etc.
>>
>
> I see, but that custom pin configuration flag can be applied
> independently from pin muxing procedure and it can be applied to pins
> while they're configured in GPIO mode.

See "GPIO mode pitfalls" in Documentation/pinctrl.txt
I've been over this hardware lingo so many times already.

It is not about "GPIO" at all, it is about pin configuration. The
generic pin config was not invented for GPIO, it was just recently
that we started to provide pin config back-ends for GPIO. Only
Intel do that so far.

> Our "flags" are not of that nature, and only apply to some register
> setting during pinmux, as I hopefully tried to clarify above.

And that is a driver semantic. Or even a subsystem semantic. No
big deal, accumulate such writes in the driver and apply it all when you have
it all available no matter if pin multiplexing or pin config happens first?
Surely this is just a hardware pecularity, then it warrants some special
driver code.

If you definately feel you must get a call from the pin control core setting
up muxing and config at the same time we need to think of a way to
augment the pin control core if necessary?

The fact that Linux pin control subsystem semantics you don't
like does not affect the relevant device tree bindings.

Yours,
Linus Walleij
