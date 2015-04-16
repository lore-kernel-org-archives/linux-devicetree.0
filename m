From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: root node serial-number
 property documentation
Date: Thu, 16 Apr 2015 20:14:37 +0200
Message-ID: <1429208077.2563.14.camel@collins>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr>
	 <f6f4f862c78fa626e7f94bde51eec5b1@agner.ch>
	 <1429175421.2483.1.camel@collins>
	 <CAL_JsqKdHQZL5Z6hKgquKihFykX0ZiCDQfeHOfOZWOh2NMg4Rw@mail.gmail.com>
	 <CFEF8F54-7A3E-482C-B295-6A6BC5D837C8@codeaurora.org>
	 <1429199145.2563.9.camel@collins>
	 <F4D05489-ACF0-44BB-AEC7-7E8FB83FAE4C@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-BeSRyygAmRMX6Cov9AsT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <F4D05489-ACF0-44BB-AEC7-7E8FB83FAE4C-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-BeSRyygAmRMX6Cov9AsT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 16 avril 2015 =C3=A0 10:53 -0500, Kumar Gala a =C3=A9crit :
> > On Apr 16, 2015, at 10:45 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wrot=
e:
> >=20
> > Le jeudi 16 avril 2015 =C3=A0 10:23 -0500, Kumar Gala a =C3=A9crit :
> >>> On Apr 16, 2015, at 9:36 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> >>>=20
> >>> On Thu, Apr 16, 2015 at 4:10 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>=
 wrote:
> >>>> Le jeudi 16 avril 2015 =C3=A0 09:56 +0200, Stefan Agner a =C3=A9crit=
 :
> >>>>> On 2015-03-28 18:39, Paul Kocialkowski wrote:
> >>>>>> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> >>>>>=20
> >>>>> I think this is a worthwhile standardization.
> >>>>>=20
> >>>>> Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >>>>=20
> >>>> Thanks! I should also add a commit message in v2 mentioning that thi=
s is
> >>>> already used in open firmware and reported by lshw.
> >>>=20
> >>> With that,
> >>>=20
> >>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >=20
> > [snip]
> >=20
> >> I feel like this is a little lite either in the doc or commit message.
> >> Is the string completely arbitrary?  Is it meant to match labeling on
> >> a board or case?  Is this meant to be used by the kernel at all?
> >=20
> > I guess it doesn't really matter what it is, as long as it's a string.
> > The kernel does not suggest any use for it either, it's just made
> > available to userspace through cpuinfo.
> >=20
> > Now if there is a particular use for this in user-space, it would have
> > to match some standards. For instance, it Android, ro.serialno is
> > usually a 16-bytes (plus one null byte) representation of a 64 bit
> > number. For USB, I recall it is usually a 32 bytes string (including th=
e
> > null byte), but may be extended to more.
> >=20
> > What the string actually represents depends and some SOCs have serial
> > number bytes (I know that omap and sunxi have some for instance, that
> > are usually used) while other devices may take it from somewhere else.
> > In any case, it doesn't really matter and is not up to the kernel anywa=
y
> > since it is just passed through from the bootloader.
> >=20
> > Thus, I don't think it's very relevant to mention it in either the
> > documentation or the commit message.
>=20
> So you say =E2=80=98board=E2=80=99 in the patch, since it could be SoC sp=
ecific, we
> should probably clean up the wording a bit.

It really doesn't matter where the string comes from, what it contains
or whether some SoCs have provisions to generate one.
I think board is one the most common words that we can use to describe
devices. "devices" is also fine, I could go with it if you prefer, but I
don't really see what it changes.

> I=E2=80=99m just saying when someone reads this 6 months or a year later =
and
> tries to figure out what the purpose of the property is they don=E2=80=99=
t
> really have enough info.  Putting some examples in the commit message
> of what possibly usages is I think a reasonable thing.

Okay, that would make sense. Still, the purpose of this is to pass the
serial number string from the bootloader to userspace. All of the
discussion about where to grab the serial from and what it should look
like is not relevant to the kernel. Instead, it's up to the bootloader
that is in charge of generating the serial string, so the discussion
should happen there.

--=-BeSRyygAmRMX6Cov9AsT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVL/wNAAoJEIT9weqP7pUM1xUP/0akeRR9VfOGDw74+rH7msrg
onKIVzwefj8+ZoQpCkNxAM/DxttypWK8LFOU7thSKaLFFZ0GTItGTWSAvzcE07Sj
/QqQR5NYMIsX3DBEy1MtFPIZ8xuNj5hX9GvTh70zxo4sfsOwZFS+q1/wnUyKShu+
JyxSMoDynV/9/6glAvpMcRJnz77zh2Atz7CJBs8qz2PVWT/7znStYzI6yMw4120x
JN7/pwexKMsO+p6CyyTKMzvLytvppfFTN86vynn7F0uJjEjz/0NOMcrdSsqGnT03
CCzM4rvHVI7SSHvMqGQB5PwX5YxuNWtZ+YTk2C7EmDxU8TsE15qjm+V0TBE9qaLt
FUsjUpb1qn1aKwvKIe1JN6Brr74HrIRFXMtitCDCOihFBm6DGKp2kbfTLTYXoG2s
1dPz2qbxf/lipkNz6oSkVYKMuXTMIdmVGFp6OiGfiWYsWxRClvrFWoUGY+QWV4Tr
/fIGj0v+yR3cllvQbAEYSMr5Hl/dh2ggGW2/z/HhJwp6z4fLLew/lBAhPeO55Lyp
JrBa0QPRFvVf4RTXC4Ud3i4McspS1S+cckGPfWKRCvQUfeW2fbhVcedr/+ujByTF
wYodH+A4ss7xpRAfJ2VZke0HmrBKI9+yznGVU5UpH2ctuDuLQeltZWmVUyAZBTi0
b9KAgQeYRXel5Qywmsot
=U34j
-----END PGP SIGNATURE-----

--=-BeSRyygAmRMX6Cov9AsT--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
