From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: serial atag tag in devicetree ?
Date: Thu, 26 Mar 2015 10:11:54 +0100
Message-ID: <1427361114.2342.7.camel@collins>
References: <550EA6D8.3090702@redhat.com>
 <CAL_JsqK0VtDj_FmA8tQ5MRmGm-o2w7ia9U2_nD0aFDtTSfns2A@mail.gmail.com>
 <550FF971.407@redhat.com>
 <CAL_JsqLev+DeWCzvhF7bwYk3URxpgaQDR+6OmwWHjJ2nx=HijQ@mail.gmail.com>
 <551119F1.2060002@redhat.com> <1427322910.26627.15.camel@collins>
 <5513C926.1010708@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2111985156=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <5513C926.1010708@redhat.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Hans de Goede <hdegoede@redhat.com>
Cc: devicetree <devicetree@vger.kernel.org>, Ian Campbell <ijc@hellion.org.uk>, U-Boot <u-boot@lists.denx.de>
List-Id: devicetree@vger.kernel.org


--===============2111985156==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-6UOBKDfQXmoy9zsBo+qY"


--=-6UOBKDfQXmoy9zsBo+qY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 mars 2015 =C3=A0 09:53 +0100, Hans de Goede a =C3=A9crit :
> Hi,
>=20
> On 25-03-15 23:35, Paul Kocialkowski wrote:
> > Le mardi 24 mars 2015 =C3=A0 09:01 +0100, Hans de Goede a =C3=A9crit :
> >> Hi,
> >>
> >> On 24-03-15 00:12, Rob Herring wrote:
> >>> On Mon, Mar 23, 2015 at 6:30 AM, Hans de Goede <hdegoede@redhat.com> =
wrote:
> >>>> Hi,
> >>>>
> >>>>
> >>>> On 22-03-15 22:01, Rob Herring wrote:
> >>
> >> <snip>
> >>
> >>>>> There is already "serial-number" (a string) which exists for
> >>>>> OpenFirmware. Also, "copyright" corresponds to vendor/manufacturer
> >>>>> string. Both of these are supported by lshw already.
> >>>>
> >>>>
> >>>> Ok, so if I understand you correctly then you're saying that we
> >>>> should set a "serial-number" string property at the dt root level
> >>>> and that this may contain pretty much anything, e.g. in the
> >>>> sunxi case the full 128 bit SID in hex.
> >>>
> >>> Right.
> >>>
> >>>> Is the use of the "serial-number" string property already documented
> >>>> somewhere? If not I'll submit a kernel patch to document it.
> >>>
> >>> Not that I'm aware of. It is something that predates our documentatio=
n
> >>> requirements. It could be in OpenFirmware specs. Documenting it in th=
e
> >>> DT bindings does not hurt.
> >>
> >> Ok.
> >>
> >>>> And for older kernels we should not set any serial atag (u-boot
> >>>> always sets it, so this leaves it at 0) and old kernel users are
> >>>> out of luck wrt getting to the serial ?
> >>>
> >>> If there is sufficient reason to support this on old kernels you coul=
d.
> >>
> >> One problem with supporting this for older kernels is that if a non 0
> >> serial gets shown in /proc/cpuinfo with older atag booted kernels, we
> >> should really show the same number in /proc/cpuinfo which means adding
> >> code to the kernel to get the devicetree "serial-number" string proper=
ty
> >> and somehow put that into the 64 bits which we have in /proc/cpuinfo,
> >> but given that the "serial-number" string could be hex or decimal or
> >> what ever and > 64 bits that will likely require a platform specific
> >> solution. All doable, but the question then becomes is this worth the
> >> effort ?
> >
> > After investigating a bit more, I found out that the USB serial number
> > is expected to be a string of 32 bytes, so a 128 bit numeric serial
> > doesn't fit (it takes 32 bytes for the hex representation of 128 bits,
> > so there is no room left for the terminating null byte), hence it makes
> > sense to keep a 64 bit limitation for the serial number, if users are
> > going to rely on it as USB serial string. Moreover, it seems that
> > Android devices are mostly used 64 bit numbers for serial numbers/
> >
> > I was initially going to suggest that we set it in stone that serial
> > must be 64 numeric bits (as it was in the ATAGs days) and that
> > bootloaders would pass it that way to the kernel through device tree
> > (with two 32 bits numeric integers), but Hans talked me out of it.
> > I just want to expose the situation (especially the USB and Android
> > thing) here to double-check that everyone still is convinced that a
> > string approach in device tree is best (which is fine with me).
>=20
> There are already existing users of the serial-number property in devicet=
ree,
> and these already use a free-format string, so AFAICT we have no choice
> but to do the same as the existing users.
>=20
> But Rob is the expert here, so lets see what Rob has to say.
>=20
> > This way, users that still want to use the serial passed through device
> > tree as a USB serial number will have to use a string of 32 bits,
> > including the null terminating byte (which is what I'll suggest for
> > sunxi by using only 64 bits for the serial number).
> >
> > Also, I suggest that we show that serial-number string as-is in cpuinfo
> > as well
>=20
> We cannot do that because we must guarantee that the serial shown
> in cpu info is a 64 bits / 16 hex values (0 padded) number, anything
> else would break the kernel <-> userspace API and potentially break
> userspace apps. So we must do the devicetree -> serialnumber low/high
> -> /proc/cpinfo version to guarantee that this format does not change.
>=20
> And as discussed before if you want a non 0 serial in cpuinfo then
> the devicetree -> serialnumber low/high should be done in sunxi
> specific kernel code, as on sunxi we will know that the string in
> devicetree will be a hex value, but we've no such guarantee for
> other platforms, so we cannot simply have a generic function to
> populate erialnumber low/high from the devicetree serial-number
> string.
>=20
>  > and instead make a string out of the serial ATAG in the kernel
> > prior to showing it in cpuinfo (as opposed to translating the string
> > coming from device tree to a numeric value that cpuinfo will end up
> > showing as a string at the end of the day). Thus, the serial number
> > coming from device tree will still be shown in cpuinfo as well and no
> > ABI gets broken.
>=20
> You're forgetting the userspace <-> kernel ABI here, the serial line
> in /proc/cpuinfo is not a free form string it is a 64 bit int shown
> as 0 padded hex, and we cannot change that as changing that would be
> an ABI break.

