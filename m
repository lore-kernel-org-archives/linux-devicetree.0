From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 3/4] regulator: pv88080: Update Regulator driver for
 MFD support
Date: Tue, 8 Nov 2016 16:37:21 +0000
Message-ID: <20161108163721.4qwuhwrdferbluxg@sirena.org.uk>
References: <cover.1477530195.git.eric.jeong@diasemi.com>
 <711afefe3e65c166111473024bf9b54f3d4cc8b6.1477530195.git.eric.jeong@diasemi.com>
 <20161027110337.GJ25322@sirena.org.uk>
 <8FA4409277D6E54680546B8811D85410029DFAA2EA@NB-EX-MBX01.diasemi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6t75qqul3cb56xah"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8FA4409277D6E54680546B8811D85410029DFAA2EA@NB-EX-MBX01.diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Hyeung Dong Jeong <eric.jeong.opensource@diasemi.com>
Cc: LINUX-KERNEL <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-GPIO <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


--6t75qqul3cb56xah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 08, 2016 at 05:59:41AM +0000, Eric Hyeung Dong Jeong wrote:

> Thank you for the comments.
> There was an internal request to release driver based on Kernel 3.18 for GPIO and MFD support.
> After that, the code has been kept. I will send a patch again after changes.

Please don't submit code for ancient kernels upstream, we can't merge
anything that isn't for current kernels.

--6t75qqul3cb56xah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYIf88AAoJECTWi3JdVIfQRQUH/i+bnzIDbjl0iqdG+sNK7WKO
okR/BhBvOGbUtzyZ9coHpQwXG/hGp5x3Ug0qXV4wLpjaLZ3AJgwJmvreZOKOfVPX
6V31HNJFSvO2PKAKK/mATurVMnVsiGjw3jZVh9WAwsdSW3UPEHP1LV0cttoroDMC
sOroLkSVU3YvTXAI0pveJJwF1wJE0kwlZ0Y706nwZIJSYTIwGwRGKJgoHYy+cXSK
vLLCAeihEbI97V2J/x5wPn23yTMU+DSFSM/jkq9D1eV/VZ1NedV40vFVTYIMM1m4
DdTYndSm7PnIlrTyIJUchES7XsWCYFy5tZxO4xrH7Kf505AHhO0zxYsr2DqSKjI=
=CBiF
-----END PGP SIGNATURE-----

--6t75qqul3cb56xah--
