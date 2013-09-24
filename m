From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] of: Add Panasonic Corporation vendor prefix
Date: Tue, 24 Sep 2013 20:49:06 +0200
Message-ID: <20130924184905.GD9911@mithrandir>
References: <1380012714-19073-1-git-send-email-treding@nvidia.com>
 <1380012714-19073-3-git-send-email-treding@nvidia.com>
 <20130924091729.GB31077@e106331-lin.cambridge.arm.com>
 <20130924093027.GC13971@ulmo>
 <20130924112105.GB32390@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130924112105.GB32390-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2013 at 12:21:05PM +0100, Mark Rutland wrote:
> On Tue, Sep 24, 2013 at 10:30:29AM +0100, Thierry Reding wrote:
> > On Tue, Sep 24, 2013 at 10:17:29AM +0100, Mark Rutland wrote:
> > > On Tue, Sep 24, 2013 at 09:51:54AM +0100, Thierry Reding wrote:
> > > > Panasonic is listed as PC on the stock exchange, so use that as the
> > > > vendor prefix.
> > >=20
> > > As I suspect this is going to lead to confusion, and there don't seem=
 to
> > > be any bindings using this yet, I'd prefer "panasonic" as the vendor
> > > prefix.
> >=20
> > There was some discussion a few months back where it was recommended to
> > use the stock symbols for vendor prefixes where one existed. According
> > to this[0], the symbol for Panasonic Corporation is "PC".
>=20
> From discussions I recall, either stock timers or full names are fine,
> as long as they didn't change over time there was no real preference. I
> do not recall a preference for stock ticker names, but perhaps I missed
> something?
>=20
> My only concern here is that "pc" may get abused elsewhere in bindings
> as a prefix, and may lead to general confusion due to other meanings for
> "pc". As "panasonic" is clear to any reader without looking in
> vendor-prefixes.txt, and there are no panasonic device bidnings using
> "pc" as a prefix, I think that "panasonic" is preferable as a vendor
> prefix.

Alright, "panasonic" it is.

Thierry

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQd6hAAoJEN0jrNd/PrOhQREP/RFe3xv+BB6HAlZTZVJp+lzj
Hc2H66MAMC6YQhCGkJfC6gzkUZ0vIsgGPpstHAQQwMHpaXyZihdD/UrPqRxpsbzb
NO256g7hAKzieF51so8cBZR7CDfZzd752A6QbFgT61bD0KBb4NoTWo+eOuDdkwQU
hKySv9Rw7c0hcbHF9r7bZP3oyQUVXwWIsD++MROQsikF1LxxJ4hNlwnyiLD1VBAU
jAFUBd/TfSJ2ihSPoDwG7EuqCeBJtBkSgGYGMzwXsw2oINp5DhoR1NIeH8ydD1xr
PxIyObURK8zxn2cpvkekkhQgW/7hrIpWd5hIEuUJv+Zb9f8PmMspmidc42yw2WY0
X4bA62h0mM7VuQ1pr0sicZFTzTUY+s99OfcGfdoXgEU30W5NnoqXvN987oGxltY+
x6Bq/JC6Q8lB506q9e5chvYC2+5A08JlRL3imew+vkSUdftKfn2tBjFUfPPJGW1j
vAYZTvXQkp3v6WZpZU2zxp0vFFie3R2WuE2l3d6P0ofEF1sNSEJFPO1hWDUrchGQ
Nv51rr1NId649wFgZGclHos3z5z4P4IyCyb3B/9XZJv8ZMu/h9fqaS/IbjDzQ3uv
sCesjUwjlCdXDDE/mTVZOsVaWs2tzQ9NCykV+/JfrWVWa29s/Yz53889CNrIj7Np
16z2IQxr+dQ2kmTD8qW9
=Te9E
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
