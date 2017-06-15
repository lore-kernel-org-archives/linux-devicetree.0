From: jmondi <jacopo@jmondi.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and
 output-enable
Date: Thu, 15 Jun 2017 13:11:24 +0200
Message-ID: <20170615111124.GD22030@w540>
References: <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
 <CAA+hA=Q9hwe7_xL440Reoi7z7m8-SScZ5E057419KSA7dQK=tQ@mail.gmail.com>
 <20170523183735.GC13664@w540>
 <CACRpkdYcaGzSvAN2Trqwer+8GbqXyfpE=VqiYcQvCOqhDO9MMw@mail.gmail.com>
 <20170529104229.GB21347@w540>
 <CAA+hA=T56WHugmA+5V5ZC6TTxeSUVt1hr0v53YuDsUYgBcvKTw@mail.gmail.com>
 <20170609075028.GE15739@w540>
 <CACRpkdZ=hNJLyV94FyRBSR3Dk8NLe-jEo3qbUKDya6ruqG3KNQ@mail.gmail.com>
 <20170612094424.GG15739@w540>
 <CAA+hA=RmDEybOkbimtyQBq+vK=6T9GYJn9Jw-GcDy7XxR0b0AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAA+hA=RmDEybOkbimtyQBq+vK=6T9GYJn9Jw-GcDy7XxR0b0AA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Dong Aisheng <dongas86@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Chris Brandt <Chris.Brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Dong,

On Tue, Jun 13, 2017 at 02:25:08PM +0800, Dong Aisheng wrote:
> On Mon, Jun 12, 2017 at 5:44 PM, jmondi <jacopo@jmondi.org> wrote:
> > Fair enough :)
> >
> > I'll try to keep this short: I don't like "output-enable", and at the
> > same time I don't think "output-high" and "output-low" fit well for
> > this purpose, as they electrically means something different from what
> > our (and IMX) use case is: enabling/disabling input/output
> > buffers internal to pin controller/gpio block HW and not driving a value
> > there.
> >
> > This seems clear to me from the "GPIO mode pitfalls" section of
> > pinctrl.txt documentation examples and from the fact that generic bindings
> > did not expose an "output" flag because if you drive an output line, you
> > reasonably either drive it high or low.
> >
> > Unfortunately I cannot convince myself that the same reasons apply
> > to the input use case.  Enabling input on a pin implies the pinctrl/gpio driver
> > has to enable any input buffer required to use that pin as a properly
> > working input line, and enabling an input buffer implies being able to sense
> > the line value from there, so I don't see that much use for "input-buffer-enable"
> > alone.
> >
> > So, even if bindings could look a bit weird as there won't be a direct
> > matching between properties names used to enable input/output buffers,
> > my vote is to add "output-buffer-enable" only, and keep using the
> > already there "input-enable" properties for the input use case.
> >
>
> Yes, it may be a bit weird.
> I'm not pad internal details expert and can't tell much difference between
> output-enable and output-buffer-enable.
> I just feel a bit confuse if only using output-buffer-enable.

Yes it is, and I actually like your proposal, I was just trying to
make sure I was not confusing the property semantic with its
real-world effect.

If no one as different opinions on this, I can send a patch later to
add output-enable only, or since you have almost done it down here you
can do the same resusing what you have proposed below.
>
> If enable both input and output, it becomes:
> pinctrl_xxx: gpios_xxx_grp {
>         pins = <
>                 ULP1_PAD_PTD0__PTD0
>         >;
>         input-enable;
>         output-buffer-enable;
>         bias-pull-up;
> };
>
> How about still use output-enable in pairs to input-enable but explain more
> in comments?
> Aslo update 'input-enable' comment to 'enable input buffer'.
> e.g.
> diff --git a/drivers/pinctrl/pinconf-generic.c
> b/drivers/pinctrl/pinconf-generic.c
> index 720a19f..96c83a4 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -172,6 +172,7 @@ static const struct pinconf_generic_params dt_params[] = {
>         { "input-schmitt-enable", PIN_CONFIG_INPUT_SCHMITT_ENABLE, 1 },
>         { "low-power-disable", PIN_CONFIG_LOW_POWER_MODE, 0 },
>         { "low-power-enable", PIN_CONFIG_LOW_POWER_MODE, 1 },
> +       { "output-enable", PIN_CONFIG_OUTPUT_ENABLE, 1 },
>         { "output-high", PIN_CONFIG_OUTPUT, 1, },
>         { "output-low", PIN_CONFIG_OUTPUT, 0, },
>         { "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
> diff --git a/include/linux/pinctrl/pinconf-generic.h
> b/include/linux/pinctrl/pinconf-generic.h
> index 7620eb1..d30f4fe 100644
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@ -59,9 +59,9 @@
>   *     which means it will wait for signals to settle when reading inputs. The
>   *     argument gives the debounce time in usecs. Setting the
>   *     argument to zero turns debouncing off.
> - * @PIN_CONFIG_INPUT_ENABLE: enable the pin's input.  Note that this does not
> - *     affect the pin's ability to drive output.  1 enables input, 0 disables
> - *     input.
> + * @PIN_CONFIG_INPUT_ENABLE: enable the pin's input buffer.  Note
> that this does
> + *     not affect the pin's ability to drive output.
> + *     1 enables input, 0 disables input.

I would not mention the "input buffer" here, as enabling input implies enabling
the buffer if you want to read values from there. Actually I guess
there may be platforms where buffer enabling may be implicit, so I
would leave this out and let drivers handle it internally.

>   * @PIN_CONFIG_INPUT_SCHMITT: this will configure an input pin to run in
>   *     schmitt-trigger mode. If the schmitt-trigger has adjustable hysteresis,
>   *     the threshold value is given on a custom format as argument when
> @@ -73,6 +73,9 @@
>   *     operation, if several modes of operation are supported these can be
>   *     passed in the argument on a custom form, else just use argument 1
>   *     to indicate low power mode, argument 0 turns low power mode off.
> + * @PIN_CONFIG_OUTPUT_ENABLE: only enable the pin's output buffer, not driving
> + *     a value.
> + *     1 enables output buffer, 0 disables output buffer.
>   * @PIN_CONFIG_OUTPUT: this will configure the pin as an output. Use argument
>   *     1 to indicate high level, argument 0 to indicate low level. (Please
>   *     see Documentation/pinctrl.txt, section "GPIO mode pitfalls" for a
>
> Or
> invent both input-buffer-enable and output-buffer-enable and
> deprecated input-enable?
>
> Andy,
> how about your comments?
>
> Regards
> Dong Aisheng
>
> > Thanks
> >    j
> >
> >>
> >> Yours,
> >> Linus Walleij
