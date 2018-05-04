From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH net-next v2 00/15] ARM: sun8i: r40: Add Ethernet support
Date: Fri, 4 May 2018 17:03:08 +0200
Message-ID: <20180504150307.sdtnksk2uslrl3o5@flea>
References: <CAGb2v67HFb6eLBS4_9s_wJ5uWFeQdUtwn_NMJnm59UUDFBDJUA@mail.gmail.com>
 <20180502.110617.304411895589508709.davem@davemloft.net>
 <20180503131257.rlqxetafejikmnji@flea>
 <20180503.144042.266645949281979304.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rw3zvd3c5ysg6aw4"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180503.144042.266645949281979304.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: wens@csie.org, mturquette@baylibre.com, sboyd@kernel.org, peppe.cavallaro@st.com, robh+dt@kernel.org, mark.rutland@arm.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, clabbe.montjoie@gmail.com, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org


--rw3zvd3c5ysg6aw4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 02:40:42PM -0400, David Miller wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> Date: Thu, 3 May 2018 15:12:57 +0200
>=20
> > Hi Dave,
> >=20
> > On Wed, May 02, 2018 at 11:06:17AM -0400, David Miller wrote:
> >> From: Chen-Yu Tsai <wens@csie.org>
> >> Date: Wed, 2 May 2018 00:33:45 +0800
> >>=20
> >> > I should've mentioned that patches 3 ~ 10, and only these, should go
> >> > through net-next. sunxi will handle the remaining clk, device tree, =
and
> >> > soc driver patches.
> >>=20
> >> Ok, I just noticed this.
> >>=20
> >> Why don't you just post those patches separately as a series on their
> >> own then, in order to avoid confusion?
> >>=20
> >> Then you can adjust the patch series header posting to explain the
> >> non-net-next changes, where they got merged, and what they provide
> >> in order to faciliate the net-next changes.
> >=20
> > I now that we usually have some feedback from non-net maintainers that
> > they actually prefer seeing the full picture (and I also tend to
> > prefer that as well) and having all the patches relevant to enable a
> > particular feature, even if it means getting multiple maintainers
> > involved.
> >=20
> > Just to make sure we understood you fully, do you want Chen-Yu to
> > resend his serie following your comments, or was that just a general
> > remark for next time?
>=20
> Yeah, good questions.
>=20
> I think it can be argued either way.  For review having the complete
> context is important.
>=20
> But from a maintainer's standpoint, when there is any ambiguity
> whatsoever about what patches go into this tree or that, it is really
> frowned upon and is quite error prone.
>=20
> Also, that header posting is _SO_ important.  It explains the series.
> But for these 'partial apply' situations the header posting refers
> to patches not in the series.
>=20
> This looks terrible in the logs, when, as I do, the header posting
> text is added to a marge commit for the series.  People will read it
> and say "where are all of these other changes mentioned in the text?
> was this series misapplied?"
>=20
> That's why, maybe after the review is successful, I want the actual
> patch series standalone with appropriately updated header posting
> text.

Ok, thanks for the explanation, that makes sense :)

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--rw3zvd3c5ysg6aw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrsdisACgkQ0rTAlCFN
r3TcSw//Yn3YcUYqjfIrkBfGBIDgFZdNlCr9B3RtR+DBTfLnOElMpbyFRWXeruB3
r51Icr67gLgXolrxdOjR5oj1dqo6HVYNgqYyf+6Qx+PgdoqdXhNr7pyR4kc8Y8XF
77OxUgZJIloy+Jrc2Do6Hnq8XzGPtHRPf2YFLHsKJ9HLljvqURkOpyv5zmI6KPq3
moV2MOV690ZlsFaCCK4bcaqz6/rVDKdJ1v4czytc99SigTWfwegFgUiPJ/Nheycs
W5G/dn3+9KearfX1ABaZHSsJiU7+fY5LOMCJoqdliA9ivxI+6DTgv/Zv9W/NyucM
VPXosZywzKqpJ7AcpxUY7bvC5x0jtkof5xGLjJZ75ZZRSZHjJhsXC/91G+kc+blO
VQtngohaP8xvZvKUTQzqBGQaVZ+nLj927UylXac27ECXhQkVx4fiC1E/E3WasGJf
/BlRn4RRI43Zm3f4Qnq152zBuQh8RRFu5X0mZWv4KABmXsdARLlB5PU+XyexUA9K
UuXjWX5WLYq7E1+e2dZGwtjgjQ6Cp+CUie30i+PguogUc+sV5/nfeL2CNTvdCXs7
zH8lc/4+pzLPpfoTBj5pdaO8inDM4UEY608MDC/5OoL3R2nV8eNW0gAujenw/xle
9b5NneDoGCRUrBoigoh+0i2cA3Nw3leY/YxcAVaDOchrVmJ1Ev0=
=7MTH
-----END PGP SIGNATURE-----

--rw3zvd3c5ysg6aw4--
