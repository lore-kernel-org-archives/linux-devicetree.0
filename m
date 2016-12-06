From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: adv7511: Add regulator
 bindings
Date: Tue, 6 Dec 2016 13:20:20 +0000
Message-ID: <20161206132020.uzchq63pfpaujg6h@sirena.org.uk>
References: <1474622430-6704-1-git-send-email-architt@codeaurora.org>
 <1849418.teKsJeE0xP@avalon>
 <20161206100517.q2v73kj256kyhmlg@sirena.org.uk>
 <3208429.mJrxuV2Nx6@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1694976356=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3208429.mJrxuV2Nx6@avalon>
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


--===============1694976356==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t3co2egp7uwa3zlz"
Content-Disposition: inline


--t3co2egp7uwa3zlz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2016 at 02:46:55PM +0200, Laurent Pinchart wrote:
> On Tuesday 06 Dec 2016 10:05:17 Mark Brown wrote:
> > On Mon, Dec 05, 2016 at 11:16:22PM +0200, Laurent Pinchart wrote:

> > > This has been discussed previously, and Rob agreed that if the datash=
eet
> > > recommends to power all supplies from the same regulator we can take =
that
> > > as a good hint that a single supply should be enough. In the very

> > No, don't do this - introducing special snowflake bindings just makes
> > things more complex at the system level and tells everyone else that
> > they too can have special snowflake bindings.  Someone should be able to
> > connect up the regulators based purely on a schematic.  Just describe
> > the hardware, it's just one extra line in the DT per regulator.

> There are power supply pin that have different names but documented as ha=
ving=20
> to be connected to the same supply. I really see no point in having multi=
ple=20
> regulators for them.

The tiny amount of extra typing involved doesn't seem like much of a
cost for keeping things consistent with every other regulator user out
there.

--t3co2egp7uwa3zlz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhGuxMACgkQJNaLcl1U
h9Bsswf/egHfeJbbWiby/nmGfI6ECh6+OMptu+VW4juCwdZOPzZOy8G3/6z8pjHY
WaeJTSVFyfm13seBX2Z7ok/jRil7Gvfn4dHbi9eHefzeklN3hiRAkkeGmIziOOjY
XYgZ5x1ZxOSRWanfsUPbqi9Gh5JX2b0Jj9SGQ85h318yhbSmNleDMYzWdsBSm1nO
bEchpxGiTPCnxhyH2EB3+wpigbJZo2jRa423o5H2guKrTPO4Aq4MI/8KiWNP0J36
MGdE0vgtA+IYRpLmdghP2dGoxwn85shblXgr7Qv836v1ddj8w2cF5AvKMKOPDisj
qHatjllmPa+gMxJWi+kJQl1VpzZHKA==
=Be/k
-----END PGP SIGNATURE-----

--t3co2egp7uwa3zlz--

--===============1694976356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1694976356==--
