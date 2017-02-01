From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: display: move ANX7814 and SiI8620 bridge
 bindings
Date: Wed, 1 Feb 2017 19:18:18 +0100
Message-ID: <20170201181817.GA8287@ulmo.ba.sec>
References: <20170131175417.20486-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170131175417.20486-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 11:54:17AM -0600, Rob Herring wrote:
> A few bindings snuck into bindings/video/bridge since consolidating
> everything under bindings/display/bridge/. Move them to the correct
> spot.
>=20
> Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>=20
> I plan to apply this to my tree.
>=20
> Rob
>=20
>  Documentation/devicetree/bindings/{video =3D> display}/bridge/anx7814.tx=
t   | 0
>  .../devicetree/bindings/{video =3D> display}/bridge/sil-sii8620.txt     =
    | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{video =3D> display}/bridge/anx=
7814.txt (100%)
>  rename Documentation/devicetree/bindings/{video =3D> display}/bridge/sil=
-sii8620.txt (100%)

I wonder how long it will take until there aren't any patches left in
people's trees that use the old location...

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliSJmYACgkQ3SOs138+
s6F4Hg/+JlIhwqgjrMmmQh+piNaXaolWt1v+DhgqNIgCX5QPfbm8h7s6iKnESsfN
l8LcA+Nvv77gstx+p7wvjOL8iFmbeID7zcm2wwGAUQmBzyMeqGum7bXGOsyZQH2k
CdVjxF46ZICG0ZEg5/rAHGSZ8Nwm+QzFlKd/tJA5lapsYkXDy2/k2qSKl4tclE2D
g+GewCLhvQh125NfzHsmw1zfLzKYdMb4+KND0eLCILSR24q+AWVi9ROXswHVfo6L
29b7SuCGPJymGNqfNq4jHYFghY668yiiGf2b82npBZZ9ccZqsr7OK8qhuVaPN4bx
HGGIFAcw34CRD9a89NYbcZe4XVmEhWDA8K44tCs9CH2EtcfqqMptOHJOWKMyiY4C
bi1HXmtMuyq74bpQFqBzrzOEt7mgYnZ8Ma1xslaenhNjjZ7Sh0qbN+hi2niiulaa
/mUOh7Mv0uEmhsOL/BLqla27f+wfi8jM60joK7Qh11LBboUJf58EJV8PPVlhTk01
6qDlzDkYijrktCZsmMihAAq37mNkik+amglQ8YaVYIfdluv2pBLgRtNLaPXKAQQQ
4vmZ8PlyPfXBclLeN+HOaWLWbYPqC88RJOGDMBkkgUeYyYhlE2BNXRquCdHqW6Q8
qb7yMSXeqw7kbVyyPe7JcxXNZuUKd49P7zIwHmeeEL4qCIDMMys=
=AexN
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
