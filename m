From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [U-Boot] serial atag tag in devicetree ?
Date: Thu, 26 Mar 2015 10:16:30 +0100
Message-ID: <1427361390.2342.9.camel@collins>
References: <550EA6D8.3090702@redhat.com>
	 <CAL_JsqK0VtDj_FmA8tQ5MRmGm-o2w7ia9U2_nD0aFDtTSfns2A@mail.gmail.com>
	 <550FF971.407@redhat.com>
	 <CAL_JsqLev+DeWCzvhF7bwYk3URxpgaQDR+6OmwWHjJ2nx=HijQ@mail.gmail.com>
	 <551119F1.2060002@redhat.com> <1427322910.26627.15.camel@collins>
	 <5513C926.1010708@redhat.com> <1427361114.2342.7.camel@collins>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-ONpXWJvT91Jw8xum0yYP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427361114.2342.7.camel@collins>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-ONpXWJvT91Jw8xum0yYP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 mars 2015 =C3=A0 10:11 +0100, Paul Kocialkowski a =C3=A9crit :
> Le jeudi 26 mars 2015 =C3=A0 09:53 +0100, Hans de Goede a =C3=A9crit :
> > Hi,
> >=20
> > On 25-03-15 23:35, Paul Kocialkowski wrote:
> > > Le mardi 24 mars 2015 =C3=A0 09:01 +0100, Hans de Goede a =C3=A9crit =
:
> > >> Hi,
> > >>
> > >> On 24-03-15 00:12, Rob Herring wrote:
> > >>> On Mon, Mar 23, 2015 at 6:30 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org=
> wrote:
> > >>>> Hi,
> > >>>>
> > >>>>
> > >>>> On 22-03-15 22:01, Rob Herring wrote:
> > >>
> > >> <snip>
> > >>
> > >>>>> There is already "serial-number" (a string) which exists for
> > >>>>> OpenFirmware. Also, "copyright" corresponds to vendor/manufacture=
r
> > >>>>> string. Both of these are supported by lshw already.
> > >>>>
> > >>>>
> > >>>> Ok, so if I understand you correctly then you're saying that we
> > >>>> should set a "serial-number" string property at the dt root level
> > >>>> and that this may contain pretty much anything, e.g. in the
> > >>>> sunxi case the full 128 bit SID in hex.
> > >>>
> > >>> Right.
> > >>>
> > >>>> Is the use of the "serial-number" string property already document=
ed
> > >>>> somewhere? If not I'll submit a kernel patch to document it.
> > >>>
> > >>> Not that I'm aware of. It is something that predates our documentat=
ion
> > >>> requirements. It could be in OpenFirmware specs. Documenting it in =
the
> > >>> DT bindings does not hurt.
> > >>
> > >> Ok.
> > >>
> > >>>> And for older kernels we should not set any serial atag (u-boot
> > >>>> always sets it, so this leaves it at 0) and old kernel users are
> > >>>> out of luck wrt getting to the serial ?
> > >>>
> > >>> If there is sufficient reason to support this on old kernels you co=
uld.
> > >>
> > >> One problem with supporting this for older kernels is that if a non =
0
> > >> serial gets shown in /proc/cpuinfo with older atag booted kernels, w=
e
> > >> should really show the same number in /proc/cpuinfo which means addi=
ng
> > >> code to the kernel to get the devicetree "serial-number" string prop=
erty
> > >> and somehow put that into the 64 bits which we have in /proc/cpuinfo=
,
> > >> but given that the "serial-number" string could be hex or decimal or
> > >> what ever and > 64 bits that will likely require a platform specific
> > >> solution. All doable, but the question then becomes is this worth th=
e
> > >> effort ?
> > >
> > > After investigating a bit more, I found out that the USB serial numbe=
r
> > > is expected to be a string of 32 bytes, so a 128 bit numeric serial
> > > doesn't fit (it takes 32 bytes for the hex representation of 128 bits=
,
> > > so there is no room left for the terminating null byte), hence it mak=
es
> > > sense to keep a 64 bit limitation for the serial number, if users are
> > > going to rely on it as USB serial string. Moreover, it seems that
> > > Android devices are mostly used 64 bit numbers for serial numbers/
> > >
> > > I was initially going to suggest that we set it in stone that serial
> > > must be 64 numeric bits (as it was in the ATAGs days) and that
> > > bootloaders would pass it that way to the kernel through device tree
> > > (with two 32 bits numeric integers), but Hans talked me out of it.
> > > I just want to expose the situation (especially the USB and Android
> > > thing) here to double-check that everyone still is convinced that a
> > > string approach in device tree is best (which is fine with me).
> >=20
> > There are already existing users of the serial-number property in devic=
etree,
> > and these already use a free-format string, so AFAICT we have no choice
> > but to do the same as the existing users.
> >=20
> > But Rob is the expert here, so lets see what Rob has to say.
> >=20
> > > This way, users that still want to use the serial passed through devi=
ce
> > > tree as a USB serial number will have to use a string of 32 bits,
> > > including the null terminating byte (which is what I'll suggest for
> > > sunxi by using only 64 bits for the serial number).
> > >
> > > Also, I suggest that we show that serial-number string as-is in cpuin=
fo
> > > as well
> >=20
> > We cannot do that because we must guarantee that the serial shown
> > in cpu info is a 64 bits / 16 hex values (0 padded) number, anything
> > else would break the kernel <-> userspace API and potentially break
> > userspace apps. So we must do the devicetree -> serialnumber low/high
> > -> /proc/cpinfo version to guarantee that this format does not change.
> >=20
> > And as discussed before if you want a non 0 serial in cpuinfo then
> > the devicetree -> serialnumber low/high should be done in sunxi
> > specific kernel code, as on sunxi we will know that the string in
> > devicetree will be a hex value, but we've no such guarantee for
> > other platforms, so we cannot simply have a generic function to
> > populate erialnumber low/high from the devicetree serial-number
> > string.
> >=20
> >  > and instead make a string out of the serial ATAG in the kernel
> > > prior to showing it in cpuinfo (as opposed to translating the string
> > > coming from device tree to a numeric value that cpuinfo will end up
> > > showing as a string at the end of the day). Thus, the serial number
> > > coming from device tree will still be shown in cpuinfo as well and no
> > > ABI gets broken.
> >=20
> > You're forgetting the userspace <-> kernel ABI here, the serial line
> > in /proc/cpuinfo is not a free form string it is a 64 bit int shown
> > as 0 padded hex, and we cannot change that as changing that would be
> > an ABI break.
>=20
> IMHO this really is all about interpretation. If you consider that the
> serial is already a *string* and not a hex-representation of a number
> (which it is when using ATAGs, but has no reason to be in general), then
> my suggestion will introduce no ABI break.
>=20
> Generally speaking, I found no documentation that indicates that the
> serial has to be in that format. It just happens to be the case when
> using ATAGs.
>=20
> Also, I found an email from Rob suggesting he would be fine with wiring
> the dts serial-number string to cpuinfo:
> http://lkml.iu.edu/hypermail/linux/kernel/1412.0/02975.html