IMHO this really is all about interpretation. If you consider that the
serial is already a *string* and not a hex-representation of a number
(which it is when using ATAGs, but has no reason to be in general), then
my suggestion will introduce no ABI break.

Generally speaking, I found no documentation that indicates that the
serial has to be in that format. It just happens to be the case when
using ATAGs.

Also, I found an email from Rob suggesting he would be fine with wiring
the dts serial-number string to cpuinfo:
http://lkml.iu.edu/hypermail/linux/kernel/1412.0/02975.html

I think it's the most flexible solution and we can think of it as an
extension of the current scheme: the serial string will no longer be
limited to a hex representation of a number but can become any string.

Now I would appreciate it if Rob could weigh-in and state whether he
changed his mind on this or not.

> > If you're all okay with this, I'll be sending patches to both U-Boot an=
d
> > Linux to start documenting/implementing this.
>=20
> Thanks for your work on this, lets first hash out to few remaining unclea=
r
> details and then I'm looking forward to your patch set for this.
>=20
> Regards,
>=20
> Hans


--=-6UOBKDfQXmoy9zsBo+qY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVE81aAAoJEIT9weqP7pUMaL8P/Rqp3jXf9EVeCJdcTYprlMsv
ZW+c9/Za6KYVRaAMzuRCuyrC1coCTh0Nux6NXc97A/lvIEBDs4a06S+Z3fpHvQD3
WuK/aBJzNvCmp6mDJKI78eqdXYv7patKgA6I5iJqbo5r7U+CZGbbe9vX6GDmX76M
9gLv9dXHMGgvvHtiNuZ+hOzr84Jk8V4c5UjK/OX46i9ta2gyGmilVG+S4SfIzGZv
ILA6h+prXtsUrjNP7l9YSTP4HjvZlfCcXOIeJPpY9oUHWAGtF2382DA1aHYt1j9u
OI1oasUCDbPw+Q4FjvVOFZjZt360Yg09T/FIgkL8kJ2FDVX8fBXU0NNM0CmHI5RU
9km/7TPfef9rq/RQhEGzg9mH2pfVLgb83TgrgNJqaAElCvNf0o8n//F6w8cqlaP7
kizXzmvBPiJpt5XncTXs7xWpXBfljtrlDWg4qzPhsCu2qgA4nlbqiPKVixlAqkDA
SRcYJ0xiDz8tcgfycoKOO+dA6FjR4kgwBx/W8nahs14/ca7QPspbbYq1xTriMvAU
yMjkFg/oBkl/xkf84rSnLTiPXpg1oUpu++mV4WlHJsXMGoK1GxbJptVW5G1Vhhak
aZOOYuzhQnxBtClyocLV5sTkXQILmPeBtHoD6lr0PG9vLiLWbaF/9KstnBo1lp7t
6CoGOHC8AWFAi451k+m0
=Om1L
-----END PGP SIGNATURE-----

--=-6UOBKDfQXmoy9zsBo+qY--


--===============2111985156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============2111985156==--
