Return-Path: <SRS0=F6gC=GE=gmail.com=thierry.reding@kernel.org>
Date: Wed, 14 Mar 2018 17:38:40 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 0/9] Refactor and add AHCI support for Tegra210
Message-ID: <20180314163840.GB9201@ulmo>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <20180313210633.GP2943022@devbig577.frc2.facebook.com>
 <20180313224258.GA23414@mithrandir>
 <20180314152513.GW2943022@devbig577.frc2.facebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <20180314152513.GW2943022@devbig577.frc2.facebook.com>
To: Tejun Heo <tj@kernel.org>
Cc: Preetham Chandru Ramchandra <pchandru@nvidia.com>, cyndis@kapsi.fi, robh+dt@kernel.org, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2018 at 08:25:13AM -0700, Tejun Heo wrote:
> Hello,
>=20
> On Tue, Mar 13, 2018 at 11:42:59PM +0100, Thierry Reding wrote:
> > My suggestion would be that I pick up the arm64 patches (2 and 3) into
> > the Tegra tree and you take the rest (dt-bindings and driver changes)
> > through libata? There are no dependencies between the two sets, other
> > than maybe checkpatch.pl complaining about using an undocumented
> > compatible string until both get merged into v4.17-rc1.
>=20
> Applied 1, 4-9 to libata/for-4.17.

Patches 2 and 3 applied to for-4.17/arm64/dt.

Thanks,
Thierry

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqpUBAACgkQ3SOs138+
s6E/+RAAsZf9DQiSevPSRDjw+9058dRsmkZ8qqjIaaEH+b9mwWch/kF1uXA/rJG7
DX6qKp8EZrxyyBusGhU5NcBJbTyH8PiODPtwwy0GIjFkp5tVeoeCMKbA8i9JyrLL
NT4fIuOEb81hMG7lpFpsyUIzGop7AVrg9gKk53HeqthBprMiwBSUcJCYOplLZb7O
2kgRGpK1tsxiEwofjYFHkXxpnyTxptLXnJYrdtH6yT/4v9i2DKoY5pQ0tq9MVUdz
FVJ7CumbxUqXZbvP5sxOfVXDxzVhwQwZHMAoAHoXAuvmj4JG1k3gtMFLCvtFHU1H
dNpTNbqs/XRit06JMPjcDvG/UAwtdL3+VJX3YhZuV2RrolrGBFj7gKQh9+J2QzpC
qLi+1whqIyI7/4QKw01NOaBIXGHcE56n4DzZdl9froy47cwHV21D4lb8HZ8Kx3tl
93w6iKOuFxgX1dUbU6jm6zFax6t0VxkpfdXnj2IKryKp/x2x73BVYVxDO0UM+u9Z
fWCGshEuJfb/964/UylGIHUZkWQ/jWDkKawQCxjIBtWStGVSwn3UxNkINvqUrAy9
AOM5jhz5l7qy7M26t+ByvuM+5XSRrG7G9uChbAAzg4LtTeV3Fk/+TRVAXDsKMswx
4d55fLECVlm1vc6pOX9O8Qg+jPtwSW8QXhHInO7dMaihL+e4Euc=
=QM+j
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
