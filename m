From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] gpio: dt-bindings: document the concept of GPIO banks
Date: Thu, 31 Mar 2016 15:30:49 +0200
Message-ID: <56FD2689.1080707@atmel.com>
References: <1459415459-8107-1-git-send-email-linus.walleij@linaro.org>
 <CAL_JsqK+n-EwHx52=d9-dTJaVsSOzRS+PAmyCYwe6HK=kDoyGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK+n-EwHx52=d9-dTJaVsSOzRS+PAmyCYwe6HK=kDoyGQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Le 31/03/2016 15:22, Rob Herring a =C3=A9crit :
> On Thu, Mar 31, 2016 at 4:10 AM, Linus Walleij <linus.walleij@linaro.=
org> wrote:
>> Cc: devicetree@vger.kernel.org
>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> We generally avoid indexing blocks in DT.
>=20
>> ---
>>  Documentation/devicetree/bindings/gpio/gpio.txt | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Docum=
entation/devicetree/bindings/gpio/gpio.txt
>> index 069cdf6f9dac..f509ecf03ece 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
>> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
>> @@ -131,6 +131,19 @@ Every GPIO controller node must contain both an=
 empty "gpio-controller"
>>  property, and a #gpio-cells integer property, which indicates the n=
umber of
>>  cells in a gpio-specifier.
>>
>> +Some system-on-chips (SoCs) use the concept of GPIO banks. A GPIO b=
ank is an
>> +instance of a hardware IP core on a silicon die, usually exposed to=
 the
>> +programmer as a coherent range of I/O addresses. Usually each such =
bank is
>> +exposed in the device tree as an individual gpio-controller node, r=
eflecting
>> +the fact that the hardware was synthesized by reusing the same IP b=
lock a
>> +few times over.
>> +
>> +A GPIO controller may specify a bank ID. This is a hardware index t=
hat
>> +indicate the logical order of the GPIO controller in the hardware a=
rchitecture,
>> +usually in the sequence 0, 1, 2 .. n. The hardware index may be dif=
ferent
>> +from the order of register ranges and related to the backplane of h=
ow this
>> +one bank is connected to the outside through a pin controller for e=
xample.
>=20
> I still don't understand why do you need to know this? If you need
> some mapping of gpio nodes into pin controller, the pin controller
> should have a mapping using phandles.

We use aliases for this:

aliases {
    gpio0 =3D &pioA;
    gpio1 =3D &pioB;
    [..]
};

Bye,

>> +
>>  Optionally, a GPIO controller may have a "ngpios" property. This pr=
operty
>>  indicates the number of in-use slots of available slots for GPIOs. =
The
>>  typical example is something like this: the hardware register is 32=
 bits
>> @@ -152,6 +165,7 @@ gpio-controller@00000000 {
>>         reg =3D <0x00000000 0x1000>;
>>         gpio-controller;
>>         #gpio-cells =3D <2>;
>> +       gpio-bank =3D <0>;
>>         ngpios =3D <18>;
>>  }
>>
>> --
>> 2.4.3
>>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
