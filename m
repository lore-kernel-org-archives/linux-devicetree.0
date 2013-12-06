From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv7][ 2/2] video: backlight: gpio-backlight: Add DT support.
Date: Fri, 6 Dec 2013 15:12:37 +0100
Message-ID: <20131206141236.GA32313@ulmo.nvidia.com>
References: <1386266109-16071-1-git-send-email-denis@eukrea.com>
 <1386266109-16071-2-git-send-email-denis@eukrea.com>
 <20131206130014.GB30625@ulmo.nvidia.com>
 <1386335318.12471946@f258.i.mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386335318.12471946-q5D3CJL46AJsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Eric =?utf-8?Q?B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 05:08:38PM +0400, Alexander Shiyan wrote:
> > On Thu, Dec 05, 2013 at 06:55:09PM +0100, Denis Carikli wrote:
> > [...]
> > > +Optional properties:
> > > +  - default-state: The initial state of the backlight.
> > > +    Valid values are "on", "off", and "keep".
> > > +    The "keep" setting will keep the backlight at whatever its curre=
nt
> > > +    state is, without producing a glitch. The default is keep if this
> > > +    property is not present.
> >=20
> > I'm not sure if "on", "off" and "keep" are a good choice for this
> > binding. Having strings for these tristate values seems suboptimal.
> > Other bindings have chosen a representation that, transposed to this
> > use-case, would read something like this:
> >=20
> > 	- default-state: The initial state of the backlight. Valid
> > 	  values:
> > 	  - 0: off
> > 	  - 1: on
> >=20
> > 	If the "default-state" property is not present, the default
> > 	will be to keep the current backlight state.
> >=20
> > Which is in fact the exact behaviour that your binding describes, but
> > it's much more intuitive in my opinion.
>=20
> Why we cannot use GPIO bindings for active level here?
> What a reason for "keep" state? Can this be an additional property?

Default state and active level are two different things.

Thierry

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSodtUAAoJEN0jrNd/PrOhtFwP/0Yg3SsT7Qs7ZwTVQEV9+uGY
diJyd5WCP7cGsNgTeFiMcBq3xEkc9Gb6RhYe9oFlXAE9I1upSuzJL4geopZq5lxD
2IVrxtKQ24N9untYrfMFrecvAim9IDVeZ33zWh3Sx8NPizPQ9EB2OJCBAJAeqQ8T
l2PZd2vOqd+0LYr02X6WPxjr5yZaH70gtS1m5jKNqpCFD/h3PO2KQUpQodSg28P8
ldaztJBxpRm0RqsVgkadvj3BO45fhxJpSVQgGIWXXJMBFgTkOGVvmLmG5eifEP9U
iguQ38y7W82rw2BlPTdRyEEtdZC9M+RPhan6YpN5plf183JKlxPUTGz+ug0bLIW3
YZ4G2u8vHgntkI+Zst6IQ9MrrZH6fKnr+tNvlZgJ2veIfHJ3HtdAuabx1dvRa+Qp
xTPqYPFKa9yGwALESBOQPini/Sqz+zjGYUOVReY7LrJxD6iAvYX+oZxS3OnfsFt0
PTyFzWlHjhF5T2TMHuiujMGpLhs0B44S7KOb+i8YkBMxArOEnJxDS+SYWg1JK7BT
ja68Jt2KZ7p0guGJ+RMmatf1O92yk9CiF80PTwyETp40h6zJ7qYRam8FB3mmogvN
huYwTg/qU7h0HHo0n5z1VrQrFHNrFtOgtu5RNWAYP45ZuGNX6f1mcvBQ7DtchZWb
4xpWDUR4LUOr4RnPfxdP
=Dc9N
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
