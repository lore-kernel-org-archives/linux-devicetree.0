From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 2/2] Make non-linear GPIO ranges accesible from gpiolib
Date: Mon, 17 Jun 2013 18:03:25 +0200
Message-ID: <20130617160324.GA15853@ab42.lan>
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
> [...]
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
> [...]

In the follow-up a patch set based on this proposal. I have also
included our drivers (and device tree updates) with this to see how thi=
s
looks in a real (working) system. To me it does actually look quite nic=
e
and logical but take a look at it yourselves and tell me what you think=
=2E

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
