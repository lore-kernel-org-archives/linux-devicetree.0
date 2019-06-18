From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 5/9] drm/sun4i: tcon_top: Register clock
 gates in probe
Date: Tue, 18 Jun 2019 18:54:33 +0800
Message-ID: <CAGb2v66onOEDPvXWLsLj7efxbReY0_z1HcQWkG78XUytLvMQ+g@mail.gmail.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com> <CAGb2v669MprYgy2wc_a7Kz8VpzzNGZxDxsj0z_Ujx5bV25+AWQ@mail.gmail.com>
 <CAMty3ZDRYBPKrGQxAZoB+trFiDLJ5BxDfNUOnPzgd+UWcpwCoQ@mail.gmail.com>
 <CAGb2v67uNhie9mb2-m04FGEi4Z7q7TYChOogGj2HgmSmEo4Arg@mail.gmail.com>
 <CAMty3ZBUrGEi+e62sFe7GkXinK3q076sGLwpEVz67qeoV+1ZeA@mail.gmail.com>
 <CAGb2v65YRVSv2mFfE2e=vqDOSu4Nie_oLQ-qpaDsTWKJwf-aeA@mail.gmail.com> <CAMty3ZA+hV_X0-=b83M3rDUhX=+g5RNC6EU-DzAS_pbvwc54FA@mail.gmail.com>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6UFUPUAKGQEQA6GVMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZA+hV_X0-=b83M3rDUhX=+g5RNC6EU-DzAS_pbvwc54FA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 6:34 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>
