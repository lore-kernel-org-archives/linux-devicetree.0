From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 1/2] dtc: Plugin and fixup support
Date: Fri, 20 Nov 2015 17:57:00 +1100
Message-ID: <20151120065700.GF18707@voom.fritz.box>
References: <1440614674-7055-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1440614674-7055-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20151021022903.GB15881@voom.fritz.box>
 <B8D23946-69DB-4A15-96FE-86C67E358B81@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <B8D23946-69DB-4A15-96FE-86C67E358B81-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--DO5DiztRLs659m5i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2015 at 04:52:25PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On Oct 21, 2015, at 05:29 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > On Wed, Aug 26, 2015 at 09:44:33PM +0300, Pantelis Antoniou wrote:
> >> This patch enable the generation of symbols & local fixup information
> >> for trees compiled with the -@ (--symbols) option.
> >>=20
> >> Using this patch labels in the tree and their users emit information
> >> in __symbols__ and __local_fixups__ nodes.
> >>=20
> >> The __fixups__ node make possible the dynamic resolution of phandle
> >> references which are present in the plugin tree but lie in the
> >> tree that are applying the overlay against.
> >>=20
> >> panto: The original alternative syntax patch required the use of an em=
pty node
> >> which is no longer required.
> >> Numbering of fragments in sequence was also implemented.
> >>=20
> >> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >=20
> > Sorry it's taken me so very long to look at this.  I've been a bit
> > swamped by critical bugs in my day job.
> >=20
>=20
> No worries.
>=20
> > As I've said before (and say several times below), I don't much like
> > the fixups/symbols format, but it's in use so I guess we're stuck with
> > it.
> >=20
> > So, the concept and behaviour of this patch seems mostly fine to me.
> > I've made a number of comments below.  Some are just trivial nits, but
> > a few are important implementation problems that could lead to nasty
> > behaviour in edge cases.

[snip]
> >> @@ -652,6 +656,15 @@ static void check_obsolete_chosen_interrupt_contr=
oller(struct check *c,
> >> }
> >> TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
> >>=20
> >> +static void check_deprecated_plugin_syntax(struct check *c,
> >> +					   struct node *dt)
> >> +{
> >> +	if (deprecated_plugin_syntax_warning)
> >> +		FAIL(c, "Use '/dts-v1/ /plugin/'; syntax. /dts-v1/; /plugin/; "
> >> +				"is going to be removed in next versions");
> >=20
> > Better to put this warning directly where the bad syntax is detected
> > in the parser (using ERROR), transferring it to here with the global
> > is pretty ugly.
> >=20
> > The checks infrastructure isn't meant to handle all possible error
> > conditions - just those that are related to the tree's semantic
> > content, rather than pars
> >=20
> > Plus.. the old syntax was never committed upstream, so I'm inclined to
> > just drop it now, making this irrelevant.
> >=20
>=20
> OK, I will drop the deprecated syntax, but I will maintain an out of tree
> patch for people that still keep old style DTSes around.

Ok.  If you think there are a reasonable number of people out there
with the old style dts, then I'll re-consider merging the support for
the older syntax.

[snip]
> >> @@ -156,10 +189,14 @@ devicetree:
> >> 		{
> >> 			struct node *target =3D get_node_by_ref($1, $2);
> >>=20
> >> -			if (target)
> >> +			if (target) {
> >> 				merge_nodes(target, $3);
> >> -			else
> >> -				ERROR(&@2, "Label or path %s not found", $2);
> >> +			} else {
> >> +				if (symbol_fixup_support)
> >> +					add_orphan_node($1, $3, $2);
> >> +				else
> >> +					ERROR(&@2, "Label or path %s not found", $2);
> >> +			}
> >> 			$$ =3D $1;
> >> 		}
> >> 	| devicetree DT_DEL_NODE DT_REF ';'
> >> @@ -174,6 +211,11 @@ devicetree:
> >>=20
> >> 			$$ =3D $1;
> >> 		}
> >> +	| /* empty */
> >> +		{
> >> +			/* build empty node */
> >> +			$$ =3D name_node(build_node(NULL, NULL), "");
> >> +		}
> >> 	;
> >=20
> > What's the importance of this new rule?  It's connection to plugins
> > isn't obvious to me.
> >=20
>=20
> It is required when you use the syntactic sugar version of an overlay def=
inition.=20
>=20
> &target {
> 	foo;
> };

Ah, good point.  With the empty production in place, we should be able
to remove the
	'/' nodedef
production.  In fact, I'm a little surprised we're not getting bison
warnings, since this definitely makes the grammar ambiguous.

