From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Fri, 16 Sep 2016 17:32:53 +0100
Message-ID: <20160916163253.GA10189@sirena.org.uk>
References: <20160906190524.GB79728@google.com>
 <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com>
 <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160915180223.GE62872-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 15, 2016 at 11:02:23AM -0700, Matthias Kaehlcke wrote:
> El Thu, Sep 15, 2016 at 03:39:45PM +0100 Mark Brown ha dit:

> > The obvious question here is how the OVP hardware knows about the new
> > voltage and why we're bodging this in the regulator core rather than in
> > the OVP hardware.

> The OVP hardware is part of the regulator and the regulator is not
> notified directly about voltage changes. The regulator transforms the
> PWM input into DC output and does the OVP internally with the limits
> described above.

So the PWM is just configuring this external regulator chip (which
doesn't seem to be described in DT...) and that's just incredibly bad at
coping with voltage changes?  It does sound rather like we ought to be
representing this chip directly in case it needs other workarounds.

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX3B60AAoJECTWi3JdVIfQxBMH/R6+6Z1rl+sTvBDbGQzSbSwv
WAD55Ra3AJx/zmjLbbFlCrNKAUhEQUJfLE6SnsQ9y5bIet8vCH7cBQyviH/L0mtt
rVEfQZucJS3j8IDPsmaW2qLwLGGre+/J8bNRleI1GIfz2W+2/1rOKDtMP1uY44lA
l0Pc0JewmKJ5H2kucOyURl87HruXXW9foPaMTdr6dYgBvmmpwClFjOaP+FZUF0fy
zVXEU1li9jBzsxX7Sd1KUIFsL8iZVd4062F4QV3gE2oloNVAIyT2znpj4vDrjoBE
fm6mI3C7bK8YddHlryV0BpEaWOpfA5cpcWtEjkN3oe6u9OntrzcryaZtbAnkbLc=
=PAfU
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
