From: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH 3/5] of/device: Make of_get_next_child() check status
	properties
Date: Thu, 09 Dec 2010 12:33:22 +1100
Message-ID: <1291858402.2962.2.camel@concordia>
References: <cover.1291799069.git.deepak_saxena@mentor.com>
	<20101208192944.GE32473@mentor.com>
	<20101208150102.69b8062b@udp111988uds.am.freescale.net>
Reply-To: michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0260119508425912923=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101208150102.69b8062b-N/eSCTBpGwP7j4BuCOFQISmX4OfbXNuMKnGXBo5VDl8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0260119508425912923==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-g4gQv5IEbk++n+xcg5Q1"


--=-g4gQv5IEbk++n+xcg5Q1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-12-08 at 15:01 -0600, Scott Wood wrote:
> On Wed, 8 Dec 2010 11:29:44 -0800
> Deepak Saxena <deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
>=20
> > We only return the next child if the device is available.
> >=20
> > Signed-off-by: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Deepak Saxena <deepak_saxena-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/of/base.c |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 5d269a4..81b2601 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -321,6 +321,8 @@ struct device_node *of_get_next_parent(struct devic=
e_node *node)
> >   *
> >   *	Returns a node pointer with refcount incremented, use
> >   *	of_node_put() on it when done.
> > + *
> > + *	Does not return nodes marked unavailable by a status property.
> >   */
> >  struct device_node *of_get_next_child(const struct device_node *node,
> >  	struct device_node *prev)
> > @@ -330,7 +332,7 @@ struct device_node *of_get_next_child(const struct =
device_node *node,
> >  	read_lock(&devtree_lock);
> >  	next =3D prev ? prev->sibling : node->child;
> >  	for (; next; next =3D next->sibling)
> > -		if (of_node_get(next))
> > +		if (of_device_is_available(next) && of_node_get(next))
> >  			break;
> >  	of_node_put(prev);
> >  	read_unlock(&devtree_lock);
>=20
> This seems like too low-level a place to put this.  Some code may know
> how to un-disable a device in certain situations, or it may be part of
> debug code trying to dump the whole device tree, etc.  Looking
> further[1], I see a raw version of this function, but not other things
> like of_find_compatible_node.

Yeah I agree. I think we'll eventually end up with __ versions of all or
lots of them. Not to mention there might be cases you've missed where
code expects to see unavailable nodes. The right approach is to add
_new_ routines that don't return unavailable nodes, and convert code
that you know wants to use them.

cheers


--=-g4gQv5IEbk++n+xcg5Q1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0AMeAACgkQdSjSd0sB4dLHQACgvV076SSf06vhnGraJVr2F0eV
EgcAn1dS4ifJXTIRL5S8fiqPTcrG1Mka
=5nUg
-----END PGP SIGNATURE-----

--=-g4gQv5IEbk++n+xcg5Q1--


--===============0260119508425912923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0260119508425912923==--
