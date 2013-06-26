From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 1/4] Make non-linear GPIO ranges accesible from gpiolib
Date: Wed, 26 Jun 2013 13:42:01 +0200
Message-ID: <20130626114159.GA7095@ab42.lan>
References: <20130618092516.GC18663@ab42.lan>
 <1371547751-13873-1-git-send-email-christian.ruppert@abilis.com>
 <CACRpkdbhTsRAGSkxQURd01_yd5arw7=ktVXAmeEo22gFg4U38Q@mail.gmail.com>
 <51C1F531.3050205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51C1F531.3050205@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2013 at 12:15:13PM -0600, Stephen Warren wrote:
> On 06/19/2013 06:03 AM, Linus Walleij wrote:
> > On Tue, Jun 18, 2013 at 11:29 AM, Christian Ruppert
> > <christian.ruppert@abilis.com> wrote:
> >=20
> >> This patch adds the infrastructure required to register non-linear=
 gpio
> >> ranges through gpiolib and the standard GPIO device tree bindings.
> >>
> >> Signed-off-by: Christian Ruppert <christian.ruppert@abilis.com>
> >=20
> > I'm basically fine with this, but would like Stephen's ACK if possi=
ble.
> >=20
> >> +In addition, named groups of pins can be mapped to pin groups of =
a given
> >> +pin controller:
> >> +
> >> +       gpio_pio_g: gpio-controller@1480 {
> >> +               #gpio-cells =3D <2>;
> >> +               compatible =3D "fsl,qe-pario-bank-e", "fsl,qe-pari=
o-bank";
> >> +               reg =3D <0x1480 0x18>;
> >> +               gpio-controller;
> >> +               gpio-ranges =3D <&pinctrl1 0 0 0>, <&pinctrl2 3 0 =
0>;
> >> +               gpio-ranges-group-names =3D "foo", "bar";
> >> +       };
> >> +
> >> +where,
> >> +   &pinctrl1 and &pinctrl2 is the phandle to the pinctrl DT node.
> >> +
> >> +   The following value specifies the base GPIO offset of the pin =
range with
> >> +   respect to the GPIO controller's base. The remaining two value=
s must be
> >> +   0 to indicate that a named pin group should be used for the re=
spective
> >> +   range. The number of pins in the range is the number of pins i=
n the pin
> >> +   group.
> >=20
> > So while this works, these zeroes seem a bit awkward, but maybe
> > it's the only way?
> >=20
> > I'm not good enough on device tree conventions, but isn't this poss=
ible:
> >=20
> >               gpio-ranges =3D <&pinctrl1 0>, <&pinctrl2 3>;
> >               gpio-ranges-group-names =3D "foo", "bar";
> >=20
> > Since we don't have any #gpio-ranges-cells or anything like that I
> > guess we can define this to have a flexible number of cells
> > depending on use case?
>=20
> If we're willing to have gpio-ranges be either *all* group names, or
> *all* IDs, we can define the format of gpio-ranges to have two cells
> (phandle and GPIO number) if the property gpio-ranges-group-names
> exists, but four cells (phandle, GPIO number, pin number, count)
> otherwise. However, that's a little restrictive, since then what if o=
ne
> GPIO controller is hooked to two different pinmux controllers, and yo=
u
> want to use different formats for the references to each. A
> #gpio-ranges-cells in the target of the phandle would allow this, but=
 I
> don't think this is something the pinctrl node should dictate to thos=
e
> who reference it; it's quite legitimate for a GPIO node to use the pu=
re
> numeric mapping even if the pin controller happens to expose some pin
> groups that allow you to do the mapping by name.

I actually had a version of the patch with #gpio-range-cells specifying
the format (one argument for named ranges, three for classical ranges)
before deciding to use a separate property and sending that version. As
I said in a previous mail, I don't have a preference which of the
following three possibilities to use and would be grateful for some
guidance (if it matters at all).

1.) separate property:
	gpio {
		gpio-ranges =3D <&pinctrl1 0 0 5>;
		gpio-range-groups =3D <&pinctrl2 5>;
		gpio-range-group-names =3D "gpios";
	};

2.) fixed number of three arguments:
	gpio {
		gpio-ranges =3D <&pinctrl1 0 0 5>, <&pinctrl2 5 0 0>;
		gpio-range-names =3D "", "gpios";
	};

3.) pinctrl-defined format.
	pinctrl1: pctl1 {
		#gpio-range-cells =3D <3>;
	};
	pinctrl2: pctl2 {
		#gpio-range-cells =3D <1>;
	};
	gpio {
		gpio-ranges =3D <&pinctrl1 0 0 5>, <&pinctrl2 5>;
		gpio-range-names =3D "", "gpios";
	};

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
