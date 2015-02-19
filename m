From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Thu, 19 Feb 2015 16:29:46 +0200
Message-ID: <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <20150218154106.GC29429@leverpostej> <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com> <20150218173115.GG29429@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150218173115.GG29429@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Ludovic Desroches <ludovic.desroches@atmel.com>, Rob Herring <robherring2@gmail.com>, Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

> On Feb 18, 2015, at 19:31 , Mark Rutland <mark.rutland@arm.com> wrote=
:
>=20
>>>> +While this may in theory work, in practice it is very cumbersome
>>>> +for the following reasons:
>>>> +
>>>> +1. The act of selecting a different boot device tree blob require=
s
>>>> +a reasonably advanced bootloader with some kind of configuration =
or
>>>> +scripting capabilities. Sadly this is not the case many times, th=
e
>>>> +bootloader is extremely dumb and can only use a single dt blob.
>>>=20
>>> You can have several bootloader builds, or even a single build with
>>> something like appended DTB to get an appropriate DTB if the same b=
inary
>>> will otherwise work across all variants of a board.
>>>=20
>>=20
>> No, the same DTB will not work across all the variants of a board.
>=20
> I wasn't on about the DTB. I was on about the loader binary, in the c=
ase
> the FW/bootloader could be common even if the DTB couldn't.
>=20
> To some extent there must be a DTB that will work across all variants
> (albeit with limited utility) or the quirk approach wouldn't work=E2=80=
=A6
>=20

That=E2=80=99s not correct; the only part of the DTB that needs to be c=
ommon
is the model property that would allow the quirk detection logic to fir=
e.

So, there is a base DTB that will work on all variants, but that only m=
eans
that it will work only up to the point that the quirk detector method
can work. So while in recommended practice there are common subsets
of the DTB that might work, they might be unsafe.

=46or instance on the beaglebone the regulator configuration is differe=
nt
between white and black, it is imperative you get them right otherwise
you risk board damage.

>>> So it's not necessarily true that you need a complex bootloader.
>>>=20
>>=20
>>>> +2. On many instances boot time is extremely critical; in some cas=
es
>>>> +there are hard requirements like having working video feeds in un=
der
>>>> +2 seconds from power-up. This leaves an extremely small time budg=
et for
>>>> +boot-up, as low as 500ms to kernel entry. The sanest way to get t=
here
>>>> +is by removing the standard bootloader from the normal boot seque=
nce
>>>> +altogether by having a very small boot shim that loads the kernel=
 and
>>>> +immediately jumps to kernel, like falcon-boot mode in u-boot does=
=2E
>>>=20
>>> Given my previous comments above I don't see why this is relevant.
>>> You're already passing _some_ DTB here, so if you can organise for =
the
>>> board to statically provide a sane DTB that's fine, or you can reso=
rt to
>>> appended DTB if it's not possible to update the board configuration=
=2E
>>>=20
>>=20
>> You=E2=80=99re missing the point. I can=E2=80=99t use the same DTB f=
or each revision of the
>> board. Each board is similar but it=E2=80=99s not identical.
>=20
> I think you've misunderstood my point. If you program the board with =
the
> relevant DTB, or use appended DTB, then you will pass the correct DTB=
 to
> the kernel without need for quirks.
>=20
> I understand that each variant is somewhat incompatible (and hence ne=
eds
> its own DTB).

In theory it might work, in practice this does not. Ludovic mentioned t=
hat they
have 27 different DTBs in use at the moment. At a relatively common 60k=
 per DTB
that=E2=80=99s 27x60k =3D 1.6MB of DTBs, that need to be installed.

>=20
>>>> +3. Having different DTBs/DTSs for different board revisions easil=
y leads to
>>>> +drift between versions. Since no developer is expected to have ev=
ery single
>>>> +board revision at hand, things are easy to get out of sync, with =
board versions
>>>> +failing to boot even though the kernel is up to date.
>>>=20
>>> I'm not sure I follow. Surely if you don't have every board revisio=
n at
>>> hand you can't test quirks exhaustively either?
>>>=20
>>=20
>> It=E2=80=99s one less thing to worry about. For example in the curre=
nt mainline kernel
>> already there is a drift between the beaglebone white and the beagle=
bone black.
>=20
> What's currently out of sync?
>=20
>> Having the same DTS is just easier to keep things in sync.
>=20
> We have dtsi files to keep this common stuff in sync currently. It
> sounds like we need to factor something out to bring beaglebone black
> and beaglebone white back in sync.
>=20

Yes, they need to. Unfortunately it is very easy for DTBs to get out of=
 sync
as it appears in practice.

>>> Additionally you face the problem that two boards of the same varia=
nt
>>> could have different base DTBs that you would need to test that eac=
h
>>> board's quirks worked for a range of base DTBs.
>>>=20
>>=20
>> This is not a valid case. This patch is about boards that have the s=
ame base DTB.
>=20
> Hmm. I mangled my words here.
>=20
> Say you have a DTB for some set of boards, relying on quirks. A new
> board comes out requiring both updates to the DT and the quirk detect=
ion
> mechanism. Now you need to test that the new detection code works wit=
h
> the old boards with the old DTB, in addition to all the boards with t=
he
> new DTB.
>=20
> If anything is updated, testing can't be avoided, regardless of this
> quirks mechanism.
>=20

Obviously testing is needed everytime something is updated. In practice
the way the boards are identified tend to be similar; on am33xx boards =
it=E2=80=99s
a standard formatted EEPROM at a known address on a specific i2c bus.

On ATMEL boards it=E2=80=99s the same, but the EEPROM is 1wire, and so =
on.

