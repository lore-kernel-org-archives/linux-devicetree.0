From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: cs35l32: avoid uninitialized variable access
Date: Mon, 4 Jan 2016 15:45:11 +0000
Message-ID: <20160104154511.GL16023@sirena.org.uk>
References: <2884997.s8B8BuE04L@wuerfel>
 <20160102141746.GH16023@sirena.org.uk>
 <9222694.IRNnfpj6Tn@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Uus2/pBTyv0r7Av1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9222694.IRNnfpj6Tn@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Brian Austin <brian.austin@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--Uus2/pBTyv0r7Av1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2016 at 04:17:47PM +0100, Arnd Bergmann wrote:
> On Saturday 02 January 2016 14:17:46 Mark Brown wrote:

> > This would be a lot nicer if there was an __always_null annotation we
> > could put on of_node for !OF configurations, that'd Just Work and this
> > can't be the only case where we have this idiom.

> How about an inline helper like

> static inline struct device_node *dev_of_node(struct device *dev)
> {
> 	if (IS_ENABLED(CONFIG_OF))
> 		return dev->of_node;=09
> }

Yeah, that'd work as well (with the correction Russell mentioned) - it's
a bit more typing but we already do similar things for the ID tables and
it looks nicer than the IS_ENABLED() in code does.

--Uus2/pBTyv0r7Av1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWipOHAAoJECTWi3JdVIfQDscH/0/I17MLpIYja4Wqp5vyhO5d
DGloM3wUstCkK0MI0gsZwa++ozFnyiv2Jqmz659SGLcv+vwZradQW+EA7ytjSYww
QrMIq5oyepwsLyu5FFPDN8+Ofo4/PHpBMehPzskmuscSS/eNoIEQhcbuKoP6kPPk
zs1au3Sxe1TOAPHVQkNhdo6ue4lJrcKNB7E6c8N+GVJ6mqyAVBK0lhC0ke0+1c9d
Qya7K2l6uE+C3J8FKattEVCAq/ejU3RkwscL3Dx765kDKj+Su/40qdnaA60s7edI
UI/pCrLWl7DNFNiipgnWcJS9tNLLo3Ak/4RFBL2f8+D0l7JVxEcouKW+f1RXHrI=
=/fXq
-----END PGP SIGNATURE-----

--Uus2/pBTyv0r7Av1--
