From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/5] checks: add string list check for *-names properties
Date: Mon, 20 Nov 2017 11:11:35 +1100
Message-ID: <20171120001135.GI19214@umbus.fritz.box>
References: <20171117144515.10870-1-robh@kernel.org>
 <20171117144515.10870-4-robh@kernel.org>
 <8eea3f9e-5512-dc6c-f755-58cc333db732@arm.com>
 <CAL_JsqLQwZ=grCDwjUORaE0NnmC_qJBBtJtT7X0-Z2BGujcfmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lYetfuAxy9ic4HK3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLQwZ=grCDwjUORaE0NnmC_qJBBtJtT7X0-Z2BGujcfmA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--lYetfuAxy9ic4HK3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2017 at 12:07:48PM -0600, Rob Herring wrote:
> On Fri, Nov 17, 2017 at 9:12 AM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =
wrote:
> > Hi,
> >
> > On 17/11/17 14:45, Rob Herring wrote:
> >> Add a string list check for common properties ending in "-names" such =
as
> >> reg-names or interrupt-names.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >>  checks.c | 17 ++++++++++++++++-
> >>  1 file changed, 16 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/checks.c b/checks.c
> >> index 4e23f29486bb..346b0256f9cb 100644
> >> --- a/checks.c
> >> +++ b/checks.c
> >> @@ -622,6 +622,21 @@ WARNING_IF_NOT_STRING(stdout_path_is_string, "std=
out-path");
> >>
> >>  WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
> >>
> >> +static void check_names_is_string_list(struct check *c, struct dt_inf=
o *dti,
> >> +                                    struct node *node)
> >> +{
> >> +     struct property *prop;
> >> +
> >> +     for_each_property(node, prop) {
> >> +             if (!strstr(prop->name, "-names"))
> >
> > But that would match "actually-names-dont-matter" as well, resulting in
> > a false positive? Should we check if the string appears at the *end* of
> > the property name?
>=20
> Perhaps. IMO, once a word is used, it needs to be reserved for that
> purpose. For example, the gpio hogs binding use of "gpios" with just
> numbers and no phandle is bad because we have a mixture of types for a
> given property name or suffix. So we should really enforce that
> "-names" only appears as a suffix and use anywhere else is a warning.

That sounds... overly restrictive to me.  The grabbing of a whole
bunch of gpios words is an example of poor - or at least nonstandard -
binding design IMO.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lYetfuAxy9ic4HK3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloSHbcACgkQbDjKyiDZ
s5Jf8g/+KERgCRxJruRXkQIua1TRybSxMtJYl4T4eB5MNugDkOZ634Zr+ylV9P+N
YShJZZMGh5ljtZ/28HCNptUTwuJvZ0dGhOa/iQxMjlwZwGqlksSDmXPlSbvjjWIl
ryehCk91I4/6fHvnrZ7JT0Y/rmrrQJ6Uxo/5XLA0iCrJzRHMKLJbo76o2aw/vzYE
S/Fx2tnxoudZXQIqtV/ia5I7+SatrgzFyA4St83Bg/YPsS7ng1X0c9/honGOddqd
JWVf2Coz+ZzWGyMgeUBGT0Ev1BsLH0Qf+mr9WEuKxzthR/aXL02gc90TMU4/w6A8
4CrbVlOXTG93ZWZzb4CIwK7goBCYWajXxdOkYSsEn9TBUMl15I8yDWPk+ygX6PC1
y59/1B1YSKcbnONElaWcYGEQuDhYU9zMx7cFIkFAo2Nu9wpO4V2Y14e18BdqC7X0
5LypYE9MQFh//OUP/OqMm9B6gzI9KibwALvBxjOz1hawqLaKbRGaJc/2U+QuAZYj
MxSpAMXenXSgTgZPrfuZ3I7r79WDx6U9o6bmFeHo0sYprteFfd2Za/FGS/xfMNLB
nvmUjymBKDweCwCfvMU/z7MHWwQLbY6Y6T8UhR8RDAh/A/lJk20Iv1WmUQESHlwF
xYEjx8MaqlOHlsw9nNQinBlPkV4TC3F+MKt9yzNl2yi3r0f0DOQ=
=zXFd
-----END PGP SIGNATURE-----

--lYetfuAxy9ic4HK3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
