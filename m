From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Wed, 14 Dec 2016 13:21:08 +0000
Message-ID: <20161214132108.3d36vuxpcrc2b7v2@sirena.org.uk>
References: <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com>
 <20160916163253.GA10189@sirena.org.uk>
 <CAD=FV=U2bi7GEA3Tq4vpzqF8J2hpgN-Vq4Jv=PnaGYhA3Z6vGg@mail.gmail.com>
 <20160924184133.seh6v6eayt7hwgue@sirena.org.uk>
 <CAD=FV=V_ncaKDzwEyCrZNqicoE+dGXN8CJ8dDuvxQ6XP8uxsDg@mail.gmail.com>
 <20161028181521.ywzmow6bgndfotq3@sirena.org.uk>
 <20161212211502.GA96889@google.com>
 <20161213171904.ohsxc3xhscdinctt@sirena.org.uk>
 <CAD=FV=WhUVeq5GZ5-ae4SxypHGB9jWqgvkO02S=G6Zz6cexRzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ilxnpwozouoj7lua"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WhUVeq5GZ5-ae4SxypHGB9jWqgvkO02S=G6Zz6cexRzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ilxnpwozouoj7lua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 13, 2016 at 12:00:32PM -0800, Doug Anderson wrote:
> On Tue, Dec 13, 2016 at 9:19 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > No, not unless the prior descriptions of the hardware have been wildly
> > inaccurate - my understanding had been that the DCDC was a normal DCDC
> > with an analogue input intended to be biased to set the output voltage
> > (presumably in terms of a full rail supply) and that the PWM had been
> > connected to this analogue input.  If the PWM is supplying the DCDC then
> > the hardware design just seems bizzare, I can't see how this would even
> > work.

> As you can see from the datasheet ("Adjusting the Output Voltage"
> section), it is intended that you stuff a resistor to make a voltage
> divider and that's how you select the output voltage.  In our case the

OK, that's what I thought was happening.  That's definitely something
that should *not* end up in ->supply, that should hold the parent supply
that the DCDC is regulating down to the target voltage.

--ilxnpwozouoj7lua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhRR0MACgkQJNaLcl1U
h9AVAAf/Umm5lv/6aFHU+qrSgt2HEatXnEesu2gXcbFCRSYPPaFaIYdNmP0wuaU3
hdtIW0Ay1QtmFT4u7+lfQkI3jo4Df68ZhNdhOiYJ5YNKY92kJZxGRemX1niaIEgx
8ojPMg0zbsjWT/6noiCj2iqHRQfMV3vGNgzU8qVphDW53d67TJZkk1fev4W2sJX/
bls1imiRaV7XNdDv2m7y1DwGS/giZ1usKQL5EMyw8LybcWTDDMrTJ8HBSChmSlzu
1uNYRI2Qfl3XHenM6MUjOnNi9qDf8pmzC/uPD27uMPawRHm8jpgQoSMSEjnatbRI
9iw937/zJ5Ber0OEgVzq7hDAFwd7mw==
=kA9n
-----END PGP SIGNATURE-----

--ilxnpwozouoj7lua--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
