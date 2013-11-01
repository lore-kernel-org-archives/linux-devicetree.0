From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Sat, 2 Nov 2013 00:24:11 +1100
Message-ID: <20131101132411.GC3430@voom.fritz.box>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <20131024234340.ADF70C403B6@trevor.secretlab.ca>
 <526A83B9.30800@wwwdotorg.org>
 <20131028101737.GC15114@voom.fritz.box>
 <5272C80A.7070204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5272C80A.7070204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 03:13:46PM -0600, Stephen Warren wrote:
> On 10/28/2013 04:17 AM, David Gibson wrote:
> > On Fri, Oct 25, 2013 at 03:44:09PM +0100, Stephen Warren wrote:
> >> On 10/25/2013 12:43 AM, Grant Likely wrote:
> >>> On Thu, 24 Oct 2013 22:51:28 +0100, Stephen Warren
> >>> <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> >>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>=20
> >>>> This is a very quick proof-of-concept re: how a DT schema
> >>>> checker might look if written in C, and integrated into dtc.
> >>>=20
> >>> Thanks for looking at this.
> >>>=20
> >>> Very interesting. Certainly an expedient way to start checking
> >>> schemas, and for certain bindings it may be the best approach.
> >>> The downside is it forces a recompilation of DTC to bring in
> >>> new bindings and it isn't a great meduim for mixing schema with
> >>> documentation in the bindings.
> >>=20
> >> This approach would certainly require recompiling something. I
> >> threw the code into dtc simply because it was the easiest
> >> container for the demonstration. It could be a separate DT
> >> validation utility if we wanted, although we'd need to split the
> >> DT parser from dtc into a library to avoid code duplication. The
> >> resultant utility could be part of the repo containing the DTs,
> >> so it didn't end up as a separate package to manage.
> >>=20
> >> I think the additional documentation could be added as comments
> >> in the validation functions, just like IIRC it was to be
> >> represented as comments even in the .dts-based schema proposals.
> >=20
> > Fwiw, I've been starting to do some hacking on the checks code,
> > with a view to making it accomodate the schema stuff better.
> > Branch 'checking' on the kernel.org tree.  In a state of flux, so
> > expect rebases.
>=20
> Did you forget to push that? I don't see it in any of:
> git://git.kernel.org/pub/scm/linux/kernel/git/jdl/dtc.git
> git://git.kernel.org/pub/scm/utils/dtc/dtc.git
> git://git.jdl.com/software/dtc.git

Oops.  Thought I'd pushed, but apparently not.  Should be there now
on:
	git://git.kernel.org/pub/scm/utils/dtc/dtc.git

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSc6t7AAoJEGw4ysog2bOSgjwP/111RYgb5PMToNt+7+5N2VU9
OR7MY+thdcwmN02XpGt1suSavx/ILjTSsDvStwrgN2LDRz87sUztnhBUHBY9CrNx
2H9pYGetPDBC752PIjEi+zkG39RJd3kv9YH30/uu6zrmar69LWoJRHiTVZ35lgKt
/hW/9DHRiwXyGavOc+MKmJWDp8ib8hrKn8kOEi3Hp1sqOc5oaHsak5pTT0L2SFY/
2dg737nZHGPd3He3Wahity2caI3v9v+U0sbk5Rx6pm/WukVwzmkeBJL3E86aNJBQ
+/23U7LezKOtNd8UybHMJhCTapJ0diLfhHvDFn7ySjQqFWmY4+e3omvjwf1wqfhn
Cq5Rrsyo2Jok0R5XplJ7pAaBUFoXMsAoDHcx1tnt7fLfBCK4pG9Vgh7Yn5PQzpQg
EoWE45nGartOJ8NpqV7X2Z+A04v12P0PdtJUmezjoFjBcRtLz93Myi1wOG4WfW+0
7U0Jf5yB/mOUbvdp6mopehCvvSEpx/BOsb5b9QH6cj6JN4Fr4PcxX32lBXaymWqp
W9gVR6SFa+55VOGlMjR3Nzt61Pkt5fzKF/NQ9OR1/riI3nhkfSL0sRpFs3RM/oGy
C1TmjUEVRLlA/8Qm0cWzAq/FDE+TJPu5q9PsrKsex4+lMPFEovAQwv8oIZez8sn5
XUP0j9sEFG+a85ZcwJMm
=OdA8
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
