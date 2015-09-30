From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/5] regulators: tps65912: Add regulator driver for
 the TPS65912 PMIC
Date: Wed, 30 Sep 2015 23:20:22 +0100
Message-ID: <20150930222022.GC15635@sirena.org.uk>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-5-git-send-email-afd@ti.com>
 <20150925180533.GN30445@sirena.org.uk>
 <5605AA1C.3090905@ti.com>
 <20150929151320.GT30445@sirena.org.uk>
 <560AD3B2.1070102@ti.com>
 <20150929183818.GA15635@sirena.org.uk>
 <560ADF61.9030105@ti.com>
 <20150930172844.GF15635@sirena.org.uk>
 <560C462A.1000707@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AdjLlRqdF7kYRNze"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560C462A.1000707@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--AdjLlRqdF7kYRNze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2015 at 03:29:30PM -0500, Andrew F. Davis wrote:
> On 09/30/2015 12:28 PM, Mark Brown wrote:

> >No, you don't need to use regulator-compatible - that's deprecated.
> >Just use the node names.

> Are we sure matching on node names is a good idea? Most are just arbitrary
> names meant to be human readable and reference-able, giving them function
> may lead to confusion. This seems to be why we have "compatible", for specific
> identification of node function. But I'm new so maybe I'm wrong?

Yes, I'm sure.  The regulators are just properties on the device, they
are not devices themselves.

> >I'm not sure what there is to add...  if the regulator is only
> >instantiated when it features in the device tree then obviously it must
> >be included in the device to be instantiated.

> This is already the case then, missing regulator nodes in old drivers will not
> get instantiated ether. And old drivers don't always store any more info about
> available regulators than mine does.

No, well implemented older drivers will still unconditionally register
everything.

> >Only getting probed for device is in DT is exactly the problem here, and
> >nothing prevents us having separate modules for things without
> >enumerating everything in DT.

> Sure, but then we have to do some fiddling with MFD_CORE to do that work,
> why not remove the dependency and let DT do that for DT only drivers?

For the reasons I've outlined repeatedly.

> >Putting everything in DT means more work for people integrating the
> >device and means that we have to have a full and complete understanding
> >of the device at the time we write the DT, including decions about how
> >we split the functionality of the device between subsystems.

> We are not adding anything extra to the DT node, we just use the "compatible"
> string to identify and match the node vs. "regulator-name", or the nodes name,
> or whatever else has been used. The node is then just filled with the standard
> optional properties just like every other driver's node.

No, you are missing the point.  The point is that only regulators
explicitly listed in the DT will be instantiated.

> Newer than a lot, I chose to base my driver off of that not just because
> it is a similar TI part, but because it was the cleanest, simplest looking
> one IMHO. The helpers would require more code (you need to know how many
> regulators you have and call the helpers in a loop).

You're talking about a trivial loop that takes perhaps a couple of lines
to open and close the for loop and another line to declare an iterator
variable.

Look, please stop arguing about this.  There appears to be nothing
special about this device that makes it different to other devices.

> I have another PMIC I'm about to push a driver for when this gets figured out
> that does the same thing, and it's more important I think to do it this way for
> this new part. Some of the new regulators are designed without a dedicated
> SOC or board to power in mind, so they will have a whole bunch for different
> regulator types on one chip and it will be up to the designer to pick which ones
> to turn on and use. With this DT approach you can just list the ones you want,
> and we may even be able to split different types into different modules, then
> we can use the same regulator driver in different spins of the PMIC with more
> or less of that type of regulator, we just add that same node under a different
> parent PMIC driver.

This sounds exactly the same as the majority of PMIC drivers, there is
nothing remarkable here.

> I could use the helper with this style and save a couple lines of code if we
> could make regulator_of_get_init_data to also match on "compatible", it
> currently only matches on "regulator-compatible" or the node name. I could make
> this addition and send the patch if you would like to see what I have in mind.

No, this would be broken - devices are instantiated via the driver
model.

--AdjLlRqdF7kYRNze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWDGAiAAoJECTWi3JdVIfQ71cH/jG8lvJbcSkrQL063bXufWgj
b3DRJDhO/uNLtoYyggD+Mjfc8qqLIcv9O1xh0OmKzWMux0vEI4grBNxv/6Cg6Te3
kdfkAcN14lGxc7pVV3QX+eox4GiiEYo4sbw5A22TDeqR24aG2fAJHtL/0MeL7Im2
FR6uJtSuGQG9ToT3mhZfOlzi9SHbZCQamjNB0ysJRvgXnK5GdwdyVKDOaY6wi9sX
kU8tvFefcA1ygpkidYAmjw5yAwvhPIQok3EZ/TA8yqnH+3/Lsd2F9oTd27r4zLRG
JDlvET04nmHTFKZCvjz7mfsFI/98VlaDVPN42H81xQ2LkHNOS4pi+aCFsBc8/OQ=
=azWT
-----END PGP SIGNATURE-----

--AdjLlRqdF7kYRNze--
