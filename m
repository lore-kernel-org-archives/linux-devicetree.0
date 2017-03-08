From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/3] checks: Add bus checks for simple-bus buses
Date: Wed, 8 Mar 2017 12:55:45 +1100
Message-ID: <20170308015545.GG19967@umbus.fritz.box>
References: <20170228224310.14162-1-robh@kernel.org>
 <20170228224310.14162-3-robh@kernel.org>
 <20170303021206.GD4067@umbus.fritz.box>
 <CAL_JsqJzWAiBUZeRMx0i5Y_NAFH6_jrASWcFp_U4MwVf2+=h0w@mail.gmail.com>
 <20170307034110.GC19967@umbus.fritz.box>
 <CAL_Jsq+U4SqL2EDR6hRrE_JcONkfkZqacBQGz4Kkq=CxNbaYAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UTZ8bGhNySVQ9LYl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+U4SqL2EDR6hRrE_JcONkfkZqacBQGz4Kkq=CxNbaYAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--UTZ8bGhNySVQ9LYl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2017 at 07:51:15AM -0600, Rob Herring wrote:
> On Mon, Mar 6, 2017 at 9:41 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Mon, Mar 06, 2017 at 04:48:18AM -0600, Rob Herring wrote:
> >> On Thu, Mar 2, 2017 at 8:12 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > On Tue, Feb 28, 2017 at 04:43:09PM -0600, Rob Herring wrote:
> >> >> Add checks to identify simple-bus bus types and checks for child
> >> >> devices. Simple-bus type is generally identified by "simple-bus"
> >> >> compatible string. We also treat the root as a simple-bus, but only=
 for
> >> >> child nodes with reg property.
> >> >>
> >> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> >> ---
> >> >> v2:
> >> >> - new patch
> >> >>
> >> >>  checks.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++
> >> >>  1 file changed, 69 insertions(+)
> >> >>
> >> >> diff --git a/checks.c b/checks.c
> >> >> index 5ed91ac50a10..c4865b4c8da0 100644
> >> >> --- a/checks.c
> >> >> +++ b/checks.c
> >> >> @@ -817,6 +817,72 @@ static void check_pci_device_reg(struct check =
*c, struct dt_info *dti, struct no
> >> >>  }
> >> >>  WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format);
> >> >>
> >> >> +static const struct bus_type simple_bus =3D {
> >> >> +     .name =3D "simple-bus",
> >> >> +};
> >> >> +
> >> >> +static bool node_is_compatible(struct node *node, const char *comp=
at)
> >> >> +{
> >> >> +     struct property *prop;
> >> >> +     const char *str;
> >> >> +
> >> >> +     prop =3D get_property(node, "compatible");
> >> >> +     if (!prop)
> >> >> +             return false;
> >> >> +
> >> >> +     for (str =3D prop->val.val; str < prop->val.val + prop->val.l=
en; str +=3D strlen(str) + 1) {
> >> >
> >> > This isn't safe if the compatible property is filled with garbage (n=
ot
> >> > '\0' terminated) - the strlen() could access beyond the end of the
> >> > property value.
> >>
> >> Okay, I guess I can check that prop->val.val[prop->val.len - 1] =3D=3D=
 0 up front.
> >
> > Sure.  Or use strnlen.
>=20
> Duh...
>=20
> >> >> +             if (streq(str, compat))
> >> >> +                     return true;
> >> >> +     }
> >> >> +     return false;
> >> >> +}
> >> >> +
> >> >> +static void check_simple_bus_bridge(struct check *c, struct dt_inf=
o *dti, struct node *node)
> >> >> +{
> >> >> +     if (node_is_compatible(node, "simple-bus") || !node->parent)
> >> >> +             node->bus =3D &simple_bus;
> >> >
> >> > I don't think it's correct to assume the root bus is always a
> >> > simple-bus.  If it is, it really should be listed explicitly in the
> >> > root node's compatible property.
> >>
> >> It is in the sense that Linux treats the root the same and creates
> >> devices for top level children and then descends for nodes with
> >> "simple-bus".
> >
> > Hmm.. where in Linux is that?  I think that's a bug, technically
> > speaking, traversing the root node's children without regard to the
> > type of the root node.
>=20
> drivers/of/platform.c:of_platform_populate() which is called on the
> root node with "simple-bus" in the match table.

It's called on the root node *by platform code*.  And the platform is
selected on properties of the root node, so it already knows something
about what format the root node should have on that particular
platform.  dtc does not know that.

> Plus I know we have some DT's like Tegra that didn't put all their
> devices under a bus (but should have). Maybe I should warn on that
> (i.e. warn on having unit-addresses without a bus type set on root).

There's nothing inherently wrong with having devices on the root bus.
Really platforms that want this should be putting something like:
	compatible =3D "vendor,myboard", "simple-bus";

in their root node.=09

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UTZ8bGhNySVQ9LYl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYv2ShAAoJEGw4ysog2bOSVO8P/1HCR5l3Mi5bpF1QngeOf0Vw
Q7djk6YNBPi4lFJUC+YjQKXWfS/VMj1iD/UXRuGId8/y5mYlTcmykjayKUxplnd9
NBo4dhN+BgNIjQy7dtvnUVGHOxJcbV/ZVAoXz4BrBi5yZkSg86ZLMRTNafeYMeoi
acG/6ZTb+qK0ea/xBkCdYtqKj2qoLB0tvWhcApv8X1VWEqsDp1YkEgJWLQGwQACY
8ws35ty5GRZU4ui1H/Sqk3MS24rBAVfQvqSMlQ4ruh0MkvwEKWgYPGgnKwWCtnq/
k1DMPfBdDc/lxcBHzGVO4TcDFWvjv6OrJ5X6aoAWieVujbR/TkqX63LfEmb7FSVV
QXo2PFIKlufmYv2Z/s39JeV5suF835bx3ni2ay6kpBaQdzxkJfIMQM+SPyNgDl2u
+64yxpV7CXFvpF23H74rR/gaJYZsQVXm7NmaaSXhRyAmYLQz+b3fqNgEKFbKt2Uu
j+Imtp+FcPC4pjo1kYFjZ+IKB755mRyyBpJ1sOXXoWUoHbwECgtcW82arV/9WY/N
ipx3qVuhlQL8ugEqbpT7RBiOskG/nBjcrqw6w3SxT1GFVh70pOHjaqL83yL2s5R8
vF0cZaSwEIiKpfCwFdeY4iNXznfLjTjDOtClDlUAZCXy6C6RfHEfZLHb5CmpKswj
3Zfk+55v+xHD6+PmBVJ+
=dFD/
-----END PGP SIGNATURE-----

--UTZ8bGhNySVQ9LYl--
