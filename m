From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2] display: panel: Add Tianma tm070rvhg71 display
 support (800x480)
Date: Fri, 17 Nov 2017 13:29:22 +0100
Message-ID: <20171117132922.3e4aee30@jawa>
References: <CAL_JsqJz67k_fTMkx5dHb5qFwXif9y+Cv=+PTq7OLH7woNoU=g@mail.gmail.com>
        <20171107153058.5554-1-lukma@denx.de>
        <20171110212423.jddj5kw32voms2oj@rob-hp-laptop>
        <20171117110247.5d7737bc@jawa>
        <20171117114126.GB1062@ulmo>
        <20171117131712.0f2a0a4f@jawa>
        <20171117122713.GA22989@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/exjGyF.w2kIFtmWH_X2.qrz"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117122713.GA22989@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/exjGyF.w2kIFtmWH_X2.qrz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Nov 2017 13:27:13 +0100
Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Fri, Nov 17, 2017 at 01:17:12PM +0100, Lukasz Majewski wrote:
> > Hi Thierry,
> >  =20
> > > On Fri, Nov 17, 2017 at 11:02:47AM +0100, Lukasz Majewski wrote: =20
> > > > Dear All,
> > > >    =20
> > > > > On Tue, Nov 07, 2017 at 04:30:58PM +0100, Lukasz Majewski
> > > > > wrote:   =20
> > > > > > Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> > > > > >=20
> > > > > > ---
> > > > > > Changes for v2:
> > > > > > - Provide more
> > > > > > detailed ./Documentation/devicetree/bindings/display/panel
> > > > > > entry to describe this panel device. ---
> > > > > >  .../bindings/display/panel/tianma,tm070rvhg71.txt  | 29
> > > > > > ++++++++++++++++++++++
> > > > > > drivers/gpu/drm/panel/panel-simple.c               | 27
> > > > > > ++++++++++++++++++++ 2 files changed, 56 insertions(+)
> > > > > > create mode 100644
> > > > > > Documentation/devicetree/bindings/display/panel/tianma,tm070rvh=
g71.txt     =20
> > > > >=20
> > > > > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>   =20
> > > >=20
> > > > Is there a chance that this patch will find its way to
> > > > v4.15-rc1 ?   =20
> > >=20
> > > No, that's very unlikely. We're in the middle of the merge
> > > window, no new patches are accepted at that point. =20
> >=20
> > Ok. I see. I should have sent the ping earlier. =20
>=20
> Looking at the timeline of this patch even that wouldn't have been
> enough. You sent the original patch on October 21, which is one day
> after the final drm-misc feature pull request was tagged. So this
> wouldn't have made it into v4.15-rc1 no matter how early you would
> have pinged. =3D)

Time's flying :-)

Anyway, thanks for help.

>=20
> Thierry



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org

--Sig_/exjGyF.w2kIFtmWH_X2.qrz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAloO1iIACgkQAR8vZIA0
zr1yFAgAgEMHEBafM+PzhgkIV5k6RzyYWXxWDR7CkOSkrvgugK1VVVg9XVnw0LEP
4WEtgpfHHv8e/SiVLJZldpB0VIraRlsXixp3/wIUz1QVvoV2rPH4V8zbjLunGSDj
JIk0sJ25u7GXarHR1C/9uChW9TfRYa6JtlyVIUULj4C70mzjBBS8pq+li5zzui6Y
m1VheXvL0AB+9ZGPCIFWi4fUu82D+Cx+j4EjJny0HtzD1IFDfZ6IWdHcJMHbYjB1
gKZKkZJsDfqdS9ET3mKHpYwIACqiyeGmXTu5lECb/m7YAPV5dehyM/6Tn95iScRl
ypWkXyx0g6U6W2M0YO/pWtIrb21qLQ==
=aifc
-----END PGP SIGNATURE-----

--Sig_/exjGyF.w2kIFtmWH_X2.qrz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
