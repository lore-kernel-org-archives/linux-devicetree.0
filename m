From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 4/7] drm/bridge: Add RGB to VGA bridge support
Date: Mon, 22 Aug 2016 15:37:07 +0200
Message-ID: <20160822133707.GO7104@lukather>
References: <20160720095857.12297-1-maxime.ripard@free-electrons.com>
 <20160720095857.12297-5-maxime.ripard@free-electrons.com>
 <57909B8E.7030105@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1841810655=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <57909B8E.7030105@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1841810655==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sGwo475CiIwWEjLI"
Content-Disposition: inline


--sGwo475CiIwWEjLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Archit,

On Thu, Jul 21, 2016 at 03:23:18PM +0530, Archit Taneja wrote:
> Hi,
>=20
> On 07/20/2016 03:28 PM, Maxime Ripard wrote:
> >Some boards have an entirely passive RGB to VGA bridge, based on either
> >DACs or resistor ladders.
> >
> >Those might or might not have an i2c bus routed to the VGA connector in
> >order to access the screen EDIDs.
> >
> >Add a bridge that doesn't do anything but expose the modes available on =
the
> >screen, either based on the EDIDs if available, or based on the XGA
> >standards.
>=20
> Our eventual aim is to separate out the connectors from the bridge
> drivers wherever possible. In the future, a KMS driver using the
> bridge would be responsible for establishing the links between
> the bridge and encoder, and the encoder and connector.
>=20
> If in the future we remove the connector pieces from this driver
> to create a separate generic VGA connector driver, we'll end up
> with a bridge driver whose main functionality is to convert RGB
> signals to VGA. The EDID parts would move to the VGA connector
> driver. In your platform's case, there is no software needed
> to translate RGB to VGA, but maybe in the future, we might need
> to add an optional regulator in the driver to support another
> platform. Therefore, the bridge driver would still be handy to
> have.
>=20
> Keeping this in consideration, I think this driver (and the DT
> binding) should be called "dumb-rgb-to-vga-bridge", or
> "rgb-to-vga-bridge" since that's what the bridge HW primarily
> does.

That works for me. I'll change it and repost.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sGwo475CiIwWEjLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXuwADAAoJEBx+YmzsjxAgg90QALbltVoZD52qiGBK1rfeydrC
oxaF2SpGcqaoHxBCTcUtcnt6wH6aqwKuE7cSOdaJgGj1+bvCjmy4DiQhH4z5PM8h
TpVyfOX6QGtUq4xUnG4rP56y/12FYwQBQS+RjeIRpEV6qf0LbELniQ2E+0UNPdCQ
aZNGlAvWjdqubGYnqVGn2fCNWSXZSWb6IC0XAvOOwhp/g99bvWgNmqa3H0vuc4Rz
YKe0TBXxoVXkcLXblb6TsdCIANmrWrnBcf8tbhC+6mksa1wbrROwJ0WdkkIGQuDM
4OI57WUs7zbrLx1inwAA4pKHZoKbvViMIiW27lrTuG+R72Rs/YGPmnrWJjywTsal
aVutFfxi6/X2WR37e5koROZKeNHFw4uDzieX1RYt08hD4rLQEbq23m+okKP3BSSH
4OEMHH1lrUUJSUt/tu7DnKCPaRcugIL8seQnRonn4LYuVm8dl9oM7W+k/DFnEncl
j2lETkcfjcydqkvzgCUHKebfeRk/+SnK37iThWLa75IYPd9yZlISqn9txCcjX5/y
fv/vRKffc0gm6u+m5NfLJEp+H+xGDDhpFdyyhQUkMEzNgLdy/HvlpdFWxFEJjNzk
b/QB2iAlTKhBXIm2swstK/axFbK5r8MEu5+l9Z9jk/4CZ9dnCHzlpOdjPqQHj9vs
f5Tp5MCz+OAvuyFNyed8
=K9kc
-----END PGP SIGNATURE-----

--sGwo475CiIwWEjLI--

--===============1841810655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1841810655==--
