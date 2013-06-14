From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 2/2] Make non-linear GPIO ranges accesible from gpiolib
Date: Fri, 14 Jun 2013 11:12:43 +0200
Message-ID: <20130614091241.GA23745@ab42.lan>
References: <CACRpkdY9F0cUaRfGJnHJW=2dYf_yKkr3M8Kh+_e6XQhh1WBoUA@mail.gmail.com>
 <1371128132-18266-2-git-send-email-christian.ruppert@abilis.com>
 <51BA3BC1.3090109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51BA3BC1.3090109@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2013 at 03:38:09PM -0600, Stephen Warren wrote:
> On 06/13/2013 06:55 AM, Christian Ruppert wrote:
> > This patch adds the infrastructure required to register non-linear =
gpio
> > ranges through gpiolib and the standard GPIO device tree bindings.
>=20
> That's not exactly true. The existing gpio-ranges property already
> allows non-linear ranges to be represented quite easily; each entry i=
n
> the gpio-ranges list is <gpio-base> <pinctrl-base> <count>, so you ca=
n
> piece together any mapping you want.

You're right, my description is somewhat imprecise here.

> The potential advantage of this patch is that the pinctrl-side of the
> mapping can be a group name rather than pin IDs, which might reduce t=
he
> size of the mapping list if you have an extremely sparse or non-linea=
r
> mapping /and/ parts of that mapping just happen to align with the pin
> groups in the pin controller HW, since each entry in the gpio-ranges
> property can be sparse/non-linear, rather than being a small linear
> chunk of the mapping.

Pin controller authors have the freedom to define pin groups just for
the purpose of "predefining" the pinctrl side of GPIO ranges. For
example, the pinctrl driver from the original patch in this discussion
has different types of pin groups treated differently by the driver's
internal logic.

> As an aside, for Tegra I solved this differently: In the pinctrl driv=
er,
> I simply defined the pin IDs to exactly match the GPIO IDs in order, =
so
> the mapping is 100% linear. Of course, this only works if your pinctr=
l
> HW documentation doesn't define any kind of numbering/ordering for yo=
ur
> pins, so you can pick any order you want for the pinctrl binding/driv=
er.
> This was true for Tegra20, since the HW only used groups for muxing.
> Given more recent Tegra SoCs have moved to per-pin muxing, that might
> not have been the best decision though, since now the HW registers at
> least do have a defined ordering/ID for each pin. If only we'd starte=
d
> with Tegra30 support not Tegra20:-)

My motivation of this patch is exactly the same problem put differently=
:
Confine the pin numbering (or what could be called a pin data base) to
the pin controller and free it from external constraints (which can be
gpio-ranges consecutiveness, customer documentation coherency or
whatever).

> > diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Docu=
mentation/devicetree/bindings/gpio/gpio.txt
>=20
> > +In addition, named groups of pins can be mapped to pin groups of a=
 given
> > +pin controller:
> > +
> > +	gpio_pio_g: gpio-controller@1480 {
> > +		#gpio-cells =3D <2>;
> > +		compatible =3D "fsl,qe-pario-bank-e", "fsl,qe-pario-bank";
> > +		reg =3D <0x1480 0x18>;
> > +		gpio-controller;
> > +		gpio-pingrps =3D <&pinctrl1 0>, <&pinctrl2 3>;
> > +		gpio-pingrp-names =3D "pctl1_gpio_g", "pctl2_gpio_g";
>=20
> A few thoughts here:
>=20
> "gpio-pingrps" doesn't sound very similar to the existing "gpio-range=
s".
> Can we make their equivalent purpose more obvious by renaming this
> "gpio-group-ranges"?
>=20
> I'm not actually even sure we need a new property for this, except fo=
r
> the string group names. We could fold the new gpio-pingrps into the
> existing gpio-ranges, whose entries have the format:
>=20
> <gpio-base> <pinctrl-base> <count>
>=20
> ... by saying that if count=3D=3D0, it means to use a group name inst=
ead of
> a pinctrl-base value. We can insist that pinctrl-base=3D=3D0 in this =
case
> too. If we go made, count=3D=3D0 could mean "special" and pinctrl-bas=
e=3D=3D0
> could mean "by pinctrl group name", and other values of pinctrl-base
> could be added later to mean other things!
>=20
> gpio-ranges =3D
> 	<&pinctrl1 0 20 10>, /* Existing numeric style */
> 	<&pinctrl2 10 0 0>,  /* Count=3D=3D0, so group name style */
> 	<&pinctrl1 0 20 10>, /* Existing numeric style */
> gpio-ranges-group-names =3D
> 	"",    /* No group name required for entry 0 */
> 	"gr1", /* Group name for entry 1 */
> 	"";    /* No group name required for entry 2 */
>=20
> Does this seem better?

I had a similar hesitation when implementing this and found the
gpio-ranges-contains-everything approach slightly confusing. On the
other hand I think it is more elegant to have only one property (plus
the strings). I didn't reach a clear conclusion and I'll happily follow
the advice of people having more device-tree experience than myself.
Just tell me if you prefer to rename the gpio-pingrps or merge
everything into gpio-ranges.

> > +		gpio-pingrp-names =3D "pctl1_gpio_g", "pctl2_gpio_g";
>=20
> I'm slightly worried that those example group names appear to be
> globally scoped. I would hope the group names are interpreted
> relative-to or within the pin controller that they are associated wit=
h.

They are relative to the pin controller that they are associated with.

> I wouldn't expect the pin controllers to include their own name in th=
e
> names of the pin groups they expose. In other words, I'd expect that
> example to be more like:
>=20
> > +		gpio-pingrp-names =3D "foo", "bar";

OK, I'll change that in the doc.

> > +The pinctrl node must have a "#gpio-pingrp-cells" property set to =
one to
> > +define the number of arguments to pass with the phandle.
>=20
> This shouldn't be required.
>=20
> Such properties are useful when one node references a second node, an=
d
> that second node dictates the format of the reference. However, that =
is
> not the case here; the definition of gpio-pingrp-names itself always
> dictates its format entirely, and hence the value #gpio-pingrp-cells
> must always be 1, and hence there is no point requiring any reference=
d
> node to include this property.

This is a residue from my hesitation between a single gpio-ranges
property and the proposed format: My alternative idea was that a pin
controller either provides pin numbers or named gpio ranges and that
#gpio-range-cells defines which (3 for pin numbers, 1 for named ranges)=
=2E
Your proposal with the 0s is probably more flexible for future
extensions.

> I realize this issue was inherited from the existing gpio-ranges
> documentation/implementation, but I've posted patches to solve that,
> triggered by thinking about this patch:
>=20
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-June/03546=
2.html
> (the rest of the series will make it more clear, i.e. the new of_ API=
)
>=20
> > +Both methods can be combined in the same GPIO controller, e.g.
>=20
> In the proposal I have above, combining the mechanisms is slightly mo=
re
> cohesive, I think.

I agree. Shall I go for the combined gpio-ranges then?

Greetings,
  Christian

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
