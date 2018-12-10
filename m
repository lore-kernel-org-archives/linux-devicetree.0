Return-Path: <SRS0=1lUL=OT=gmail.com=thierry.reding@kernel.org>
Date: Mon, 10 Dec 2018 11:56:23 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: tegra186-gpio: Add Tegra186 specific prefix
Message-ID: <20181210105623.GK15154@ulmo>
References: <20181123124341.21431-1-thierry.reding@gmail.com>
 <CACRpkdYGnQNGePViRz-M6Ku=MP063as2G_vJqNx2HDgGdW1UQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vbzKE9fGfpHIBC6T"
Content-Disposition: inline
In-Reply-To: <CACRpkdYGnQNGePViRz-M6Ku=MP063as2G_vJqNx2HDgGdW1UQQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--vbzKE9fGfpHIBC6T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 07, 2018 at 11:08:28AM +0100, Linus Walleij wrote:
> On Fri, Nov 23, 2018 at 1:43 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Subsequent generations of Tegra, such as Tegra194, contain a completely
> > different set of GPIOs. In order to clarify that the Tegra186 defines
> > are indeed specific to Tegra186, change the prefix from TEGRA_ to
> > TEGRA186_.
> >
> > Note that for now we need to keep the old definitions in place to avoid
> > breaking compilation in file that use this header. Once all users have
> > been converted to use the new defines, the old ones can be removed.
> >
> > Also note that this is only a naming change and doesn't affect device
> > tree ABI.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Patch applied for v4.21 with Jon's ACK.
>=20
> I assume this is not something that needs coordinating with
> some other git tree but part of some long term plan, so just
> optimistically applied it.

You're right. The idea is to introduce these definitions for v4.21, then
convert all usage of the old definitions in v4.22 and finally remove the
old definitions in v4.23. So no need for special coordination.

Thierry

--vbzKE9fGfpHIBC6T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwORlcACgkQ3SOs138+
s6EAQQ//drIfB7DZCsa19dbVt5O24ccse/2YrkB5es9Kt9MT0679YRS6Asu2bEuH
q3X+zbxs0N/AOf2pzghWAT6kTcJeTt1gxH6QF0DIaUHVQKG5gTkrylnoNVlpSz9H
4YXRLvYFjNdfyHz7SRtRXi8I771KI40f7bj+CS2HOU3LRKaC5hFXRtE7ePaXGOOi
dFk5C20b2LDryl8u+nsn8vPQzt52+r6RykDpx4/NOZ8pGzM3Soc5vnmj7WqG44c9
hBx5OlQ2ibRMeIXjtzG2MidU6o+2V/NrfByZ0wdio8cRy2bWQ1n7bOiqrf6zMko3
tMQePDlMV/Cj2v53nRwvesx5aHEjycfMmYh6CUwBT4hLvKmgBM0CKaXkQ+6vzBui
iif9bjSPUS5xkHv+tTidObhrkLZu/2zvFnT/hL/2u1HCGntlEGQIOjgwtZuPGyAY
2ebhBLd2Yx+iaa0UquN2DqCOjo68nVVco58T0qf8yqyLK+gBDnKvlSmLTTAteS0Z
AoFT3LnMpMYCC3QWcBr+4JPsqLbzTZ13I3YRFboX/EflXgXTHNWwtSN6EPVb8CG3
w8gI9GPH5yKEKYKpHmkXGZ1vlUKb9k6RWZ6vHiKQgM+8RxIVvm/fGuc8DCNbDx/S
MaeMI4UQsY6KnHzUYwd0LpxUvBos/71p3TewB5edoXgnoKPRxIg=
=cGzn
-----END PGP SIGNATURE-----

--vbzKE9fGfpHIBC6T--