[snip]
> >> diff --git a/dtc.h b/dtc.h
> >> index 56212c8..d025111 100644
> >> --- a/dtc.h
> >> +++ b/dtc.h
> >> @@ -20,7 +20,7 @@
> >>  *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-13=
07
> >>  *                                                                   U=
SA
> >>  */
> >> -
> >> +#define _GNU_SOURCE
> >=20
> > Ugh.. I'm at least trying to keep dtc compilable on FreeBSD, so I'd
> > prefer to avoid using GNU extensions.  What's the feature you needed
> > this for?
> >=20
>=20
> Hmm, it=E2=80=99s for using asprintf.
>=20
> Funnily asprintf is already used in the srcpos.c file, which is used for =
the
> converter. I can easily switch to sprintf with some hit to readability.

Yeah, I cleaned a bunch of stuff to get things compiling on FreeBSD,
but then I think it bitrotted again.  Mind you I suspect FreeBSD has
asprintf, just maybe in a different header.

I kind of want to include an asprintf implementation which we use if
the system library doesn't have it, except that involves adding some
kind of configure step that I've so far been able to avoid.

Hmm.. for now, I think use asprintf, putting any _GNU_SOURCE that's
necessary into individual C files, rather than dtc.h.  We can think
about cleaning that up some other time.

[snip]
> >> +void add_orphan_node(struct node *dt, struct node *new_node, char *re=
f)
> >> +{
> >> +	static unsigned int next_orphan_fragment =3D 0;
> >> +	struct node *ovl =3D xmalloc(sizeof(*ovl));
> >> +	struct property *p;
> >> +	struct data d =3D empty_data;
> >> +	char *name;
> >> +	int ret;
> >> +
> >> +	memset(ovl, 0, sizeof(*ovl));
> >> +
> >> +	d =3D data_add_marker(d, REF_PHANDLE, ref);
> >> +	d =3D data_append_integer(d, 0xffffffff, 32);
> >> +	p =3D build_property("target", d);
> >> +	add_property(ovl, p);
> >=20
> > Hmm, using a phandle (which has to be later mangled) rather than a
> > string ref directly in the target property seems an unnecessarily
> > difficult way of doing things, but I guess the format's in use so we
> > can't fix that now.
>=20
> It makes sense in practice though and it makes this to work:
>=20
> &target {
> 	foo;
> };

Yeah, but that could have been implemented by putting the label string
straight into the "target" property on the overlay blob, rather than
putting a necessarily meaningless phandle which later gets resolved.

Oh well, too late now.

[snip]
> >> +	has_label =3D 0;
> >> +	for_each_label(node->labels, l) {
> >> +		has_label =3D 1;
> >> +		break;
> >> +	}
> >> +
> >> +	if (has_label) {
> >> +
> >=20
> > Nit: extraneous blank line.
> >=20
>=20
> OK. (geeze)

Yeah, that was a nitpick.  Wouldn't mention it if there weren't
already other reasons for a respin.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTsQ7AAoJEGw4ysog2bOSJowQALUXFuDlle1X2noJoSjq3kGh
lDBcVaPNXdL8eVCNudFRTRaKv4SbURSSgnV1pSfsU/Js3MnCNpp14f+aqhOLRV1V
2BZHOfjWjRBAS6gwIUr3qxbupXlBlqmJjFQomKXfYF5hwJpds++umEi2uMM/+dy2
sb9BLc6jZvHbKX+Uwpy3di2CIf1Jak93FEl+nIKFeizbic9shr5FyM/vHZZKoQQj
FgjKYgZep2yyUHL+ZuTUk4ZpLc0eZ78zCO7pvpJUucXKRK+G91fqXYcvx3KpJfu2
XaFKnReYHHL568+ZuPvDcihTFhcL1OUv8VvwsUG3kAly8hgICnLDiC0EXPmsFItx
qLZTMiIgrY95JexpV4ocArxs1BuIPU5XIkuk6pZkuGR0UFqrNrEGJoqwrrqEZ4sW
g7wiJ/6KIGzuCInvoET48XZom1UFANaeihloxWg3/YXQywSGwju3bdrvexXEAixK
bwtUb01cbyBjAFqpyqYhLvt6o0SUTN1zTxjR5JCRTkOy2KLF9yBROSUuqbuGnQBZ
pprh1Q8JPY6HdSD1TZ/qjANS/pGT7Py92na/zlEQHUhZfyknEu2C/Qb4uQyeCVii
aX8nmxODHbFyCimT8DONXliEwQBRo4B9xkGX1v7CLzRJJRPelRZYFPHXOODOk0cP
6kYTftFWllNgpYBq/6lZ
=XBVm
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--
