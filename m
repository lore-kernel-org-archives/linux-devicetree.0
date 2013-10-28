From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Mon, 28 Oct 2013 21:17:37 +1100
Message-ID: <20131028101737.GC15114@voom.fritz.box>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <20131024234340.ADF70C403B6@trevor.secretlab.ca>
 <526A83B9.30800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <526A83B9.30800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2013 at 03:44:09PM +0100, Stephen Warren wrote:
> On 10/25/2013 12:43 AM, Grant Likely wrote:
> > On Thu, 24 Oct 2013 22:51:28 +0100, Stephen Warren <swarren@wwwdotorg.o=
rg> wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> This is a very quick proof-of-concept re: how a DT schema checker might
> >> look if written in C, and integrated into dtc.
> >=20
> > Thanks for looking at this.
> >=20
> > Very interesting. Certainly an expedient way to start checking schemas,
> > and for certain bindings it may be the best approach. The downside is it
> > forces a recompilation of DTC to bring in new bindings and it isn't a
> > great meduim for mixing schema with documentation in the bindings.
>=20
> This approach would certainly require recompiling something. I threw the
> code into dtc simply because it was the easiest container for the
> demonstration. It could be a separate DT validation utility if we
> wanted, although we'd need to split the DT parser from dtc into a
> library to avoid code duplication. The resultant utility could be part
> of the repo containing the DTs, so it didn't end up as a separate
> package to manage.
>=20
> I think the additional documentation could be added as comments in the
> validation functions, just like IIRC it was to be represented as
> comments even in the .dts-based schema proposals.

Fwiw, I've been starting to do some hacking on the checks code, with a
view to making it accomodate the schema stuff better.  Branch
'checking' on the kernel.org tree.  In a state of flux, so expect
rebases.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSbjnBAAoJEGw4ysog2bOSUyAQANEzXZKTZ5WQeg6sQ1g8cdEc
LxhoDCBlb7jcVK+TLVN5K5go30AtFzvHMi95uDgBsLlNSlhApZKuLBhQdUWvbJPY
GltTGYffBEbG1sWnP5ydYbjMB4lGZQrroFSvFUBFTV9sbdJkb2oFyVVFYLFvSvcM
7sGr7G5p2EkPkV25XsI0a1naj+vhL+fASSMKkgEUcu5Ypa0r7VfHhic3XVXaBtut
j4Pwcrtt9MNt8rjUJ8gqqX1z6ZsSbUTnQdB8118qMV0behJItbjGQTxiKrzd7UX2
7nodB+iDDDoEUc7DRvNNmJiV9NGpFnqFP/Kuxnuy699JIlEYZSA9f4qq+z6b7xl5
xzyN8rAOt9Ugo4TpR+4ytkKyj+1SvoRDG6WRB3KenRpVVBvYWkD5ywPPJtDxyUOn
UGpc9L5pjaY2ekOFgjUtkDrAt3Z28mUnGHcFUER6DYwdPBzZEry08NnQ5UYCCHk6
VGbIwWGfjMxvziMWZkFmvYB5Q+tUqQWgrOAPJbmf4xJgpMPmxC704eOq/cv8OGhF
ippEs9G1HJ85UoOAM3cQRP60XUX0TV95+HxREioCQUnFi+1RxkbtUVuXBiT08yuG
Ds+thMzNZ8smaa/5hxXAoyfD0Rj1p9iBkuCDN7jFrCc/PiBZYlelY+zsTaLefjc1
/xwaj11YojRwzjY3r7dr
=zIlb
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
