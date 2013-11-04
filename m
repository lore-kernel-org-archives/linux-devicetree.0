From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Tue, 5 Nov 2013 00:28:28 +1000
Message-ID: <20131104142828.GD3430@voom.fritz.box>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <E1VZjCU-0005RE-Vt@jdl.com>
 <20131025231106.GC17659@voom.redhat.com>
 <1432962.yW4lKnaQJE@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432962.yW4lKnaQJE@flatron>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2013 at 12:15:58AM +0100, Tomasz Figa wrote:
> On Saturday 26 of October 2013 10:11:06 David Gibson wrote:
> > On Fri, Oct 25, 2013 at 10:21:22AM -0500, Jon Loeliger wrote:
> > > > On 10/25/2013 12:43 AM, Grant Likely wrote:
> > > > > On Thu, 24 Oct 2013 22:51:28 +0100, Stephen Warren
> > > > > <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>> >=20
> > > > wrote:
> > > > >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > >>=20
> > > > >> This is a very quick proof-of-concept re: how a DT schema checker
> > > > >> might
> > > > >> look if written in C, and integrated into dtc.
> > > > >=20
> > > > > Thanks for looking at this.
> > > > >=20
> > > > > Very interesting. Certainly an expedient way to start checking
> > > > > schemas,
> > > > > and for certain bindings it may be the best approach. The downside
> > > > > is it forces a recompilation of DTC to bring in new bindings and
> > > > > it isn't a great meduim for mixing schema with documentation in
> > > > > the bindings.> >=20
> > > > This approach would certainly require recompiling something. I threw
> > > > the code into dtc simply because it was the easiest container for
> > > > the demonstration. It could be a separate DT validation utility if
> > > > we wanted, although we'd need to split the DT parser from dtc into
> > > > a library to avoid code duplication. The resultant utility could be
> > > > part of the repo containing the DTs, so it didn't end up as a
> > > > separate package to manage.
> > > >=20
> > > > I think the additional documentation could be added as comments in
> > > > the
> > > > validation functions, just like IIRC it was to be represented as
> > > > comments even in the .dts-based schema proposals.
> > >=20
> > > DTers,
> > >=20
> > > I think the additional benefit of starting with a direct C
> > > implementation is that it causes us to begin to actually
> > > codify the schema requirements.  Sure, it may not be ideal
> > > at first, but over time it may reveal consistent patterns
> > > that can be extracted.  And it may reveal what a real schema
> > > might look like and how it might be expressed better.  Which
> > > is to say that perhaps we are letting "perfect" get in the
> > > way of "good enough to start"?
> > >=20
> > > In the meantime, someone has shown us the code and we can
> > > get started.  It's a Small Matter of Refactoring later. :-)
> >=20
> > Yes!  This!
> >=20
> > Think of this prototype as a mechanism for collating and applying a
> > bunch of schemas to the tree.  At the moment the schemas are all hard
> > coded in C, but it can be extended to load some or all of them
> > dynamically from a description / template / whatever.
> >=20
> > That also gives us the flexibility to start out with a simple but
> > limited schema language which handles common cases, while leaving the
> > complex cases in C, at least until we understand the requirements well
> > enough to extend the schema language.
>=20
> This is fine as an intermediate step, but I'm afraid that the overhead of=
=20
> work needed to describe all the bindings using C language directly will b=
e=20
> pretty big. C language isn't really best fitted for such purposes.

I don't disagree.

> If we agree to base on this, but solely as a mechanism and a base for=20
> further work, my idea would be to introduce a schema description language=
=20
> anyway and then some code generator that would generate C code from=20
> schemas described using such language

I suspect interpreting the schemas rather than compiling them into C
code will be more convenient, but that's a detail, really.

> (and possibly also something to=20
> generate textual documentation from schemas, so we could have a central=
=20
> repository of indexed DT bindings, for example on [1] - maybe kerneldoc=
=20
> could be reused here).

Hrm.  I think trying to generate documentation from a schema is a bit
backwards.  I think it makes more sense to think of the binding as the
documentation, some parts of which are machine parseable to generate
the formal schema.  Literate schema programming, if you want to think
of it that way.

> Such design would allow for describing a lot of cases using a simple=20
> description language, while leaving the possibility of adding inline C=20
> snippets, like PHP in HTML, to handle those super complex ones.
>=20
> [1] https://www.kernel.org/doc/htmldocs/
>=20
> Best regards,
> Tomasz
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSd68MAAoJEGw4ysog2bOSHLQP/24dRqJh3SUaJux3i2nRoiiK
owEstRRORQcnasGDsp60G66lL6VFx3HINBF8NlBNDq3HcmJHPeIDJu5jZ9Ct042V
ewS+870qSfY85VQCj7Lwj/yxkVBPgLvTRajF+gzhWHLImlAmXHKkUJxCm3uQCYy7
bkGgGXvK+6OO1iTXoEgiTX6Z2rCCdqX1umH3o5V7uFdbF7fsChzEMaOSjIdcdJzN
k8yyWEh8+q8kvUvMmMy4Rux7wK49LfsflGKsH6425vZf5LnQCIj/tAkVxlh5uOMq
+gS7S/+c3cDT/If9P1uW9JZocdacgjhEG9VcBO4XVSUjPk1kxt1UE8XDHG0+2uyU
JqkqIowLJi7e0BaUj5RdQ3esDWx3e6nFkwTOHURyAdkxovw+XLZT3DZLnIbZOgVZ
8J0Dn9ZBavMOlxkqtn003xU1AiuVGO+VfgT8rSAeHC3XiaZ42/hPBK9EXuZ9hrGl
A6MGtn56W/kC8BZJujPej5Rr52H9ifP494BoTlhHKmHZzagl4ZaVcUEeTfJERUGk
9j2akSHoyJuyOFSoBPhXImuIn8OZcJnpKsON821IwrmsuPPbDh0cyPuik5AMnU0r
n2zsIu2k3kSWyQUnAeokmuC7NPfJ/YjYc+s0vbPMzgcndfjcJCoV3RJ9SfBKTSrm
5rDwWFEWdWfZExqvxmgO
=sg0u
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
