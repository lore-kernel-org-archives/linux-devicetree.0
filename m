From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] extcon-gpio: add devicetree support.
Date: Mon, 4 Nov 2013 10:39:32 -0800
Message-ID: <20131104183932.GQ2493@sirena.org.uk>
References: <20131101205005.659ba606@notabene.brown>
 <20131101171643.GA2643@kartoffel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uc2nn8srCdMFAHlk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131101171643.GA2643@kartoffel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Uc2nn8srCdMFAHlk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2013 at 10:16:44AM -0700, Mark Rutland wrote:
> On Fri, Nov 01, 2013 at 09:50:05AM +0000, NeilBrown wrote:

> > + - label: name for connector.  If not given, device name is used.

> Are extcon devices ever used standalone? If so, why?

They are sometimes used for things that don't have/need any other
software representation in the system like detection of attachment of
covers or as bundles for other connectors (like the Apple 30 pin cables,
they have the base connector with multiple possible things connected on
it).

> If not I see _no_ reason at all for the label property. If a userspace
> application needs to detect the presence of a particular external connector, it
> will need to know this in relation to the device the external connectors are
> attached to. In that case the application should find that device and traverse
> its set of extcon devices. The names for the external connections will be a
> property of the device, not the extcon devices themselves (along hte same lines
> as clocks), and need not be a property of the extcon device.

This is often done for user display purposes rather than for the
application and is sometimes done from the perspective of "what's
plugged into my system" (eg, helping someone cable up their system)
rather than from the point of view of using an individual device.

For example the HDA spec connector objects include information like the
connector label (ie, writing on the case) and colour as part of the
object for the connector and DMI does similar things for PCI slots.

--Uc2nn8srCdMFAHlk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSd+naAAoJELSic+t+oim9dJQP/i8dJjYJQCSQD1mqGhxWqy9U
3wNdJyFp1l2Y9P1GIMPhbc+NEhkf4oXl3INdq2eKy9puMIslJV3wyyHSGSWcjXkF
gxfn82FnjV5uwZOS1IqNEUqqt2NJ8l7gYV7yWy1V751UYO1eg58FBfkr6tTPw6tK
6CJr9RVln08WSVh4kybtucGrQhWRF2hhBdzHsQFfbJuufJv0IzpfdQ3X2qC0vzUE
ttINznW8lOhV60kylD4rwjOtWPBCsvHIJWsh3gWAWqpgcag3gMgEmc/Hb2U8cQ3b
sQ+JYLW5/KMvyDtG1DR2zo6X2CrRZ0t8GDLKNfbJmiNgFiABbO+jPyKYJs9TZcV1
eHxzfoaxO683xAl86LXlS+0OHa8iHdDi8gsmnXrJUA5uFwzGNXvJtmpdDgP+fPxr
a2DWtA543S871gUYcWnzGgXiYXxrOYZUebHifU3BIEhc0XgAtNgotBf3QPPHFZwp
8RP6JDoZX6lBFBuxjJingHWND4faAhc6BfuOoFrcsKevYG5UhQTjYPdjBw5lR1eD
1MrvJRb1jvWOi6yJdXOIBsDwBAusVRJh3Q9NO1Vi3mv90vca2Jj+5ArHSDwoymP2
9So0N03S5JzPxWNFas5y4Gk3JfjSeTOV0Izemnew7Nya+07ltmhD66OY+NA9I2Q4
w+I36qbXe8fvgbDYpldR
=jiya
-----END PGP SIGNATURE-----

--Uc2nn8srCdMFAHlk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
