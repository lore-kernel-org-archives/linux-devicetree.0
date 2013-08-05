Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35911 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753380Ab3HERDD (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2013 13:03:03 -0400
Date: Mon, 5 Aug 2013 18:02:44 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130805170244.GU9858@sirena.org.uk>
References: <20130803142043.GA13830@panicking>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y+HvVzgSYPr8J+Me"
Content-Disposition: inline
In-Reply-To: <20130803142043.GA13830@panicking>
Subject: Re: [RFC PATCH] ASoC: Add PCM1792A spi mode codec support
Sender: devicetree-owner@vger.kernel.org
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--y+HvVzgSYPr8J+Me
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 03, 2013 at 04:20:43PM +0200, Michael Trimarchi wrote:
> Add PCM1792A spi mode codec support. This version implements only
> a subset of functionalities. Tested connect to a pandaboard ES
> device and based on recently pcm1681 codec.

Applied, thanks (having sorted the Kconfig and Makefile entries).

--y+HvVzgSYPr8J+Me
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR/9qxAAoJELSic+t+oim9Mk8P/0YsJvdz16aqErZr+p83QGXE
G9L4pEaP4giSS7uY+X6Sy+a+QhoMpAcYCbNQ37nEx1G97irNbk9VYjL+5xedMBXF
8DWCWo2jlu0UpYT9E89f66rjWSadkMwQEYs1T6kkcCPJL2A82adcgG+j4Z6d5OkL
nOlXIddJvjf5mPmoUWzMHExWN1EXCpWT2GKGCwYkBH1tvu4fg49XZyMyhaGsXRTw
aDnAkG0GxSeOG9Su7s1rblNb9cor7zmEm8/ssqcbS/HeWqqadSMlnL/D5LrdH6qs
HkHTnYZXLY8VqXvahpbqrlI7oTNPlxPRKQuE5TAEwytEFpZT9ukZPZzKml9kOtfX
Q5zrPxY/AakqBqvvU9GVK/WJ6QDPCJ/cKjDhqQy28A0pNSc2u8ZG4K6AV+S/D7o7
gYDUNlDhnAmIKiDqUGsEnXJ8KN0qtwOSrWWTfH7lxSXHAgX54f/OOtebE6yV/vLR
Ln5rOFg9cwvMcv80yRjuuwzwS0QJacVZKf0AStBRvJzBhXP7HB3hxT/PuRmjchgX
XR2ISgM+EN3qD4mPKEtVOL3iE/kByy5I/34ETrufx7VcCTb7cdaXDn1PwEMPNoEG
dNEChLXOcGkUMSPm9xNNRVEeEaPo8Mee5sMqQV8EFTPdrnxPiHvCqnnTCZPeUqC2
8l8yh1EF+GAIrkHVEvvp
=wfGH
-----END PGP SIGNATURE-----

--y+HvVzgSYPr8J+Me--