> On Tue, Jun 18, 2019 at 1:23 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> >
> > On Tue, Jun 18, 2019 at 3:45 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> > >
> > > On Tue, Jun 18, 2019 at 12:49 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > > >
> > > > On Mon, Jun 17, 2019 at 6:30 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> > > > >
> > > > > On Sun, Jun 16, 2019 at 11:01 AM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > > > > >
> > > > > > On Sat, Jun 15, 2019 at 12:44 AM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> > > > > > >
> > > > > > > TCON TOP have clock gates for TV0, TV1, dsi and right
> > > > > > > now these are register during bind call.
> > > > > > >
> > > > > > > Of which, dsi clock gate would required during DPHY probe
> > > > > > > but same can miss to get since tcon top is not bound at
> > > > > > > that time.
> > > > > > >
> > > > > > > To solve, this circular dependency move the clock gate
> > > > > > > registration from bind to probe so-that DPHY can get the
> > > > > > > dsi gate clock on time.
> > > > > > >
> > > > > > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 94 ++++++++++++++------------
> > > > > > >  1 file changed, 49 insertions(+), 45 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > > > > > > index 465e9b0cdfee..a8978b3fe851 100644
> > > > > > > --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > > > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> > > > > > > @@ -124,7 +124,53 @@ static struct clk_hw *sun8i_tcon_top_register_gate(struct device *dev,
> > > > > > >  static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
> > > > > > >                                void *data)
> > > > > > >  {
> > > > > > > -       struct platform_device *pdev = to_platform_device(dev);
> > > > > > > +       struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
> > > > > > > +       int ret;
> > > > > > > +
> > > > > > > +       ret = reset_control_deassert(tcon_top->rst);
> > > > > > > +       if (ret) {
> > > > > > > +               dev_err(dev, "Could not deassert ctrl reset control\n");
> > > > > > > +               return ret;
> > > > > > > +       }
> > > > > > > +
> > > > > > > +       ret = clk_prepare_enable(tcon_top->bus);
> > > > > > > +       if (ret) {
> > > > > > > +               dev_err(dev, "Could not enable bus clock\n");
> > > > > > > +               goto err_assert_reset;
> > > > > > > +       }
> > > > > >
> > > > > > You have to de-assert the reset control and enable the clock before the
> > > > > > clocks it provides are registered. Otherwise a consumer may come in and
> > > > > > ask for the provided clock to be enabled, but since the TCON TOP's own
> > > > > > reset and clock are still disabled, you can't actually access the registers
> > > > > > that controls the provided clock.
> > > > >
> > > > > These rst and bus are common reset and bus clocks not tcon top clocks
> > > > > that are trying to register here. ie reason I have not moved it in
> > > > > top.
> > > >
> > > > And you're sure that toggling bits in the TCON TOP block doesn't require
> > > > the reset to be de-asserted and the bus clock enabled?
> > > >
> > > > Somehow I doubt that.
> > > >
> > > > Once the driver register the clocks it provides, they absolutely must work.
> > > > They can't only work after the bind phase when the reset gets de-asserted
> > > > and the bus clock enabled. Or you should provide proper error reporting
> > > > in the clock ops. I doubt you want to go that way either.
> > >
> > > Why would they won't work after bind phase? unlike tcon top gates,
> > > these reset, and bus are common like  what we have in other DE block
> > > so enable them in bind won't be an issue as per as I understand. let
> > > me know if you want me to check in other directions.
> >
> > You misunderstood. When you moved the clock registering parts to the probe
> > phase, but didn't move the clock enable and reset de-assert parts to go with,
> > the clock ops will not work as expected between probe and bind time.
>
> If I understand correctly, I have moved tcon clock gates, not the bus
> clock or the reset. Both have independent enablement phase, the bus
> clock is enable in tcon top bind and the clock gate ("dsi") enable in
> init call of phy_ops. is both bus clock and clock gates are same and
> related that is what you are saying?

I am saying that you may need the tcon top bus gates and resets properly
configured to be able to read/write the tcon top address range. That includes
enabling/disabling the clocks that the tcon top driver registers.

In other words, the TCON TOP's bus gate and reset control have everything to do
with what you can do within the TCON TOP block or address range.

> >
> > Simple way to verify it: Just use devmem to disable the TCON TOP bus gate
> > and/or assert its reset control. Then try to toggle any of the bits in the
> > TCON TOP block and see if it works, or if the bits stick.
>
> Yes I have verified "dsi" gate enablement before via devmem. Below is
> the bus, reset disablement and re-enablement and result is similar for
> the reset, bus clock in bind and even in probe.
>
> 00. get the existing value
>
> # devmem 0x1c70020
> 0x00010000
> # devmem 0x1c20064
> 0x44021000
> # devmem 0x1c202c4
> 0x44021000
>
> 01: disable bus, and assert reset
>
> # devmem 0x1c20064 32 0x4021000
> # devmem 0x1c202c4 32 0x4021000
> # devmem 0x1c20064
> 0x04021000
> # devmem 0x1c202c4
> 0x04021000
> # devmem 0x1c70020
> 0x00000000

See here. The value became 0 when it was still 0x10000 in the previous phase.
Any guesses to why this happened, assuming you didn't touch it?

Now if you keep the bus gate disabled and the reset control asserted, and
try to write some non-zero value to 0x1c70020, and read it back, does the
value stick?

If you don't have the bus gate enabled and the reset control de-asserted,
any operations you do to the TCON TOP is essentially not happening. Including
bit operations that the clocks you registered are required to do.

Get what I'm saying?

You need to have the bus gate enabled and the reset control de-asserted
BEFORE you register the clocks you are providing, or something is going
to go very wrong.

Worst case scenario: the reset control was left de-asserted by the bootloader
but the bus gate was disabled. When you register the clocks, the CCF tries
to read back the current status of the clocks, and the I/O stalls because
the bus gate wasn't enabled. System stalls.

Do I need to draw a time flow chart for you?

Also see the very simple example:

    https://elixir.bootlin.com/linux/latest/source/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c#L113

where the bus gate is enabled before registering the clocks. This hardware
block doesn't have a reset control for it, but the same principle applies.

> 02: enable bus, and dessert reset
>
> # devmem 0x1c20064 32 0x44021000
> # devmem 0x1c202c4 32 0x44021000
> # devmem 0x1c20064
> 0x44021000
> # devmem 0x1c202c4
> 0x44021000
> # devmem 0x1c70020
> 0x00000000

And it's still zero here, meaning the reset control does have an effect
on the TCON TOP registers.

> 03: enable gate
>
> # devmem 0x1c70020 32 0x00010000
> # devmem 0x1c70020
> 0x00010000

This is irrelevant and not what I wanted you to try.

> >
> > Whether another driver actually does so is not the question. It is just bad
> > implementation.
>
> Not sure, I understand this.
