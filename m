From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Tue, 13 Dec 2016 17:19:04 +0000
Message-ID: <20161213171904.ohsxc3xhscdinctt@sirena.org.uk>
References: <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com>
 <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com>
 <20160916163253.GA10189@sirena.org.uk>
 <CAD=FV=U2bi7GEA3Tq4vpzqF8J2hpgN-Vq4Jv=PnaGYhA3Z6vGg@mail.gmail.com>
 <20160924184133.seh6v6eayt7hwgue@sirena.org.uk>
 <CAD=FV=V_ncaKDzwEyCrZNqicoE+dGXN8CJ8dDuvxQ6XP8uxsDg@mail.gmail.com>
 <20161028181521.ywzmow6bgndfotq3@sirena.org.uk>
 <20161212211502.GA96889@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z3pj42jqlu4bzjjr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161212211502.GA96889-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--z3pj42jqlu4bzjjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2016 at 01:15:02PM -0800, Matthias Kaehlcke wrote:
> El Fri, Oct 28, 2016 at 07:15:21PM +0100 Mark Brown ha dit:
> > On Mon, Sep 26, 2016 at 10:41:59AM -0700, Doug Anderson wrote:

> > What you're describing to me is a discrete DCDC that has an input
> > voltage that sets the output voltage which happens to be set with a PWM.

> I experimented a bit with this. Besides the question of how to model
> the passives I wonder how the two regulators would interact. The
> correct thing seems to be to specify the input regulator as a supply
> of the DCDC. dcdc->set_voltage breaks down a voltage transition into

No, not unless the prior descriptions of the hardware have been wildly
inaccurate - my understanding had been that the DCDC was a normal DCDC
with an analogue input intended to be biased to set the output voltage
(presumably in terms of a full rail supply) and that the PWM had been
connected to this analogue input.  If the PWM is supplying the DCDC then=20
the hardware design just seems bizzare, I can't see how this would even
work.

--z3pj42jqlu4bzjjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhQLYcACgkQJNaLcl1U
h9BVdQf+LKLF62o7RS6A9qQ9e4uSH1GEMraS+34ENWubu3bAh8by/bcFoF8k88g8
FhOgwAf0Ni/rP0Yt1Of8oe+UC5qj11gXdrOpBh8lrABmwwFG/V4sNmJ0s7LAIvJP
YfZN2KeiSQGa76x3yZwqJrkHuFGqcIvLQcBbHarDTXAqLQithHLPZaL9t+yUfpOJ
YR4piphf84b2flgChIm7wGnuRwG8f1M1jzvayWbZyCeKNoJbVSQCqzmXrUFaKsWF
0efNyAHfflfXDNkk0QBYoJ9e13A6RUg16L2VqJkQC0yr+bvqS2j1kIauMXJESz/6
k5oVMgrdkQsTfoQjOhH/IkmWT3V0pw==
=pyQC
-----END PGP SIGNATURE-----

--z3pj42jqlu4bzjjr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
