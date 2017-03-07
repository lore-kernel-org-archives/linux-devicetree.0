From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/3] checks: Add bus checks for simple-bus buses
Date: Tue, 7 Mar 2017 14:41:10 +1100
Message-ID: <20170307034110.GC19967@umbus.fritz.box>
References: <20170228224310.14162-1-robh@kernel.org>
 <20170228224310.14162-3-robh@kernel.org>
 <20170303021206.GD4067@umbus.fritz.box>
 <CAL_JsqJzWAiBUZeRMx0i5Y_NAFH6_jrASWcFp_U4MwVf2+=h0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJzWAiBUZeRMx0i5Y_NAFH6_jrASWcFp_U4MwVf2+=h0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2017 at 04:48:18AM -0600, Rob Herring wrote:
> On Thu, Mar 2, 2017 at 8:12 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Tue, Feb 28, 2017 at 04:43:09PM -0600, Rob Herring wrote:
> >> Add checks to identify simple-bus bus types and checks for child
> >> devices. Simple-bus type is generally identified by "simple-bus"
> >> compatible string. We also treat the root as a simple-bus, but only for
> >> child nodes with reg property.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >> v2:
> >> - new patch
> >>
> >>  checks.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  1 file changed, 69 insertions(+)
> >>
> >> diff --git a/checks.c b/checks.c
> >> index 5ed91ac50a10..c4865b4c8da0 100644
> >> --- a/checks.c
> >> +++ b/checks.c
> >> @@ -817,6 +817,72 @@ static void check_pci_device_reg(struct check *c,=
 struct dt_info *dti, struct no
> >>  }
> >>  WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format);
> >>
> >> +static const struct bus_type simple_bus =3D {
> >> +     .name =3D "simple-bus",
> >> +};
> >> +
> >> +static bool node_is_compatible(struct node *node, const char *compat)
> >> +{
> >> +     struct property *prop;
> >> +     const char *str;
> >> +
> >> +     prop =3D get_property(node, "compatible");
> >> +     if (!prop)
> >> +             return false;
> >> +
> >> +     for (str =3D prop->val.val; str < prop->val.val + prop->val.len;=
 str +=3D strlen(str) + 1) {
> >
> > This isn't safe if the compatible property is filled with garbage (not
> > '\0' terminated) - the strlen() could access beyond the end of the
> > property value.
>=20
> Okay, I guess I can check that prop->val.val[prop->val.len - 1] =3D=3D 0 =
up front.

Sure.  Or use strnlen.
>=20
> >
> >> +             if (streq(str, compat))
> >> +                     return true;
> >> +     }
> >> +     return false;
> >> +}
> >> +
> >> +static void check_simple_bus_bridge(struct check *c, struct dt_info *=
dti, struct node *node)
> >> +{
> >> +     if (node_is_compatible(node, "simple-bus") || !node->parent)
> >> +             node->bus =3D &simple_bus;
> >
> > I don't think it's correct to assume the root bus is always a
> > simple-bus.  If it is, it really should be listed explicitly in the
> > root node's compatible property.
>=20
> It is in the sense that Linux treats the root the same and creates
> devices for top level children and then descends for nodes with
> "simple-bus".

Hmm.. where in Linux is that?  I think that's a bug, technically
speaking, traversing the root node's children without regard to the
type of the root node.

> And since unit addresses are a single address space for
> a given level, we can't have any other bus type. IOW, any other
> defined bus type like I2C is going to be a child of its controller.
>=20
> Rob

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYvivTAAoJEGw4ysog2bOS1ycQANTXx60IVXsoguEmexXaSSy1
+ESTC+/Lh9XK+l1+YjL5PPwkRw9Pe77B3pcEt+8DFL82Qv76G2JC3fYqGsmRQX78
6jEPDl2YpSKpWzXEzFQdNcUPlYsfQk8FdSVLvX6dU56F92JbTXrU9LcUkuWdLvy5
TPU+OL050pYUdFY+KtJeD448j1LG6y7LjHgDXItIYV7zqzUrUz8Zl2C2cwgXaiWg
DrbB7OlW1gN2Qh2FyBSQTQuExosccKm+2LLmxzBxFmXxgeJBudMEmyCqMFHkYt7w
bxaYHvXKPgCwcb/p0le7HtYNcfMGxgjWp0YHjWUyMFtzrC8n9lipoRDB4bmDSqSA
H4lBA3XNJy9jP3/dRomwtmchRkmajvjVw6ofu2TNMloxdNy++1RBD8MUn/XkuTne
0Twha0ZqSr8BVtQ8DdaS8mGyYpucpnmsztqQ5LBue4mfteIPkcBEUu3+OY4SmDvV
bG23XRIPCjPrJtyU4amQdoou23z/Av9uTuFYWZqEQA9S4Fe2V1reG+hOqMvSD4k/
PbHjIqDWkdXLXHYkI0/2mLOhBnKNhSzOfRvaiv+JCpCY7F1cz2Jqgwf16CDsrgJR
xN5a5Hfk7UC2hp92i2UGj9Wf3oSsaDn9tdMdb9znu87rwwGVf3CFGHqYWsFyMpr3
ckBbnjKoMUdIV8J76zqk
=qYrX
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
