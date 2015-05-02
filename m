From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arch: arm: Show the serial number from
 devicetree in cpuinfo
Date: Sat, 02 May 2015 17:46:22 +0200
Message-ID: <1430581582.5339.0.camel@collins>
References: <1429351135-11842-1-git-send-email-contact@paulk.fr>
	 <1429351135-11842-2-git-send-email-contact@paulk.fr>
	 <CAL_JsqKkw7n5p1ZH345BeKkyU=GKDrhaLef__0ET7t90Cm0Eog@mail.gmail.com>
	 <1430145747.3081.5.camel@collins>
	 <20150428160910.GE12732@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-aVmLc9kywaqi7Ezdt/vH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150428160910.GE12732-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-aVmLc9kywaqi7Ezdt/vH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 avril 2015 =C3=A0 17:09 +0100, Russell King - ARM Linux a =C3=
=A9crit :
> On Mon, Apr 27, 2015 at 04:42:27PM +0200, Paul Kocialkowski wrote:
> > Well, of_property_read_string is only defined when CONFIG_OF is set
> > (base.c is always built in drivers/of but the directory is only include=
d
> > when CONFIG_OF is set).
> >=20
> > Of course, on ARM, we now expect that it is the case, but it seems like
> > good practice to check for it, since it could theoretically be disabled=
.
>=20
> That is _not_ "is the case" - there are a number of non-OF platforms...
> including some which will probably never be converted.

Right, so I think v4 should be fine too, given the empty functions in
case CONFIG_OF is not set.

--=-aVmLc9kywaqi7Ezdt/vH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVRPFOAAoJEIT9weqP7pUM/F0P/2DQdmQDrqSf9Gh7ERrNeTRk
N3mJB32uZ8JWRJxb8/huDg5r6r3cGLnZ2ycq5ImFdi5LUN23HRpVqD1wZ50TSoBD
xnhtJSOrOxtWnOTsE2yimSS2new745fc6eMQKg5oD9Is8KX0JxIXReTZbVcpEIBW
nsDlSueoldAzUtov/ycnL3RCxlWb6H7KcWNs/Cob054607KVwEPco3UwnU0MDZI+
BeSzLYpmBsmNdP907ZiIp1nW9PeWC6P06HcaOHbqOI54FDm2nWO6bViDDRCmjqrC
7QBWuQuH4Hy1T2t0cbHu+laPvsfIF5/rGc14gwnwI0VIsRWWStB1ZCbH5kzoZob9
7asN4/DFg/7KfEDDzfK22YaBIs0QlzbWDHpD0jl0hthBYDJdY+7P5pNGAGLwaBok
q6jnD6tzUgkh+jPhmLQCoSKd8K5CF9ZmXVJRi3KLHfRdRZJG0ASEpHVG0IisDxPZ
Xp9khDL5oWFdZg9chc/VA80RuoaRVkfXuXhyPq0tTc0KYlE1uN8PxjE6hqX0mH+z
To6fqE+HRy5VlkuaxzjOmRxydQ6hwSdiUPLcYVD7/IHiS+tvcK9qToCDojUQccAY
KIkjIkdGZbTfRVx0nt18Jq6U9VoRiFoo4bgVpiVMBpLdb28dvKBpyvtiKMxIwyAG
xK0qN9iJZjYLrTKLFPq0
=1FjM
-----END PGP SIGNATURE-----

--=-aVmLc9kywaqi7Ezdt/vH--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
