From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Fri, 28 Oct 2016 19:15:21 +0100
Message-ID: <20161028181521.ywzmow6bgndfotq3@sirena.org.uk>
References: <20160906190524.GB79728@google.com>
 <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com>
 <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com>
 <20160916163253.GA10189@sirena.org.uk>
 <CAD=FV=U2bi7GEA3Tq4vpzqF8J2hpgN-Vq4Jv=PnaGYhA3Z6vGg@mail.gmail.com>
 <20160924184133.seh6v6eayt7hwgue@sirena.org.uk>
 <CAD=FV=V_ncaKDzwEyCrZNqicoE+dGXN8CJ8dDuvxQ6XP8uxsDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m4nyrvn5qvfcqpno"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=V_ncaKDzwEyCrZNqicoE+dGXN8CJ8dDuvxQ6XP8uxsDg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Brian Norris <briannorris@chromium.org>, Javier Martinez Canillas <javier@dowhile0.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--m4nyrvn5qvfcqpno
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 26, 2016 at 10:41:59AM -0700, Doug Anderson wrote:

> I guess I think of the whole network of components as the PWM
> regulator and not the individual discreet BUCK.  I'm also not quite
> sure how you would model it as you're asking.  I suppose you could say
> that all of the resistors / capacitors / inductors end up producing a
> voltage and this voltage is an input to the BUCK.  ...then the BUCK

Yes, that's what's happening.

> I know for sure that our EEs have massively modified the behavior of
> the whole thing by just changing the resistors / capacitors /
> inductors, changing the undershoot, OVP issue, voltage ranges, default
> voltage, etc.  That's what leads me to believe it's not so separable.

What you're describing to me is a discrete DCDC that has an input
voltage that sets the output voltage which happens to be set with a PWM.
It's of course going to be the case that the passives are important to
the system performance but it seems we have two bits here - the PWM
regulator providing an input to the DCDC and the DCDC itself which is
sensitive to rate changes.

> You could possible include some sort of string indicating what the
> model of the BUCK is, but I'm not sure how you would use it at the
> moment.

Well, the main thing it's apparently doing is providing this over
voltage protection...   That's the bit that seems to warrant being
captured in this separate device.

> As I heard it described, the whole PWM regulator concept allows you to
> take relatively low cost BUCKs and make them easy to adjust up or down
> in software.  It may have its downsides, but if it is inexpensive and
> can be made to work by adding a few delays for downward transitions I
> have a feeling that people will want to use it.

If they were easy to adjust up or down in software there wouldn't be any
issue!  There doesn't seem to be anything PWM specific in the false
positive OVP issue, we could equally imagine someone shoving a regulator
like this on an otherwise unused LDO and experiencing the same problem.
The fact that a PWM is being used to generate the input voltage seems
like just a decision this particular system took to pair a cheap
controllable regualator with a not quite system appropriate high current
regulator, if this pattern does start to get wider use I'd expect to see
other systems using other regulators to set the input voltage.

--m4nyrvn5qvfcqpno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYE5W4AAoJECTWi3JdVIfQfawH/iZ3rLIbuh3JnJpt6/mBfarP
ofGAwhKeB9h8/smn5UowvkVEn0y6oVlpbcUijujyn9B2CVwfF+b+n7xkaCTvXgPt
wFN4unQD4GOhsj1zKnV4Kp39jwsBzjZ0/JZQ2u/8UL2FDrA3WUvuSJuthVU1oWvh
HAYyOAgqZClyoWsKpNrIRR5Ijj1teCSrwUMG06WAbfkWuDVWXYUkk3V7iX29cU3D
sZ879W55QGFLmXgRgXJuMb4Ndm99PL/0b95pdtpKd7T9LikoGNjPL+fFtltirsdF
KRLLtkRmzHxWrBhQk3sgRnoZnYBATmENALPFMDUC5VZ2eIjaVoU0F66fofaLAQI=
=6QuO
-----END PGP SIGNATURE-----

--m4nyrvn5qvfcqpno--
