From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: breaking DT compatibility (was: Re: [PATCH v4] clk: sunxi:
 Refactor A31 PLL6 so that it can be reused)
Date: Tue, 16 Feb 2016 09:44:48 +0100
Message-ID: <20160216084448.GE4344@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <56B4E2FB.3050703@arm.com>
 <56BB2D79.6090402@arm.com>
 <CABGGiswOKztmRT40w4t_7BD729WgM8ueLtOD-UF_wgMbmcg4cg@mail.gmail.com>
 <20160210143755.GE31506@lukather>
 <20160210163001.GG2632@leverpostej>
 <20160211100048.GK31506@lukather>
 <20160211114410.GA32535@leverpostej>
 <20160211170820.GP31506@lukather>
 <1455270030.3201.71.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wchHw8dVAp53YPj8"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455270030.3201.71.camel@pengutronix.de>
Sender: linux-clk-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rob Herring <rob.herring@linaro.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Andre Przywara <andre.przywara@arm.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Jens Kuske <jenskuske@gmail.com>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--wchHw8dVAp53YPj8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2016 at 10:40:30AM +0100, Lucas Stach wrote:
> Am Donnerstag, den 11.02.2016, 18:08 +0100 schrieb Maxime Ripard:
> [...]
> > > > > Having code in mainline comes with responsibilities. One of those=
 is to
> > > > > keep said code working for existing users. Otherwise, why bother =
having
> > > > > it in mainline at all?
> > > >=20
> > > > None of our existing users ever complained.
> > >=20
> > > I believe that in this case, Andre was complaining about this particu=
lar
> > > breakage, unless I have misunderstood.
> > >=20
> > > To be clear, I'm arguing for the strategy going forward. If no-one has
> > > complained about the stuff broken up to this point, let's not waste t=
ime
> > > restoring that.
> > >=20
> > > Going forward we need to keep old DTBs supported.
> >=20
> > I find that stand a bit dishonest.
> >=20
> > You, DT maintainers, admit that you're not doing your job properly,
> > and that burden relies on the platform maintainers? Or should I take
> > it as you volunteering to maintain that code?
> >=20
> > But ok. Let's do that. Make sure that the other platform maintainers
> > are aware that this is the rule too though. I surely don't want to be
> > alone in that boat.
>=20
> FWIW: I always thought it's the platform maintainers job to enforce a
> reasonable level of DT stability. I don't see how the DT maintainers
> could provide the necessary in-depth review with every platform being
> different in many subtle ways.
>=20
> For the i.MX platform we actually enforced a baseline of DT stability by
> shooting down patches that break DT stability for the sake of adding new
> features, or when trying to put "fixes" into the DT, that could be
> solved entirely inside the kernel.
>=20
> Yes, mistakes happen and and we can not really prevent all breakage,
> especially when the bindings were not strictly enough defined and board
> DT writers may have interpreted them differently, but it is definitely
> possible to keep DTs reasonably stable if the platform maintainers care
> about that.
>=20
> I strongly disagree with platform maintainers denying that duty, by
> claiming that DTs won't be completely stable ever, so there is no reason
> to even care.

A DT is either stable or not. If it is "reasonably" stable, then it's
not.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--wchHw8dVAp53YPj8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWwuGAAAoJEBx+YmzsjxAgpKQP/RbUORVZICS38GpFghNeFp+l
o9Vc1yNi0GD1SdoVE2bm+eXDuEZDnqU0dm6HinDzd981/s2AzT86aoYSwRiOJSAM
0BBosumT52wz7o9TEUq0Gk7keHBAH9UgOB39PELtR8655ay21pVFeHpoGRF7QoyZ
5cmB6ZD10FLV/bHqsEbdrNfMNYZAG4dXitklZF7UokZAiVIKs+o/nc3/cGI1WuFh
cvDz58K0BlWJ/fcB7J28T4HmWfj4nrAj2pa8J9PQTs2AUlygA4sNEyZmf7BVEjoF
4hk6CXloUkVAoMkUGhDyAO9yXp03PJWMKFo5bhtcMrbrG/FpwGDnjJyqGrtKL72H
pXrPAtmasf7UFBRR/vP7UcRBdfmqnhUazfVZMQ0/4Jqokr1G8JOomjDG4rdJ3kHD
c0QYzU8FMpEmvX7AlSiJhy1OJhHK2LKmgseNC9ZDZ+Dpg3pGThLyrIT1LiDABM6k
e9ixSjgQfeNxagCwEPEQfZRALVpsfrZXjhgoa4ViJBC+/uyiM9sBFz/9pqQCY74c
a1fiDP2X8mJ9GHa8wdA1N026SUDuMOTveF9j4eo+RMkPxozfnNDINSvAVv5WGMsl
ysKk5sHL3J+5ZhwoAeiwPNIMpe00Y3UOp+2XCzPq5sYYdoKDUvCtcR0xh+JJ6Shs
Y2bZFeKwtBKJ8BiPcU0W
=u8sV
-----END PGP SIGNATURE-----

--wchHw8dVAp53YPj8--
