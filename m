From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Mon, 18 Nov 2013 15:04:55 +0000
Message-ID: <20131118150455.GD24408@sirena.org.uk>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <CAOesGMhkCn2zeJj_ZZAZu_wJya-4evWEqNHpVJEpjxzWHVWY3A@mail.gmail.com>
 <alpine.DEB.2.02.1311171705130.4714@kaball.uk.xensource.com>
 <3371903.8j54vrCjEN@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3371903.8j54vrCjEN@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 17, 2013 at 07:10:51PM +0100, Arnd Bergmann wrote:
> On Sunday 17 November 2013 17:18:03 Stefano Stabellini wrote:

> > Simply using DT would help avoiding the awkward situation where a driver
> > of a device only works with one of the two description formats and not
> > the other.

> Yes, but remember that Intel still have the problem on their embedded
> systems, and will want to solve them.

Has it been confirmed that Intel are going with ACPI for their embedded
devices rather than SFI?  That would be nice given how awful SFI is and
I have heard that before but I'm not sure I've seen anything official.

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSiiyUAAoJELSic+t+oim9+l4P/jBXBMUaqBX/O1Y8iAox8hsg
d5tetSOVmh0XllC0C3ttgSJbRi07Bczf5w7v7rMOItdtAVSC2GOo7hZzQY2dF9dK
zYHnK6xacsEecymicRSo4Y/XKeeFMJEAIGkCtOZdJSG+t7Wrteky0uF3V+woae+S
9//j1ZbQROzMKRIh7cII/Yoz/Ym/1Ju6ObljWY9tRZVCNwmsqwsQ8y996lQsaDAN
8ktTZW601d3MWo4kBGwoHFIV6QbFQl7p0PX4uzReceAKqcS2K7SMDs8jrBiJuCq7
1c4xV4I6+ObwEFXSY/wuRDgK9I6m6KCi02UeJqsct0H2hqxx7cpv5yxgGHxR1L6I
dx/IfsvpmqJios929ihhsB2OcnReJVNaba4VCtJlleI68Oa0Tni6+kBlygEAwWA7
Y1SaXahqQmojcCnvjjFr3yl4xLwRtP2UaVtinuyogwTwPJX2iR6rGCbrFMI5r84R
aTeOxvNH+ohoC1Dpuk46u4z9lubzwotVbL/NZk4/ib+qjSntd2pPMfIeykvOnXYr
7nITEhbs+yTYUMO/ic6+lDgRfOLTtWMCpnqNT/k8LwFVHXNUi0NevmBAtTI9EKDX
eL7Us/HvzSIJUYGBM0L98FAUNgkBeYK5WO+cqSoz8Or/ouqQw0NEtgnZIAtUr7/I
JC2wofNOw8iuAyM0iKo9
=GToh
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
