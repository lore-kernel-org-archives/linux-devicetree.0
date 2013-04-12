From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH] clk: Add device tree binding to clk-fixed-factor
Date: Fri, 12 Apr 2013 08:54:19 +0200
Message-ID: <20130412065417.GA29291@ab42.lan>
References: <1365608443-30350-1-git-send-email-christian.ruppert@abilis.com>
 <51658BA9.7030508@free-electrons.com>
 <20130410162747.GG32603@ab42.lan>
 <20130411091952.GF8400@ab42.lan>
 <5166E41F.7060100@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5166E41F.7060100@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@linaro.org>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Landley <rob@landley.net>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2013 at 06:26:07PM +0200, Gregory CLEMENT wrote:
> On 04/11/2013 11:19 AM, Christian Ruppert wrote:
> > Hi Gregory,
> >=20
> > Since there doesn't seem to be anyone opposing this feature I just
> > checked your patch and after adding the CLK_OF_DECLARE macro in the=
 end
> > it works well for us. Tell me if you would like to rebase and resub=
mit
> > your patch or if I should follow up on our own.
>=20
> I can rebase and resubmit my patch, it's pretty straightforward.
> The problem was the lack of user in the kernel. And by user I mean
> a driver using these functions. Usually a new function enter in the
> kernel only if there are users for it inside the kernel so if you pla=
n
> to submit a driver using this piece of code, then I see no reason
> to not get it.

If you add the line

CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clkdiv",=20

in the end of drivers/clk/clk-fixed-factor.c, the new function will be
automatically used by of_clk_init(NULL) which itself is used in numerou=
s
platform ports, in particular arch/arc/plat-tb10x. plat-tb10x is curren=
tly
being integrated in the ARC architecture tree. The device tree file
requiring this patch is already in linux-next (see
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/a=
rch/arc/boot/dts/abilis_*.dtsi).

We didn't know if you wanted to resubmit your patch or if I should
pursue mine at the time, and today it uses the naming scheme from mine.
It would be nice if you could either adapt your patch to that naming
scheme.

Greetings,
  Christian

> > Greetings,
> >   Christian
> >=20
> > On Wed, Apr 10, 2013 at 06:27:47PM +0200, christian ruppert wrote:
> >> Hi Gregory,
> >>
> >> We use derived clocks with fixed ratios for our TB10x platform. I
> >> originally had this in the platform code but Vineet (the platform
> >> maintainer) rightly pointed out that the common clock framework wo=
uld
> >> be the correct place for it.
> >> Is there any reason not to support this functionality? After all, =
the
> >> generic fixed rate clock also has a device tree binding and I'd gu=
ess
> >> we're not the only ones statically deriving one clock from another=
 in
