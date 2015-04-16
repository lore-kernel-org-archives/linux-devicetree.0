From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: root node serial-number
 property documentation
Date: Thu, 16 Apr 2015 17:45:45 +0200
Message-ID: <1429199145.2563.9.camel@collins>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr>
	 <f6f4f862c78fa626e7f94bde51eec5b1@agner.ch>
	 <1429175421.2483.1.camel@collins>
	 <CAL_JsqKdHQZL5Z6hKgquKihFykX0ZiCDQfeHOfOZWOh2NMg4Rw@mail.gmail.com>
	 <CFEF8F54-7A3E-482C-B295-6A6BC5D837C8@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-ciepd5U3czj5YfribMg1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CFEF8F54-7A3E-482C-B295-6A6BC5D837C8-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-ciepd5U3czj5YfribMg1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 16 avril 2015 =C3=A0 10:23 -0500, Kumar Gala a =C3=A9crit :
> > On Apr 16, 2015, at 9:36 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >=20
> > On Thu, Apr 16, 2015 at 4:10 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> w=
rote:
> >> Le jeudi 16 avril 2015 =C3=A0 09:56 +0200, Stefan Agner a =C3=A9crit :
> >>> On 2015-03-28 18:39, Paul Kocialkowski wrote:
> >>>> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> >>>=20
> >>> I think this is a worthwhile standardization.
> >>>=20
> >>> Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >>=20
> >> Thanks! I should also add a commit message in v2 mentioning that this =
is
> >> already used in open firmware and reported by lshw.
> >=20
> > With that,
> >=20
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

[snip]

> I feel like this is a little lite either in the doc or commit message.
> Is the string completely arbitrary?  Is it meant to match labeling on
> a board or case?  Is this meant to be used by the kernel at all?

I guess it doesn't really matter what it is, as long as it's a string.
The kernel does not suggest any use for it either, it's just made
available to userspace through cpuinfo.

Now if there is a particular use for this in user-space, it would have
to match some standards. For instance, it Android, ro.serialno is
usually a 16-bytes (plus one null byte) representation of a 64 bit
number. For USB, I recall it is usually a 32 bytes string (including the
null byte), but may be extended to more.

What the string actually represents depends and some SOCs have serial
number bytes (I know that omap and sunxi have some for instance, that
are usually used) while other devices may take it from somewhere else.
In any case, it doesn't really matter and is not up to the kernel anyway
since it is just passed through from the bootloader.

Thus, I don't think it's very relevant to mention it in either the
documentation or the commit message.

--=20
Paul Kocialkowski, Replicant developer

Replicant is a fully free Android distribution running on several
devices, a free software mobile operating system putting the emphasis on
freedom and privacy/security.

Website: http://www.replicant.us/
Blog: http://blog.replicant.us/
Wiki/tracker/forums: http://redmine.replicant.us/


--=-ciepd5U3czj5YfribMg1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVL9kpAAoJEIT9weqP7pUMl2kP+gN9TjVW+tL/IbkIxC2E/Jxx
Hu6iQeGeuTmT4vHGYkBm4Yq8hpko4nBp0bZ7G/eGMFSlGsz0fRcB3yGomz9kwsbP
Wxcv4LxT60/nnPB3svNmA556Joctupsf68Kj6RodTcpQGLlbZaYtiWQ/SHIGXI63
PoKk/4ce52xLstRnA9QDMdQxLn7jSf1jj2XZN8qmZvNnpLMwY/xBK4wO7PIn6NhP
QbG3htpcWZIvxo87tEmad5cGMNmdk/sRqYUJ58T5r2TERiMp64QwtZy9FTrVQLtD
DwFJ1QwBHbOoBwVakjj4x/Nnuidnpvc4EBA8K8YXFOhVadZiOtC8ruEE8BetPzLe
gG9+ykqWhGiZ9wcL6aJMMkOvo3rBsZZUTsFhINKnyLQOo68qU9XB1PWOXWF0F2XZ
vWON1+ftiEhYKEIMWRA+6zO9gXNzq1PB75L2n9UecDVmqw1r7D3rrfyNN4i7U7lS
DMu/ygOTho+IHl9SkO5QuexcleJN+JgQxfHZcSxlvs6LjKloRQSVdVbLKRY5T1Wc
GGrLvyVPEGy22NaThghbfFrqWmbMOHniMEpBH477QafBuqIdV+xZn51uUQAEWUKg
e1GUDVSUMaqBcXzAF+hwXUIpRH/AwpYmUnhEXGrVhvetquiYBLbtF6SCLmzzsOdv
aF/d2FbD0A7qxiTmT/+V
=2iib
-----END PGP SIGNATURE-----

--=-ciepd5U3czj5YfribMg1--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
