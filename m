From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 5/6] clk: bd71837: Add driver for BD71837 PMIC clock
Date: Fri, 01 Jun 2018 10:11:19 -0700
Message-ID: <152787307968.144038.530443034026242491@swboyd.mtv.corp.google.com>
References: <cover.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <3d9d7239331c30826a237ae55db28d918155d504.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <152777943977.144038.10971658990200651749@swboyd.mtv.corp.google.com>
 <20180601073156.GC5150@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180601073156.GC5150@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, broonie@kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com, mark.rutland@arm.com, mazziesaccount@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Quoting Matti Vaittinen (2018-06-01 00:31:56)
> First of all - Thanks for looking at this!
> =

> On Thu, May 31, 2018 at 08:10:39AM -0700, Stephen Boyd wrote:
> > Quoting Matti Vaittinen (2018-05-30 01:43:19)
> > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > index 41492e980ef4..4b045699bb5e 100644
> > > --- a/drivers/clk/Kconfig
> > > +++ b/drivers/clk/Kconfig
> > > @@ -279,6 +279,15 @@ config COMMON_CLK_STM32H7
> > >         ---help---
> > >           Support for stm32h7 SoC family clocks
> > >  =

> > > +config COMMON_CLK_BD71837
> > > +       tristate "Clock driver for ROHM BD71837 PMIC MFD"
> > > +       depends on MFD_BD71837
> > > +       depends on I2C=3Dy
> > =

> > Why depend on I2C=3Dy?
> =

> I added this because the PMIC is connected via i2c. But as you ask this
> - and as you probably knew my answer - I guess this is not correct. So
> I guess depends on MFD_BD71837 should be sufficient and the MFD portion
> should hide the fact we sit on I2C? If this is the case - I will remove
> this.

Sounds right.

> > =

> > > +
> > > +static int bd71837_clk_set(struct clk_hw *hw, int status)
> > > +{
> > > +       struct bd71837_clk *c =3D container_of(hw, struct bd71837_clk=
, hw);
> > > +
> > > +       return bd71837_update_bits(c->mfd, c->reg, c->mask, status);
> > > +}
> > > +
> > > +static void bd71837_clk_disable(struct clk_hw *hw)
> > > +{
> > > +       int rv;
> > > +       struct bd71837_clk *c =3D container_of(hw, struct bd71837_clk=
, hw);
> > > +
> > > +       rv =3D bd71837_clk_set(hw, 0);
> > > +       if (rv)
> > > +               dev_err(&c->pdev->dev, "Failed to disable 32K clk (%d=
)\n", rv);
> > =

> > Why is a disable error message more important than an enable error
> > message?  Please drop this message and rely on callers to indicate if
> > enabling their clk didn't work for some reason.
> =

> Reason is that the disable function is not returning error. So if I drop
> the print there will be no indication of error, right?

I'm not sure anyone cares if disable fails, which is why we have it
marked as void. The end user probably can't do anything about it, and it
isn't actually causing some sort of problem besides lost power so if you
really want to keep it please move it to dev_dbg(), or just remove it
and add it in when you're debugging.

> =

> > =

> > > +}
> > > +
> > > +static unsigned long bd71837_clk_recalc_rate(struct clk_hw *hw,
> > > +                                            unsigned long parent_rat=
e)
> > > +{
> > > +       struct bd71837_clk *c =3D container_of(hw, struct bd71837_clk=
, hw);
> > > +
> > > +       return c->rate;
> > =

> > Recalc rate should read the hardware instead of returning a cached rate
> > unless it can't actually read hardware.
> =

> We can't read the rate from HW. And actually, as this is fixed rate
> clock generator - is the recalc_rate needed at all?

Yes recalc_rate is still needed in this case. Thanks for pointing it
out. This is fine.

> =

> > =

> > > +       if (!c)
> > > +               goto err_out;
> > > +
> > > +       c->reg =3D BD71837_REG_OUT32K;
> > > +       c->mask =3D BD71837_OUT32K_EN;
> > > +       c->rate =3D BD71837_CLK_RATE;
> > =

> > Is the plan to have more clks supported by this driver in the future?
> > Because right now it seems to make a structure up and then hardcode the
> > members for a single clk so I'm not sure why those registers aren't just
> > hardcoded in the clk_ops functions that use them.
> =

> (At least) one more chip from this series is coming and I am planning to
> support it with this driver. I am not sure if the registers will stay
> the same. Hence I rather not hardcode the register values.

Ok.

> =

> > =

> > > +               of_property_read_string_index(pdev->dev.of_node,
> > > +                                             "clock-output-names", 0,
> > > +                                             &init.name);
> > > +
> > > +       c->hw.init =3D &init;
> > > +
> > > +       errstr =3D "failed to register 32K clk";
> > =

> > The 'errstr' thing is not standard. Please just call dev_err() directly
> > with the string you want to print. And consider not printing anything at
> > all.
> =

> I think this technique is actually used in many places at net side. I
> guess i have adobted this habit from some netlink message handling code.
> I can change this to in-place prints if it fits environment better
> though.

Ok.

> =

> > =

> > > +       rval =3D clk_hw_register(&pdev->dev, &c->hw);
> > > +       if (rval)
> > > +               goto err_free;
> > > +
> > > +       errstr =3D "failed to register clkdev for bd71837";
> > > +       rval =3D clk_hw_register_clkdev(&c->hw, init.name, NULL);
> > =

> > Are you using the clkdev lookup? Or this is just added for backup
> > purposes? If this is a mostly DT driver then please drop this part of
> > the patch and rely on of_clk_hw_add_provider() to handle the lookup
> > instead.
> =

> I did this because this is how I get the clk_get to work in my test
> driver. Problem is that I don't know how this clock is going to be used
> - and I lack of knowledge how these things are usually done. I don't
> know the clock consumer code so this was best I could think of. But if
> this is not how things are usually handled I can remove the clkdev and
> rely on of_clk_add_hw_provider. Would this be correct then:

There isn't any example code inserted, but yes, usually clkdev is used
when a non-DT enabled platform wants to use the clk. That typically only
happens on x86 platforms because we don't have a way in ACPI to express
clk handles. If this is never used with an x86 platform then clkdev is
not needed. Either way, adding an OF provider would be good to support
DT platforms. Having a clkdev lookup would also be good to support
non-DT platforms.
