From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: Myir AM437x Rico board support (DTS) for Linux mainline 4.9 and
 4.4 Ti Processor SDK 03.02.00.05
Date: Mon, 9 Jan 2017 10:26:06 +0200
Message-ID: <db5a6cc9-8c89-49f0-1d22-17c7d3d8a5ba@ti.com>
References: <201701051754.03159.ppisa@pikron.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="8vAx7F0w4gFN9WFtnsokVv5jqMvnexOTc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201701051754.03159.ppisa-hnFyeMMZ0rvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Pisa <ppisa-hnFyeMMZ0rvQT0dZR+AlfA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, Dan Murphy <DMurphy-l0cyMroinI0@public.gmane.org>, support-0A6ZgDe55FJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

--8vAx7F0w4gFN9WFtnsokVv5jqMvnexOTc
Content-Type: multipart/mixed; boundary="iMXnlgX0XW50bdP2QVUL01O9itfhIt8VK";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
To: Pavel Pisa <ppisa-hnFyeMMZ0rvQT0dZR+AlfA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org,
 Dan Murphy <DMurphy-l0cyMroinI0@public.gmane.org>, support-0A6ZgDe55FJWk0Htik3J/w@public.gmane.org
Message-ID: <db5a6cc9-8c89-49f0-1d22-17c7d3d8a5ba-l0cyMroinI0@public.gmane.org>
Subject: Re: Myir AM437x Rico board support (DTS) for Linux mainline 4.9 and
 4.4 Ti Processor SDK 03.02.00.05
References: <201701051754.03159.ppisa-hnFyeMMZ0rvQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <201701051754.03159.ppisa-hnFyeMMZ0rvQT0dZR+AlfA@public.gmane.org>

--iMXnlgX0XW50bdP2QVUL01O9itfhIt8VK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/01/17 18:54, Pavel Pisa wrote:

> Only significant missing piece is HDMI support. I have put
> setup which I prepared for Ti kernels to device-tree.
> But mainline supports SII9022 HDMI encoder only by
>=20
>   drivers/gpu/drm/bridge/sii902x.c
>=20
> but OMAP DSS changes "sil,sii9022" in device-tree
> to omapdss,sil,sii9022 which seems to be customized
> version found in Texas Instruments tree
>=20
>   drivers/gpu/drm/omapdrm/displays/encoder-sii9022-video.c
>=20
> Do you know if there are some plans to support combination
> of this driver or include customized version in mainline
> for OMAP?

Yes, the plan is to get everything upstream. The short story is, omapdrm
currently uses a custom model for the panel & encoder drivers, not the
common DRM model. I'm reluctant to push more custom drivers into
mainline, and so SiI9022 driver is only in the TI kernel for now.

We'll be working on to getting omapdrm support DRM model, but I can't
give you any schedule right away. The TI kernel's SiI9022 driver should
be easily portable to your mainline based kernel, though.

> I have managed to build SGX driver for my kernel configuration
> and from the testing of Ti image it seem to be used same way
> as for original Ti kernel build.
>=20
> I have no luck with accelerated Xorg. But Ti release notes
> states that Xorg support is missing in 03.02.00.05.

Unfortunately TI doesn't support SGX with X. There's some unofficial
work on that, so perhaps one day we'll get it... I also think that Pyra
board guys have SGX working with X, but that's not the same SGX version
as on AM4, so I'm not sure if it's of any use here.

 Tomi


--iMXnlgX0XW50bdP2QVUL01O9itfhIt8VK--

--8vAx7F0w4gFN9WFtnsokVv5jqMvnexOTc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYc0keAAoJEPo9qoy8lh71UyEQAJwwE3+gmjajA/U5bbjiKy6x
xj4wU5DHZqHyLSBQ4vPQ8oe0fUgBTaMzsOPJ5vwYpDNbJ4QvGzz8SsN2cBsmAkfr
ZMjKZVWLO0VswYdKt7VTO/KUMoS/ztaNoyihJE5BJdvnpiw+/t96FoYENFSubdic
Cb4NPqX+GFyrm8rnrnooiwPM9/CetnZQR6P5fgRpUkA1sVP54oRCxOsTNwN4fGFH
zBiJP4qa55yXzz5G5xUZD9IxHhNqen1SEab/lemkmTY1JxTdYbipkODvWqM58FqY
e3eXhN5e1vQuTVI1ZvciAfdPkiNS3dIk1i1KxePNIk7nQj6jZLesYV6x/F3LiY2A
pJJZ9f2osf99/CrIz+ylkcmjSL3hzG16QlGyitqUGSvfvPygdy7zPVHk4zmrEUbc
8aRPstrm9UvbjIepxB5iVD8NybAZl0b4xlzb+WCYCIf/OAvIY7GswO1WQyowgpS0
Dquk9dGVRGn/Xd2UgDCSmIQHQ/eaQQrdJV+yO2nfxG8dU/FrESvNhGr0nJquH6o8
KdibeGFx+7KqHu+9iKsYRIM7hKc6G8laQboTO0WCcj0THjUt/2hem6pKQSMKbiSO
2LNG8C75LOxTpfCVTe0USDl+tg0dfgLX/CpXx1WEAeS33Z4tmVbR6Om+x7QEzfUe
JMATVgfTJv1JdP69AtMo
=/Kn7
-----END PGP SIGNATURE-----

--8vAx7F0w4gFN9WFtnsokVv5jqMvnexOTc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
