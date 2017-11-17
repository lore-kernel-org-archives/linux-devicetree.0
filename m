From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2] display: panel: Add Tianma tm070rvhg71 display
 support (800x480)
Date: Fri, 17 Nov 2017 11:02:47 +0100
Message-ID: <20171117110247.5d7737bc@jawa>
References: <CAL_JsqJz67k_fTMkx5dHb5qFwXif9y+Cv=+PTq7OLH7woNoU=g@mail.gmail.com>
        <20171107153058.5554-1-lukma@denx.de>
        <20171110212423.jddj5kw32voms2oj@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dVdAaYltv26_2wgB7_yqxsB"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171110212423.jddj5kw32voms2oj@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/dVdAaYltv26_2wgB7_yqxsB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

> On Tue, Nov 07, 2017 at 04:30:58PM +0100, Lukasz Majewski wrote:
> > Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> >=20
> > ---
> > Changes for v2:
> > - Provide more
> > detailed ./Documentation/devicetree/bindings/display/panel entry to
> > describe this panel device. ---
> >  .../bindings/display/panel/tianma,tm070rvhg71.txt  | 29
> > ++++++++++++++++++++++
> > drivers/gpu/drm/panel/panel-simple.c               | 27
> > ++++++++++++++++++++ 2 files changed, 56 insertions(+) create mode
> > 100644
> > Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt =
=20
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Is there a chance that this patch will find its way to v4.15-rc1 ?

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org

--Sig_/dVdAaYltv26_2wgB7_yqxsB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAloOs8cACgkQAR8vZIA0
zr2SzwgA0XNRqRFyX6KtA82RxTxXsVcIb3lQbgJ/j/fkgpoVHyzNR19s9lt4ufYn
WYQy/R4Get+i+4eb9qNiZ7jQim5/xKlyko31TCun8ozbLs062C+tjQoSruULEpK+
z1zmCE4MNLRqbZjELF+P41MKiEHOxSnTgYH33HtQ5rxRBfg/17F7tsOo59+sZ4xb
1STqTknOD7VPi1O5C31qkGBGAlckhQBeV3MtRTF8ipBTtyYZ0T7zZtkzQX0W2NXW
u5Pp/UM7WXTvBJEqs5fdUs3cTOlWzJDr5zArhgtp0TpOKDWKnOEDwbsgmuyHN/fn
pKHUz1DcwVxGCAUm422dCMof1nhM1A==
=dEkA
-----END PGP SIGNATURE-----

--Sig_/dVdAaYltv26_2wgB7_yqxsB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