> >> our SOCs.
> >>
> >> Greetings,
> >>   Christian
> >>
> >> On Wed, Apr 10, 2013 at 05:56:25PM +0200, Gregory CLEMENT wrote:
> >>> Hi Christian,
> >>>
> >>> On 04/10/2013 05:40 PM, Christian Ruppert wrote:
> >>>> This patch adds a device tree binding for the simple fixed facto=
r clock
> >>>> divider/multiplier of the common clock tree binding.
> >>>
> >>> This patch remind me of something :
> >>> http://lists.infradead.org/pipermail/linux-arm-kernel/2012-August=
/116405.html
> >>>
> >>> Do you have a use case for it, this time?
> >>>
> >>> My version have been hold off waiting for an user for it.
> >>> Will you need it for a driver?
> >>>
> >>> Regards,
> >>>
> >>>>
> >>>> Signed-off-by: Christian Ruppert <christian.ruppert@abilis.com>
> >>>> ---
> >>>>  .../bindings/clock/fixed-factor-clkdiv.txt         |   24 +++++=
++++++++++
> >>>>  drivers/clk/clk-fixed-factor.c                     |   32 +++++=
+++++++++++++++
> >>>>  include/linux/clk-provider.h                       |    1 +
> >>>>  3 files changed, 57 insertions(+), 0 deletions(-)
> >>>>  create mode 100644 Documentation/devicetree/bindings/clock/fixe=
d-factor-clkdiv.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/clock/fixed-facto=
r-clkdiv.txt b/Documentation/devicetree/bindings/clock/fixed-factor-clk=
div.txt
> >>>> new file mode 100644
> >>>> index 0000000..352bac4
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/clock/fixed-factor-clkdi=
v.txt
> >>>> @@ -0,0 +1,24 @@
> >>>> +Device Tree Clock bindings for plat-tb10x
> >>>> +
> >>>> +This binding uses the common clock binding[1].
> >>>> +
> >>>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> >>>> +
> >>>> +Required properties:
> >>>> +- compatible : shall be "fixed-factor-clkdiv"
> >>>> +- #clock-cells: from common clock binding; shall be set to 0
> >>>> +- clocks: shall be the input parent clock phandle for the clock=
=2E
> >>>> +- clock-mult: defines the multiplication factor of the output c=
lock frequency
> >>>> +  wrt. the input clock frequency.
> >>>> +- clock-div: defines the division factor of the output clock fr=
equency wrt.
> >>>> +  the input clock frequency.
> >>>> +
> >>>> +Example:
> >>>> +cpu_clk: clkdiv_cpu {	/* CPU clock derived from pll0. 1/2 of pl=
l frequency */
> >>>> +	compatible =3D "fixed-factor-clkdiv";
> >>>> +	#clock-cells =3D <0>;
> >>>> +	clocks =3D <&pll0>;
> >>>> +	clock-mult =3D <1>;
> >>>> +	clock-div =3D <2>;
> >>>> +	clock-output-names =3D "cpu_clk";
> >>>> +};
> >>>> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fi=
xed-factor.c
> >>>> index 1ef271e..85e45f1 100644
> >>>> --- a/drivers/clk/clk-fixed-factor.c
> >>>> +++ b/drivers/clk/clk-fixed-factor.c
> >>>> @@ -11,6 +11,7 @@
> >>>>  #include <linux/clk-provider.h>
> >>>>  #include <linux/slab.h>
> >>>>  #include <linux/err.h>
> >>>> +#include <linux/of.h>
> >>>> =20
> >>>>  /*
> >>>>   * DOC: basic fixed multiplier and divider clock that cannot ga=
te
> >>>> @@ -96,3 +97,34 @@ struct clk *clk_register_fixed_factor(struct =
device *dev, const char *name,
> >>>> =20
> >>>>  	return clk;
> >>>>  }
> >>>> +
> >>>> +#ifdef CONFIG_OF
> >>>> +/**
> >>>> + * of_fixed_factor_clkdiv_setup() - Set up simple fixed factor =
clock divider
> >>>> + */
> >>>> +void of_fixed_factor_clkdiv_setup(struct device_node *node)
> >>>> +{
> >>>> +	struct clk *clk;
> >>>> +	const char *clk_name =3D node->name;
> >>>> +	const char *parent_name;
> >>>> +	u32 mult, div;
> >>>> +
> >>>> +	if (of_property_read_u32(node, "clock-mult", &mult))
> >>>> +		return;
> >>>> +
> >>>> +	if (of_property_read_u32(node, "clock-div", &div))
> >>>> +		return;
> >>>> +
> >>>> +	parent_name =3D of_clk_get_parent_name(node, 0);
> >>>> +
> >>>> +	of_property_read_string(node, "clock-output-names", &clk_name)=
;
> >>>> +
> >>>> +	clk =3D clk_register_fixed_factor(NULL, clk_name, parent_name,=
 0,
> >>>> +					mult, div);
> >>>> +	if (!IS_ERR(clk))
> >>>> +		of_clk_add_provider(node, of_clk_src_simple_get, clk);
> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(of_fixed_factor_clkdiv_setup);
> >>>> +CLK_OF_DECLARE(fixed_clkdiv, "fixed-factor-clkdiv",
> >>>> +		of_fixed_factor_clkdiv_setup);
> >>>> +#endif
> >>>> diff --git a/include/linux/clk-provider.h b/include/linux/clk-pr=
ovider.h
> >>>> index 7f197d7..d4937cf 100644
> >>>> --- a/include/linux/clk-provider.h
> >>>> +++ b/include/linux/clk-provider.h
> >>>> @@ -184,6 +184,7 @@ struct clk *clk_register_fixed_rate(struct d=
evice *dev, const char *name,
> >>>>  		unsigned long fixed_rate);
> >>>> =20
> >>>>  void of_fixed_clk_setup(struct device_node *np);
> >>>> +void of_fixed_factor_clkdiv_setup(struct device_node *node);
> >>>> =20
> >>>>  /**
> >>>>   * struct clk_gate - gating clock
> >>>>
> >>>
> >>>
> >>> --=20
> >>> Gregory Clement, Free Electrons
> >>> Kernel, drivers, real-time and embedded Linux
> >>> development, consulting, training and support.
> >>> http://free-electrons.com
> >>
> >> --=20
> >>   Christian Ruppert              ,          <christian.ruppert@abi=
lis.com>
> >>                                 /|
> >>   Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=
=E9-Fleuri
> >>                              _// | bilis Systems   CH-1228 Plan-le=
s-Ouates
> >=20
>=20
>=20
> --=20
> Gregory Clement, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
