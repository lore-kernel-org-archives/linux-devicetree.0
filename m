From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: display: bridge: Document
 THC63LVD1024 LVDS decoder
Date: Mon, 9 Apr 2018 11:22:44 +0100
Message-ID: <20180409102244.GB11532@sirena.org.uk>
References: <1523018517-24121-1-git-send-email-jacopo+renesas@jmondi.org>
 <1664336.M7KDjLhzuK@avalon> <20180406142558.GP20945@w540>
 <2441543.5xTHaLXzZ0@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1902917233=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2441543.5xTHaLXzZ0@avalon>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jacopo mondi <jacopo@jmondi.org>, sergei.shtylyov@cogentembedded.com, airlied@linux.ie, magnus.damm@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, niklas.soderlund@ragnatech.se, geert@linux-m68k.org, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org


--===============1902917233==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 06, 2018 at 06:40:14PM +0300, Laurent Pinchart wrote:
> On Friday, 6 April 2018 17:25:58 EEST jacopo mondi wrote:

> > Same on the mandatory/optional VCC supply thing. Let's try to make
> > next version the final one. If the optional property with the dummy
> > regulator doesn't satisfy you and it is preferred to have a fixed-regul=
ator
> > anyhow in DT I'll do in next version, othewise let's try not to change
> > it again. I'll just remark here that in the current Eagle design vcc is
> > connected to a power rail with no regulator at all :)

> I don't like the dummy regulator much, as it generates a dev_warn(), whic=
h=20
> makes me believe that it's a hack rather than a proper solution. You migh=
t=20
> want to ask Mark Brown for his opinion.

The DT should describe the physical supplies the device needs, if that's
a fixed regulator with no software control then the DT should have a
fixed regulator with no software control.

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlrLPvQACgkQJNaLcl1U
h9Aqvwf/ciDfXmVqKQSvxMtmLhQMHUGmfRiXwnrhL+GeughyU+/cdRY39m4DlJ/r
l6SO9pxgy35Nafx9kK9N+SaJytNy/WI7qMqvEtO7Ekl0ySaCxVHDSz9EPIyV0C3r
+HJ8ZpLzBvg8Vxprv38qSt8rbwzuejiIsaz7wamIEwmY0QH650COYddR34+29EGq
hfwfseobZuIrHIBJ6o/bLV5js0xHiY68cXVAhSNWZK2RA935yVnD4mjWGakkvydu
7G55zw9GVulr11UYjP7XDamnkRVqS7WsHt9B0vge0oIXqyAXhWWhsx14GxsJyhpI
TNMbXD8PGAMasYAQ3cd+l0MgbD0dhQ==
=OXuF
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--

--===============1902917233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1902917233==--
