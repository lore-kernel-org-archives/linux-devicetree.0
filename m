From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/5] regulators: tps65912: Add regulator driver for
 the TPS65912 PMIC
Date: Thu, 1 Oct 2015 11:53:08 +0100
Message-ID: <20151001105308.GF12635@sirena.org.uk>
References: <20150925180533.GN30445@sirena.org.uk>
 <5605AA1C.3090905@ti.com>
 <20150929151320.GT30445@sirena.org.uk>
 <560AD3B2.1070102@ti.com>
 <20150929183818.GA15635@sirena.org.uk>
 <560ADF61.9030105@ti.com>
 <20150930172844.GF15635@sirena.org.uk>
 <560C462A.1000707@ti.com>
 <20150930222022.GC15635@sirena.org.uk>
 <560C70FE.6000909@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560C70FE.6000909@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2015 at 06:32:14PM -0500, Andrew F. Davis wrote:
> On 09/30/2015 05:20 PM, Mark Brown wrote:

> >>This is already the case then, missing regulator nodes in old drivers will not
> >>get instantiated ether. And old drivers don't always store any more info about
> >>available regulators than mine does.

> >No, well implemented older drivers will still unconditionally register
> >everything.

> Is this desired? If they are not in the DT could this be used to signal
> we don't want to register this regulator?

Yes, this is desired.  The point is that there is no situation in which
we do not want to register all the regulators physically present on the
device.

> >You're talking about a trivial loop that takes perhaps a couple of lines
> >to open and close the for loop and another line to declare an iterator
> >variable.

> Adding any extra code and complexity to use a helper that does something
> that already works with less doesn't make much sense to me, but if that's
> the API you want I'll use it.

It would take a lot less effort to implement the requested changes
rather than go on and on about this.  There is no meaningful complexity
here, we're talking about removing code and moving some data tables from
DT (where they are an ABI) to code (where they are not an ABI).

> >Look, please stop arguing about this.  There appears to be nothing
> >special about this device that makes it different to other devices.

> I'm sorry if I sounded overly argumentative about this, I'm just trying to make
> points in favor of me not having to re-write my driver.

It's hardly a rewrite.

> The new framework helpers do not help my driver as it does things differently.
> You signed off on this different way of doing things just last year with the
> TPS65218.

> If you no longer want it done this way then I'll go and change my driver.

It should already be apparent that this is not a desired configuration,
old drivers are never a good reason not to do the right thing on new
code.

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDRCUAAoJECTWi3JdVIfQfUoH/1pOOLr4yHM7Icy185CDpB9L
E2a5bMvbp87XNme8hH/xNMlWLDTESIc3d7mUILAnMGqc+MjZgSHzyFBPkNAlAh9l
xXZ9xeOxFzmrpPU0zrcaShELdTYFQR7rsL2o0IrDU5ker2BUiT9xiXHZghnNahF4
OZitdM62aj/zA7cC+xgAvLFX9JD8ceVC52xCb0GdK+blOQztMXDAysk8dPO9DP7U
kBeFERAX4ingF2ahJsFcQVyfo0JUbEo/VHGamgqt2aC2ty1iWaUK9L/v+W7J5sBh
aJ/ED0lsQPb31TcucUQOFxX9zUMAHKfc/bpaj7ckuFlRWVkb4sluNEjcBXS64cE=
=vxq1
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--
