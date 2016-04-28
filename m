From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RFC v3 1/3] gpio: dt-bindings: add basic-mmio-gpio bindings
Date: Thu, 28 Apr 2016 15:20:39 +0900
Message-ID: <CAAVeFuLeQRLReHQbwM5mBtoUG7zKcuw8ScNaV_0-MLw48QZsOw@mail.gmail.com>
References: <cover.1461710784.git.chunkeey@googlemail.com> <7e8845e6b6384c6b5673532ebef79c8730ed7748.1461710784.git.chunkeey@googlemail.com>
 <CAL_Jsq+OrkudQwxqfSvuqW=HWm6B74pE9bec0QBh5xNbF+s2Hw@mail.gmail.com>
 <1838530.usypLq5u4X@debian64> <CAL_JsqKYU=W8DhVjgihgPiu2B_QgLnFqDqX-soghHDFVUGtAOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKYU=W8DhVjgihgPiu2B_QgLnFqDqX-soghHDFVUGtAOQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Christian Lamparter <chunkeey@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 28, 2016 at 12:08 AM, Rob Herring <robh+dt@kernel.org> wrot=
e:
> On Wed, Apr 27, 2016 at 5:15 AM, Christian Lamparter
> <chunkeey@googlemail.com> wrote:
>> On Tuesday, April 26, 2016 09:06:14 PM Rob Herring wrote:
>>> On Tue, Apr 26, 2016 at 5:51 PM, Christian Lamparter
>>> <chunkeey@googlemail.com> wrote:
>>> > From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>> >
>>> > This patch adds the device tree bindings for the basic-mmio-gpio.
>>> > The basic-mmio-gpio is already part of a the GPIO generic library
>>> > and shares its compatible with the platform device.
>>>
>>> These things always start out "simple", "basic" or "generic". Then
>>> people extend them a property or 2 at a time until they are no long=
er
>>> basic. Make a bunch of GPIO drivers use a generic driver then maybe
>>> I'll be convinced this is a good idea.
>> Well, I mentioned brcm63xx (MIPS) and MyBook Live (PPC). But OK, if =
you
>> want me to look at the existing code in the kernel. I found the foll=
owing
>> candidates.
>
> What I meant was convert the drivers, not the dts files to a generic
> driver. There is no benefit here from a dts perspective. It is driver
> consolidation that would make all this worthwhile.
>
>> 1. MOXA ART: "moxa,moxart-gpio"
>> http://lxr.free-electrons.com/source/drivers/gpio/gpio-moxart.c
>> This driver is used by the:
>> arch/arm/boot/dts/moxart.dtsi
>>
>> ---
>> diff --git a/arch/arm/boot/dts/moxart.dtsi b/arch/arm/boot/dts/moxar=
t.dtsi
>> index 1fd27ed..26707d0 100644
>> --- a/arch/arm/boot/dts/moxart.dtsi
>> +++ b/arch/arm/boot/dts/moxart.dtsi
>> @@ -66,8 +66,11 @@
>>                 gpio: gpio@98700000 {
>>                         gpio-controller;
>>                         #gpio-cells =3D <2>;
>> -                       compatible =3D "moxa,moxart-gpio";
>> -                       reg =3D <0x98700000 0xC>;
>> +                       compatible =3D "basic-mmio-gpio";
>> +                       reg =3D <0x98700000 0x4
>> +                              0x98700004 0x4
>> +                              0x98700008 0x4>;
>> +                       reg-names =3D "set dat dirout";
>
> This is not a compatible change. You can't remove the old drivers as
> they are needed to work with old dtbs, so there is no gain.
>
> You would need to match on existing compatibles such as
> moxa,moxart-gpio and provide a match data struct that has all the inf=
o
> you are adding here (e.g. data register offset). Then additionally yo=
u
> could add "basic-mmio-gpio" (I would drop "basic" part) and the
> additional data associated with it. But it has to be new properties,
> not changing properties. Changing the reg values doesn't work.
>
>
>> 2. GE FPGA based GPIO: "ge,imp3a-gpio", "gef,sbc310-gpio", "gef,sbc6=
10-gpio"
>> 3. CLPS711X GPIO driver: "cirrus,clps711x-gpio"
>> 4. GPIO driver for the TS-4800 board: "technologic,ts4800-gpio"
>>
>> What do you think. There's a total of six devices that can make use
>> of the "basic-mmio-gpio". If this gives me your go-ahead, I'll inclu=
de
>> them in the series as proper patches.
>
> Those are a good start. My other worry about this is next someone wil=
l
> want to add interrupt registers which is probably a majority of GPIO
> controllers.
>
> Of course, I'm sure Linus has an opinion on all of this.

I'm not Linus, but after a quick look at the drivers mentioned by
Christian I see little room for improvement (but still some - see
below). Like Rob mentioned we want the DT's compatible property to
describe the hardware as precisely as possible. "basic-mmio-gpio" is
not precise and not backward-compatible. The examples listed by
Christian are already all using the generic MMIO driver and are thus
already quite short.

However, they all repeat the same basic sequence to initialize the
generic IOMMU driver, and maybe this could be consolidated in a single
file, with each matching chip having the arguments passed to
bgpio_init() encoded as data (a bit like the simple-panel driver does
- see the platform_of_match member of
drivers/gpu/drm/panel/panel-simple.c)

This would reduce the amount of code that basically does the same
thing, and remove a few files from drivers/gpio. Even there I see that
gpio-clps711x.c has some specifics compared to the other drivers, but
maybe Christian can iron them out.

So without touching the DT I think consolidating the bgpio users in a
fashion similar to what simple-panel does would be worthwhile.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
