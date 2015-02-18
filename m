From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Wed, 18 Feb 2015 17:47:32 +0100
Message-ID: <20150218164732.GH32600@odux.rfo.atmel.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20150218154106.GC29429@leverpostej>
 <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com>
 <20150218163238.GG32600@odux.rfo.atmel.com>
 <A5D4ED10-F3EB-4DA8-A846-C28842BDAA9F@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <A5D4ED10-F3EB-4DA8-A846-C28842BDAA9F-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 18, 2015 at 06:39:01PM +0200, Pantelis Antoniou wrote:
> Hi Ludovic,
>=20
> > On Feb 18, 2015, at 18:32 , Ludovic Desroches <ludovic.desroches@at=
mel.com> wrote:
> >=20
> > Hi,
> >=20
> > Great something we are waiting for a long time!
> >=20
> > On Wed, Feb 18, 2015 at 05:53:50PM +0200, Pantelis Antoniou wrote:
> >> Hi Mark,
> >>=20
> >>> On Feb 18, 2015, at 17:41 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> w=
rote:
> >>>=20
> >>> Hi Pantelis,
> >>>=20
> >>> On Wed, Feb 18, 2015 at 02:59:34PM +0000, Pantelis Antoniou wrote=
:
> >>>> Implement a method of applying DT quirks early in the boot seque=
nce.
> >>>>=20
> >>>> A DT quirk is a subtree of the boot DT that can be applied to
> >>>> a target in the base DT resulting in a modification of the live
> >>>> tree. The format of the quirk nodes is that of a device tree ove=
rlay.
> >>>>=20
> >>>> For details please refer to Documentation/devicetree/quirks.txt
> >>>>=20
> >>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org=
>
> >>>> ---
> >>>> Documentation/devicetree/quirks.txt | 101 ++++++++++
> >>>> drivers/of/dynamic.c                | 358 ++++++++++++++++++++++=
++++++++++++++
> >>>> include/linux/of.h                  |  16 ++
> >>>> 3 files changed, 475 insertions(+)
> >>>> create mode 100644 Documentation/devicetree/quirks.txt
> >>>>=20
> >>>> diff --git a/Documentation/devicetree/quirks.txt b/Documentation=
/devicetree/quirks.txt
> >>>> new file mode 100644
> >>>> index 0000000..789319a
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/quirks.txt
> >>>> @@ -0,0 +1,101 @@
> >>>> +A Device Tree quirk is the way which allows modification of the
> >>>> +boot device tree under the control of a per-platform specific m=
ethod.
> >>>> +
> >>>> +Take for instance the case of a board family that comprises of =
a
> >>>> +number of different board revisions, all being incremental chan=
ges
> >>>> +after an initial release.
> >>>> +
> >>>> +Since all board revisions must be supported via a single softwa=
re image
> >>>> +the only way to support this scheme is by having a different DT=
B for each
> >>>> +revision with the bootloader selecting which one to use at boot=
 time.
> >>>=20
> >>> Not necessarily at boot time. The boards don't have to run the ex=
act
> >>> same FW/bootloader binary, so the relevant DTB could be programme=
d onto
> >>> each board.
> >>>=20
> >>=20
> >> That has not been the case in any kind of board I=E2=80=99ve worke=
d with.
> >>=20
> >> A special firmware image that requires a different programming ste=
p at
> >> the factory to select the correct DTB for each is always one more =
thing
> >> that can go wrong.
> >>=20
> >=20
> > I agree. We have boards with several display modules, even if it se=
ems
> > quite easy to know which dtb has to be loaded since we use a prefix
> > describing the display module (_pda4, _pda7, etc.) it is a pain for
> > customers. Moreover you can add the revision of the board, we have =
a
> > mother board and a cpu module so it can quickly lead to something l=
ike
> > this:
> > at91-sama5d31ek_mb-revc_cm-revd_pda7.
> >=20
> > It is only an example, at the moment it is a bit less complicated b=
ut I
> > am not so far from the reality: sama5d31ek_revc_pda7.dts,
> > sama5d33ek_revc_pda4.dts, etc. For a SoC family, we have 27 DTS fil=
es=E2=80=A6
> >=20
>=20
> I bet it=E2=80=99s easy to screw up no? Any horror stories from the f=
actory floor? :)

