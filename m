From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] clk: sunxi: Extend the simple gates and
 handle the Allwinner H3
Date: Tue, 8 Dec 2015 07:42:26 +0100
Message-ID: <20151208074226.17c75247f9eed69c9cac1d2d@free.fr>
References: <20151206100412.1a74b71da8e9ca28c6e61589@free.fr>
	<20151207143102.GA29097@rob-hp-laptop>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBWXXTGZQKGQE6WQDA4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20151207143102.GA29097@rob-hp-laptop>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 7 Dec 2015 08:31:02 -0600
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Sun, Dec 06, 2015 at 10:04:12AM +0100, Jean-Francois Moine wrote:
> > The H3 has a clock gate definition similar to the other Allwinner SoCs,
> > but with a different parent clock for each single gate.
> >=20
> > Adding the names of the parent clocks in both the source and output clo=
cks
> > permits the use of the simple-gates driver to define the bus gates
> > of all known Allwinner SoCs.
> >=20
> > Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> > ---
> > This patch replaces a part of Jens Kuske's patch
> > 	[PATCH v5 1/4] clk: sunxi: Add H3 clocks support
> > ---
> >  Documentation/devicetree/bindings/clock/sunxi.txt | 25 +++++++++++++++=
++++++++
> >  drivers/clk/sunxi/clk-simple-gates.c              | 14 ++++++++++++-
> >  2 files changed, 38 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Docume=
ntation/devicetree/bindings/clock/sunxi.txt
> > index 8a47b77..5736e6d 100644
> > --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> > +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> > @@ -70,6 +70,7 @@ Required properties:
> >  	"allwinner,sun8i-a23-usb-clk" - for usb gates + resets on A23
> >  	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
> >  	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
> > +	"allwinner,sunxi-gates-clk" - simple gates
> > =20
> >  Required properties for all clocks:
> >  - reg : shall be the control register address for the clock.
> > @@ -93,6 +94,12 @@ The "allwinner,sun9i-a80-mmc-config-clk" clock also =
requires:
> >  - #reset-cells : shall be set to 1
> >  - resets : shall be the reset control phandle for the mmc block.
> > =20
> > +The "allwinner,sunxi-gates-clk" clock also requires:
> > +- clock-names : corresponding names of the parent clocks
> > +when the output clocks have different parents.
> > +These names must be 4 characters long and must appear as a prefix in
> > +the names of the output clocks. See example.
> > +
>=20
> I don't think you should be encoding relationships of clocks using the=20
> name strings. We describe relationships in DT via parent/child or=20
> phandles.

As you know, in the H3, each of the 49 output clock has one of the 4
main clocks as its source.
There are 3 options for defining the source of each clock:
1- all definitions are in the DT,
2- some definitions are in the DT, some other ones are hard-coded,
3- all definitions are hard-coded.

The 2nd option is the one proposed by Jens
	https://lkml.org/lkml/2015/12/4/689
In the code, the clock index gives the source clock.
This means that this code is H3 specific and that it cannot be reused
for an other SoC.

So, instead of putting some information in the DT, the 3rd option could
be done without too much overhead with a DT:

	bus_gates: clk@01c20060 {
		#clock-cells =3D <1>;
		compatible =3D "allwinner,sun8i-h3-bus-gates-clk";
		reg =3D <0x01c20060 0x14>;
		clocks =3D <&ahb1>, <&ahb2>, <&apb1>, <&apb2>;
		clock-names =3D "ahb1", "ahb2", "apb1", "apb2";
		/* no clock-indices, nor clock-output-names,
		 * these ones are hard-coded */
};

But, this option, as the previous one, implies new code for each new
SoC.

I better like the 1st option (reusable/generic code).
This one may be done in many ways:

1.1- define a source phandle of each output clock.
    There were many proposals for such definitions, the simplest being
    mine:
	https://lkml.org/lkml/2015/10/22/109
    but this asked for a long list in 'clocks', and Maxime did not like
    that.

1.2- use a container per source clock
	https://lkml.org/lkml/2015/10/23/?663

1.3- use a part of the name of the output clock as the source reference.
    Current proposal, which seemed to suit Maxime
	https://lkml.org/lkml/2015/10/26/647

1.4- have you any other idea?

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
