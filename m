From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add bindings for the
 Sitronix ST7789V panel
Date: Thu, 6 Apr 2017 23:52:37 +0200
Message-ID: <20170406215237.GE27728@ulmo.ba.sec>
References: <cover.74614dd427b0214d0ba7ccfe75bdd7506b42e61d.1491226701.git-series.maxime.ripard@free-electrons.com>
 <85ff9c2013ed43f3ad4c566d3430fab380d9a80a.1491226701.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <85ff9c2013ed43f3ad4c566d3430fab380d9a80a.1491226701.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 03:38:31PM +0200, Maxime Ripard wrote:
> The Sitronix ST7789V is an LCD panel controller, controlled over SPI, that
> can drive 18-bits 240x320 LCD displays.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt | 3=
7 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sitro=
nix,st7789v.txt

Applied, thanks.

Thierry

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljmuKIACgkQ3SOs138+
s6FSEQ//b9vRuA1qgNvWoUObJQgqiitFCTfLDxLPAUwx+HNXGHWtBW0F2jpW2Zjz
8+FZOykGT0mCL4QFkvYkkwRYusxXYOxq9jQLdnjiMh6aCionflWqK88OXm3EpOoC
QKP9YvsGeMbI1EB0YK2KDiS55wQsnPWeSujcs0R4yIs5ffYwys69KTk5vgt4N5WB
ilNQi7jZH1CRVndHxjozTNiVjmCwtG8kfkLX134ERUwlWMo3rusnR/Riq2rrfzE9
gXyfRrjokL+9dazecYC5YUsyuFg/D8plWHsqt8g3Xtz+fjYnoHlenhAp19OLITPv
Uy9Sh/PetiE6vYDyFUjVPuEon/0fDtBdpyJGCLzSrI9oF24j8nB95l/lsdgFPRJq
AsnPUZzuTQrJwSfu+TWZYBVshZD95tV2OUrAcJh56UY1nv12juT/7gMJWGaAtWpU
2NvEdutEScbatBYDtWiX868MtP0MS9FlCJTSFO+v4UznVtfSHVZBf/YhFtXaNsE8
hY6RKCV5MHVreaalG6lDrbwfjIU6fyydxOuFszX+G30k4/Wj/J32UuM7CXDMGOqY
+FC/ZjwN+9PuW8Xp5GGUYpxPLPDp0VFBlAxBxbLdYd1fi0ZCvryif0Su8km+Y7uT
XghrA7miVWS1SVBZcrZ25EAp+Iwidq7EsAYGSkNhJ+3Qv10zD3g=
=T1YS
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
