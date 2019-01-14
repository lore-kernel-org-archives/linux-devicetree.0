From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: dt-bindings: Convert fixed-regulator to
 json-schema
Date: Mon, 14 Jan 2019 22:08:17 +0000
Message-ID: <20190114220817.GH11073@sirena.org.uk>
References: <20190110221903.3990-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+Z7/5fzWRHDJ0o7Q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110221903.3990-6-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--+Z7/5fzWRHDJ0o7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 10, 2019 at 04:19:03PM -0600, Rob Herring wrote:
> Convert the fixed-regulator binding to DT schema format using
> json-schema.

Actually I've had to drop the series this conflicted with since it broke
a bunch of platforms so I'll go ahead and apply this instead, no need to
respin!

--+Z7/5fzWRHDJ0o7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw9CFEACgkQJNaLcl1U
h9D3Uwf/YdWRexgPnkLabs94GZD6T9erBqzrFnXhZf0b4SxxknkChZ9ahq+VDi1r
pUsf/T5HKA75PiPQCcbn+TVM0fRQBlNDeb/2q1l1YWnU8fXSgY8VgYmWqgJGKpVg
ytWAKmIo440zfYvyPOXwxedGaJ29xGUmAHiL96WXIZJZdqqBkrWLyrbRMpSCnwI/
tO9Q5TntZM1TcaALSx2ooGCO+eqCXTKHfazMxco7qFYwqzVsEeYjNzIjBQ/Vx3q4
ynf/SetNemGsPfIa+0gHkdn6eoC5e2nIGz1OhBEuW6CVhvpcFxDkoGAiYcin2Rc4
zQwyCkCtS5kMSUCi+IoUijCgKqLOdw==
=8G0B
-----END PGP SIGNATURE-----

--+Z7/5fzWRHDJ0o7Q--
