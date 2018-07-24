From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v9 1/2] regulator: dt-bindings: add QCOM RPMh regulator
 bindings
Date: Tue, 24 Jul 2018 15:57:55 +0100
Message-ID: <20180724145755.GF13268@sirena.org.uk>
References: <cover.1531531808.git.collinsd@codeaurora.org>
 <56b9d5c38cfe46da1228c54f001a49773c3e31dc.1531531808.git.collinsd@codeaurora.org>
 <CAD=FV=VmfqWRGRMEn+0dzZ8x4R5vVaHbkthXAN91Lm-XmP9Gqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=VmfqWRGRMEn+0dzZ8x4R5vVaHbkthXAN91Lm-XmP9Gqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org


--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 23, 2018 at 01:09:05PM -0700, Doug Anderson wrote:

> I know you are still looking for time to review the RPMh-regulator
> driver and that's fine.  One idea I had though: if the bindings look
> OK to you and are less controversial, is there any chance they could
> land in the meantime?

This appears to have a bunch of dependencies which I've got no idea
what's going on with the merging of and no idea if they'll affect the
bindings or anything, nobody's said anything and last I looked it was
unclear what was going on.  I'm kind of hoping that things might have
sorted themselves out of the merge window.

Some of the decisions in the code have flowed out into the bindings
before so I'm not keen to merge the bindings separately, and if the
driver for the thing used to communicate with the device is still in
review then that's definitely a red flag.

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltXPnIACgkQJNaLcl1U
h9Cnlgf/Us+o70Zq0Iaws8EPizNkIFJTyo9hKNBJLy2nFBa6j3aAcDXTget3QCfT
2Pii23L4yQvr+6M2JoO4eOcuL9HtiJKkbKtqdf/P0MfMWGRSmI9IBVypILXlb95n
qsqghZ6Fd2Iu16zelRHgpfxlezB1vz+O3/Z3TURqmPH/ntaY/FVjZu31+ciaA6xR
zn5MfgmJpnYPQNJpLFndEc7AS6aszgvxKwgZ3rggIhG/uMJd0lrAGBsA2/w1Mrd+
umLdkg53zKwjVN3wnqdaqKlwh7d3eQdbw9uL+lS+p1JXZXgHQTmZnHw0nCkEcu88
do3PmjMP3V6yplJh9S6pRNTMgn+/ag==
=ElU3
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--
