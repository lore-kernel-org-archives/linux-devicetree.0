From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] of: match by compatible property first
Date: Fri, 20 Apr 2012 15:28:40 +0200
Message-ID: <20120420132839.GB25662@avionic-0098.adnet.avionic-design.de>
References: <1334917312-21192-1-git-send-email-thierry.reding@avionic-design.de>
 <4F9160DF.70308@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5834208661241021304=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F9160DF.70308-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============5834208661241021304==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Rob Herring wrote:
> On 04/20/2012 05:21 AM, Thierry Reding wrote:
[...]
> > +const struct of_device_id *of_match_compat(const struct of_device_id *=
matches,
> > +					   const char *compat)
> > +{
> > +	while (matches->name[0] || matches->type[0] || matches->compatible[0]=
) {
>=20
> You are not using name or type here, so you can remove.

They are still required so we don't stop early. A match table could well ha=
ve
a first entry that has name and/or type set but not compatible, followed by=
 a
second entry with only compatible set.

> >  	while (matches->name[0] || matches->type[0] || matches->compatible[0]=
) {
>=20
> You don't need to check compatible ptr here.

For similar reasons as above this check needs to stay in.

>=20
> >  		int match =3D 1;
> >  		if (matches->name[0])
> > @@ -532,10 +558,7 @@ const struct of_device_id *of_match_node(const str=
uct of_device_id *matches,
> >  		if (matches->type[0])
> >  			match &=3D node->type
> >  				&& !strcmp(matches->type, node->type);
> > -		if (matches->compatible[0])
> > -			match &=3D of_device_is_compatible(node,
> > -						matches->compatible);
> > -		if (match)
> > +		if (match && !matches->compatible[0])
> >  			return matches;
> >  		matches++;
> >  	}
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index bd52d83..23b5061 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -231,6 +231,8 @@ extern const void *of_get_property(const struct dev=
ice_node *node,
> > =20
> >  extern int of_n_addr_cells(struct device_node *np);
> >  extern int of_n_size_cells(struct device_node *np);
> > +extern const struct of_device_id *of_match_compat(
> > +	const struct of_device_id *matches, const char *compat);
>=20
> Why does this need to be a public function?

It doesn't. I just thought it might be handy to have. I can make it static =
if
you don't think it's useful generally.

Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+RZIcACgkQZ+BJyKLjJp9MxQCgm0rGaEVuJqJA7OVJw/PikwVM
oa8An3DWjn+JO+uw15m1CV0b3j5WOtRr
=mVvW
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--

--===============5834208661241021304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5834208661241021304==--
