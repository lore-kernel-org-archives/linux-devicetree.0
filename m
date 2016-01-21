From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/2] regulator: Add coupled regulator
Date: Thu, 21 Jan 2016 16:46:49 +0100
Message-ID: <20160121154649.GE3997@lukather>
References: <1452605842-9317-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452605842-9317-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160112143100.GA14628@rob-hp-laptop>
 <20160115085734.GG4581@lukather>
 <20160117000434.GB7774@rob-hp-laptop>
 <20160118162538.GH6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160118162538.GH6588@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 18, 2016 at 04:25:38PM +0000, Mark Brown wrote:
> > >   - When you come to consider it from an hardware point of view, the
> > >     device usually have a single pin that powers it. It's the board
> > >     designer that chose to route that pin to multiple regulators, so
> > >     it's really the board that is wired that way, and putting that
> > >     code in the consumer drivers would be an abstraction leak imho.
>=20
> > That's a good point. Perhaps the regulator core needs to be able to=20
> > parse the list and return the single ptr to the virtual regulator.
>=20
> Exactly, if we don't want to represent the combination directly.  For
> most uses it's probably OK but I can see us in a situation where we
> might want to do things like only use one of the regulators in low load
> situations where we might want to attach properties to the merge of the
> two regulators rather than just referencing them both.  I'm not sure
> that's realistic though or that we wouldn't just be working that use
> case out dynamically at runtime.
>=20
> I'm ambivalent on which way is better, it does complicate the
> implementation to support doing this as lists and while it makes the DT
> more elegant I'm not clear that it's worth the effort especially when it
> comes to constraint combining.  But perhaps the implementation turns out
> to be simpler than I would anticiapte.

I guess a separate driver would make it easier to deal with cases like
the one you suggested (shutting down when the load is going to be
lower). I don't see how we could have a good DT representation of that
if we're going to use lists.

Anyway, I'm fine with both approaches, just let me know what you
prefer.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWoP1pAAoJEBx+YmzsjxAg2WoQALz5XpYUq/ir5Nb/9TTI1l4O
Lh8yMuO1KGxWo2YWn/uptldSixwgzSACueUw0mH323daeCMsurcNGGS/aD5nTG6I
bD0Wafw+nH6AQLPSQXUwDRTaGlGTo+j78Uv3xwJTlayrIqMDREZ2p7XzpDEBQB1a
YM4KdNXmz5NhdNwPC+fewAEYjLrcPSf6GjRKr1X9sx0IRwgpczNQTzLLNNkUEYxA
btTlio0vsWii9Yb4A/HupVA9IN1n1CNW91J6c1wtF0EeiI+Fxl44pViz5wrAFpX3
2d345AM4ePaj3PSWQJAGxhHio1vr6Kc+eLkGt+5aYUXhPZX5qyVyDycYunwJ82Sy
syi29D9LnbAoOQCg3Vh7ExNHs/usLWozs8MVzC3KKfanBwuuQ0fKkCPRLE1uQct5
PFO2ePzXyymve0Xnp6nh3aKVCBL7TqmPMYfVQwsWHgP5IV/2jILdzsFoOqSduw/0
Ak+Cm1A5W3jGlsIt/0d/4jF3iy9ZHxANQXvVycqw3U2vEnsvKsFCnqfClDbALecS
ls7V87OSTIkITygIHaiNzuth1QoFbkelnd8VLWEi/zP7MWBDglSNwGPw+yHulfLm
2QHix0j1IQwBIm5HJZwJ5A4OHUf0iFDCwqtezQV3fuWSa6JU5I8Wjv8wovxVi1jJ
NrH3k9d5ac2rQzEciVts
=XKbZ
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--
