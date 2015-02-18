From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Wed, 18 Feb 2015 11:46:29 -0500
Message-ID: <20150218164629.GM26795@beef>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20150218154106.GC29429@leverpostej>
 <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <FE61DD1C-51DA-4869-8A62-C019C3D70577-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 18, 2015 at 05:53:50PM +0200, Pantelis Antoniou wrote:
> Hi Mark,
>=20
> > On Feb 18, 2015, at 17:41 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wro=
te:
> >=20
> > Hi Pantelis,
> >=20
> > On Wed, Feb 18, 2015 at 02:59:34PM +0000, Pantelis Antoniou wrote:
> >> Implement a method of applying DT quirks early in the boot sequenc=
e.
> >>=20
> >> A DT quirk is a subtree of the boot DT that can be applied to
> >> a target in the base DT resulting in a modification of the live
> >> tree. The format of the quirk nodes is that of a device tree overl=
ay.
> >>=20
> >> For details please refer to Documentation/devicetree/quirks.txt
> >>=20
> >> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >> ---
> >> Documentation/devicetree/quirks.txt | 101 ++++++++++
> >> drivers/of/dynamic.c                | 358 ++++++++++++++++++++++++=
++++++++++++
> >> include/linux/of.h                  |  16 ++
> >> 3 files changed, 475 insertions(+)
> >> create mode 100644 Documentation/devicetree/quirks.txt
> >>=20
> >> diff --git a/Documentation/devicetree/quirks.txt b/Documentation/d=
evicetree/quirks.txt
> >> new file mode 100644
> >> index 0000000..789319a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/quirks.txt
> >> @@ -0,0 +1,101 @@
> >> +A Device Tree quirk is the way which allows modification of the
> >> +boot device tree under the control of a per-platform specific met=
hod.
> >> +
> >> +Take for instance the case of a board family that comprises of a
> >> +number of different board revisions, all being incremental change=
s
> >> +after an initial release.
> >> +
> >> +Since all board revisions must be supported via a single software=
 image
> >> +the only way to support this scheme is by having a different DTB =
for each
> >> +revision with the bootloader selecting which one to use at boot t=
ime.
> >=20
> > Not necessarily at boot time. The boards don't have to run the exac=
t
> > same FW/bootloader binary, so the relevant DTB could be programmed =
onto
> > each board.
> >=20
>=20
> That has not been the case in any kind of board I=E2=80=99ve worked w=
ith.
>=20
> A special firmware image that requires a different programming step a=
t
> the factory to select the correct DTB for each is always one more thi=
ng
> that can go wrong.
>=20
> >> +While this may in theory work, in practice it is very cumbersome
> >> +for the following reasons:
> >> +
> >> +1. The act of selecting a different boot device tree blob require=
s
> >> +a reasonably advanced bootloader with some kind of configuration =
or
> >> +scripting capabilities. Sadly this is not the case many times, th=
e
> >> +bootloader is extremely dumb and can only use a single dt blob.
> >=20
> > You can have several bootloader builds, or even a single build with
> > something like appended DTB to get an appropriate DTB if the same b=
inary
> > will otherwise work across all variants of a board.
> >=20
>=20
> No, the same DTB will not work across all the variants of a board.
>=20
> > So it's not necessarily true that you need a complex bootloader.
> >=20
>=20
> >> +2. On many instances boot time is extremely critical; in some cas=
es
> >> +there are hard requirements like having working video feeds in un=
der
> >> +2 seconds from power-up. This leaves an extremely small time budg=
et for
> >> +boot-up, as low as 500ms to kernel entry. The sanest way to get t=
here
> >> +is by removing the standard bootloader from the normal boot seque=
nce
> >> +altogether by having a very small boot shim that loads the kernel=
 and
> >> +immediately jumps to kernel, like falcon-boot mode in u-boot does=
=2E
> >=20
> > Given my previous comments above I don't see why this is relevant.
> > You're already passing _some_ DTB here, so if you can organise for =
the
> > board to statically provide a sane DTB that's fine, or you can reso=
rt to
> > appended DTB if it's not possible to update the board configuration=
=2E
> >=20
>=20
> You=E2=80=99re missing the point. I can=E2=80=99t use the same DTB fo=
r each revision of the
> board. Each board is similar but it=E2=80=99s not identical.
>=20
> >> +3. Having different DTBs/DTSs for different board revisions easil=
y leads to
> >> +drift between versions. Since no developer is expected to have ev=
ery single
> >> +board revision at hand, things are easy to get out of sync, with =
board versions
> >> +failing to boot even though the kernel is up to date.
> >=20
> > I'm not sure I follow. Surely if you don't have every board revisio=
n at
> > hand you can't test quirks exhaustively either?
> >=20
>=20
> It=E2=80=99s one less thing to worry about. For example in the curren=
t mainline kernel
> already there is a drift between the beaglebone white and the beagleb=
one black.
>=20
> Having the same DTS is just easier to keep things in sync.

Absolutely, we have the problem in the dts files today where we have
lots of duplicated bits. I know one case that I think you are alluding
to is how BBW has the aes and sham enabled but BBB does not. That's wit=
h
just two variants. :( This would definitely drive better organization
of dtses and cure a lot of bitrot if they could share a common file.
OTOH, some might argue that the bone common dtsi should just enable tho=
se
nodes staticly for this case.

-Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
