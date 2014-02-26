From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv1 1/2] rx51_battery: convert to iio consumer
Date: Wed, 26 Feb 2014 22:54:52 +0100
Message-ID: <20140226215452.GA11468@earth.universe>
References: <1393375569-21751-1-git-send-email-sre@debian.org>
 <1393375569-21751-2-git-send-email-sre@debian.org>
 <CAAfyv37B=xn3AktnUxPDpuey+5S73vW0PJnuUZtorP4rajPKiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAfyv37B=xn3AktnUxPDpuey+5S73vW0PJnuUZtorP4rajPKiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Feb 26, 2014 at 10:43:40PM +0100, Belisko Marek wrote:
> [...]
> > +       int val, err;
> > +       err = iio_read_channel_average_raw(channel, &val);
> Where this function comes from? I cannot find it in current linux-next
> (only iio_read_channel_raw()). Am I missing some patches? Thx.

Ah right. I planned to send a patch adding this function together
with the rx51-battery patchset, but it seems I forgot to include it.

Sorry for the inconvenience. I will send it out as a separate patch
now.

> BTW when I convert to iio consumer and use DT some of values work
> but some of them just report 0 :( (I don't have latest twl4030-madc
> iio patches).

Can you retry with the twl4030-madc iio patch from today? The
older patchsets, which do not contain the "tested on real hw"
note are slightly broken.

-- Sebastian

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJTDmKsAAoJENju1/PIO/qauEUP/AwF+4r9Wk3+oFDongD2CCT+
MPEIn3zhRnksdrOP5X/3pIAjFOFxcmZC3gi4mAkUCZ6G5asEDXwS4LwtdSgZTvuF
W/zpOyFYPY7W0zVqU0jt2xCnpKzSbYfwGY7vSM4SE/2NHl0KYcPC56mUNuHX6r/K
+7+4usAC7Nt5lFjLfwjkZfU5GsPBN69cOEg63M1eR8aC7pBIKxa0Qk1ww7lLz81m
rPjWBOK8Adk60BOMZVBYoUD1kb0WT2Ow+CPzeJuxWGXdltrurrwoAU9R8Y47ukoH
JrNv1hpSitBD5bldKygbwwsZpo+QyEX0LwyR8f2s3Zf6XJP1GYc/gfJAYiebm0UH
K8YR6tH89IMBf5btTXuZvZdCQbcMJwSSUbZ0HZS0tzn345mtbwQsrztk1yl3b7Pu
pVipWYXk6CzM9oCyYJeqtDIuJ6J5xcG6Dfmz6rUcL4PttnOeXwwt3IJXEtel+Y69
rcPiqINWx2RNBfyKfbLzb+hfd/O8QCepA6goZ0FJ2pyXGVbH6+7qyr4FYXaIojU4
kJOdJziTa9HZsblptH6PIp0Ql+qaEdpctl/VLetkQnlRlL8DXdDojZicd0SD9wW9
mS1PkGR1iGd/uCoMpV2vKE91rQBl8L0EVWx5ci7ih8ikOV3E7LCWLOBzdik7EO0Y
zqg+W6U86wqTQZPp+3MK
=HVjH
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
