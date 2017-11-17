From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3] display: panel: Add Mitsubishi aa070mc01 display
 support (800x480)
Date: Fri, 17 Nov 2017 11:03:54 +0100
Message-ID: <20171117110354.3ffdaf04@jawa>
References: <1508537169-402-1-git-send-email-lukma@denx.de>
        <1508537917-1723-1-git-send-email-lukma@denx.de>
        <CAL_JsqLf2Kpbe5NK3-xLPr4kYDWXPgriA6Lwd_4huQPyKGOQ6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DsC8q24aVKpLij1DVtVuT65"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLf2Kpbe5NK3-xLPr4kYDWXPgriA6Lwd_4huQPyKGOQ6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Sig_/DsC8q24aVKpLij1DVtVuT65
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

> On Fri, Oct 20, 2017 at 5:18 PM, Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> wrote:
> > This commit adds support for Mitsubishi aa070mc01 TFT panel working
> > with 8 bit ISP mode (pin 19 "mode" HIGH for 20 pin TFT connector).
> >
> > Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> > ---
> > Changes for v2:
> > - Place the code sorted alphabetically
> > - Add missing ./Documentation/devicetree/binding/display properties
> >   description
> >
> > Changes for v3:
> > - Fix typo in display name (in property description)
> >
> > ---
> >  .../display/panel/mitsubishi,aa070mc01.txt         |  7 +++++
> >  drivers/gpu/drm/panel/panel-simple.c               | 35
> > ++++++++++++++++++++++ 2 files changed, 42 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/mitsubishi,aa070mc01.tx=
t =20
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Is there a chance that this patch will find its way to v4.15-rc1 ?

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org

--Sig_/DsC8q24aVKpLij1DVtVuT65
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAloOtAsACgkQAR8vZIA0
zr0XwQf/etqIhOybY1XE43e2ejyfVOdRhtEr+xXctjwk/0VmFBnyw476cXkv/eQd
X4+cCLegucsGzp1pKVmQnHk6VtKAqEguzgcQ1PjTmEedNDYd4ShG3IpVv45SbKA8
lhtOEULjNT6yq3ZwHuGrsv9vBz30SldxBIsLsskO0Lnm5DvjunxnfiQlGO1ZgCOf
zX4uw9DRNPIFcm82ulsnZOSdwraRJiWXp0poQCiLycsZKgKus1iSmeFK9F30J98L
MqNmyHZfgtFJ9qRCnXIVuO4/86j+CQniBpT/xRtrBjuAZrdhxArRF4ZIcENbCMEk
s9eCr5uJvXMqN4yDkiT9mCpTRcNTKQ==
=K9TM
-----END PGP SIGNATURE-----

--Sig_/DsC8q24aVKpLij1DVtVuT65--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
