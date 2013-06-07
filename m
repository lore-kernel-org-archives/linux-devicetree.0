From: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: pxa27x and pinctrl-single
Date: Thu, 06 Jun 2013 17:48:41 -0700
Message-ID: <51B12DE9.9040908@newsguy.com>
References: <51AF7404.3090003@newsguy.com>
 <CAD6h2NTu9-E=Xy8zz5cgDdk5W4ShM9-B+p+gQtiA_HASQ7AEuQ@mail.gmail.com>
 <51B0C7E8.5090308@newsguy.com>
 <CAD6h2NSRCti57NZtw0wzE8Th65_3Y8Dkz5zGsbnA2SUPYS263Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD6h2NSRCti57NZtw0wzE8Th65_3Y8Dkz5zGsbnA2SUPYS263Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: "Manjunathappa, Prakash" <prakash.pm@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 06/06/2013 04:58 PM, Haojian Zhuang wrote:
> On 7 June 2013 01:33, Mike Dunn <mikedunn@newsguy.com> wrote:
>>


[...]


>>
>> Yes, but currently pinctrl-single only supports writing one register for=
 a given
>> pin (with multiple pins sharing a register if bit-per-mux=3D=3Dtrue).  O=
n pxa27x, a
>> pin's alt function is determined by the values written to both the GAFRx=
 and the
>> GPDRx registers, so I think that pinctrl-single may need to allow a devi=
ce tree
>> to specify multiple reg/value/mask sets for any one pin.  I don't have a
>> pxa3xx/mmp developer's manual handy, but from the code it appears that o=
n these
>> arches the direction register is irrelevant to the mux setting.
>>
> =

> No, it's not need to access both GAFRx & GPDRx. Let's focus on PXA27x fir=
st.
> =

> GPIO =91x=92 Alternate Function Select Bits (where x =3D 112 through 120)
> A bit-pair in this register determines the corresponding GPIO pin=92s
> functionality as one of the alternate functions that is mapped to it or a=
s a
> generic GPIO pin.
> =

> 0b00 =3D The corresponding GPIO pin (GPIO<x>) is used as a general-
> purpose I/O.
> 0b01 =3D The corresponding GPIO pin (GPIO<x>) is used for its alternate
> function 1.
> 0b10 =3D The corresponding GPIO pin (GPIO<x>) is used for its alternate
> function 2.
> 0b11 =3D The corresponding GPIO pin (GPIO<x>) is used for its alternate
> function 3.
> =

> We can see that GAFRx configures the pinmux. That's all. We can use
> pinctrl-single
> driver to cover this.


But on the pxa27x there are usually *two* meanings for any one of the 3 alt
functions, depending on the direction.  As a random example... gpio28 alt fn
0b01 is AC97_BITCLK if the direction is input, but is I2S_BITCLK if the
direction is output (from PXA27x Developer's Manual, Table 24-2).


> =

> I know that you're also talking the implementation in gpio-pxa driver.
> __gpio_is_occupied() checks both GAFRx & GPDRx. Because this GPIO
> pin should be configured as GPIO input. Actually we could also discard the
> checking.
> =

> So there's no relationship between GAFRx and GPDRx.


But I am thinking on pxa27x there is... see my example above.  Perhaps this=
 is
not true for the later Marvell arches and you are missing this point?  Or e=
lse I
am stating the obvious to you and I am missing your point.  In either case,
thanks for your patience.

Thanks,
Mike
