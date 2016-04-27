From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC v3 1/3] gpio: dt-bindings: add basic-mmio-gpio bindings
Date: Wed, 27 Apr 2016 10:08:49 -0500
Message-ID: <CAL_JsqKYU=W8DhVjgihgPiu2B_QgLnFqDqX-soghHDFVUGtAOQ@mail.gmail.com>
References: <cover.1461710784.git.chunkeey@googlemail.com> <7e8845e6b6384c6b5673532ebef79c8730ed7748.1461710784.git.chunkeey@googlemail.com>
 <CAL_Jsq+OrkudQwxqfSvuqW=HWm6B74pE9bec0QBh5xNbF+s2Hw@mail.gmail.com> <1838530.usypLq5u4X@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1838530.usypLq5u4X@debian64>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Alexandre Courbot <gnurou@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 27, 2016 at 5:15 AM, Christian Lamparter
<chunkeey@googlemail.com> wrote:
> On Tuesday, April 26, 2016 09:06:14 PM Rob Herring wrote:
>> On Tue, Apr 26, 2016 at 5:51 PM, Christian Lamparter
>> <chunkeey@googlemail.com> wrote:
>> > From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> >
>> > This patch adds the device tree bindings for the basic-mmio-gpio.
>> > The basic-mmio-gpio is already part of a the GPIO generic library
>> > and shares its compatible with the platform device.
>>
>> These things always start out "simple", "basic" or "generic". Then
>> people extend them a property or 2 at a time until they are no longe=
r
>> basic. Make a bunch of GPIO drivers use a generic driver then maybe
>> I'll be convinced this is a good idea.
> Well, I mentioned brcm63xx (MIPS) and MyBook Live (PPC). But OK, if y=
ou
> want me to look at the existing code in the kernel. I found the follo=
wing
> candidates.

What I meant was convert the drivers, not the dts files to a generic
driver. There is no benefit here from a dts perspective. It is driver
consolidation that would make all this worthwhile.

> 1. MOXA ART: "moxa,moxart-gpio"
> http://lxr.free-electrons.com/source/drivers/gpio/gpio-moxart.c
> This driver is used by the:
> arch/arm/boot/dts/moxart.dtsi
>
> ---
> diff --git a/arch/arm/boot/dts/moxart.dtsi b/arch/arm/boot/dts/moxart=
=2Edtsi
> index 1fd27ed..26707d0 100644
> --- a/arch/arm/boot/dts/moxart.dtsi
> +++ b/arch/arm/boot/dts/moxart.dtsi
> @@ -66,8 +66,11 @@
>                 gpio: gpio@98700000 {
>                         gpio-controller;
>                         #gpio-cells =3D <2>;
> -                       compatible =3D "moxa,moxart-gpio";
> -                       reg =3D <0x98700000 0xC>;
> +                       compatible =3D "basic-mmio-gpio";
> +                       reg =3D <0x98700000 0x4
> +                              0x98700004 0x4
> +                              0x98700008 0x4>;
> +                       reg-names =3D "set dat dirout";

This is not a compatible change. You can't remove the old drivers as
they are needed to work with old dtbs, so there is no gain.

You would need to match on existing compatibles such as
moxa,moxart-gpio and provide a match data struct that has all the info
you are adding here (e.g. data register offset). Then additionally you
could add "basic-mmio-gpio" (I would drop "basic" part) and the
additional data associated with it. But it has to be new properties,
not changing properties. Changing the reg values doesn't work.


> 2. GE FPGA based GPIO: "ge,imp3a-gpio", "gef,sbc310-gpio", "gef,sbc61=
0-gpio"
> 3. CLPS711X GPIO driver: "cirrus,clps711x-gpio"
> 4. GPIO driver for the TS-4800 board: "technologic,ts4800-gpio"
>
> What do you think. There's a total of six devices that can make use
> of the "basic-mmio-gpio". If this gives me your go-ahead, I'll includ=
e
> them in the series as proper patches.

Those are a good start. My other worry about this is next someone will
want to add interrupt registers which is probably a majority of GPIO
controllers.

Of course, I'm sure Linus has an opinion on all of this.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
