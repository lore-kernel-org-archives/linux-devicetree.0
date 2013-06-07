From: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: pxa27x and pinctrl-single
Date: Fri, 07 Jun 2013 07:50:24 -0700
Message-ID: <51B1F330.9080007@newsguy.com>
References: <51AF7404.3090003@newsguy.com>
 <CAD6h2NTu9-E=Xy8zz5cgDdk5W4ShM9-B+p+gQtiA_HASQ7AEuQ@mail.gmail.com>
 <51B0C7E8.5090308@newsguy.com>
 <CAD6h2NSRCti57NZtw0wzE8Th65_3Y8Dkz5zGsbnA2SUPYS263Q@mail.gmail.com>
 <51B12DE9.9040908@newsguy.com>
 <CAN1soZyOzrRewwx0up2s+4igUf77h+UbFpCsm324O-nkBWcsTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAN1soZyOzrRewwx0up2s+4igUf77h+UbFpCsm324O-nkBWcsTQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "Manjunathappa,
 Prakash" <prakash.pm@ti.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 06/06/2013 06:21 PM, Haojian Zhuang wrote:
> On Fri, Jun 7, 2013 at 8:48 AM, Mike Dunn <mikedunn@newsguy.com> wrote:
>> On 06/06/2013 04:58 PM, Haojian Zhuang wrote:
>>> On 7 June 2013 01:33, Mike Dunn <mikedunn@newsguy.com> wrote:
>>>>
>>
>>
>> [...]
>>
>>
>>>>
>>>> Yes, but currently pinctrl-single only supports writing one register f=
or a given
>>>> pin (with multiple pins sharing a register if bit-per-mux=3D=3Dtrue). =
 On pxa27x, a
>>>> pin's alt function is determined by the values written to both the GAF=
Rx and the
>>>> GPDRx registers, so I think that pinctrl-single may need to allow a de=
vice tree
>>>> to specify multiple reg/value/mask sets for any one pin.  I don't have=
 a
>>>> pxa3xx/mmp developer's manual handy, but from the code it appears that=
 on these
>>>> arches the direction register is irrelevant to the mux setting.
>>>>
>>>
>>> No, it's not need to access both GAFRx & GPDRx. Let's focus on PXA27x f=
irst.
>>>
>>> GPIO =91x=92 Alternate Function Select Bits (where x =3D 112 through 12=
0)
>>> A bit-pair in this register determines the corresponding GPIO pin=92s
>>> functionality as one of the alternate functions that is mapped to it or=
 as a
>>> generic GPIO pin.
>>>
>>> 0b00 =3D The corresponding GPIO pin (GPIO<x>) is used as a general-
>>> purpose I/O.
>>> 0b01 =3D The corresponding GPIO pin (GPIO<x>) is used for its alternate
>>> function 1.
>>> 0b10 =3D The corresponding GPIO pin (GPIO<x>) is used for its alternate
>>> function 2.
>>> 0b11 =3D The corresponding GPIO pin (GPIO<x>) is used for its alternate
>>> function 3.
>>>
>>> We can see that GAFRx configures the pinmux. That's all. We can use
>>> pinctrl-single
>>> driver to cover this.
>>
>>
>> But on the pxa27x there are usually *two* meanings for any one of the 3 =
alt
>> functions, depending on the direction.  As a random example... gpio28 al=
t fn
>> 0b01 is AC97_BITCLK if the direction is input, but is I2S_BITCLK if the
>> direction is output (from PXA27x Developer's Manual, Table 24-2).
>>
> =

> You didn't understand the alternate function. GPIO mode is only one mode
> of alternate functions. Because GPIO means that user can program the
> pin, you also need to configure the direction for GPIO usage.
> =

> Most of pins are either input or output. If the alternate function is
> AC97_BITCLK,
> input mode is configured by hardware automatically. You shouldn't configu=
re
> it in GPDR register. Since it's working in AC97 mode, not GPIO mode. Conf=
iguring
> in GPDR register can't work.


This is where you are wrong Haojian.  Now I am sure that this peculiarity is
unique to pxa2xx.  From pxa27x developer's manual (section 24.4.2)...

GPIO pins can have as many as three alternate input and three alternate out=
put
functions.

And in the comments above the __gpio_is_occupied() function in gpio-pxa.c y=
ou
mentioned earlier...

/*
 * On PXA25x and PXA27x, GAFRx and GPDRx together decide the alternate
 * function of a GPIO, and GPDRx cannot be altered once configured. It


I'll try to state it another way... on the old Intel pxa arches, the direct=
ion
bit is effectively a third alt function bit, as "alt function" is defined b=
y the
newer Marvell processors.

I'll be happy to send you the pxa27x developer's manual if you still have
doubts.  In the gpio chapter you will see a table with a row for each gpio =
pin,
each row containing 6 columns labeled

alt fn 1 (in)
alt fn 2 (in)
alt fn 3 (in)
alt fn 1 (out)
alt fn 2 (out)
alt fn 3 (out)

I hope that makes sense now.

Thanks again,
Mike
