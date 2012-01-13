From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Fri, 13 Jan 2012 20:47:02 +0800
Message-ID: <20120113124659.GA17029@S2101-09.ap.freescale.net>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <20120110213338.GD3226@page>
 <CACxGe6vqb8AZcZb5WMvfmLsUZH7=SEtBrJCSfsFmDYpKX42MzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6vqb8AZcZb5WMvfmLsUZH7=SEtBrJCSfsFmDYpKX42MzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 11, 2012 at 09:46:58PM -0700, Grant Likely wrote:
...
> >> +Required properties:
> >> +- compatible : shall be "fixed-clock".
> >> +- #clock-cells : from common clock binding; shall be set to 0.
> >> +- clock-frequency : frequency of clock in Hz. May be multiple cells.
> >> +
> >> +Optional properties:
> >> +- gpios : From common gpio binding; gpio connection to clock enable p=
in.
> >
> > This seems a little odd to me to have in the common binding, but I'm not
> > that familiar with too many platforms.
> >
> >> +- clock-output-names : From common clock binding
> >> +
> >> +Example:
> >> + =A0 =A0 clock {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <1000000000>;
> >> + =A0 =A0 };
> >
> > I wonder if this should have an optional clock consumer with a standard
> > name for parenting? =A0For example, on picoxcell there is a fixed 200MHz
> > APB clock that is really a PLL from a 20MHz reference input and I'd like
> > to represent that in the clock tree.
> =

> If it depends on a parent clock, then it really isn't a fixed clock,
> is it (from the perspective of the OS).  The point of this binding is
> a trivial way to describe clocks that don't change.  If that
> assumption doesn't hold true, then this binding isn't suitable for
> that clock.  As you point out, even the gpio enable feature is pushing
> things a bit.
> =

I recently ran into a use case perfectly fitting into this discussion.

We have audio codec sgtl5000 on imx51-babbage board requiring a 26 MHz
clock input to its SYS_MCLK pin.  The board has a 26 MHz oscillator with
a gpio control that outputs 26M_OSC_CLK.  And this clock goes through a
3-state buffer component with another gpio control, and then goes to
sgtl5000 SYS_MCLK pin.  The following is what I have in my mind to
describe them in device tree.

soc_26m_clk: soc-26m-clk {
	compatible =3D "fixed-clock";
	#clock-cells =3D <0>;
	clock-frequency =3D <26000000>;
	clock-output-names =3D "soc-26m-clk";
	gpios =3D <&gpio3 1 0>;
};

sgtl5000_clk: sgtl5000-sys-mclk {
	#clock-cells =3D <0>;
	gpios =3D <&gpio4 26 0>;
	clocks =3D <&soc_26m_clk>;
	clock-names =3D "soc-26m-clk";
	clock-output-names =3D "sgtl5000-sys-mclk";
};

codec: sgtl5000@0a {
	compatible =3D "fsl,sgtl5000";
	reg =3D <0x0a>;
	clocks =3D <&sgtl5000_clk>;
	clock-names =3D "sgtl5000-sys-mclk";
};

The sgtl5000-sys-mclk is a clock with fixed rate, but the rate is really
defined by its parent soc-26m-clk, which is anothe fixed-rate clock.  We
have no doubt that soc-26m-clk is a "fixed-clock".  Is sgtl5000-sys-mclk
a "fixed-clock"?  The following is the "fixed-clock" defined by Mike's
implementation.

/*
 * DOC: basic fixed-rate clock that cannot gate
 *
 * Traits of this clock:
 * prepare - clock never gates.  clk_prepare & clk_unprepare do nothing
 * enable - clock never gates.  clk_enable & clk_disable do nothing
 * rate - rate is always a fixed value.  No clk_set_rate support
 * parent - fixed parent.  No clk_set_parent support
 *
 * note: parent can be NULL, which implies that this clock is a root clock.
 */
struct clk_hw_ops clk_hw_fixed_ops =3D {
       .recalc_rate =3D clk_hw_fixed_recalc_rate,
       .get_parent =3D clk_hw_fixed_get_parent,
};

It says that the "fixed-clock" can have a fixed parent.  So I should
probably add compatible =3D "fixed-clock" for node sgtl5000-sys-mclk too.
Then should I add clock-frequency property for it too?  I'm not sure
about that, since the frequency is really defined by its parent.  IOW,
should the clock-frequency property for "fixed-clock" be optional?  On
the other hand, let clock-frequency property be optional seems a little
illogical to the concept of "fixed-clock".  So I'm really confused here.

With the proper clock support, I would expect that sgtl5000 driver only
needs to make the following two calls to have its clock enabled.

	mclk =3D clk_get(&dev, "sgtl5000-sys-mclk");
	clk_prepare_enable(mclk);

But looking at the current fixed-clock implementation, there is even
no clk_enable operation for fixed-clock.  How can we control the clock
with gpio?

All I'm saying is that we need some level of alignment between clock
binding and common-clk implementation.

Regards,
Shawn

> That said, I'm open to extending this binding if something can be
> defined that will have a lot of use cases.
