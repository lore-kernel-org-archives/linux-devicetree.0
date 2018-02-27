Return-Path: <SRS0=8hQX=FV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42100 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752107AbeB0NuA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 27 Feb 2018 08:50:00 -0500
Date: Tue, 27 Feb 2018 13:49:57 +0000
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv4 0/3] spi: support for Socionext Synquacer platform
Message-ID: <20180227134957.GC11822@sirena.org.uk>
References: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline
In-Reply-To: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, tpiepho@impinj.com, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 27, 2018 at 06:26:22PM +0530, jassisinghbrar@gmail.com wrote:

>  Support for Socionext's FIP controller intended for flash device interfacing.
> The controller can operate in 'direct' or 'command' mode. One mode directly
> talks and provide a read/write i/f to the flash device. Other works as plain
> SPI mode. This driver runs the controller as a SPI controller.

If any updates are needed to a patch that's already been applied you
should submit incremental patches which make those updates.  This avoids
having to change published git commits which could cause problems for
people working against git.

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlqVYgQACgkQJNaLcl1U
h9B67Qf+NKTgk0kqcwLbbxAWyov+2aXFo1yQ5xVgbXiRdXMtdz+26vEcH2G0LCUX
6KQ73JIUWKh2y4/YX5LJZbFd1PEUqRVR8sn2vyQJrozF32ws/+mik4ihypveGFJd
F4bk7lzjydSg2FmaOGiemNN/FB1HXJbFSXnETPvUf/krrbH4AUh4pdAMOnkka3D/
f55U3TKRtbpHzczt9RtPfs85FucSOS4ASiVHM9imQqbEFY2Ky767iH0EyQ6owo4Z
MJvI/Tic01jxfGrE2ZVFBhMSzjaVrtqM2RL/2+7F6bfilmiyRvawoYKKDxx986nY
IuAy96LJoGYjvacEgTJYoSxxl+vJ0A==
=lDK1
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
