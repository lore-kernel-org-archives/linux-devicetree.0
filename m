From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC 2/3] checks: Add unit-address checks for simple-bus and
 default
Date: Fri, 1 Apr 2016 13:27:35 +1100
Message-ID: <20160401022735.GJ416@voom.redhat.com>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
 <1458780021-5052-2-git-send-email-robh@kernel.org>
 <20160331052912.GE416@voom.redhat.com>
 <CAL_JsqJO+9Wna4mjeRLj+ELy7BwL7K=QEVrNGs3CuAaE3Y_Q3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="72k7VsmfIboquFwl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJO+9Wna4mjeRLj+ELy7BwL7K=QEVrNGs3CuAaE3Y_Q3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--72k7VsmfIboquFwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 11:18:25AM -0500, Rob Herring wrote:
> On Thu, Mar 31, 2016 at 12:29 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Mar 23, 2016 at 07:40:20PM -0500, Rob Herring wrote:
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Minor nit: before doing these tests, we should probably add a check
> > which ensures that any bus bridge node *has* a #address-cells and
> > #size-cells value.
>=20
> I'll check, but I thought we already had that check because any bridge
> node has reg or ranges.
>=20
> >
> >> ---
> >>  checks.c                                    | 87 ++++++++++++++++++++=
+++++++--
> >>  tests/run_tests.sh                          |  4 ++
> >>  tests/unit-addr-leading-0s.dts              | 10 ++++
> >>  tests/unit-addr-leading-0x.dts              | 10 ++++
> >>  tests/unit-addr-simple-bus-comma.dts        | 18 ++++++
> >>  tests/unit-addr-simple-bus-reg-mismatch.dts | 18 ++++++
> >>  6 files changed, 142 insertions(+), 5 deletions(-)
> >>  create mode 100644 tests/unit-addr-leading-0s.dts
> >>  create mode 100644 tests/unit-addr-leading-0x.dts
> >>  create mode 100644 tests/unit-addr-simple-bus-comma.dts
> >>  create mode 100644 tests/unit-addr-simple-bus-reg-mismatch.dts
> >>
> >> diff --git a/checks.c b/checks.c
> >> index 48e926e..82a7f38 100644
> >> --- a/checks.c
> >> +++ b/checks.c
> >> @@ -20,6 +20,11 @@
> >>
> >>  #include "dtc.h"
> >>
> >> +#define node_addr_cells(n) \
> >> +     (((n)->addr_cells =3D=3D -1) ? 2 : (n)->addr_cells)
> >> +#define node_size_cells(n) \
> >> +     (((n)->size_cells =3D=3D -1) ? 1 : (n)->size_cells)
> >> +
> >>  #ifdef TRACE_CHECKS
> >>  #define TRACE(c, ...) \
> >>       do { \
> >> @@ -578,12 +583,88 @@ static bool is_simple_bridge(struct node *node)
> >>       return false;
> >>  }
> >>
> >> +static void default_unit_addr(struct check *c, struct node *dt, struc=
t node *node)
> >> +{
> >> +     const char *unitname =3D get_unitname(node);
> >> +
> >> +     if (strstr(unitname, "0x") =3D=3D unitname) {
> >> +             FAIL(c, "Node %s unit address should not have leading \"=
0x\"",
> >> +                  node->fullpath);
> >> +             /* skip over 0x for next test */
> >> +             unitname +=3D 2;
> >> +     }
> >> +     if (unitname[0] =3D=3D '0' && isxdigit(unitname[1]))
> >> +             FAIL(c, "Node %s unit address should not have leading 0s=
",
> >> +                  node->fullpath);
> >
> > Explicitly checking various aspects of the format seems a bit weird to
> > me.  Why not just generate the expected address from 'reg' and
> > strcmp()?
>=20
> Because for the default check, I'm only testing these aspects. I found
> some cases running this thru the kernel tree dts files that the full
> simple-bus check is too strict. For example, we want to warn on
> "@0x002,4", but not "@2,4" or "@2blah".

Ok.  Thinking about it, I think this might work a bit better separated
(mostly) from the bus type stuff.  Basically treat it as a "common
unit name problems" test, that will skip itself if a bus type is set
(which will allow more thorough testing of the unit name).

> >> +static void simple_bus_unit_addr(struct check *c, struct node *dt, st=
ruct node *node)
> >> +{
> >> +     const char *unitname =3D get_unitname(node);
> >> +     struct property *prop;
> >> +     uint64_t unitaddr, regaddr =3D 0;
> >> +     int n, addr_cells;
> >> +     cell_t *cell;
> >> +
> >> +     default_unit_addr(c, dt, node);
> >> +
> >> +     n =3D strspn(unitname, DIGITS "abcedf");
> >> +     if (n !=3D strlen(unitname))
> >> +             FAIL(c, "Node %s unit address should have only lower cas=
e hex digits",
> >> +                  node->fullpath);
> >> +
> >> +     unitaddr =3D strtoll(unitname, NULL, 16);
> >> +
> >> +     prop =3D get_property(node, "reg");
> >> +     if (!prop) {
> >> +             prop =3D get_property(node, "ranges");
> >> +             if (!prop || !prop->val.len)
> >> +                     return;
> >> +
> >> +             cell =3D (cell_t *)prop->val.val;
> >> +             cell +=3D node_addr_cells(node);
> >> +     } else
> >> +             cell =3D (cell_t *)prop->val.val;
> >> +
> >> +     addr_cells =3D node_addr_cells(node->parent);
> >> +     while (addr_cells--)
> >> +             regaddr =3D (regaddr << 32) | fdt32_to_cpu(*cell++);
> >> +
> >> +     if (regaddr !=3D unitaddr)
> >> +             FAIL(c, "Node %s unit address does not match reg address=
 (%zx !=3D %zx)",
> >> +                  node->fullpath, regaddr, unitaddr);
> >
> > Again, parsing the unit address and comparing back to reg seems
> > backwards to me.
>=20
> I agree here. And then I don't need simple-bus to inherit the default che=
cks.

Yes, I think that makes sense.

> >> +}
> >> +
> >>  struct bus_type simple_bus_type =3D {
> >>       .expected_addr_cells =3D -1, /* For don't care */
> >>       .expected_size_cells =3D -1,
> >>       .is_type =3D is_simple_bridge,
> >> +     .check_unit_addr =3D simple_bus_unit_addr,
> >> +};
> >> +
> >> +struct bus_type default_bus_type =3D {
> >> +     .expected_addr_cells =3D -1, /* For don't care */
> >> +     .expected_size_cells =3D -1,
> >> +     .check_unit_addr =3D default_unit_addr,
> >>  };
> >>
> >> +static void check_unit_address_format(struct check *c, struct node *d=
t,
> >> +                                   struct node *node)
> >> +{
> >> +     struct bus_type *bt;
> >> +
> >> +     if (!node->parent)
> >> +             return;
> >> +
> >> +     bt =3D node->parent->bus_type;
> >> +     if (!bt)
> >> +             bt =3D &default_bus_type;
> >> +
> >> +     if (bt->check_unit_addr)
> >> +             bt->check_unit_addr(c, dt, node);
> >> +}
> >> +NODE_WARNING(unit_address_format, NULL);
> >
> > I'm not entirely convinced with the idea of the default unit address
> > checker.  I'm more inclined towards only checking when we have a known
> > bus type, then trying to expand those known bus types as much as we can.
>=20
> We've been thru this. The default check is pretty minimal. If we could
> come up with determining bus types of I2C and SPI, then maybe. We
> could look at controller node names, but then if the node names are
> wrong, we'd need to detect that. With SPI the child nodes generally
> have SPI specific properties. With I2C, we don't have anything else to
> key off of.

Ok.  As above, I think I'd be more comfortable with this check as a
"common mistakes" warning than a "default bus" checker.

It's a small distinction, but it's a question of being presented as
something with authoritative knowledge of what a unit address should
look like, versus something looking for specific common problems.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--72k7VsmfIboquFwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW/dyXAAoJEGw4ysog2bOSV2YP/i1nZdMKQnwhFO1yoI/iU0XC
APU4OQfIGEqoV871H+aTpsX7JtRjwkuxg2i9+vY9s10reQwnW7920sr5v9lFBkyU
u72IGZU3yNK3F8Le3xH82SjSC8Bq8NR/ESRGKnsSiYlxknFHpI7HNs+Q2sM6mLFG
GUTF2PNfFdRPJo/hWisZVZquJOyl9Yqjg2V22VsNfYiKdk8M2EBOVnEsA7p+XKwi
FQ+OaG0JgWbEic54fVQFJM4nyawO7gOJAC9PsmUTDJVZF8I/7NjSSzfvVOjXSmK/
WilXShHzgrx6LzcPH0G+zGvxVlG1g2hHJVVp+lypQa0TNm5ME+qBAoMVq8vyx3OT
Qs2fMyzUc1dUoY3IvcNhhCoJuyJxejxWR56s2VVVBdsuALvMnGM+MEV4pCeW/3OR
tm8JT7F11vsXCDkRUUEL4bIiXfT3jgRUeTCuiVgO46sawN+Qe26Hx2w4Uq7etNvD
PPIfLKVcakRkKuSXscbk88BLp6+bjC4mgFbtFchnnZpKgezPwXJIAUXzRN/iidtS
YOgEhw/+Diq+meotG4V8iE8aVqStF1DX72ZROoKhtI7sbqb/KOezSCUOpUG23rOy
0eU5qVu7Z9gG+R5w+/tbV2K1jdX6+mOAbrRLV7LXM57ZlUWld9/wqiVahV1jxBSh
5/LU6g3AshVyWv4zs4hC
=Jthd
-----END PGP SIGNATURE-----

--72k7VsmfIboquFwl--
