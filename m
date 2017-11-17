From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2] display: panel: Add Mitsubishi aa070mc01 display
 support (800x480)
Date: Fri, 17 Nov 2017 13:27:55 +0100
Message-ID: <20171117132755.6a910746@jawa>
References: <1508537169-402-1-git-send-email-lukma@denx.de>
        <20171117114505.GC1062@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2QiouEMF8PgQK2hkvhoPjZ."; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117114505.GC1062@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/2QiouEMF8PgQK2hkvhoPjZ.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

> On Sat, Oct 21, 2017 at 12:06:09AM +0200, Lukasz Majewski wrote:
> > This commit adds support for Mitsubishi aa070mc01 TFT panel working
> > with 8 bit ISP mode (pin 19 "mode" HIGH for 20 pin TFT connector).
> >=20
> > Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> > ---
> > Changes for v2:
> > - Place the code sorted alphabetically
> > - Add missing ./Documentation/devicetree/binding/display properties
> >   description
> > ---
> >  .../display/panel/mitsubishi,aa070mc01.txt         |  7 +++++
> >  drivers/gpu/drm/panel/panel-simple.c               | 35
> > ++++++++++++++++++++++ 2 files changed, 42 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.tx=
t =20
>=20
> Applied to drm-misc-next, thanks.
>=20
> Thierry

Thanks :-)

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org

--Sig_/2QiouEMF8PgQK2hkvhoPjZ.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAloO1csACgkQAR8vZIA0
zr3x0wf+N4Y2rEWxkoe+n4azFmrWjUbZKcOLDGzt2jID7N9dCBCYbXtCYrFqtir/
kYbjKE6mRr/Lp32DQwVAIFvaCeGCqM6EA9Go7YcOE+AwK6oRMLDGcCUzw2EVGI4i
SSOnmj3ofR6xq1rWVBW4FLdEOq0W2sXl2Uupbtu61A9LF43fLzz+ZWJrD9hccgga
O5t44IfZlK4+WhlURH8IFHnlXMXxhLvgXm8Zr5N4XBgBNWk72MF+6buREqE0bQLc
Pee1XuGze0+reNyST5drC9qQ5sQYZzILX0DOjtigq2MVbatrNcQdUvHGEEWW+Bpv
09nTjDT4/s10jGzzTDR2wH+2QktGrg==
=fSI7
-----END PGP SIGNATURE-----

--Sig_/2QiouEMF8PgQK2hkvhoPjZ.--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