>>>> +4. One final problem is the static way that device tree works.
>>>> +For example it might be desirable for various boards to have a wa=
y to
>>>> +selectively configure the boot device tree, possibly by the use o=
f command
>>>> +line options.  For instance a device might be disabled if a given=
 command line
>>>> +option is present, different configuration to various devices for=
 debugging
>>>> +purposes can be selected and so on. Currently the only way to do =
so is by
>>>> +recompiling the DTS and installing, which is an chore for develop=
ers and
>>>> +a completely unreasonable expectation from end-users.
>>>=20
>>> I'm not sure I follow here.
>>>=20
>>> Which devices do you envisage this being the case for?
>>>=20
>>> Outside of debug scenarios when would you envisage we do this?
>>>=20
>>=20
>> We already have to do this on the beaglebone black. The onboard EMMC=
 and HDMI
>> devices conflict with any capes that use the same pins. So you have =
to
>> have a way to disable them so that the attached cape will work.
>=20
> Surely the boot-time quirks are independent of the cape/overlay cases=
?
>=20
> If you pass a sane DTB to begin with for the board then things should
> work, and if you override with an overlay then that should work
> regardless of whatever the boot-time configuration was, no?
>=20

No. There is no such thing as a =E2=80=98sane=E2=80=99 DTB that will wo=
rk under every case.

Let me expand on the specific HDMI case for the beaglebone black.

The black has an on board HDMI framer that=E2=80=99s connected to the L=
CDC interface.
However the LCDC pins are brought out to the dual connectors and a add-=
on
LCD cape can be attached.

=46or it to work, the LCDC driver must be disabled in the boot DTB so t=
hat
the overlay that enables the LCD cape can work.

But since the image drop for both case is the same you have to be able =
to
disable the HDMI using a command line option, instead of installing a d=
ifferent
DTB.

>>> For the debug case it seems reasonable to have command line paramet=
ers
>>> to get the kernel to do what we want. Just because there's a device=
 in
>>> the DTB that's useful in a debug scenario doesn't mean we have to u=
se it
>>> by default.
>>=20
>> I don=E2=80=99t follow. Users need this functionality to work. I.e. =
pass a command
>> line option to use different OPPs etc. Real world usage is messy.
>=20
> This was all about the debug case; for anything that's required for
> normal operation I agree that a command line argument doesn't work.
>=20
>>>> +Device Tree quirks solve all those problems by having an in-kerne=
l interface
>>>> +which per-board/platform method can use to selectively modify the=
 device tree
>>>> +right after unflattening.
>>>> +
>>>> +A DT quirk is a subtree of the boot DT that can be applied to
>>>> +a target in the base DT resulting in a modification of the live
>>>> +tree. The format of the quirk nodes is that of a device tree over=
lay.
>>>> +
>>>> +As an example the following DTS contains a quirk.
>>>> +
>>>> +/ {
>>>> +       foo: foo-node {
>>>> +               bar =3D <10>;
>>>> +       };
>>>> +
>>>> +       select-quirk =3D <&quirk>;
>>>> +
>>>> +       quirk: quirk {
>>>> +               fragment@0 {
>>>> +                       target =3D <&foo>;
>>>> +                       __overlay {
>>>> +                               bar =3D <0xf00>;
>>>> +                               baz =3D <11>;
>>>> +                       };
>>>> +               };
>>>> +       };
>>>> +};
>>>> +
>>>> +The quirk when applied would result at the following tree:
>>>> +
>>>> +/ {
>>>> +       foo: foo-node {
>>>> +               bar =3D <0xf00>;
>>>> +               baz =3D <11>;
>>>> +       };
>>>> +
>>>> +       select-quirk =3D <&quirk>;
>>>> +
>>>> +       quirk: quirk {
>>>> +               fragment@0 {
>>>> +                       target =3D <&foo>;
>>>> +                       __overlay {
>>>> +                               bar =3D <0xf00>;
>>>> +                               baz =3D <11>;
>>>> +                       };
>>>> +               };
>>>> +       };
>>>> +
>>>> +};
>>>> +
>>>> +The two public method used to accomplish this are of_quirk_apply_=
by_node()
>>>> +and of_quirk_apply_by_phandle();
>>>> +
>>>> +To apply the quirk, a per-platform method can retrieve the phandl=
e from the
>>>> +select-quirk property and pass it to the of_quirk_apply_by_phandl=
e() node.
>>>> +
>>>> +The method which the per-platform method is using to select the q=
uirk to apply
>>>> +is out of the scope of the DT quirk definition, but possible meth=
ods include
>>>> +and are not limited to: revision encoding in a GPIO input range, =
board id
>>>> +located in external or internal EEPROM or flash, DMI board ids, e=
tc.
>>>=20
>>> It seems rather unfortunate that to get a useful device tree we hav=
e to
>>> resort to board-specific mechanisms. That means yet more platform c=
ode,
>>> which is rather unfortunate. This would also require any other DT u=
sers
>>> to understand and potentially have to sanitize any quirks (e.g. in =
the
>>> case of Xen).
>>=20
>> The original internal version of the patches used early platform dev=
ices and
>> a generic firmware quirk mechanism, but I was directed to the per-pl=
atform
>> method instead. It is perfectly doable to go back at the original im=
plementation
>> but I need to get the ball rolling with a discussion about the inter=
nals.
>=20
> Either way my concern is the same; some platform-specific code (be it=
 in
> arch/arm or drivers/) is potentially required in order to get a usabl=
e
> DTB of any level of functionality.
>=20

Yes, platform specific code is required, but that=E2=80=99s a given for=
 any platform no?

> Thanks,
> Mark.

Regards

=E2=80=94 Pantelis
