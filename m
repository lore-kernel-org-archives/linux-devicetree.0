From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 1/5] bindings: regulator: added support for suspend
 states
Date: Tue, 23 Jan 2018 11:28:14 +0000
Message-ID: <20180123112814.GD7600@sirena.org.uk>
References: <1515752305-15907-2-git-send-email-zhang.chunyan@linaro.org>
 <1516607961-379-1-git-send-email-zhang.chunyan@linaro.org>
 <CAL_JsqJy1o7cjEqs8vYe7Y45W6_A8iyC3_4=eeZ-teCxR06Rqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJy1o7cjEqs8vYe7Y45W6_A8iyC3_4=eeZ-teCxR06Rqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Chunyan Zhang <zhang.chunyan@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2018 at 01:50:35PM -0600, Rob Herring wrote:
> On Mon, Jan 22, 2018 at 1:59 AM, Chunyan Zhang <zhang.chunyan@linaro.org> wrote:
> > Some systems need to set regulators to specific states when they enter
> > low power modes, especially around CPUs. There are many of these modes
> > depending on the particular runtime state.

This v4 appears to have failed to arrive in either my inbox or on my
copy of lkml, not sure what's going on there but can you resend please?
Last I have in either place is v3.

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlpnHE0ACgkQJNaLcl1U
h9BA+Qf/elthvR8o5EDfThHQemrvTtj46dn7IZnuTlf+p1XWtDcwDzUa6RQMtbYf
zBQIJXXhW5dOikxPJi4fG5k/YX25x0zDlvJsbk8G7VALtIRbEe9S2mEtLJaHIEkQ
3R+AJgGnGmd82F18eeRBfDtm1tNZEYBNtHVT8LzsWLsbYBqVNw5q1HPmDz/MvlU3
QTbVx2Eqd6chiYEeaB3d87qLrQzbJTNojwaqAuufBLdQeSsHAQctsfwQM4M7elyS
HNQl/jqJ5m+43pomWhbPMgVasORJhF2atuSEIL+Bq/0pgcofKcrbFp1vk9XLLWpK
KO4WuCCV3UwFJjMgWxZnMg/h/below==
=iXaI
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
