From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Sat, 26 Oct 2013 10:11:06 +1100
Message-ID: <20131025231106.GC17659@voom.redhat.com>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <20131024234340.ADF70C403B6@trevor.secretlab.ca>
 <526A83B9.30800@wwwdotorg.org>
 <E1VZjCU-0005RE-Vt@jdl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1VZjCU-0005RE-Vt-CYoMK+44s/E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2013 at 10:21:22AM -0500, Jon Loeliger wrote:
> > On 10/25/2013 12:43 AM, Grant Likely wrote:
> > > On Thu, 24 Oct 2013 22:51:28 +0100, Stephen Warren <swarren@wwwdotorg=
=2Eorg>=20
> > wrote:
> > >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >>
> > >> This is a very quick proof-of-concept re: how a DT schema checker mi=
ght
> > >> look if written in C, and integrated into dtc.
> > >=20
> > > Thanks for looking at this.
> > >=20
> > > Very interesting. Certainly an expedient way to start checking schema=
s,
> > > and for certain bindings it may be the best approach. The downside is=
 it
> > > forces a recompilation of DTC to bring in new bindings and it isn't a
> > > great meduim for mixing schema with documentation in the bindings.
> >=20
> > This approach would certainly require recompiling something. I threw the
> > code into dtc simply because it was the easiest container for the
> > demonstration. It could be a separate DT validation utility if we
> > wanted, although we'd need to split the DT parser from dtc into a
> > library to avoid code duplication. The resultant utility could be part
> > of the repo containing the DTs, so it didn't end up as a separate
> > package to manage.
> >=20
> > I think the additional documentation could be added as comments in the
> > validation functions, just like IIRC it was to be represented as
> > comments even in the .dts-based schema proposals.
>=20
> DTers,
>=20
> I think the additional benefit of starting with a direct C
> implementation is that it causes us to begin to actually
> codify the schema requirements.  Sure, it may not be ideal
> at first, but over time it may reveal consistent patterns
> that can be extracted.  And it may reveal what a real schema
> might look like and how it might be expressed better.  Which
> is to say that perhaps we are letting "perfect" get in the
> way of "good enough to start"?
>=20
> In the meantime, someone has shown us the code and we can
> get started.  It's a Small Matter of Refactoring later. :-)

Yes!  This!

Think of this prototype as a mechanism for collating and applying a
bunch of schemas to the tree.  At the moment the schemas are all hard
coded in C, but it can be extended to load some or all of them
dynamically from a description / template / whatever.

That also gives us the flexibility to start out with a simple but
limited schema language which handles common cases, while leaving the
complex cases in C, at least until we understand the requirements well
enough to extend the schema language.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSavqKAAoJEGw4ysog2bOSVjQQAI4a0G+1AgZIdR8WQ0DC2X1V
1KR7X2LY7ZxJIEzEyEaGqr+2qm9Uc/tj6TVv/i0LkLVHT1wtNlhHb/6m703zEuld
qK4pXXM2b//eMevFs0QVLafaCFEXMsj5ihS+D9xhNaI8oVPG2UoAzts5TwtFxRHE
a/rNr0MoLNKlqqXkiUBxA0Hrw7SUNNYLrgNt7N23nSNElR2e9IGSUvWWGVC+neXi
tqDETm7xvh0uC8XvZhbnia2rvU89/bC+uyBHeWvSPZhk/Krw+/3oAijKE43d2qGG
NHZiIAP/K945Pqn9YaSVmpbmDvpk9F9Vz+4xFe6QTHJVSGjmvOJVNz7Q1Ybh+kHF
fRRF+kcNitzJsImmMlYI48/J+FepEyUEzVsvi9esCYuv1vsV0LCZHABTDcd/H6zU
wlec+pD+GS1tjUqm1jtUZ+7x4YSBTJeKVsao2XUH035aldgKh9zVkguuQfvWdSg+
tqzoWAUFfda1159CRePT1yIPF6+BYZa/xwep5Q9WSb6JyaKgTUz4015FQuAncN7r
27jNT3V1pYVnWnU3UBZHdFXYPjCfJhzWXYFqbnJ1HTOY+462PwYNsPjerJsWzCf4
R5OAPvoUtKSSN7+zhi3SbL6XImPPLb8T8bb2/b/HUm8FMwRJv6iORmg9E46G09qu
aPovj0mZxQqa38T1wh7i
=CeSn
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
