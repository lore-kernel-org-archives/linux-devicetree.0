From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] regulator: fixed: dt: support for input supply
Date: Tue, 3 Jul 2012 20:17:05 +0100
Message-ID: <20120703191704.GE29030@opensource.wolfsonmicro.com>
References: <1341223645-7817-1-git-send-email-ldewangan@nvidia.com>
 <1341223645-7817-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fblc08uBQ7kpPybH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1341223645-7817-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: lrg@ti.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--fblc08uBQ7kpPybH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 02, 2012 at 03:37:25PM +0530, Laxman Dewangan wrote:

> +	if (vin_supply)
> +		drvdata->desc.supply_name = "vin";
> +

This isn't great both in terms of it being conditional and the fact that
it's only usable on DT systems as there's no non-DT way to do this.  In
general unless we're working around some device tree issue (which should
be *very* rare) we shouldn't be adding any DT only stuff to generic
code, we need to be able to run Linux on non-DT systems.

--fblc08uBQ7kpPybH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP80UYAAoJEBus8iNuMP3dylgQAI30dX4i6cWMFpyf3p6ZxYaD
gtUrvxWE4XYgOB97F3yjKygHWPDH/6NTfEJusgj0V21b8bcOPZzNDPDBCNwrn4A3
BkuWz3riefvkmzlT4nqaEBXCqpvRfYLRpTYdHOrSi+G4BozXx+SRPT/yPYwc5i3k
bNfPmOywkG3IZtOGGSdHK4YnYtoOvk4ky5miVdaA30ybbmBs3lS8nNZ2wOJEMLbq
AlV6ucEGWTlSxI1JUEW/K+DHI/bRpAqwPSG1/o4+XO4VukBGirCiAvXpu2Sp9Xol
H7nTE3BfbcgcEMN13U2vx8LrG6STNm2WCmtSkebTbUfBdLpLSa8Q2enUTfMMEdHu
rFIuSG22yI9jts6BYOXotynBLscLIkKFFCprXDGRb090BTxnXD+jpm3UWk3U2SO9
jfBOx9uhWqOWW6TXVQZVB5FB8f9CwvrlCijpUs8HLd8fe+I2NtEwJuLAARBX1TaN
uo5sPOB6Oy9D7QIS3WY77SQe0OIcU9VFRif1KywQRMW3uPzhAMnNphqV//cKi37M
awIO+Kh3vVJkFwR86801vs3dc4QYPnZWv9TdMnXl8rhpIu3Ql6UnTB/f61n8o1x5
+y/oGugvQ97QPtf5t6L2judtXcgIKckCjCewvY9se3r2K3fRJYfr3i9OD3VzCyfF
vmIBMluh+xfYYNEhW8nY
=1dQQ
-----END PGP SIGNATURE-----

--fblc08uBQ7kpPybH--
