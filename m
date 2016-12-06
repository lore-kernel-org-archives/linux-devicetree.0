From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: adv7511: Add regulator
 bindings
Date: Tue, 6 Dec 2016 10:05:17 +0000
Message-ID: <20161206100517.q2v73kj256kyhmlg@sirena.org.uk>
References: <1474622430-6704-1-git-send-email-architt@codeaurora.org>
 <3929994.7YhJtsl9c3@avalon> <20161205211151.GA30492@tuxbot>
 <1849418.teKsJeE0xP@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1226658924=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1849418.teKsJeE0xP@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org


--===============1226658924==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ymtzczvnu5o364vi"
Content-Disposition: inline


--ymtzczvnu5o364vi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2016 at 11:16:22PM +0200, Laurent Pinchart wrote:
> On Monday 05 Dec 2016 13:11:51 Bjorn Andersson wrote:

> > Further more, a DT binding for a particular block should describe that
> > block; so if we have three different 1.8V pins then the DT binding
> > should reflect this - even if our current platform have them wired to
> > the same regulator.

> This has been discussed previously, and Rob agreed that if the datasheet=
=20
> recommends to power all supplies from the same regulator we can take that=
 as a=20
> good hint that a single supply should be enough. In the very unlikely eve=
nt=20
> that a board would require control of more regulators we can always exten=
d the=20
> DT bindings later without breaking backward compatibility.

No, don't do this - introducing special snowflake bindings just makes
things more complex at the system level and tells everyone else that
they too can have special snowflake bindings.  Someone should be able to
connect up the regulators based purely on a schematic.  Just describe
the hardware, it's just one extra line in the DT per regulator.

--ymtzczvnu5o364vi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhGjVwACgkQJNaLcl1U
h9Deuwf9EMNBFSbkQpzBHz80U/ptNcKxmD1CVN1JVpIH/Z16EA+Byjvvz/Vz8jwe
HzHJEUZuf4//nlLy8M9XJdY0kUELdRncYGssm+7ZjJOJRw/zMtbuQ5u4d/GpvZTQ
7eOGiiXVSaPD+Fc93OJUuXD18jwazmaa1WWsOMIX895nH573XWhl2LfWBlHayxrw
zCGn5i8bIMtmELfTqNI/V4D6TFnyz0OyB+Xkq7TzfMIEaEXOSuElxtVSpkx9cokD
uemMRakYeenw5MV3Ln2ZMwbAgePZDzvuQ8B+3iBuG9ivnJjJ9LfX7aPV5KkeSP8w
JEvu5aN6ZRLHDrsm2k5niCbuPF7R3Q==
=0sZb
-----END PGP SIGNATURE-----

--ymtzczvnu5o364vi--

--===============1226658924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1226658924==--
