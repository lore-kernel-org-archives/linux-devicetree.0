From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 4/8] dt-bindings: Add doc for the Ingenic TCU drivers
Date: Thu, 29 Mar 2018 17:59:12 +0200
Message-ID: <1522339152.1792.1@smtp.crapouillou.net>
References: <20180110224838.16711-2-paul@crapouillou.net>
        <20180317232901.14129-1-paul@crapouillou.net>
        <20180317232901.14129-5-paul@crapouillou.net>
        <20180327144631.j2bugsjxulkv57ws@rob-hp-laptop>
        <3765e5a86b80b2a1888cabee623e5d0c@crapouillou.net>
        <CAL_JsqLA8WbYZ49_oVb-uVgwUixVqDw2wtLy2tkyQwBM3ow5ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLA8WbYZ49_oVb-uVgwUixVqDw2wtLy2tkyQwBM3ow5ew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, James Hogan <jhogan@kernel.org>, Maarten ter Huurne <maarten@treewalker.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Le mer. 28 mars 2018 =E0 18:28, Rob Herring <robh@kernel.org> a =E9crit :
> On Wed, Mar 28, 2018 at 10:33 AM, Paul Cercueil=20
> <paul@crapouillou.net> wrote:
>>  Le 2018-03-27 16:46, Rob Herring a =E9crit :
>>>=20
>>>  On Sun, Mar 18, 2018 at 12:28:57AM +0100, Paul Cercueil wrote:
>>>>=20
>>>>  Add documentation about how to properly use the Ingenic TCU
>>>>  (Timer/Counter Unit) drivers from devicetree.
>>>>=20
>>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>  ---
>>>>   .../bindings/clock/ingenic,tcu-clocks.txt          | 42=20
>>>> ++++++++++++++++
>>>>   .../bindings/interrupt-controller/ingenic,tcu.txt  | 39=20
>>>> +++++++++++++++
>>>>   .../devicetree/bindings/mfd/ingenic,tcu.txt        | 56
>>>>  ++++++++++++++++++++++
>>>>   .../devicetree/bindings/timer/ingenic,tcu.txt      | 41=20
>>>> ++++++++++++++++
>>>>   4 files changed, 178 insertions(+)
>>>>   create mode 100644
>>>>  Documentation/devicetree/bindings/clock/ingenic,tcu-clocks.txt
>>>>   create mode 100644
>>>> =20
>>>> Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
>>>>   create mode 100644=20
>>>> Documentation/devicetree/bindings/mfd/ingenic,tcu.txt
>>>>   create mode 100644
>>>>  Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>>>=20
>>>>   v4: New patch in this series. Corresponds to V2 patches 3-4-5=20
>>>> with
>>>>   added content.
>>>>  +/ {
>>>>  +       tcu: mfd@10002000 {
>>>>  +               compatible =3D "ingenic,tcu", "simple-mfd",=20
>>>> "syscon";
>>>>  +               reg =3D <0x10002000 0x1000>;
>>>>  +               #address-cells =3D <1>;
>>>>  +               #size-cells =3D <1>;
>>>>  +               ranges =3D <0x0 0x10002000 0x1000>;
>>>>  +
>>>>  +               tcu_timer: timer@10 {
>>>>  +                       compatible =3D "ingenic,jz4740-tcu";
>>>>  +                       reg =3D <0x10 0xff0>;
>>>>  +
>>>>  +                       clocks =3D <&tcu_clk 0>, <&tcu_clk 1>,=20
>>>> <&tcu_clk
>>>>  2>, <&tcu_clk 3>,
>>>>  +                                        <&tcu_clk 4>, <&tcu_clk=20
>>>> 5>,
>>>>  <&tcu_clk 6>, <&tcu_clk 7>;
>>>>  +                       clock-names =3D "timer0", "timer1",=20
>>>> "timer2",
>>>>  "timer3",
>>>>  +                                                 "timer4",=20
>>>> "timer5",
>>>>  "timer6", "timer7";
>>>>  +
>>>>  +                       interrupt-parent =3D <&tcu_irq>;
>>>>  +                       interrupts =3D <0 1 2 3 4 5 6 7>;
>>>=20
>>>=20
>>>  Thinking about this some more... You simply have 8 timers (and no=20
>>> other
>>>  functions?) with some internal clock and irq controls for each=20
>>> timer. I
>>>  don't think it really makes sense to create separate clock and irq
>>>  drivers in that case. That would be like creating clock drivers for
>>>  every clock divider in timers, pwms, uarts, etc. Unless the clocks=20
>>> get
>>>  exposed to other parts of the system, then there is no point.
>>=20
>>=20
>>  I have 8 timers with some internal clock and IRQ controls, that can=20
>> be used
>>  as PWM.
>=20
> Please include how you plan to do the PWM support too. I need a
> complete picture of the h/w, not piecemeal, evolving bindings.

Alright.

>>  But the TCU also controls the IRQ of the OS Timer (which is
>>  separate),
>>  as well as masking of the clocks for the OS timer and the watchdog.
>=20
> The OS timer and watchdog are different blocks outside the TCU? This
> doesn't seem to be the case based on the register definitions.

Their register areas are mostly separate, although contiguous. On the=20
other
hand, the watchdog and OST can be started/stopped from a bit within a=20
TCU
register, so they're probably part of the same h/w block.

>>  I thought having clean drivers for different frameworks working on=20
>> the same
>>  regmap was cleaner than having one big-ass driver handling=20
>> everything.
>=20
> DT is not the only way to instantiate drivers and how one OS splits
> drivers should not define your DT binding. An MFD driver can create
> child devices and a single DT node can be a provider of multiple
> things. It is appropriate for an MFD to have child nodes primarily
> when the sub devices need their own resources defined as properties in
> DT or when the sub device is an IP block reused in multiple devices.
> Just to have a node per driver/provider is not what should drive the
> decision.

The idea is not to have necesarily one node per driver. I just wanted=20
to keep
it simple.

Regards,
-Paul
=
