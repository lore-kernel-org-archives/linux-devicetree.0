From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] display: panel: Add Tianma tm070rvhg71 display
 support (800x480)
Date: Fri, 17 Nov 2017 12:41:26 +0100
Message-ID: <20171117114126.GB1062@ulmo>
References: <CAL_JsqJz67k_fTMkx5dHb5qFwXif9y+Cv=+PTq7OLH7woNoU=g@mail.gmail.com>
 <20171107153058.5554-1-lukma@denx.de>
 <20171110212423.jddj5kw32voms2oj@rob-hp-laptop>
 <20171117110247.5d7737bc@jawa>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171117110247.5d7737bc@jawa>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2017 at 11:02:47AM +0100, Lukasz Majewski wrote:
> Dear All,
>=20
> > On Tue, Nov 07, 2017 at 04:30:58PM +0100, Lukasz Majewski wrote:
> > > Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> > >=20
> > > ---
> > > Changes for v2:
> > > - Provide more
> > > detailed ./Documentation/devicetree/bindings/display/panel entry to
> > > describe this panel device. ---
> > >  .../bindings/display/panel/tianma,tm070rvhg71.txt  | 29
> > > ++++++++++++++++++++++
> > > drivers/gpu/drm/panel/panel-simple.c               | 27
> > > ++++++++++++++++++++ 2 files changed, 56 insertions(+) create mode
> > > 100644
> > > Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.tx=
t =20
> >=20
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> Is there a chance that this patch will find its way to v4.15-rc1 ?

No, that's very unlikely. We're in the middle of the merge window, no
new patches are accepted at that point.

If you want to make sure a patch goes into the next release, make sure
it is posted and reviewed at least a few days before -rc6 of the prior
release. -rc6 is a common cut-off point for subsystems (though not all)
in the kernel.

Thierry

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloOyuYACgkQ3SOs138+
s6HtIxAAtdqWqncXNxOWWZixPDw549omS39vVlSARtzEw3p7nuG6T8cWa2lzI/er
kbFSTuiWX2Md2gn/sp4cpZB+DlHLiia43TXe6A6GFUjLlVDgnxB6Exz6G2v5tFhp
snhXePLpURRmmxtgvdjCZJucWaLNke+sf10W/7Azz4ZHjxysA/cwNcAw39frqXWc
p6i+/A9UKU4qh4CfyHQBJ46vp5KtK8e5iKDAeN6z5bMXRm949DzoHtIXNi4wIHhv
25v+zrAXidwueCLhbpW4Yf8Nql1+Of2ZttTbhBULDjD7qfIOizkQL7A8APofcmMN
xxNAE0mGMtx9+4P/0FJ6iTRalJlF1dyaATn32MzbsUpC/14zeu3io4C31SrpcsoS
f1EQnKMjfUgMLZSrUr4fjs8JwSpm4s/wMoqCNe5WgI7z+BW/qO105+S2Opvh9tCK
NxoPV5bwwv/e2ao5H4eSVG4GE+qpcJLAnGlwIelkXPt1gsDodUNK6PsCE7pOTQed
gDNn7HKT/RIdftxAAVCTJ4eAQtvte3bf/N1v1CjDcQkWAZFPACqBcveeA6zqL5Zo
USVJke+okM1yiSvKVXpH2dNZzYpMfIykZ3sSIoV/jWALscQIZZ4J/t7EUjl2VOTD
NR9Gdn9xRuzgEaDcNvt2bXcxxzHVQbU4o0zPN+Jd64r+exrmaKM=
=krA9
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
