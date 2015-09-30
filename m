From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/5] regulators: tps65912: Add regulator driver for
 the TPS65912 PMIC
Date: Wed, 30 Sep 2015 18:28:44 +0100
Message-ID: <20150930172844.GF15635@sirena.org.uk>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-5-git-send-email-afd@ti.com>
 <20150925180533.GN30445@sirena.org.uk>
 <5605AA1C.3090905@ti.com>
 <20150929151320.GT30445@sirena.org.uk>
 <560AD3B2.1070102@ti.com>
 <20150929183818.GA15635@sirena.org.uk>
 <560ADF61.9030105@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560ADF61.9030105@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2015 at 01:58:41PM -0500, Andrew F. Davis wrote:
> On 09/29/2015 01:38 PM, Mark Brown wrote:

> >Oh, ick.  The binding has a compatible string in the individual
> >regulator bindings which is broken unless there really are lots of
> >variants being configured via DT (which is just not the case here).
> >It's not only more typing in the DT,

> I don't see this, the alternative is matching to this "regulator-compatible",
> why not just use the existing compatible.

No, you don't need to use regulator-compatible - that's deprecated.
Just use the node names.

> >it also means that we can't read
> >back the configuration of the device unless the user goes and creates a
> >DT which explicitly lists each regulator on the device which is
> >unhelpful.  We should be able to read back the configurations of all the
> >regulators by simply listing the device in DT.

> Could you expand this? I'm not sure I understand why we still cant do this
> using this new way.

I'm not sure what there is to add...  if the regulator is only
instantiated when it features in the device tree then obviously it must
be included in the device to be instantiated.

> Bindings should have compatible strings when they describe hardware like this,
> we can then do stuff like put the LDO and DCDC drivers in separate modules for
> instance, letting DT only load what we need. There are other benefits like
> not having to search our own DT binding for data, and we only get probed for
> devices in the DT.

Only getting probed for device is in DT is exactly the problem here, and
nothing prevents us having separate modules for things without
enumerating everything in DT.

> This also eliminates the need for MFD_CORE, we just call
> of_platform_populate on ourself and DT helpers do the rest. Why hard code
> mfd_cell's and do matching when DT does the same thing.

Putting everything in DT means more work for people integrating the
device and means that we have to have a full and complete understanding
of the device at the time we write the DT, including decions about how
we split the functionality of the device between subsystems.

> >The fact that this is different to the bindings for other regulator
> >drivers and requires more code ought to have been a big warning sign
> >here :(

> The binding is the same as the new tps65218 driver, different isn't always
> a warning sign. And what do you mean "requires more code"? This regulator
> driver is smaller than almost any other. DT takes care of everything for
> us relating to hardware instantiation like it should.

That's not a new driver, it's from more than a year ago (before or about
the same time the helpers got added IIRC).

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDBvLAAoJECTWi3JdVIfQHYgH/2I5Rx1woUYHckuTrw9QDPZj
Hpd+94g6RQh2RuJU1C1KUfKThAJaAqftsPSEWcw5xH2hch9xZF141L4udkMyfcVr
kBT/222kec1I4rFLiE6Na8xLoA1wRqrXCMIUDVsovoscursqVeNoWHPBj1Xx7aS1
+kbg3dYwlT4ooy6bbsCTMSfUg+1YVZko6LMUKdVINHTrb2SEDi5Omg8fKhHW8hCj
E8THUnv65j2jzGCf6w/E8tyFe5C+r5qt4EPLgL0jLnfr2d49NmnSiGEvB2zzhiPj
qydXp7D4+7iethYBhXeYfKjCKsD82/ZWzKGohaMJrFsGGFjFkGLjqFJqj6Y2eBI=
=Efvy
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
