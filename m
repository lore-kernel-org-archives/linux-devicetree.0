From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] Qualcomm Shared Memory State Machines
Date: Tue, 8 Sep 2015 14:32:40 +0100
Message-ID: <20150908133240.GE9751@sirena.org.uk>
References: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
 <CACRpkdb-624MauE4sS0mqxarXRRaS3sEB2aMzeRNZw945xhMnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb-624MauE4sS0mqxarXRRaS3sEB2aMzeRNZw945xhMnA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Alexandre Courbot <gnurou@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2015 at 02:20:14PM +0200, Linus Walleij wrote:
> On Thu, Aug 27, 2015 at 7:37 PM, Bjorn Andersson
> <bjorn.andersson@sonymobile.com> wrote:

> Let's discuss this a bit, looping in Mark Brown.

Please don't send upstream discussions ot my work address.

> While sparsely documented: what about regmap (maybe in the
> form of syscon) and drivers/base/regmap/regmap-irq.c for the
> interrupt handling?

> I cannot claim to understand regmap-irq.c, but I just intuitively
> think it deserves consideration, such that drivers who need one
> of these misc registers can read/write their bits with regmap
> accessors and also get IRQs by way of regmap-irq.

Well, all it's doing is exporting a simple register based interrupt
controller based on regmap.  There's not a lot to document.  If you're
using it with a system controller you'd probably want to implement
support for handling interrupts directly in the primary handler rather
than using a threaded handler.  Alternatively if there's no cache or no
overlap between interrupt registers and other registers then just using
the genirq MMIO code should do the trick.

--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV7uN4AAoJECTWi3JdVIfQraIH/1Qb2LpNGPv3mQzYqd+w44pr
apmdAHxP49zNPIXm+GbK/4glJW9pUml4qW0qzRKMoig6C4svUXJf+SdnvtxgnBLN
bO6hiICwTNVPm/hDLvZl6trAfaKkPnevCPo/iJFfXCkbI+Hynx0D5hD4jftdFJpP
PMwBSntKXbO/fWIieFcWgprpSV8QX/D9ZcizkVMgrgMioyNHcUmyKIKXNPfjS40W
pbbGr6Bi5MMIMIVgDBDAbg+xEUIwRq8x3VufcrIFeJ9sbwG04/4TUMgYmZagi6Ry
MXFck1WwCaYUpwb17ETUxUr7jO3ONgtxwonWSfEmoZ26q51yPifHWrLgjhVGxVc=
=J1NQ
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--
