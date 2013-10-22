From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Tue, 22 Oct 2013 22:35:47 +0200
Message-ID: <20131022203546.GC8037@mithrandir>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131021085420.GA21518@ulmo.nvidia.com>
 <52658C49.80400@wwwdotorg.org>
 <5265AFED.1040503@roeck-us.net>
 <52665314.2040904@imgtec.com>
 <232aa6e4-19fe-4460-8101-8bf1d639ff3c@email.android.com>
 <20131022164922.GA29852@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131022164922.GA29852-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2013 at 09:49:22AM -0700, Guenter Roeck wrote:
> On Tue, Oct 22, 2013 at 05:31:25PM +0100, Jonathan Cameron wrote:
> >=20
> >=20
> > James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> > >On 21/10/13 23:51, Guenter Roeck wrote:
> > >> In my opinion, not being able to describe behavior (or what people
> > >refer
> > >> to as "describe how the hardware is used") is a severe limitation of
> > >> devicetree usage in Linux. That is not a devicetree limitation per
> > >se,
> > >> though, it is simply a matter of choice (or, in some cases, the
> > >ability
> > >> of those arguing for new bindings to sell those bindings as "hardware
> > >> description").
> > >
> > >I agree this is a real problem, and I think it hinders upstream
> > >submission, since platform data was permitted to describe behaviour as
> > >well as describe the hardware, and platform data is being replaced with
> > >DT which is only permitted to describe the hardware. How then should we
> > >specify the behaviour to the kernel?
> > >
> > >I've already mentioned specific examples of this on the "Clock DT
> > >bindings" thread, and would be very interested if anybody has thoughts
> > >about it:
> > >http://lkml.kernel.org/r/520E1DF5.4030409-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
> >=20
> > We have run into a kind of similar issue with IIO. We are interested in=
 describing sensors
> >  adcs,DACs etc and providing both userspace access and in kernel access=
 to other drivers.
> >=20
> >  Lots of sensors are used for different
> >  purposes on different devices. Simple example is free fall detection v=
s vibration
> >  analysis vs input for an accelerometer. User space expects data from d=
ifferent
> >  subsystems. We handle that via 'bridge' drivers.  So need a way to spe=
cify which
> >  bridge driver cares about which channels.
> > It is not always 'wiring' but it usually is dictated by the product imp=
lementation.=20
> > Some aspects of this have been discussed but they only cover the is an =
ADC wired to an
> >  accelerometer case rather than the using the same physical hardware fo=
r on or more
> >  unrelated purpose.
> > Perhaps this case could be pushed into user space but then we just have=
 another board
> >  specific bit of code...
> >=20
> > Just to add that for IIO device tree mostly works pretty well.
>=20
> Yes, it does, only the iio-hwmon bridge is one of those cases where we ar=
e now
> told that "this describes use, not the hardware itself". But how is one s=
upposed
> to describe that an ADC on a board is used as voltage sensor ? Does that =
mean one
> would have to have a dedicated voltage sensor (or current sensor, for that
> matter) to ensure that the use case is clear ?

I'm not sure I understand correctly, but it seems to me like this isn't
actually about behaviour at all. Having something like:

	adc: adc {
		...
	};

	sensor {
		adc =3D <&adc>;
	};

sounds like an appropriate description of the hardware. Well, I guess it
doesn't quite accurately describe the hardware if one considers the ADC
to actually be the sensor, in which case, yeah, this actually describes
what the ADC is used for.

But on the other hand we do the same with other "resources". GPIOs for
example are rather useless if you don't associate them with specific
functionality. And we actually do that quite often. They are used in
properties such as:

	foo {
		...
		enable-gpios =3D <&gpio 42 0>;
		...
	};

I don't see how that is different to the ADC/sensor example above.
Perhaps there's no real physical device that is the sensor, but if we
can't even represent simple yet essential things like that in DT, then
we definitely need something better.

We do pretty much the same thing with regulators. We can have fixed
regulators that control a GPIO, yet there's no physical device that one
could associate with such regulators either.

> Another example is my recent attempt to add dt support to gpio based conn=
ectors.
> Even though a connector is as much hardware as it can get (or at least one
> should think so), that was rejected because it isn't generic enough and,
> after all, it describes the _use_ of gpio pins which apparently is already
> borderline. So now I have my own out of tree driver (where I can add as m=
any
> bindings and as much functionality as I want and see fit, so I am not too
> unhappy about that).

That's odd. This sounds exactly like a variant of the above. Would you
mind posting the binding (or a usage example here)? I'd be interested to
understand why it would be inappropriate.

> That matches Thierry's earlier comments - one is now _forced_ to maintain
> out-of-tree code simply because DT bindings are either unacceptable, not =
generic
> enough, or not stable enough to be accepted into the upstream kernel.
>=20
> So far I have been able to work around that, but I seriously consider dro=
pping
> DT use entirely and moving back to platform data ...

I've actually been toying with that idea myself. Unfortunately it's very
difficult to do once you run on a platform that's completely moved to DT
because you actually have to manually search the DT in order to find any
references that you need.

> not the very least because DT isn't supported on x86 and I have to deal w=
ith
> that situation as well (and, no, ACPI doesn't solve my problems there eit=
her).

Actually DT is supported very well on x86. There's at least one platform
in mainline that uses it (arch/x86/platform/ce4100/falconfalls.dts) and
I've ported a platform that I worked on in the past to use DT on x86 as
well.

Thierry

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZuGiAAoJEN0jrNd/PrOh9IwP/A08GjlyfIDCK99B6ykey0db
FKTNlF7cT7JcMNIJ5+9iNAtFzQySx9xeorLNDRHuCO2YBOaf6JB1eYq69nDd7mK7
SeKG1/Y+rDng+E9ohxjNSNDBO6CNWSllh9Z6ftjXqiHw3g//X2NxwQh9J2C0DJ5H
JqjTl5mjlqdFbR1g1O5XY0jDQiO+hxDOIeJKMH8mPaOFwPVzLXX7qshsgaoqIYpi
YpLT6zLcay8RBm+pzhxwEzsN0wbYG988R0R+QapUYdRnvKxw6ibwR/5RtRypLR8J
SSAcj9vJhpsjuPj5+wRzsaJ+A5xgU3r48SpezIPDNTTtVP7jcCL595U9UArOtETo
s8+hce+56pmTTPOI4+CqDZYFXne59/Xa1CGXGCJhIaUMDQldK4VZRS4YgbePzWz/
jPFi53y4xOGiPuFkLnOJI+V1Z/eQuZHeAryodBEDFznNsiNu4yl6Dl4j0W3Mo7Yx
NxXLsipzgWoJHb19XGFgyAQq1/2o3d59rANdSxv1ubu7Rx2YsBbIKUJCgXfJnShQ
2nQc02d6Iq/MU7brdV3zOPLUYZmzPls52qytQJlXQZ2i+KZYd8iI/PafSB5r1Cnn
F00ZnGAsa8av4SR6bDLjYcWd6hLX85ASjOyN7pxtOdF3LEJPBE1pnlknKWFmsHRN
bN/6LNywr+RzcX2gQZ5w
=wO3Y
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
