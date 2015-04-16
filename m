From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: root node serial-number
 property documentation
Date: Thu, 16 Apr 2015 21:15:49 +0200
Message-ID: <1429211749.2563.15.camel@collins>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr>
	 <f6f4f862c78fa626e7f94bde51eec5b1@agner.ch>
	 <1429175421.2483.1.camel@collins>
	 <CAL_JsqKdHQZL5Z6hKgquKihFykX0ZiCDQfeHOfOZWOh2NMg4Rw@mail.gmail.com>
	 <CFEF8F54-7A3E-482C-B295-6A6BC5D837C8@codeaurora.org>
	 <1429199145.2563.9.camel@collins>
	 <F4D05489-ACF0-44BB-AEC7-7E8FB83FAE4C@codeaurora.org>
	 <1429208077.2563.14.camel@collins>
	 <B1128C28-AC17-47F6-A64A-FD3197112751@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-rDLsC/sURMPwZXezJAe3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <B1128C28-AC17-47F6-A64A-FD3197112751-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-rDLsC/sURMPwZXezJAe3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 16 avril 2015 =C3=A0 13:54 -0500, Kumar Gala a =C3=A9crit :
> > On Apr 16, 2015, at 1:14 PM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wrote=
:
> >=20
> > Le jeudi 16 avril 2015 =C3=A0 10:53 -0500, Kumar Gala a =C3=A9crit :
> >>> On Apr 16, 2015, at 10:45 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wr=
ote:
> >>>=20
> >>> Le jeudi 16 avril 2015 =C3=A0 10:23 -0500, Kumar Gala a =C3=A9crit :
> >>>>> On Apr 16, 2015, at 9:36 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> >>>>>=20
> >>>>> On Thu, Apr 16, 2015 at 4:10 AM, Paul Kocialkowski <contact@paulk.f=
r> wrote:
> >>>>>> Le jeudi 16 avril 2015 =C3=A0 09:56 +0200, Stefan Agner a =C3=A9cr=
it :
> >>>>>>> On 2015-03-28 18:39, Paul Kocialkowski wrote:
> >>>>>>>> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> >>>>>>>=20
> >>>>>>> I think this is a worthwhile standardization.
> >>>>>>>=20
> >>>>>>> Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >>>>>>=20
> >>>>>> Thanks! I should also add a commit message in v2 mentioning that t=
his is
> >>>>>> already used in open firmware and reported by lshw.
> >>>>>=20
> >>>>> With that,
> >>>>>=20
> >>>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>>=20
> >>> [snip]
> >>>=20
> >>>> I feel like this is a little lite either in the doc or commit messag=
e.
> >>>> Is the string completely arbitrary?  Is it meant to match labeling o=
n
> >>>> a board or case?  Is this meant to be used by the kernel at all?
> >>>=20
> >>> I guess it doesn't really matter what it is, as long as it's a string=
.
> >>> The kernel does not suggest any use for it either, it's just made
> >>> available to userspace through cpuinfo.
> >>>=20
> >>> Now if there is a particular use for this in user-space, it would hav=
e
> >>> to match some standards. For instance, it Android, ro.serialno is
> >>> usually a 16-bytes (plus one null byte) representation of a 64 bit
> >>> number. For USB, I recall it is usually a 32 bytes string (including =
the
> >>> null byte), but may be extended to more.
> >>>=20
> >>> What the string actually represents depends and some SOCs have serial
> >>> number bytes (I know that omap and sunxi have some for instance, that
> >>> are usually used) while other devices may take it from somewhere else=
.
> >>> In any case, it doesn't really matter and is not up to the kernel any=
way
> >>> since it is just passed through from the bootloader.
> >>>=20
> >>> Thus, I don't think it's very relevant to mention it in either the
> >>> documentation or the commit message.
> >>=20
> >> So you say =E2=80=98board=E2=80=99 in the patch, since it could be SoC=
 specific, we
> >> should probably clean up the wording a bit.
> >=20
> > It really doesn't matter where the string comes from, what it contains
> > or whether some SoCs have provisions to generate one.
> > I think board is one the most common words that we can use to describe
> > devices. "devices" is also fine, I could go with it if you prefer, but =
I
> > don't really see what it changes.
>=20
> Lets go with device instead of board.
>=20
> >=20
> >> I=E2=80=99m just saying when someone reads this 6 months or a year lat=
er and
> >> tries to figure out what the purpose of the property is they don=E2=80=
=99t
> >> really have enough info.  Putting some examples in the commit message
> >> of what possibly usages is I think a reasonable thing.
> >=20
> > Okay, that would make sense. Still, the purpose of this is to pass the
> > serial number string from the bootloader to userspace. All of the
> > discussion about where to grab the serial from and what it should look
> > like is not relevant to the kernel. Instead, it's up to the bootloader
> > that is in charge of generating the serial string, so the discussion
> > should happen there.
>=20
> Again, I=E2=80=99ve got no issues with the property and its purpose to be=
 used
> by user space, just saying we need to convey more of the intent via
> commit message or updating the doc.

Okay so I'll go with "device" and mention a few use cases and what the
serial numbers look like for those. Is that satisfying to you?

> - k


--=-rDLsC/sURMPwZXezJAe3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVMAplAAoJEIT9weqP7pUM3JYP/RJcOQx8tEPBdv1SFn9MuaHz
lERpAtyRfDwMsqywp3mjntBS7sJkeQYdd3b+uek/bN/0RhswhWA0QKjxB0ykhzjZ
DxheYJxbKCms5PTG3tGPIZUFD8MbAD/NVHAuQwelBqHZUUd1NFT4BWu/hE/1vZva
YPylkBrXd+FaOMKlKP+S7zbUUhRk7/0/3tftI88lqmQH2bWaJ4B/QY9FyXBm5frA
Y+oztRG9DgrIKwiXR3kl3fj/wCLQVPgp6tGsf/4x2fDcT7GC7pfFmaIJpP5F5kbr
uWfP6dE+aGNsSZWNjRQpFkWPWQ+9JzU2BVjVmX4DZ4b91o0i031QEl9D6Zd+QHgp
WkraqaKGLJZ2/vyMl0zumSjQG+KAQ3H9iPmh883CvYF0TyTFyi+8rIc6Yc3uZLmn
QVy0rloDb9mcDOGz8LU9Nxix31HSR1D6DdGsSRQ6XrbWuvxlEQY0EJxL6QWKiIZV
LfVdewzjqaCzPqLhMt8/Yw46pT5udEMaZwmCVqtfSXQeSzck3dqwP2J0mqOw2PGv
Xd0Aj4Nq26KpPk3AEljYl7PwpJg4WJwdsDElfOIY0GDVZPniMHRZ2DIalzZsPiBa
QrjhQf88Oz3VDxN1hjwlPiqXsuAXC8I5VnSX5ws+7c6HWIzD4aLqeLbkBQin/ztz
fQtbBohKJ+MObI9X8XWS
=L2Y6
-----END PGP SIGNATURE-----

--=-rDLsC/sURMPwZXezJAe3--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
