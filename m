From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: add phandle with arg property checks
Date: Fri, 25 Aug 2017 10:49:43 +1000
Message-ID: <20170825004943.GN5379@umbus.fritz.box>
References: <20170822230208.20987-1-robh@kernel.org>
 <20170822230208.20987-2-robh@kernel.org>
 <20170824020338.GV5379@umbus.fritz.box>
 <CAL_Jsq+0Njjs_PHBSD-B7W9YFzdfpB2ApBcBD=48+BoXQKv2pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UIkw8Cc2/Xz5YwHB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+0Njjs_PHBSD-B7W9YFzdfpB2ApBcBD=48+BoXQKv2pw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--UIkw8Cc2/Xz5YwHB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2017 at 12:23:16PM -0500, Rob Herring wrote:
> On Wed, Aug 23, 2017 at 9:03 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Tue, Aug 22, 2017 at 06:02:06PM -0500, Rob Herring wrote:
> >> Many common bindings follow the same pattern of client properties
> >> containing a phandle and N arg cells where N is defined in the provider
> >> with a '#<specifier>-cells' property such as:
> >>
> >>       intc0: interrupt-controller@0 {
> >>               #interrupt-cells =3D <3>;
> >>       };
> >>       intc1: interrupt-controller@1 {
> >>               #interrupt-cells =3D <2>;
> >>       };
> >>
> >>       node {
> >>               interrupts-extended =3D <&intc0 1 2 3>, <&intc1 4 5>;
> >>       };
> >>
> >> Add checks for properties following this pattern.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >> v2:
> >> - Make each property a separate check
> >> - Iterate over raw cells rather than markers
> >> - Fix property length check for 2nd to Nth items
> >> - Improve error messages. If cell sizes are wrong, the next iteration =
can
> >>   get a bad (but valid) phandle.
> >> - Add a test
> >>
> >>  checks.c                    | 104 +++++++++++++++++++++++++++++++++++=
+++++++++
> >>  dtc.h                       |   1 +
> >>  livetree.c                  |   6 +++
> >>  tests/bad-phandle-cells.dts |  11 +++++
> >>  tests/run_tests.sh          |   1 +
> >>  5 files changed, 123 insertions(+)
> >>  create mode 100644 tests/bad-phandle-cells.dts
> >>
> >> diff --git a/checks.c b/checks.c
> >> index afabf64337d5..548d7e118c42 100644
> >> --- a/checks.c
> >> +++ b/checks.c
> >> @@ -956,6 +956,93 @@ static void check_obsolete_chosen_interrupt_contr=
oller(struct check *c,
> >>  WARNING(obsolete_chosen_interrupt_controller,
> >>       check_obsolete_chosen_interrupt_controller, NULL);
> >>
> >> +struct provider {
> >> +     const char *prop_name;
> >> +     const char *cell_name;
> >> +     bool optional;
> >
> > AFAICT you don't actually use this optional flag, even in the followup
> > patches; it's always false.
>=20
> Yes, it is. Here:
>=20
> >> +WARNING_PROPERTY_PHANDLE_CELLS(msi_parent, "msi-parent", "#msi-cells"=
, true);
>=20
> Well hidden, isn't it. :)

Little bit, yes.  Objection withdrawn.

>=20
> >
> >> +};
> >> +
> >> +static void check_property_phandle_args(struct check *c,
> >> +                                       struct dt_info *dti,
> >> +                                       struct node *node,
> >> +                                       struct property *prop,
> >> +                                       const struct provider *provide=
r)
> >> +{
> >> +     struct node *root =3D dti->dt;
> >> +     int cell, cellsize =3D 0;
> >> +
> >> +     for (cell =3D 0; cell < prop->val.len / sizeof(cell_t); cell +=
=3D cellsize + 1) {
> >> +             struct node *provider_node;
> >> +             struct property *cellprop;
> >> +             int phandle;
> >> +
> >> +             phandle =3D propval_cell_n(prop, cell);
> >> +             if (phandle =3D=3D 0 || phandle =3D=3D -1) {
> >> +                     cellsize =3D 0;
> >> +                     continue;
> >
> > I'm not clear what case this is handling.  If the property has an
> > invalid (or unresolved) phandle value, shouldn't that be a FAIL?  As
> > it is we interpret the next cell as a phandle, and since we couldn't
> > resolve the first phandle, we can't be at all sure that it really is a
> > phandle.
>=20
> It is valid to have a "blank" phandle when you have optional entries,
> but need to preserve the indexes of the entries. Say an array of gpio
> lines and some may not be hooked up. Not widely used, but it does
> exist in kernel dts files.

Ah ok.  A comment to that effect would be helpful.

>=20
>=20
> >> +             }
> >> +
> >> +             provider_node =3D get_node_by_phandle(root, phandle);
> >> +             if (!provider_node) {
> >> +                     FAIL(c, dti, "Could not get phandle node for %s:=
%s(cell %d)",
> >> +                          node->fullpath, prop->name, cell);
> >> +                     break;
> >> +             }
> >> +
> >> +             cellprop =3D get_property(provider_node, provider->cell_=
name);
> >> +             if (cellprop) {
> >> +                     cellsize =3D propval_cell(cellprop);
> >> +             } else if (provider->optional) {
> >> +                     cellsize =3D 0;
> >> +             } else {
> >> +                     FAIL(c, dti, "Missing property '%s' in node %s o=
r bad phandle (referred from %s:%s[%d])",
> >> +                          provider->cell_name,
> >> +                          provider_node->fullpath,
> >> +                          node->fullpath, prop->name, cell);
> >> +                     break;
> >> +             }
> >> +
> >> +             if (prop->val.len < ((cell + cellsize + 1) * sizeof(cell=
_t))) {
> >> +                     FAIL(c, dti, "%s property size (%d) too small fo=
r cell size %d in %s",
> >> +                          prop->name, prop->val.len, cellsize, node->=
fullpath);
> >> +             }
> >
> > How will this cope if the property is really badly formed - e.g. a 3
> > byte property, so you can't even grab a whole first phandle?  I think
> > it will trip the assert() in propval_cell_n() which isn't great.
>=20
> At least for your example, we'd exit the loop (cell < 3/4). But I need
> to a check for that because it would be silent currently. I'll add a
> check that the size is a multiple of 4 and greater than 0.

Ok.

> However, the check here is not perfect because we could have
> "<&phandle1 1 2>" when really it should be "<&phandle1 &phandle2
> &phandle3>". We don't fail until we're checking the 2nd phandle.
> That's why I added the "or bad phandle" and the cell # in the message
> above. In the opposite case, we'd be silent. One thing that could be
> done is double check things against the markers if they are present.

Uh.. I don't really understand what you're getting at here.  We should
be able to determine which of these cases it should be by the
#whatever-cells at &phandle1.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UIkw8Cc2/Xz5YwHB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmfdCQACgkQbDjKyiDZ
s5JYEg//W+5WnrM0lwMUwDsRfdy39x8H9IEilTUSvQ7ctetq9z6cSr/GKph9vqHY
oKwB85Mxxrh4XHLTEszyex1LGbEXRrD6nOoKc+T1z3Q8jfe+uCkSTw7JUZP71HcF
IptZIfrh9CSJqjYrnrtcl7zQECUnHGr6h4cn3G2t5tjpPDgeO5k89uqvlEh1+epg
V2c81ftOrlmKusbFULg/QBxWynQ6yJP+6hYEAJ5rSvDIi+wOynjxs5GWpAseITI0
kkkqd3C33dayUUh5M0K/ahQuH8HLAGQWkVCNAmkM6t8fJhZ0r1JQVs6MWVBniHRv
sw1I0Oms1ZkRtU7fxf89v0RHb11E+UDPSWZR4c1ZZdkQtPqD4MPWFGOI9ah8Wp1I
7x8+dnS0saQnTaSqddrJDOVokHPdV22co8HNLnugG6abK8hSPZ26T3kOS0Vf7Owf
BtmYXAKAIqG10YdVzfcuMeBGcjz+Ui6WbhfM1lnAVxt20tSMFaq1h2GUcstyU7mx
E2DUpcLQ9fLG5HEezWlFqn3f/x7tNB/g1eaHcT9wumsoHU3XK9OmVJwgykPFP7n0
+Tn5kkWaWqMrRi51zMuiIEGwV6MbGfyxDgXnsKpr6+GDuYHCyLSQ4sB7PTpxhtDi
UI7dWQPJDa5wDAK+CJUTxCFGS4bng252gAlSPuOnRYtKaVLqrMc=
=WNz4
-----END PGP SIGNATURE-----

--UIkw8Cc2/Xz5YwHB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
