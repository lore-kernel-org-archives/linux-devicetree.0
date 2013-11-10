From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Sun, 10 Nov 2013 22:00:43 +1100
Message-ID: <20131110110043.GB21328@voom.fritz.box>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <20131025232951.GD17659@voom.redhat.com>
 <5272C773.2030901@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5272C773.2030901-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 03:11:15PM -0600, Stephen Warren wrote:
> On 10/25/2013 05:29 PM, David Gibson wrote:
> > On Thu, Oct 24, 2013 at 10:51:28PM +0100, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>=20
> >> This is a very quick proof-of-concept re: how a DT schema checker
> >> might look if written in C, and integrated into dtc.
>=20
> >> diff --git a/schemas/schema.c b/schemas/schema.c
>=20
> >> +int schema_check_node(struct node *node)
> ...
> >> +	if (!best_checker) { +		printf("WARNING: no schema for node
> >> %s\n", node->fullpath); +		return 0; +	} + +	printf("INFO: Node
> >> %s selected checker %s\n", node->fullpath, +
> >> best_checker->name); + +	best_checker->checkfn(node);
> >=20
> > IMO, thinking in terms of "the" schema for a node is a mistake.=20
> > Instead, think in terms of a bunch of schemas, which "known" what=20
> > nodes they're relevant for.  Often that will be determined by=20
> > compatible, but it could also be determined by other things
> > (presence of 'interrupts', parent node, explicitly implied by
> > another schema).
>=20
> I don't agree here.
>=20
> Each node represents a single specific type of object, and the
> representation uses a single specific overall schema.
>=20
> I'll admit that sometimes that schema is picked via the compatible
> value (most cases), and other times via the node name/path (e.g.
> /chosen, /memory).
>=20
> In particular, I don't think it's correct to say that e.g. both a
> "Tegra I2C controller" schema and an "interrupt" schema apply equally
> to a "Tegra I2C DT node".

Why not?  Both are mandatory.

> Instead, I think that the "interrupt" schema
> only applies because the "Tegra I2C controller" schema happens to
> inherit from, or aggregate, the "interrupt" schema.

So, explicit inheritence makes sense in many cases, but I don't like
seeing these universal rules as inheritence based.  They should be
just that - universal - not opt-in for any particular device binding.

> I see two important results from this distinction:
>=20
> 1) We should only allow properties from the "interrupt" schema to
> exist within a node /if/ the top-level schema for the node actually
> does make use of the "interrupt" schema". This is important since it
> disallows e.g.:
>=20
>                 battery: smart-battery@b {
>                         compatible =3D "ti,bq20z45", "sbs,sbs-battery";
>                         reg =3D <0xb>;
>                         interrupt-parent =3D <&gpio>;
>                         interrupts =3D <5 4>;
>                 };
>=20
> ... since the ti,bq20z45/sbs,sbs-battery don't actually have an
> interrupt output (assuming that the current binding doc for that
> compatible value accurately reflects the HW here anyway).
>=20
> If we allowed the "interrupt" schema to match the node simply because
> it saw an "interrupts" property there, that'd allow this unused
> property to exist in the DT, whereas we really do want to throw an
> error here, so the DT author is aware they made a mistake.

So.  To clarify my proposal of multiple applied schemas: in order for
the node to "pass" the checks, it must satisfy all constraints of all
applicable schemas - they don't override each other.  Furthermore, I'm
not seeing any specific property as being owned by a particular schema
- multiple schemas applying to a node can place overlapping
constraints on the same property.

So in this case, the interrupt schema describes what the interrupts
property needs to look like if it exists, but the device schema says
that there should be no interrupts.  The only way to satisfy both is
to have no interrupts property, which is the right answer.

Actually, rather than a global "interrupts" schema here, more useful
would be a schema provided by the interrupt controller (and so
selected by the interrupt-parent property) which could validate the
internal format of the interrupt descriptors.  But, again, this
doesn't prevent the device schema from validating the number of
interrupt descriptors for this device.

> 2) Some inheritance or aggregation of schemas is parameterized, e.g.
> on property name. For example, GPIO properties are named ${xxx}-gpios.
> However, I don't believe there's any hard rule that absolutely
> mandates that an /unrelated/ property cannot exist that matches the
> same naming rule. Admittedly, it would be suboptimal if such a
> conflicting property name were used, but if there's no hard rule
> against it, I don't think we should design our schema checker to
> assume that.

The schema checker, no.  The schemas themselves, maybe.  At least for
really well established things, like interrupts, I think it's
reasonble that the schemas enforce best practice, not merely minimal
correctness.

> If the GPIO schema checker simply searched for any properties named
> according to that pattern, it might end up attempting to check
> properties that weren't actually generic GPIO specifiers. Instead, I'd
> prefer the node's top-level schema to explicitly state which
> properties should be checked according to which inherited schema(s).

So, in the case of GPIOs, I tend to agree.  For the case of
interrupts, not so much.

> In particular, perhaps this conflict could occur in a slightly generic
> binding for a series of similar I2C GPIO expander chips, some of which
> have 4 GPIOs and others 8. Someone might choose a "count-gpios" or
> "number-of-gpios" property to represent that aspect of the HW.
>=20
> So overall, I believe it's actually very important to first determine
> *the* exact schema for a node, then apply that one top-level checker,
> with it then invoking various (potentially parameterized) sub-checkers
> for any inherited/aggregated schemas.

So, I certainly think we want explicitly invoked subcheckers.  But I
think we want multiple independently applied schemas for a single node
too.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSf2dbAAoJEGw4ysog2bOS2zAP/0kSDd6bAN90LAWqb7+OJ3cW
wwAtIwUUAzCuObFq9LTfCf1wyd7v/7kFYId1u35co7xg3FdcKWtFVDxzF6VMbu40
Fu8xcCkuzqCIqMNHXP6EDOeaLzG4qxfDCNy7EW9dgDKh+7SYpwNRWVI3h0q0SVKN
Mu8Ars4B6LgtS17YwcfOPx60KinENmMEZ455wF0kjKkTkWMhBgriVW9qVJBmlSFX
uaiQFPPgXXgTld+5WwAeRpgW8+ibqzqHel5i7NcdUqmLkN9UOJ1EYHPPiVltvlOh
gZp+HaBnM7VmBU2M3ryoz7oxLLu8U0ZUPrF/g2Xpo6p3uaEBvs+SkerN1rQwcsYq
M+uZQ0Z6bq7jA7ZpH0OLcUF0so/7Al8mt9JlBDBjAAFIFV0Mxjt6rQLINJDueI3P
SrebGUy2/SMvPcroNgmU9RlUakJrFPkIvXabJAexC5qOM86p9+mLrDDa/D/iYZt2
IGuiq7tJ1gDDeGBDlOsKFbT526YyT1nXyhSj29VDcjtKW4oVWvATSZNZVtPRKjT+
0Q9wcsShravWXKSyyZM1TlUwrahZgtOTvVQhdXV2nrev2rwCF7ciCbJJ1q+fudqC
5DRu0IAi1XjrgL0+6uhZKKGdOe1cUi6jKMuc2X1UyWqUOyawL4XcJE3wTH2vDUfA
yCGYYKkARtOC6Ly0Fh7+
=oIyd
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
