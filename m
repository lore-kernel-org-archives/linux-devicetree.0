From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
Date: Thu, 26 Sep 2019 08:07:21 -0700
Message-ID: <20190926150721.GT2036@sirena.org.uk>
References: <20190926071707.17557-1-nuno.sa@analog.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7741625905344322906=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190926071707.17557-1-nuno.sa@analog.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============7741625905344322906==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zQiiCAM5ptAyb9EE"
Content-Disposition: inline


--zQiiCAM5ptAyb9EE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 09:17:06AM +0200, Nuno S=E1 wrote:
> This patch adds support for the 8 channel PDM-to-I2S/TDM converter. The
> ADAU7118 converts four stereo pulse density modulation (PDM) bitstreams
> into one pulse code modulation (PCM) output stream. The source for the PDM

This is the third copy of this I've got in the past 24 hours -
there's no versioning or anything so what's going on?

--zQiiCAM5ptAyb9EE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2M1CgACgkQJNaLcl1U
h9A4EQf6A7KkdqPiVOYmb+wMLdzwvMZ5a7NT59t1LTN1pQxfvhj9DFWW5yC2kn4U
vV2EtKpQhx203WjJiTOTffygZYyOLLFqoG1rB8hdHkmbrk5Oc3qHvNiP0FZSBQue
ExwQdk1eDpvLU4SVcoD9Wy6/YjLJCs1KnABIAdPqbKyIpUZnUwi11n4NKg4HPBo9
LzytHc+Wt68kmbadQDVGM/u4hMi8vCD93mWyjyYwsZGgMWppvianVMyEE8x02iEF
KGlLC8HpaafCHTEgVOghdXzyiDr2pz0fyqZUG+Cp1uL9sTWTr53PfoMxx52J702h
B1RKOXoQIveEeCemwYq0E5tNXNIhwQ==
=4BYm
-----END PGP SIGNATURE-----

--zQiiCAM5ptAyb9EE--

--===============7741625905344322906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7741625905344322906==--
