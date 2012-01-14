From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Fri, 13 Jan 2012 20:30:30 -0800
Message-ID: <CAJOA=zNGM=743zyantezVk-5q_VmJc92iGBGR8fQM4LY5jxMVQ@mail.gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <20120110213338.GD3226@page> <CACxGe6vqb8AZcZb5WMvfmLsUZH7=SEtBrJCSfsFmDYpKX42MzA@mail.gmail.com>
 <20120113124659.GA17029@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120113124659.GA17029@S2101-09.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Jamie Iles <jamie@jamieiles.com>, Sascha Hauer <kernel@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2012 at 4:47 AM, Shawn Guo <shawn.guo@linaro.org> wrote=
:
> On Wed, Jan 11, 2012 at 09:46:58PM -0700, Grant Likely wrote:
> ...
>> >> +Required properties:
>> >> +- compatible : shall be "fixed-clock".
>> >> +- #clock-cells : from common clock binding; shall be set to 0.
>> >> +- clock-frequency : frequency of clock in Hz. May be multiple ce=
lls.
>> >> +
>> >> +Optional properties:
>> >> +- gpios : From common gpio binding; gpio connection to clock ena=
ble pin.
>> >
>> > This seems a little odd to me to have in the common binding, but I=
'm not
>> > that familiar with too many platforms.
>> >
>> >> +- clock-output-names : From common clock binding
>> >> +
>> >> +Example:
>> >> + =A0 =A0 clock {
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
>> >> + =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <1000000000>;
>> >> + =A0 =A0 };
>> >
>> > I wonder if this should have an optional clock consumer with a sta=
ndard
>> > name for parenting? =A0For example, on picoxcell there is a fixed =
200MHz
>> > APB clock that is really a PLL from a 20MHz reference input and I'=
d like
>> > to represent that in the clock tree.
>>
>> If it depends on a parent clock, then it really isn't a fixed clock,
>> is it (from the perspective of the OS). =A0The point of this binding=
 is
>> a trivial way to describe clocks that don't change. =A0If that
>> assumption doesn't hold true, then this binding isn't suitable for
>> that clock. =A0As you point out, even the gpio enable feature is pus=
hing
>> things a bit.
>>
> I recently ran into a use case perfectly fitting into this discussion=
=2E
>
> We have audio codec sgtl5000 on imx51-babbage board requiring a 26 MH=
z
> clock input to its SYS_MCLK pin. =A0The board has a 26 MHz oscillator=
 with
> a gpio control that outputs 26M_OSC_CLK. =A0And this clock goes throu=
gh a
> 3-state buffer component with another gpio control, and then goes to
> sgtl5000 SYS_MCLK pin. =A0The following is what I have in my mind to
> describe them in device tree.
>
> soc_26m_clk: soc-26m-clk {
> =A0 =A0 =A0 =A0compatible =3D "fixed-clock";
> =A0 =A0 =A0 =A0#clock-cells =3D <0>;
> =A0 =A0 =A0 =A0clock-frequency =3D <26000000>;
> =A0 =A0 =A0 =A0clock-output-names =3D "soc-26m-clk";
> =A0 =A0 =A0 =A0gpios =3D <&gpio3 1 0>;
> };
>
> sgtl5000_clk: sgtl5000-sys-mclk {
> =A0 =A0 =A0 =A0#clock-cells =3D <0>;
> =A0 =A0 =A0 =A0gpios =3D <&gpio4 26 0>;
> =A0 =A0 =A0 =A0clocks =3D <&soc_26m_clk>;
> =A0 =A0 =A0 =A0clock-names =3D "soc-26m-clk";
> =A0 =A0 =A0 =A0clock-output-names =3D "sgtl5000-sys-mclk";
> };
>
> codec: sgtl5000@0a {
> =A0 =A0 =A0 =A0compatible =3D "fsl,sgtl5000";
> =A0 =A0 =A0 =A0reg =3D <0x0a>;
> =A0 =A0 =A0 =A0clocks =3D <&sgtl5000_clk>;
> =A0 =A0 =A0 =A0clock-names =3D "sgtl5000-sys-mclk";
> };
>
> The sgtl5000-sys-mclk is a clock with fixed rate, but the rate is rea=
lly
> defined by its parent soc-26m-clk, which is anothe fixed-rate clock. =
=A0We
> have no doubt that soc-26m-clk is a "fixed-clock". =A0Is sgtl5000-sys=
-mclk
> a "fixed-clock"? =A0The following is the "fixed-clock" defined by Mik=
e's
> implementation.
>
> /*
> =A0* DOC: basic fixed-rate clock that cannot gate
> =A0*
> =A0* Traits of this clock:
> =A0* prepare - clock never gates. =A0clk_prepare & clk_unprepare do n=
othing
> =A0* enable - clock never gates. =A0clk_enable & clk_disable do nothi=
ng
> =A0* rate - rate is always a fixed value. =A0No clk_set_rate support
> =A0* parent - fixed parent. =A0No clk_set_parent support
> =A0*
> =A0* note: parent can be NULL, which implies that this clock is a roo=
t clock.
> =A0*/
> struct clk_hw_ops clk_hw_fixed_ops =3D {
> =A0 =A0 =A0 .recalc_rate =3D clk_hw_fixed_recalc_rate,
> =A0 =A0 =A0 .get_parent =3D clk_hw_fixed_get_parent,
> };
>
> It says that the "fixed-clock" can have a fixed parent. =A0So I shoul=
d
> probably add compatible =3D "fixed-clock" for node sgtl5000-sys-mclk =
too.
> Then should I add clock-frequency property for it too? =A0I'm not sur=
e
> about that, since the frequency is really defined by its parent. =A0I=
OW,
> should the clock-frequency property for "fixed-clock" be optional? =A0=
On
> the other hand, let clock-frequency property be optional seems a litt=
le
> illogical to the concept of "fixed-clock". =A0So I'm really confused =
here.

I had envisioned fixed clocks as being clocks whose rates could never
change; obviously this is mostly useful for root clocks like
oscillators and whatnot.

There is nothing wrong with using fixed clock for sgtl5000-sys-mclk,
but it's rate *can* change if it's parent rate ever changes.  This may
be very unlikely on your platform, in which case again it is OK to use
fixed clock here if you want to.

However... I'm inclined to say that sgtl5000-sys-mclk is good
candidate for a dummy clock: it follows it's parent rate, doesn't
gate, doesn't divide it's parent rate, only has one input.  There
isn't a common dummy clock in the v4 patches, but there is in v5.  The
key difference between the fixed rate clock and the dummy clock is
that the dummy clock looks at clk->parent->rate in it's .get_rate,
whereas a fixed rate clock will have it's rate cached in struct
clk_fixed.

Thoughts?

Mike

> With the proper clock support, I would expect that sgtl5000 driver on=
ly
> needs to make the following two calls to have its clock enabled.
>
> =A0 =A0 =A0 =A0mclk =3D clk_get(&dev, "sgtl5000-sys-mclk");
> =A0 =A0 =A0 =A0clk_prepare_enable(mclk);
>
> But looking at the current fixed-clock implementation, there is even
> no clk_enable operation for fixed-clock. =A0How can we control the cl=
ock
> with gpio?
>
> All I'm saying is that we need some level of alignment between clock
> binding and common-clk implementation.
>
> Regards,
> Shawn
>
>> That said, I'm open to extending this binding if something can be
>> defined that will have a lot of use cases.
