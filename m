From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: sun8i: dts: Add Ippo-q8h v1.2 with A33 and 1024x600 lcd support
Date: Sun, 14 Jun 2015 21:16:21 +0300
Message-ID: <85E62D2D-5387-433B-A944-7F2145459F08@konsulko.com>
References: <1432997706-20172-1-git-send-email-hdegoede@redhat.com> <1432997706-20172-7-git-send-email-hdegoede@redhat.com> <20150602081459.GO23777@lukather> <556D6955.8030708@redhat.com> <20150603094535.GI23777@lukather> <556EE104.3090803@redhat.com> <20150613135002.GP19653@lukather>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150613135002.GP19653@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

> On Jun 13, 2015, at 16:50 , Maxime Ripard <maxime.ripard@free-electro=
ns.com> wrote:
>=20
> Hi,
>=20
> Sorry for the late reply.
>=20
> On Wed, Jun 03, 2015 at 01:12:04PM +0200, Hans de Goede wrote:
>> Hi,
>>=20
>> On 03-06-15 11:45, Maxime Ripard wrote:
>>> On Tue, Jun 02, 2015 at 10:29:09AM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>=20
>>>> On 02-06-15 10:14, Maxime Ripard wrote:
>>>>> On Sat, May 30, 2015 at 04:55:06PM +0200, Hans de Goede wrote:
>>>>>> The Ippo-q8h is a tablet circuit board commonly found in cheap A=
ndroid
>>>>>> tablets. The v1.2 version can be used with either an A23 or A33 =
SoC.
>>>>>>=20
>>>>>> This adds a dts file for the v1.2 board with an A33 SoC and a 10=
24x600
>>>>>> LCD screen (most of these tablets have a 800x480 screen).
>>>>>=20
>>>>> I think the difference between the resolution here is more of a c=
ase
>>>>> for the DT quirks interface:
>>>>> https://lkml.org/lkml/2015/2/18/258
>>>>=20
>>>> I would expect the only difference between the 2 dts files to be t=
he
>>>> node describing the lcd panel, so yes that makes somewhat sense.
>>>>=20
>>>>> Do you know if there's some way to autodetect the two board versi=
ons
>>>>> (like a board id somewhere in an EEPROM)?
>>>>=20
>>>> No, AFAIK there is no way to tell the difference. There is no eepr=
om no
>>>> the board, and we really cannot rely on the nand contents.
>>>=20
>>> Ok.
>>>=20
>>>>> If not, then maybe u-boot can simply add that board compatible to=
 the
>>>>> list, and we'll base our logic on that when we'll need it.
>>>>=20
>>>> That means extra logic in u-boot, and on the kernel side, for what
>>>> benefit exactly? Such logic would make sense if there was one u-bo=
ot
>>>> image which runtime adjusted itself, but that is not an option.
>>>=20
>>> For what benefit? One kernel image which runtime adjusts itself.
>>=20
>> You mean one dtb right, because the kernel itself already runtime
>> adjusts itself.
>=20
> Well, the kernel will runtime adjust the DT, so, both, I'd say?
>=20
>>> It's especially possible if u-boot's image is not, which seems to b=
e what
>>> you're saying.
>>=20
>> But we will still need different configs in u-boot, and we need
>> to add code + config to u-boot to plug in the extra compatibles
>> to automatically select the right built-in overlays.
>=20
> You're going to have a different config anyway, but yeah, that's true=
=2E
>=20
>>>> And we can avoid copy and paste on the dts side by putting all
>>>> the common stuff in a common file and including that, I believe
>>>> that that is better (KISS =3D better) since we've no way to runtim=
e
>>>> do the right thing AFAICT.
>>>=20
>>> My concern is about the ever-growing number of DTS that just are sm=
all
>>> variations of one or the other. What about the time when we'll
>>> discover that this board has a variant that has an emmc, and some t=
hat
>>> don't have any button, or the i2c bus 2 not wired, and one other th=
at
>>> doesn't have any HDMI?
>>>=20
>>> Do we really want to have a dts called
>>> sun8i-a33-q8h-emmc-lcd800x600-nohdmi-noi2c2-nobuttons.dts?
>>>=20
>>> Especially when we will have the one that we include here that will
>>> not have followed this convention because it was introduced before
>>> that, and that we have a way to deal with this nicely?
>>>=20
>>> You chose to consider the DTS names an ABI, the best way to handle
>>> this is to have a DTS as generic as possible, and leave all these
>>> small variations outside of the name.
>>=20
>> Ok, so for now this is not really an issue at all since the dts
>> does not yet decribe the lcd at all. So can you merge this one
>> renamed to a more generic name for 4.2?
>>=20
>> That will work fine for now.
>>=20
>> Then we can use the DT quirks interface to add different lcd
>> nodes for different variants once we get lcd support in the kernel,
>> and teach u-boot to add the extra board compatible to select
>> the right lcd node at that time.
>=20
> I think we need to discuss this with Pantelis and what is his feeling
> about this.
>=20
> Pantelis, to sum things up, we have a case of a tablet that comes wit=
h
> the exact same board, but coming in two flavours with two differents
> screen resolutions. It looks like a great case for your DT quirks
> work, but we have no way of runtime detecting the difference between
> the two variants. What do you think about this? Should we go with
> using the DT quirks or is this simply out of scope?
>=20
> There's not so much example of similar cases in the kernel, and none
> of them use quirks so far (obviously) but they all boil down to eithe=
r
> the solution you were suggesting in that patch or adding the alternat=
e
> configuration as a comment.
>=20
> I don't think the latter would work for you, and I agree with that, s=
o
> I guess that depending on what Pantelis says, either we go with a
> better solution using the quirks, or we end up using what you
> suggested (with a nitpick though, I'd prefer if you used the display
> standard instead of the resolution, which would make it xga I guess?)
>=20

=46irst of all, the quirks interface is at an RFC stage (new name sugge=
sted is
=E2=80=98variants=E2=80=99); getting that out of the way this seems lik=
e what it is designed
to do.

The idea of the DT quirks is to drastically cut down on the number of d=
ifferent
DTs required, each different for each board with minute differences fro=
m one another.

In your case you have boards that have no way to be probed about what t=
hey =E2=80=98are=E2=80=99,
but that=E2=80=99s no big problem. You can easily pass the board varian=
t in the kernel command
line and use that to select the quirk to apply.

In fact the original patchset does contain a command line quirk for ena=
bling and disabling
the onboard emmc & hdmi of the beaglebone black for capes that need to =
use those signals.

Saying that, if you=E2=80=99re in a hurry I=E2=80=99d say go with a dif=
ferent DTSs for now, since that=E2=80=99s
going to go in a near kernel cycle; DT quirks will be discussed at plum=
ber=E2=80=99s in a couple
of months, and then we=E2=80=99ll if it will go in and in what form.

Maxime
>=20
>=20
> --=20
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
