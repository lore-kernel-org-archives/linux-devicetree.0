From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v3 2/3] dt-bindings: input: Add R_LRADC
 support for A83T
Date: Thu, 29 Jun 2017 09:53:24 +0200
Message-ID: <20170629075324.oflzdye3pi5ijzcr@flea>
References: <20170624024515.4669-1-techping.chan@gmail.com>
 <20170624024515.4669-3-techping.chan@gmail.com>
 <20170626171524.cqfyasetpsfr6xfg@flea.lan>
 <CAAST=9x+fS41tznuJ9hQ-cQxecKN751=61YkhEt31DvpeqeEcA@mail.gmail.com>
 <24845446a80e3542d90a1111a6141415@aosc.io>
 <20170627173631.2rjdzgwdwnksqjzm@flea>
 <CAAST=9yWEO7qdZvZJPDKhYnqSwT_fJLcyN_f3eGrLQ15EMvSzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ixmydedsq64hippy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAST=9yWEO7qdZvZJPDKhYnqSwT_fJLcyN_f3eGrLQ15EMvSzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: icenowy-h8G6r0blFSE@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ixmydedsq64hippy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2017 at 12:45:51PM +0800, Ziping Chen wrote:
> 2017-06-28 1:36 GMT+08:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>:
> > Hi,
> >
> > On Tue, Jun 27, 2017 at 11:29:10PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> >> Maxime, here's another problem: if we have already a GP LRADC driver,
> >> how can we tell the kernel to use it as IIO ADC rather than keys?
> >
> > The GPADC IIO driver is not for the LRADC driver, but the GPADC /
> > temperature sensor.
> >
> > We used to have an LRADC IIO driver in the CHIP BSP written by Alex
> > (in CC):
> > https://github.com/NextThingCo/CHIP-linux/commit/8675b761c54be73dc7cc01=
13209f02e10cc63a27
> >
> > But he never mainlined it.
> >
> >> Should we introduce a new property for this once ready?
> >
> > We need to keep the current binding. We can just check for the
> > presence or not of child nodes to see if it has some keys, and we'd
> > need an IIO-to-input driver that is yet to be written.
> >
>=20
> Yes, then we need an iio-to-input driver...
> So...whether the driver(a83t lradc keys) can be applied now,
> or we should wait for the iio-to-input driver.

This is a long term discussion, it shouldn't hold the patches you
sent.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ixmydedsq64hippy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZVLH0AAoJEBx+YmzsjxAgApQP/3W49rPKJoSkajZ0upgtorZF
P2/x0MeyY5hvcJGrU8EPntmdCE6RwiwxHpd7TTs7HaA88W7vREAlGGleH7A+t66f
TTRJkzHvhbll3QsiTjiaeRFANDg753ZRVXOBCwWHmAW8uqxMNUPpj7ZFz9rncnuN
XfFjZyJRWEyQz6iYd5cYRzfI/IBnoM8Umh4YQjSabjKXhwdzaqU775LfXMQ46Bno
E1ILGAju4dPa33GZe20B7XCcv9yv/gBhNe8L3KAUGcnRncIxYesX64JzspKJSzgM
tV6tq5hRIoQxLhEcRt4/od3yLsAhLYquvfPq9TGKdtcEDVgsIveKQeTev3AmBGCf
pXyTetGpO3JUXH5/nqheUz/JkjVFfqeQnHbHnYYRe7Z603Vf2Bd4EETtQQHo6OFm
CK8KsKKLuWQC27DjBl53GxS+RLBr1gKTyltFI5XuYvpn/Ev6lt2xKvFDFEgcy2Di
KQ7bnfTF0wkH8zACDyGDElfmE7JVE0AozcZ4bb4RpVB0Gndi+qruNhJiDv7j+c89
eCzRgr+vSvMG+ndEySG439tawsP8hQHhVXcosBbbJmwX65FHSXfI6g+q1v7jOZhS
sWL7PNTqsHSa2qEV4vHuDP6Pu423oO1c8n441JOW9uQSpx7VEAz6HLCzaINiDW4Y
Ga3QG3OPSvwe5OGG4f2/
=f57M
-----END PGP SIGNATURE-----

--ixmydedsq64hippy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
