From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v3 2/6] mfd: dt: ranges, #address-cells and #size-cells
 as optional properties
Date: Sat, 10 Dec 2016 09:25:15 +1030
Message-ID: <1481324115.3112.8.camel@aj.id.au>
References: <20161206025321.1792-1-andrew@aj.id.au>
         <20161206025321.1792-3-andrew@aj.id.au>
         <20161209224927.3indhfdjgyndtjid@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-kG9ChGDQ6zSSRYHY8brZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161209224927.3indhfdjgyndtjid@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-kG9ChGDQ6zSSRYHY8brZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-09 at 16:49 -0600, Rob Herring wrote:
> On Tue, Dec 06, 2016 at 01:53:17PM +1100, Andrew Jeffery wrote:
> > Whilst describing a device and not a bus, simple-mfd is modelled on
> > simple-bus where child nodes are iterated and registered as platform
> > devices. Some complex devices, e.g. the Aspeed LPC controller, can
> > benefit from address space mapping such that child nodes can use the
> > regs property to describe their resources within the multi-function
> > device.
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> > ---
> > =C2=A0Documentation/devicetree/bindings/mfd/mfd.txt | 10 ++++++++++
> > =C2=A01 file changed, 10 insertions(+)
>=20
> No objections to this, but this is all implied by having a reg property.

Thanks for clarifying. I wasn't sure so I wrote the patch with the
thought that we could drop it if it wasn't necessary. Regardless, I
think being explicit about the properties is nice.

>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks,

Andrew

>=20
> Rob
--=-kG9ChGDQ6zSSRYHY8brZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYSzZUAAoJEJ0dnzgO5LT5vhwP/29qxLVLbUokdfDH9CIHeqG3
+8c01f3cgoqQ7QPy7TdyA43LWeuUYbFT1DXcjoZvwT7YzOSBbmoS5UM0u4K256pf
kYGeQuj8ERE+39a3P6Or2lb5QKeOl6Gm4++YRzyPN9tiA62Bu4zZ5fnYLpxhXMZg
aphKQM9Rc4OEQCS+PD8bFZE8zF0V4DN9bkj8VuCFmPCRtr8F4pVpbR/ZSeUru49F
sRMQPnOGUCJBCQWdL3+7YMJLFPhSP0Fxf+DLd3cqdcLCGxE4f78yZHQKTI6emgu3
BXAhackAnxMMryWJcQ9uZl1zu2jAGDVMsxsQ5LIJ1AmmP1AGyFYBYkob9fQ1C5Om
7yvWIaJH30nLC+ALbkIIVtD4qBq3YnARw9b088uR9xINikdC8JCOmcRYOUkGeuk7
byJ7SDvinobbhHECUBGX3dxlz0v9p9HtJAU4JyBZiuA4NT499qlEN20dzKsGlfm2
dbe6O9QR4NnYfNTzWu+o9EWX0Mw9wozIQqnOyAVbZ75Iu7rx1bXN1dsAJXsJU1Pc
7s3+kQWjQPTv2S4qXs6lvNkls1dsVU/KnlLMqXBl3LeBzRHzr+Eqd9KrJfZ5rE97
BtCeqXzUOJ0pU9+2tExqQ6aRzDIwuA0Nll5pSWtInfyMFtnjMq9M+P5g5fSKQfiV
DnQQg1BmaQndZaor8SOH
=i0xq
-----END PGP SIGNATURE-----

--=-kG9ChGDQ6zSSRYHY8brZ--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
