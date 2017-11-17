From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] display: panel: Add Tianma tm070rvhg71 display
 support (800x480)
Date: Fri, 17 Nov 2017 13:27:13 +0100
Message-ID: <20171117122713.GA22989@ulmo>
References: <CAL_JsqJz67k_fTMkx5dHb5qFwXif9y+Cv=+PTq7OLH7woNoU=g@mail.gmail.com>
 <20171107153058.5554-1-lukma@denx.de>
 <20171110212423.jddj5kw32voms2oj@rob-hp-laptop>
 <20171117110247.5d7737bc@jawa> <20171117114126.GB1062@ulmo>
 <20171117131712.0f2a0a4f@jawa>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1201923252=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171117131712.0f2a0a4f@jawa>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1201923252==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2017 at 01:17:12PM +0100, Lukasz Majewski wrote:
> Hi Thierry,
>=20
> > On Fri, Nov 17, 2017 at 11:02:47AM +0100, Lukasz Majewski wrote:
> > > Dear All,
> > >  =20
> > > > On Tue, Nov 07, 2017 at 04:30:58PM +0100, Lukasz Majewski wrote: =
=20
> > > > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > > >=20
> > > > > ---
> > > > > Changes for v2:
> > > > > - Provide more
> > > > > detailed ./Documentation/devicetree/bindings/display/panel
> > > > > entry to describe this panel device. ---
> > > > >  .../bindings/display/panel/tianma,tm070rvhg71.txt  | 29
> > > > > ++++++++++++++++++++++
> > > > > drivers/gpu/drm/panel/panel-simple.c               | 27
> > > > > ++++++++++++++++++++ 2 files changed, 56 insertions(+) create
> > > > > mode 100644
> > > > > Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg7=
1.txt   =20
> > > >=20
> > > > Acked-by: Rob Herring <robh@kernel.org> =20
> > >=20
> > > Is there a chance that this patch will find its way to v4.15-rc1 ? =
=20
> >=20
> > No, that's very unlikely. We're in the middle of the merge window, no
> > new patches are accepted at that point.
>=20
> Ok. I see. I should have sent the ping earlier.

Looking at the timeline of this patch even that wouldn't have been
enough. You sent the original patch on October 21, which is one day
after the final drm-misc feature pull request was tagged. So this
wouldn't have made it into v4.15-rc1 no matter how early you would
have pinged. =3D)

Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloO1Z4ACgkQ3SOs138+
s6GiMw/+LHMIIVTJ+BfsTZMSbRO/PC1Z/0KsZBxOrHliLI/AGOU/hTjEQYWXxoIk
2vjAz4yTnHMHn3jqVOHO/w0BnXoDdkggz/bbGT46qCpev4hiV9TWuzaBUSM9gWuR
DjQOXL/2i6tDHsmB0FMWPNcrY/YFTCEZ1vloXJbdqOwcG/GvpyKFk1z5obEzOhim
1i12v6MSJ1uw7BUiaKblKvVe9r7+2uHag4T6+EFK2rQxghLPA3AzgNb0CMDXifYS
0lCDk7PN6IOjhT1wXoPs+qBnOwoZbB5XJjKfRh5yQgbesSVOPrLEMVl9Qk3DeNgB
/WUIrQP9flGmm/bBpOHk2iZLmYWv/XrB00Fg9LA4sqd0lFxQUjIKlvJL47o9Fh3q
hNMLT6U51/2usUK5venbkTwIM2v1dYnPjcnjDN5pvRbT21xRAFKSMjqZjZFnqmib
/DVoyxx6mKIZTuDXjEJ1TMukEhtfF+s+U4lZ2li0zE/ve9SRjgVLXSFQz+nQwz0m
xe1RNau2w9MCa6mep/cim7bQAK6g4w2m3g8KqxxaNHLQhDqNREyydPWT2xoHES3q
68Cv1iCAE0HRKtM+rYTS6BMqenVDF7PQbm75aBBgVNhOYXliaT2MG8vm4z2D7coP
5eclRbmAc/BO3iMPYyCa105ljwUHtnWB2y7A6D9DmfNlH/RfC78=
=w1Sg
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

--===============1201923252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1201923252==--
