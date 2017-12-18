From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: sunxi: Add alternative pins for spi0
Date: Mon, 18 Dec 2017 10:28:14 +0100
Message-ID: <20171218092814.n5ptd5mhvo4nkjgq@flea.lan>
References: <1513151074-6888-1-git-send-email-stefan@olimex.com>
 <20171213154035.qc655iahjoeflftq@flea.lan>
 <5f518e4b-e624-17c2-7e72-24ba930a1c15@gmail.com>
 <20171215150823.jplgknururmkvp2t@flea.lan>
 <ca648552-cefb-e19d-72cf-8b56e97b013d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mjcs2jtp6xcpyfff"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ca648552-cefb-e19d-72cf-8b56e97b013d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--mjcs2jtp6xcpyfff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2017 at 08:24:21AM +0200, Stefan Mavrodiev wrote:
> On 12/15/2017 05:08 PM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Dec 14, 2017 at 08:24:54AM +0200, Stefan Mavrodiev wrote:
> > > On 12/13/2017 05:40 PM, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Wed, Dec 13, 2017 at 09:44:34AM +0200, Stefan Mavrodiev wrote:
> > > > > Allwinner A10/A13/A20 SoCs have pinmux for spi0
> > > > > on port C. The patch adds these pins in the respective
> > > > > dts includes.
> > > > >=20
> > > > > Signed-off-by: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
> > > > Do you have any boards that are using these?
> > > >=20
> > > > We won't merge that patch if there's no users for it.
> > > A20-OLinuXino-Lime/Lime2 and A10-OLinuXino-Lime with spi flash.
> > > For A13 we still doesn't have that option.
> > If this bus is exposed on the headers, you can add those to the DT but
> > leave them disabled if you want. Buf if there's no users of those
> > nodes, our policy is not to merge them.
>
> So basically I should resend the patch, enabling the those pins only for
> sun4i and sun7i platform?

I'm not quite sure what you mean, but you should do something like
77df9d66b0b1ad01c685fd6341ce501493899658

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mjcs2jtp6xcpyfff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlo3iisACgkQ0rTAlCFN
r3Rj+g/7BUR1GesICXIZ7GSDZGsagxHJGPfU+SeDs9b5MfANsc9Pbn6HNUqa4te7
5f8jYrMUjQJ5tsNagpOAXuNMW2b2Mgbdj+cnuvuPSYsudK2+1TeOzPbxbjkIbP8I
sxgTixHy/C423UqX7AsSysjzXeP9LV41YxgBKJVeUZqWRsfiHJt9dnUVv595zK/r
zBUg6xLNVOpHhhLOmP91c9NchCqL50A8KKmQSx6NPux+f2e/BSs+KG1MOJxWsofE
goHVbRVw6e//Zm+28MwP4iZI/TCH1t6LldTUHmZAHakgUyvAfYmMKTZgwfwlieSk
If4ZGqS9UZ3fJ2/GUV20MLt3hEFhnzBQpXk0cE3mreFQ0ae76WIbmMibLcWqIzQk
ETC20P1bBVaqQA7sJt7XNiobkxpLl1z+sjas3K40ZHhUXEeodrWLoPjpnFq4Wdvb
a3XbzK9RS9RGl9jvZiHfSOeVJbAVnM/A9DZSt5RgwPn+iJTlE+emGyqg6YPfgrpu
v+djUfNm4dyIpCa3CTtHVElqg3QsvT1lJxoSebERzjxJOgNTbU3L+oVNxJUSAuQa
b5UqOzjGYAFaTPBXeDkmzxjWyqMzhhgprGVhUnbrO+sfDWt+KqXxtSUosmuEFocC
OJOGpDYRC7YvEQp5F7MUftG+xk1aafT7xsWLlA+FXW1yRnEed/4=
=z8p5
-----END PGP SIGNATURE-----

--mjcs2jtp6xcpyfff--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
