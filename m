From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/5] checks: add string list check for *-names properties
Date: Mon, 20 Nov 2017 11:10:49 +1100
Message-ID: <20171120001049.GH19214@umbus.fritz.box>
References: <20171117144515.10870-1-robh@kernel.org>
 <20171117144515.10870-4-robh@kernel.org>
 <8eea3f9e-5512-dc6c-f755-58cc333db732@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Li7ckgedzMh1NgdW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8eea3f9e-5512-dc6c-f755-58cc333db732-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Li7ckgedzMh1NgdW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2017 at 03:12:02PM +0000, Andre Przywara wrote:
> Hi,
>=20
> On 17/11/17 14:45, Rob Herring wrote:
> > Add a string list check for common properties ending in "-names" such as
> > reg-names or interrupt-names.
> >=20
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >  checks.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/checks.c b/checks.c
> > index 4e23f29486bb..346b0256f9cb 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -622,6 +622,21 @@ WARNING_IF_NOT_STRING(stdout_path_is_string, "stdo=
ut-path");
> > =20
> >  WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
> > =20
> > +static void check_names_is_string_list(struct check *c, struct dt_info=
 *dti,
> > +				       struct node *node)
> > +{
> > +	struct property *prop;
> > +
> > +	for_each_property(node, prop) {
> > +		if (!strstr(prop->name, "-names"))
>=20
> But that would match "actually-names-dont-matter" as well, resulting in
> a false positive? Should we check if the string appears at the *end* of
> the property name?

Yes, we should.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Li7ckgedzMh1NgdW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloSHYkACgkQbDjKyiDZ
s5ILZQ//aGHIkhj7jllcCcMxsbcnmcHB7YA5tBDhMYMODjzWAZbajG3VkBRdNDVa
UK2lL6sYnz8nkHwCwT//OS6BrFUtzwghUfvV/xMLyGIUxPFVez9I4fdbN/Fxucvz
SDHB4WqwG5/5SleVIuW4UoqE/vYXVUb/4AbNrw9vGfA8/bg2OtlW3AClzW6d0McZ
CxXoaIJd4R5esUFQQvZ91g5Vqo9izzhl4I8CCbaPrl4ZsQ1DzlfptJsr0n8EAV6S
VViEDD2SGSbd4lQ0ID3ABifO59yl1sQz19i9KEKW18BEc2ivlFiye1se2Lb1yy+o
rDjC/vjG9etQSBvohIUf3Z6sL/827tmOu+SV6i85n8vRSCvEO6q852amczsnaQiv
dwbzNGa/V+kuN+lIB/HBIuKp0eMRFRIWXEVfoyB2wBPskbmOkcH7mLLejV93KWHE
/N6FnEm5Fl98qu+qGu8OO5b740STiBcitH7EIg+WJMPCdO+AlQoWpSnbwyFhKPZ4
iG3eeJdrrABVkTWu7oIw1UtXC9G7Wxv3IG7xfGJgLJ75mF3WGjr4Jk9FOBX+tJ5X
wdLqyogxHTyt7lNtOQ1ZuacJY9eEEhajwbuqjnCdEFlx187Q0B+vNJ2pkdtbsE+G
St0yyZYZnV4X6Iwg2oNxMSxI85Wb26zjMbOQgK9i5/yLaeCuknI=
=YazD
-----END PGP SIGNATURE-----

--Li7ckgedzMh1NgdW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