Yes it is.

I keep these horror stories for Halloween! At the moment no incident be=
cause
we are trying hard to find workarounds with the help of our
In-system programmer or U-boot but the goal is to not rely on a particu=
lar
component to do this job.

>=20
> > As for the single zImage, we should find a way to have a single DTB=
=2E
> >=20
> >>>> +While this may in theory work, in practice it is very cumbersom=
e
> >>>> +for the following reasons:
> >>>> +
> >>>> +1. The act of selecting a different boot device tree blob requi=
res
> >>>> +a reasonably advanced bootloader with some kind of configuratio=
n or
> >>>> +scripting capabilities. Sadly this is not the case many times, =
the
> >>>> +bootloader is extremely dumb and can only use a single dt blob.
> >>>=20
> >>> You can have several bootloader builds, or even a single build wi=
th
> >>> something like appended DTB to get an appropriate DTB if the same=
 binary
> >>> will otherwise work across all variants of a board.
> >>>=20
> >>=20
> >> No, the same DTB will not work across all the variants of a board.
> >>=20
> >>> So it's not necessarily true that you need a complex bootloader.
> >>>=20
> >>=20
> >>>> +2. On many instances boot time is extremely critical; in some c=
ases
> >>>> +there are hard requirements like having working video feeds in =
under
> >>>> +2 seconds from power-up. This leaves an extremely small time bu=
dget for
> >>>> +boot-up, as low as 500ms to kernel entry. The sanest way to get=
 there
> >>>> +is by removing the standard bootloader from the normal boot seq=
uence
> >>>> +altogether by having a very small boot shim that loads the kern=
el and
> >>>> +immediately jumps to kernel, like falcon-boot mode in u-boot do=
es.
> >>>=20
> >>> Given my previous comments above I don't see why this is relevant=
=2E
> >>> You're already passing _some_ DTB here, so if you can organise fo=
r the
> >>> board to statically provide a sane DTB that's fine, or you can re=
sort to
> >>> appended DTB if it's not possible to update the board configurati=
on.
> >>>=20
> >>=20
> >> You=E2=80=99re missing the point. I can=E2=80=99t use the same DTB=
 for each revision of the
> >> board. Each board is similar but it=E2=80=99s not identical.
> >>=20
> >>>> +3. Having different DTBs/DTSs for different board revisions eas=
ily leads to
> >>>> +drift between versions. Since no developer is expected to have =
every single
> >>>> +board revision at hand, things are easy to get out of sync, wit=
h board versions
> >>>> +failing to boot even though the kernel is up to date.
> >>>=20
> >>> I'm not sure I follow. Surely if you don't have every board revis=
ion at
> >>> hand you can't test quirks exhaustively either?
> >>>=20
> >>=20
> >> It=E2=80=99s one less thing to worry about. For example in the cur=
rent mainline kernel
> >> already there is a drift between the beaglebone white and the beag=
lebone black.
> >>=20
> >> Having the same DTS is just easier to keep things in sync.
> >>=20
> >>> Additionally you face the problem that two boards of the same var=
iant
> >>> could have different base DTBs that you would need to test that e=
ach
> >>> board's quirks worked for a range of base DTBs.
> >>>=20
> >>=20
> >> This is not a valid case. This patch is about boards that have the=
 same base DTB.
> >>=20
> >>>> +4. One final problem is the static way that device tree works.
> >>>> +For example it might be desirable for various boards to have a =
way to
> >>>> +selectively configure the boot device tree, possibly by the use=
 of command
> >>>> +line options.  For instance a device might be disabled if a giv=
en command line
> >>>> +option is present, different configuration to various devices f=
or debugging
> >>>> +purposes can be selected and so on. Currently the only way to d=
o so is by
> >>>> +recompiling the DTS and installing, which is an chore for devel=
opers and
> >>>> +a completely unreasonable expectation from end-users.
> >>>=20
> >>> I'm not sure I follow here.
> >>>=20
> >>> Which devices do you envisage this being the case for?
> >>>=20
> >>> Outside of debug scenarios when would you envisage we do this?
> >>>=20
> >>=20
> >> We already have to do this on the beaglebone black. The onboard EM=
MC and HDMI
> >> devices conflict with any capes that use the same pins. So you hav=
e to
> >> have a way to disable them so that the attached cape will work.
> >>=20
> >>> For the debug case it seems reasonable to have command line param=
eters
> >>> to get the kernel to do what we want. Just because there's a devi=
ce in
> >>> the DTB that's useful in a debug scenario doesn't mean we have to=
 use it
