From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/18] regmap: mmio: Add function to attach a clock
Date: Tue, 18 Jul 2017 14:21:47 +0100
Message-ID: <20170718132147.uzexelksygjeasmw@sirena.org.uk>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <02f409ad80afed68e02660f161fc26d588a86fa7.1499955058.git-series.maxime.ripard@free-electrons.com>
 <20170713160142.2buaie6ebqbxunin@sirena.org.uk>
 <20170717090107.cpjxoxfqcc3qwabh@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0089936345=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170717090107.cpjxoxfqcc3qwabh@flea>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0089936345==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dorp7qp2jdppfcih"
Content-Disposition: inline


--dorp7qp2jdppfcih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 17, 2017 at 11:01:07AM +0200, Maxime Ripard wrote:
> On Thu, Jul 13, 2017 at 05:01:42PM +0100, Mark Brown wrote:

> > > This might be problematic if the clock to enable is stored in another node.
> > > Let's add a function that allows to attach a clock that has already been
> > > retrieved to a regmap in order to fix this.

> > What is the use case for this?

> This is useful when the clock you want to be handled by the regmap is
> not described in the device node that probed the driver, but one of
> its subnode, or an another node entirely.

> We're in the latter case, where we have two controllers in the DT, but
> are driven by the same driver. We'll create two regmaps, but one will
> not have the proper of_node used to retrieve the clock.

I'm sorry but I'm still not seeing why you're doing this.  Can you be
more concrete please?

--dorp7qp2jdppfcih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlluC2oACgkQJNaLcl1U
h9AgGwf/U7/VjZReTRqFVAih0pK/0nqz3xriFh8b/MlZQZxYThBJgFDOXcXWafKn
aPfGa2GAU0QJaFIM9f0X+WjKF1du+v7Qkmbdc6FnyZD/VcWSkoOmtzS7yXSllS+B
+mn/TCI002pdWBsnf9HztudcqIGlPKhctc1IGCf6Uk4qJNl9aWrtIXIbl0lhz17R
iel7q6m7T25e2zv9efMejrTrtWS1lWk07hCMCGARZ0uug/SL4kcvPPq4v0eWq33d
HQIpNSpZCj/ibhEshqBMVI5DdNqITyXswHE2/IcHIkc5l/zmJONIwngdiqAvB+Ry
MxGaSZCmDnAD8TN8JFlh5+T1faAR9A==
=C3bf
-----END PGP SIGNATURE-----

--dorp7qp2jdppfcih--

--===============0089936345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0089936345==--
