From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: root node serial-number
 property documentation
Date: Thu, 16 Apr 2015 22:06:55 +0200
Message-ID: <1429214815.2563.21.camel@collins>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr>
	 <f6f4f862c78fa626e7f94bde51eec5b1@agner.ch>
	 <1429175421.2483.1.camel@collins>
	 <CAL_JsqKdHQZL5Z6hKgquKihFykX0ZiCDQfeHOfOZWOh2NMg4Rw@mail.gmail.com>
	 <CFEF8F54-7A3E-482C-B295-6A6BC5D837C8@codeaurora.org>
	 <1429199145.2563.9.camel@collins>
	 <F4D05489-ACF0-44BB-AEC7-7E8FB83FAE4C@codeaurora.org>
	 <1429208077.2563.14.camel@collins>
	 <97473e9075df185ab3024db70c471f53@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-nMReYSSmi+6XR3eUoB/P"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <97473e9075df185ab3024db70c471f53-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-nMReYSSmi+6XR3eUoB/P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 16 avril 2015 =C3=A0 21:40 +0200, Stefan Agner a =C3=A9crit :
> On 2015-04-16 20:14, Paul Kocialkowski wrote:
> > Le jeudi 16 avril 2015 =C3=A0 10:53 -0500, Kumar Gala a =C3=A9crit :
> >> > On Apr 16, 2015, at 10:45 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> w=
rote:
> >> >
> >> > Le jeudi 16 avril 2015 =C3=A0 10:23 -0500, Kumar Gala a =C3=A9crit :
> >> >>> On Apr 16, 2015, at 9:36 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> >> >>>
> >> >>> On Thu, Apr 16, 2015 at 4:10 AM, Paul Kocialkowski <contact@paulk.=
fr> wrote:
> >> >>>> Le jeudi 16 avril 2015 =C3=A0 09:56 +0200, Stefan Agner a =C3=A9c=
rit :
> >> >>>>> On 2015-03-28 18:39, Paul Kocialkowski wrote:
> >> >>>>>> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> >> >>>>>
> >> >>>>> I think this is a worthwhile standardization.
> >> >>>>>
> >> >>>>> Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >> >>>>
> >> >>>> Thanks! I should also add a commit message in v2 mentioning that =
this is
> >> >>>> already used in open firmware and reported by lshw.
> >> >>>
> >> >>> With that,
> >> >>>
> >> >>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> >
> >> > [snip]
> >> >
> >> >> I feel like this is a little lite either in the doc or commit messa=
ge.
> >> >> Is the string completely arbitrary?  Is it meant to match labeling =
on
> >> >> a board or case?  Is this meant to be used by the kernel at all?
> >> >
> >> > I guess it doesn't really matter what it is, as long as it's a strin=
g.
> >> > The kernel does not suggest any use for it either, it's just made
> >> > available to userspace through cpuinfo.
> >> >
> >> > Now if there is a particular use for this in user-space, it would ha=
ve
> >> > to match some standards. For instance, it Android, ro.serialno is
> >> > usually a 16-bytes (plus one null byte) representation of a 64 bit
> >> > number. For USB, I recall it is usually a 32 bytes string (including=
 the
> >> > null byte), but may be extended to more.
> >> >
> >> > What the string actually represents depends and some SOCs have seria=
l
> >> > number bytes (I know that omap and sunxi have some for instance, tha=
t
> >> > are usually used) while other devices may take it from somewhere els=
e.
> >> > In any case, it doesn't really matter and is not up to the kernel an=
yway
> >> > since it is just passed through from the bootloader.
> >> >
> >> > Thus, I don't think it's very relevant to mention it in either the
> >> > documentation or the commit message.
> >>
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
> There is already something related for SoC's in SoC bus called soc_id,
> see
> Documentation/ABI/testing/sysfs-devices-soc
>=20
> So I would rather prefer that this is more reserved for device/board
> serial number...

Again, I don't wish to define what the number represents in the kernel.

It's whatever string the bootloader sends. I know that e.g. on an omap3
device, I'll be using this with the ID bits provided by the SoC (maybe
only part of them, there are 128 bits available and I like to have 64
bit serial numbers). But if you want your device to use something else
(e.g. some serial number stored in an external eeprom), it's up to you
to decide and in any case, that will be decided at bootloader stage.

Perhaps it would make sense to provide consistency for this among a
particular family of devices (say, devices from the same manufacture or
devices using the same SoC). We have already set up such a standard for
Allwinner (sunxi) devices, in U-Boot.


--=-nMReYSSmi+6XR3eUoB/P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVMBZfAAoJEIT9weqP7pUMwQQP/2mDjEpU67WXaj2pv0vflOlL
dpFArOJS+6xPjvhDIKZw8ib0XTErA/g/I9I5Plnk2GVN/zL8PtIjz/HM+Iqq+sH/
QXi16DE6Ld71z6N/pxKRKLtfR+/ZhmUtufV39aG2JDqlk/DILogYVWDsbmzh3DIH
Uarckzu0ZR7KJD3f3YdNkMTYWa1Xj/9FNsNjq1M7Az85QYPlSVBQDK+pOkdnlkmI
rR7OJ3gVMu8QgCadzjnK9NCSXeZXJhubJ7yIONhu3GSmvOQQMRiAYL8Haj/8hOub
D7XSPvT3HtiathjdzAQz1ZkToXkAvbXN9ptrlgVc2Rbo0i6hloQWj7oYCE13SjIE
u40LomV4oRF9R4UO989VPiePmVwNHko5bhgphWfEtwxVLDmaeGek+put1iNG7pck
/iMn7gFlVf8XcvmUWYCTO/0FQ88NhapyvmNEVBFbGPfrqcRzCYE6TDkVuLGWlv5t
c85dUF3wfmJ4Qd5RDkMRvRa182A76+7ymbn7hZhyWYEnsirWzihTvmIfd+u0je0w
x6E2LbNc0FV9vn6WYm9Jm689G775LuY9JzZMLvdwjtwUalInE0iWbDgVXtgNAddB
KaqSR+tvfkSH01vT29hnJ3Q3DkD53SCA9DKHABFXEOWuNuT9EFzePTA1zJtA1r+S
M8JKXjep7ioTWFuaprmm
=nHXc
-----END PGP SIGNATURE-----

--=-nMReYSSmi+6XR3eUoB/P--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
