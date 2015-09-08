From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Tue, 8 Sep 2015 12:57:01 +1000
Message-ID: <20150908025701.GA24774@voom.redhat.com>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2015 at 04:45:35PM -0500, Rob Herring wrote:
> +devicetree-spec as a good question to separate from the fire hose.
>=20
> On Thu, Sep 3, 2015 at 9:49 AM, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
> > Hi Rob, Pawel, Mark, Ian and Kumar,
> >
> > Quick question regarding this series here
> > https://lkml.org/lkml/2015/7/8/832. and the proposed
> > st,fw-name binding.
>=20
> Thanks for looking at the bigger picture.
>=20
> > What are the rules with putting firmware names into DT?
>=20
> Whatever you can sneak in without DT maintainers noticing...
>=20
> > Is it allowed?
>=20
> They are already there as you have found, so yes. But should they be
> allowed? Possibly. I'm not saying no, but do have some concerns.

I think this is a genuine edge case.  A firmware name isn't strictly
speaking hardware description, but if the names exist in some "well
known" OS independent namespace, then it's a reasonable thing to be
specified in the device tree.

That said, I have some concerns on points, see later replies to the thread.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV7k58AAoJEGw4ysog2bOS0zcQAOa7S6y5s2x8CnjCuUuf7o9a
v83OzRK8DRFgGgrI5xXfp/z6NZOoKwgmwmnGvUQIo8xL8HbiyzU5xUuVKcCE4wvQ
m7nC12I+0v2AMFX/04D9gQHLR/+M7Jfx3B+eDHvUJT+89tuGiKjlsbltFAP3n+PR
cB89j5w8UwyIikGD5P3Q+NxRrBHSFX37fuwB4d5ayWziMCQYgQQsCIwv7jvmw7Ph
8eIAeDmLwlcydijy0w/ycyxGnnu/q2GiV51xYQNulwEEjoMiecksnoeY/Np6Mqzh
C2HMPKf8NQ4+WJLS//uwkeXhipNF8BJ0KZy6GSJG05D9ae9T+5Ex0cckjjayLR1x
u274SNTnSeez0Y4n5M+BWBMYpZrZhNeLsMnbTo191Dh3hDdghal3Fh8/1U/wEIxE
c6gWVGIs8XkuhpWXwp45FfGs7Wk2jPDWhdSl0KDpEphHRXnCOnvz/8fi5ZIa/gv5
ZuCIZwVPL/hO+cyw4zdVGxEPY2TC+RMWGchthB0oURyovYx9lQoLMiOPxD1dDXkJ
5D6C4clSei81DWnwbnvxea3jESPYT9kxl0kkF1oIcl5HFvKpACTSZ4DiotVANoi/
nyWnZdm2ccnAviAyzJusfQq4x/JJfB1+Ldj8kkGt+RZKq6Sv3xuO+FS5KklBbU1r
eBKKRj0NSTUYstxdGYKb
=T+mD
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
