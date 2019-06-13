From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v15 0/7] support ROHM BD70528 PMIC
Date: Thu, 13 Jun 2019 15:05:29 +0200
Message-ID: <20190613130529.kgswgbuszb24itxz@earth.universe>
References: <cover.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
 <20190611200043.eib3g3acc7ilawsx@earth.universe>
 <20190612060328.GQ4797@dell>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z7gwwmvwfgzls6v6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190612060328.GQ4797@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--z7gwwmvwfgzls6v6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2019 at 07:03:28AM +0100, Lee Jones wrote:
> On Tue, 11 Jun 2019, Sebastian Reichel wrote:
> > On Mon, Jun 03, 2019 at 10:23:37AM +0300, Matti Vaittinen wrote:
> > > Patch series introducing support for ROHM BD70528 PMIC
> > > [...]
> >=20
> > I think all patches have been reviewed by the respective subsystem
> > maintainers. Lee, can you provide an immutable branch with the MFD
> > patches (1, 2, 4)? Looks like the other patches only depend on those
> > and can go through their respective subsystems.
>=20
> Yes.  It's on my TODO list.

Thanks.

> Would you prefer this method over me just taking them all and sending
> out a PR?  The latter is my usual flow, but I'm happy with either.

Both methods are fine with me. I usually go with "my" method, since
that results in less shared commits. It simplifies potential
follow-up bug fixes, since there is only one tree to fix.

-- Sebastian

--z7gwwmvwfgzls6v6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0CShYACgkQ2O7X88g7
+pr+dQ//UKZYRSKZHKIkw81U/LPaGmkXOWyyYGwVfxHDYeMyeHur/klljg+mU4bW
gMCGCns23SP/L4c9lOc3aY/Ovkjuq2gjonKtMFo66fY9slf6MdnC4L9FNXXUqsPK
oa8Fir0ful7FdJ4HxsxLqkiTT1wWDNRgchMI/iNEhcjMt14rlzwIM7wyktT8O/Zr
9Om2Cx282JEE5hGbl2D98VPrR67vqNRqOwIhZ+lQBNgXiOUgvlh2UDqpXziOjdwX
vxgmoxUB1v72itnyz0qf46L+ayqnPmBH6MSEdTYs5vYz4l64c4jIXoyyJ/pPr+ck
rb6eygO0LkADnW6zab11yWn1HH/CYJG1TUNMNOw8a4RFPpCyDW17U5ksICi55hhx
HrG1YXCPgpiGV2d0MawLwLhEbv3FXIYDPPt6xEne0FXUHg53apOQjmyPoGP404RN
M7jJJlpkGyHd5N2iskFU79NBES64aHkc/uvmEZw56xHUVg0SZ9e/V7zLKWwxMYeM
C0kaTjsN86xnoNwsMoVx94RiIjk38xDz1anaAafOtpkUxdFb2xL9qpGWiUlwZKVJ
ALa7k8jleI0Mzv/fOFHGBZzkGoPCdqURkANKyCLHBA8Pi++nGR4RHF2Om/goK/mb
pLme4LVfDKswR8HYUbrfCBLsG/uBNX1GfoEH9/CQ2gNKSphUZ90=
=ScGm
-----END PGP SIGNATURE-----

--z7gwwmvwfgzls6v6--