> >>> by default.
> >>=20
> >> I don=E2=80=99t follow. Users need this functionality to work. I.e=
=2E pass a command
> >> line option to use different OPPs etc. Real world usage is messy.
> >>=20
> >>>=20
> >>>> +Device Tree quirks solve all those problems by having an in-ker=
nel interface
> >>>> +which per-board/platform method can use to selectively modify t=
he device tree
> >>>> +right after unflattening.
> >>>> +
> >>>> +A DT quirk is a subtree of the boot DT that can be applied to
> >>>> +a target in the base DT resulting in a modification of the live
> >>>> +tree. The format of the quirk nodes is that of a device tree ov=
erlay.
> >>>> +
> >>>> +As an example the following DTS contains a quirk.
> >>>> +
> >>>> +/ {
> >>>> +       foo: foo-node {
> >>>> +               bar =3D <10>;
> >>>> +       };
> >>>> +
> >>>> +       select-quirk =3D <&quirk>;
> >>>> +
> >>>> +       quirk: quirk {
> >>>> +               fragment@0 {
> >>>> +                       target =3D <&foo>;
> >>>> +                       __overlay {
> >>>> +                               bar =3D <0xf00>;
> >>>> +                               baz =3D <11>;
> >>>> +                       };
> >>>> +               };
> >>>> +       };
> >>>> +};
> >>>> +
> >>>> +The quirk when applied would result at the following tree:
> >>>> +
> >>>> +/ {
> >>>> +       foo: foo-node {
> >>>> +               bar =3D <0xf00>;
> >>>> +               baz =3D <11>;
> >>>> +       };
> >>>> +
> >>>> +       select-quirk =3D <&quirk>;
> >>>> +
> >>>> +       quirk: quirk {
> >>>> +               fragment@0 {
> >>>> +                       target =3D <&foo>;
> >>>> +                       __overlay {
> >>>> +                               bar =3D <0xf00>;
> >>>> +                               baz =3D <11>;
> >>>> +                       };
> >>>> +               };
> >>>> +       };
> >>>> +
> >>>> +};
> >>>> +
> >>>> +The two public method used to accomplish this are of_quirk_appl=
y_by_node()
> >>>> +and of_quirk_apply_by_phandle();
> >>>> +
> >>>> +To apply the quirk, a per-platform method can retrieve the phan=
dle from the
> >>>> +select-quirk property and pass it to the of_quirk_apply_by_phan=
dle() node.
> >>>> +
> >>>> +The method which the per-platform method is using to select the=
 quirk to apply
> >>>> +is out of the scope of the DT quirk definition, but possible me=
thods include
> >>>> +and are not limited to: revision encoding in a GPIO input range=
, board id
> >>>> +located in external or internal EEPROM or flash, DMI board ids,=
 etc.
> >>>=20
> >>> It seems rather unfortunate that to get a useful device tree we h=
ave to
> >>> resort to board-specific mechanisms. That means yet more platform=
 code,
> >>> which is rather unfortunate. This would also require any other DT=
 users
> >>> to understand and potentially have to sanitize any quirks (e.g. i=
n the
> >>> case of Xen).
> >>=20
> >> The original internal version of the patches used early platform d=
evices and
> >> a generic firmware quirk mechanism, but I was directed to the per-=
platform
> >> method instead. It is perfectly doable to go back at the original =
implementation
> >> but I need to get the ball rolling with a discussion about the int=
ernals.
> >=20
> > I also think we should used early platform devices to not add platf=
orm
> > specific code. What were the cons to swith to per-platform method?
> >=20
>=20
> Supposedly easier to accept. /me shrugs
>=20
> >>=20
> >>>=20
> >>> Mark.
> >>=20
> >> Regards
> >>=20
> >> =E2=80=94 Pantelis
> >>=20
> >=20
> > Regards
> >=20
> > Ludovic
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
