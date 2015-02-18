From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Wed, 18 Feb 2015 17:31:16 +0000
Message-ID: <20150218173115.GG29429@leverpostej>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20150218154106.GC29429@leverpostej>
 <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Ludovic Desroches <ludovic.desroches@atmel.com>, Rob Herring <robherring2@gmail.com>, Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

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

I wasn't on about the DTB. I was on about the loader binary, in the cas=
e
the FW/bootloader could be common even if the DTB couldn't.

To some extent there must be a DTB that will work across all variants
(albeit with limited utility) or the quirk approach wouldn't work...

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

I think you've misunderstood my point. If you program the board with th=
e
relevant DTB, or use appended DTB, then you will pass the correct DTB t=
o
the kernel without need for quirks.

I understand that each variant is somewhat incompatible (and hence need=
s
its own DTB).

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

What's currently out of sync?

> Having the same DTS is just easier to keep things in sync.

We have dtsi files to keep this common stuff in sync currently. It
sounds like we need to factor something out to bring beaglebone black
and beaglebone white back in sync.

> > Additionally you face the problem that two boards of the same varia=
nt
> > could have different base DTBs that you would need to test that eac=
h
> > board's quirks worked for a range of base DTBs.
> >=20
>=20
> This is not a valid case. This patch is about boards that have the sa=
me base DTB.

Hmm. I mangled my words here.

Say you have a DTB for some set of boards, relying on quirks. A new
board comes out requiring both updates to the DT and the quirk detectio=
n
mechanism. Now you need to test that the new detection code works with
the old boards with the old DTB, in addition to all the boards with the
new DTB.

If anything is updated, testing can't be avoided, regardless of this
quirks mechanism.

> >> +4. One final problem is the static way that device tree works.
> >> +For example it might be desirable for various boards to have a wa=
y to
> >> +selectively configure the boot device tree, possibly by the use o=
f command
> >> +line options.  For instance a device might be disabled if a given=
 command line
> >> +option is present, different configuration to various devices for=
 debugging
> >> +purposes can be selected and so on. Currently the only way to do =
so is by
> >> +recompiling the DTS and installing, which is an chore for develop=
ers and
> >> +a completely unreasonable expectation from end-users.
> >=20
> > I'm not sure I follow here.
> >=20
> > Which devices do you envisage this being the case for?
> >=20
> > Outside of debug scenarios when would you envisage we do this?
> >=20
>=20
> We already have to do this on the beaglebone black. The onboard EMMC =
and HDMI
> devices conflict with any capes that use the same pins. So you have t=
o
> have a way to disable them so that the attached cape will work.

Surely the boot-time quirks are independent of the cape/overlay cases?

If you pass a sane DTB to begin with for the board then things should
work, and if you override with an overlay then that should work
regardless of whatever the boot-time configuration was, no?

> > For the debug case it seems reasonable to have command line paramet=
ers
> > to get the kernel to do what we want. Just because there's a device=
 in
> > the DTB that's useful in a debug scenario doesn't mean we have to u=
se it
> > by default.
>=20
> I don=E2=80=99t follow. Users need this functionality to work. I.e. p=
ass a command
> line option to use different OPPs etc. Real world usage is messy.

This was all about the debug case; for anything that's required for
normal operation I agree that a command line argument doesn't work.

> >> +Device Tree quirks solve all those problems by having an in-kerne=
l interface
> >> +which per-board/platform method can use to selectively modify the=
 device tree
> >> +right after unflattening.
> >> +
> >> +A DT quirk is a subtree of the boot DT that can be applied to
> >> +a target in the base DT resulting in a modification of the live
> >> +tree. The format of the quirk nodes is that of a device tree over=
lay.
> >> +
> >> +As an example the following DTS contains a quirk.
> >> +
> >> +/ {
> >> +       foo: foo-node {
> >> +               bar =3D <10>;
> >> +       };
> >> +
> >> +       select-quirk =3D <&quirk>;
> >> +
> >> +       quirk: quirk {
> >> +               fragment@0 {
> >> +                       target =3D <&foo>;
> >> +                       __overlay {
> >> +                               bar =3D <0xf00>;
> >> +                               baz =3D <11>;
> >> +                       };
> >> +               };
> >> +       };
> >> +};
> >> +
> >> +The quirk when applied would result at the following tree:
> >> +
> >> +/ {
> >> +       foo: foo-node {
> >> +               bar =3D <0xf00>;
> >> +               baz =3D <11>;
> >> +       };
> >> +
> >> +       select-quirk =3D <&quirk>;
> >> +
> >> +       quirk: quirk {
> >> +               fragment@0 {
> >> +                       target =3D <&foo>;
> >> +                       __overlay {
> >> +                               bar =3D <0xf00>;
> >> +                               baz =3D <11>;
> >> +                       };
> >> +               };
> >> +       };
> >> +
> >> +};
> >> +
> >> +The two public method used to accomplish this are of_quirk_apply_=
by_node()
> >> +and of_quirk_apply_by_phandle();
> >> +
> >> +To apply the quirk, a per-platform method can retrieve the phandl=
e from the
> >> +select-quirk property and pass it to the of_quirk_apply_by_phandl=
e() node.
> >> +
> >> +The method which the per-platform method is using to select the q=
uirk to apply
> >> +is out of the scope of the DT quirk definition, but possible meth=
ods include
> >> +and are not limited to: revision encoding in a GPIO input range, =
board id
> >> +located in external or internal EEPROM or flash, DMI board ids, e=
tc.
> >=20
> > It seems rather unfortunate that to get a useful device tree we hav=
e to
> > resort to board-specific mechanisms. That means yet more platform c=
ode,
> > which is rather unfortunate. This would also require any other DT u=
sers
> > to understand and potentially have to sanitize any quirks (e.g. in =
the
> > case of Xen).
>=20
> The original internal version of the patches used early platform devi=
ces and
> a generic firmware quirk mechanism, but I was directed to the per-pla=
tform
> method instead. It is perfectly doable to go back at the original imp=
lementation
> but I need to get the ball rolling with a discussion about the intern=
als.

Either way my concern is the same; some platform-specific code (be it i=
n
arch/arm or drivers/) is potentially required in order to get a usable
DTB of any level of functionality.

Thanks,
Mark.
