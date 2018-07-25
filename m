Return-Path: <SRS0=pMuV=KJ=sirena.org.uk=broonie@kernel.org>
Date: Wed, 25 Jul 2018 18:06:44 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] spi: pl022: Add OF binding to disable DMA usage
Message-ID: <20180725170644.GE6315@sirena.org.uk>
References: <20180724112753.6020-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline
In-Reply-To: <20180724112753.6020-1-alexander.sverdlin@nokia.com>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 24, 2018 at 01:27:53PM +0200, Alexander Sverdlin wrote:

> Legacy platform instantiation of PL022 had an ability to configure DMA
> usage on controller level. If PL022 is being instantiated from DT it still
> claims couple of DMA channels capable of DMA_SLAVE unconditionally even if
> there are no DMA channels specified in the DT.

> Depending on the slave devices' configuration this might be waste of DMA
> channels or this might even claim some precious DMA channels if there are
> only few of them in the system.

Hrm.  This makes sense as an expedient solution for constrained systems
however I'm wondering if it's a good idea to bake it into the ABI like
this or if we shouldn't instead be looking at improving the driver to
work better in systems with limited channels, for example by only
claiming the channels when it's active (since it can fall back to PIO if
it doesn't get them).  That might be too heavyweight though, possibly
even impact performance for systems that do have abundant channels and
could interfere with other devices that aren't so able to do the
fallback stuff.

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltYriMACgkQJNaLcl1U
h9DBYQf+LNsReIz6zlR0z7YIN4OSFP62Ku3W9npGbQNFmFV9+IgudqhzQilZy2/8
BCg03Q6RdQK3lmAefw/72g2x/f23ZCVPR51Q0z0IzsQ4k1Mlnp5sLJQ5KsT+ephG
IH6ipbPQq1SGe08B7W79rMb7WrEj/YkOkeh0jkPIhj06KBZmNlIQNIcjml6m3tQi
/cMIC7EvtSCq8QWae5KanPo8JvyH6vuzUSicE5bnR17/um32XK5TNdPU9z8YVPA2
VnwDGuIF2ExdyoP+8L2RB2mNsQgfvzXvt7HkU7aRfBriSYief9y2/c8MNY+iqm3n
7kxVZfsNECHy0ctPdi15TCzco8qQ/A==
=VPG6
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