Oh, and Russell King also seemed to agree back then:
http://lkml.iu.edu/hypermail/linux/kernel/1412.0/03318.html

Russell, Rob, what are your thoughts on this?

> I think it's the most flexible solution and we can think of it as an
> extension of the current scheme: the serial string will no longer be
> limited to a hex representation of a number but can become any string.
>=20
> Now I would appreciate it if Rob could weigh-in and state whether he
> changed his mind on this or not.
>=20
> > > If you're all okay with this, I'll be sending patches to both U-Boot =
and
> > > Linux to start documenting/implementing this.
> >=20
> > Thanks for your work on this, lets first hash out to few remaining uncl=
ear
> > details and then I'm looking forward to your patch set for this.
> >=20
> > Regards,
> >=20
> > Hans
>=20


--=-ONpXWJvT91Jw8xum0yYP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVE85uAAoJEIT9weqP7pUMM5YQAI+4VZAlDURfF2nNLwKuFnZV
SWQXekmeDikgxML+TtX0uTVThpqXcrpBYYiccIaA1f0Pn6T09IQsCAWEbd+yoAP8
PNkDbGSuSaic0ithLQORZM9egYdYNFbIUBcxnt3Yxc27cxWjoPUyQeR5mfBNVs5D
wmlOrrTvflTZLm2hbx93TfacPciKEUyTTtIs0wi5oVHN/pM6GKYNXAvtOVAOM4yS
Evcm0Hkll8zL28k6KkB5+moSxzGSiefjy05vGW/7nHbkaNpyT6w764fpDIKzPLIa
1ThM4crktNejmD4xiKG44ZyPnh4iWRKpvhi5sJ2025Y7DynyjaOYdKeSboxR6O+g
UaNCOaVFFVgT2LwOOpOC2D+P37HnT+8SmsYoTBt57ymxDyejSRNW3McWTBOySI+N
AOVHs18p1P1itWg2Uxb8lUHkQsgExi3n3osPc2eLHU+g8/k+2aTd5j5pdCedmgDS
aIrZP8RNjbiE9pGsTrpsJpn3E+aCLRIDF1CMc02tDhnr+0onnthrzNHJB3LjXik1
Xb/Zgg0Rg+pu/afvhjw3HMsCuFiB9uaGq9mcWGdzV9CA1U2nFwDXXAF0NvfFeQMy
Gw/ajrHiMYxFMjElWUxhkeKMfxk6Ej6IR0Fyiosb60PtLpQyM/nyssjyStAW3fPK
DrpzJ/ZSlup/jRYViINW
=WQvR
-----END PGP SIGNATURE-----

--=-ONpXWJvT91Jw8xum0yYP--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
