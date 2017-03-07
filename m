From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Extending /memreserve/ to allow defining descriptions
Date: Tue, 7 Mar 2017 13:21:04 +1100
Message-ID: <20170307022104.GA19967@umbus.fritz.box>
References: <9c1cb5e8-2afd-e266-72b9-20ca6622956e@gmail.com>
 <20170306035856.GF12030@umbus.fritz.box>
 <87r32a6l43.fsf@linux.vnet.ibm.com>
 <fba988e1-40a0-4a7e-e680-45c7360c5aa3@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fba988e1-40a0-4a7e-e680-45c7360c5aa3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2017 at 04:12:59PM -0800, Florian Fainelli wrote:
> On 03/06/2017 03:28 PM, Stewart Smith wrote:
> > David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:
> >> What you could do is to add properties within the device tree further
> >> annotating the reservations, with the extra structure essentially just
> >> acting as an easy-to-parse summary of that.  In fact I know that POWER
> >> systems firmware use 'reserved-ranges' and 'reserved-names' properties
> >> for this.  I don't know if anyone else has adopted that though.
> >=20
> > We've also been toying with the idea of creating a binding for "named
> > reserved memory range that should probably show up in debugfs"
> >=20
> > I'd also be happy with a standard binding to do it.
>=20
> Seems like
> Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> may be a good place to add descriptive properties about what these
> reserved regions are? The code parsing this also seems to be easily
> extensible with adding custom "name" properties.
>=20
> Using "reserved-names" sounds like a good thing, I will be looking into
> submitting a binding update in the next few days, but if you beat me to
> it, happy to review it.
>=20
> Tangential: is it me, or it's possible for /memreserve/'s address and
> size cells to disagree with #address-cells and #size-cells defined by
> the top-level node?

/memreserve/ has no address or size cells; they're simply 64-bit
integers.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYvhkOAAoJEGw4ysog2bOS+YsQALPe1t09u5UkjEl29lWCvems
uu50ICa+2/uRUzDYN94xXSLEAJzb/2cAMyQRF0pGFI1IJzvtxkWi2VzxhHK+7ZNI
REhKDnJiC66E0q8jeNkZhtWxhYrsACAoT6vfkJTyy5xIFcnqTyt1um7NyU2CC3Fe
G0N7DxpNJDnZLj1cT/jDBVU8E1roM2g5WR3XzxHcVqA5kNeaKknUs+dNVuKYNOGG
NskgGLdFpiIQJJJzTJPCZhEj58MVxPOVJ0zfADo+0vDGH2E6AIHvx1f5x+oXaCbl
OrlkQBRU/SkQ3hKinkO+QpuhtfFShDKMvbhu7AtAZDoszlSETc/X6qHjMLu7lFGY
tq7EdJmq6xitl2CYrWyHT8XQD9MeHbHIdnnABBkNZmylpLxdhAHhXrq82fX2zv/D
90GgJk2T6BSRd500ahi5y0bw8OzHD6rh9fJZ0LWHVhww/EC86EU1HLXXFDK0OaGa
4wrvfYT7MQ1M9OOHbOG5KLWMrO8TrPnXsx75t7NVmQdvY7RC9bNvxHS0UxIxs8XM
qw4UEDg235kEkNkAXAaDImoFVPUDllxrFL2Vu3FjovsIn90Y/FKglTwVwW/cdw7E
Maz/tuaRPwIhD9KCYFbwqRprImm4nindkbzvO/dc5RTZVAQqE/EIZkLNHxAtvmUW
wOLZX3YtA2UvQkAdvwD1
=JKF1
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
