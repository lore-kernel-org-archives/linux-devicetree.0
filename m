From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: dt-bindings: document the concept of GPIO banks
Date: Thu, 31 Mar 2016 09:48:48 -0500
Message-ID: <CAL_JsqKzzoSOFY9b9jwOVa4EZdzzRDusOEtDuOwnB7Q3x6W=eQ@mail.gmail.com>
References: <1459415459-8107-1-git-send-email-linus.walleij@linaro.org>
 <CAL_JsqK+n-EwHx52=d9-dTJaVsSOzRS+PAmyCYwe6HK=kDoyGQ@mail.gmail.com> <56FD2689.1080707@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <56FD2689.1080707@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 8:30 AM, Nicolas Ferre <nicolas.ferre@atmel.com=
> wrote:
> Le 31/03/2016 15:22, Rob Herring a =C3=A9crit :
>> On Thu, Mar 31, 2016 at 4:10 AM, Linus Walleij <linus.walleij@linaro=
=2Eorg> wrote:
>>> Cc: devicetree@vger.kernel.org
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> We generally avoid indexing blocks in DT.
>>
>>> ---
>>>  Documentation/devicetree/bindings/gpio/gpio.txt | 14 +++++++++++++=
+
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Docu=
mentation/devicetree/bindings/gpio/gpio.txt
>>> index 069cdf6f9dac..f509ecf03ece 100644
>>> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
>>> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
>>> @@ -131,6 +131,19 @@ Every GPIO controller node must contain both a=
n empty "gpio-controller"
>>>  property, and a #gpio-cells integer property, which indicates the =
number of
>>>  cells in a gpio-specifier.
>>>
>>> +Some system-on-chips (SoCs) use the concept of GPIO banks. A GPIO =
bank is an
>>> +instance of a hardware IP core on a silicon die, usually exposed t=
o the
>>> +programmer as a coherent range of I/O addresses. Usually each such=
 bank is
>>> +exposed in the device tree as an individual gpio-controller node, =
reflecting
>>> +the fact that the hardware was synthesized by reusing the same IP =
block a
>>> +few times over.
>>> +
>>> +A GPIO controller may specify a bank ID. This is a hardware index =
that
>>> +indicate the logical order of the GPIO controller in the hardware =
architecture,
>>> +usually in the sequence 0, 1, 2 .. n. The hardware index may be di=
fferent
>>> +from the order of register ranges and related to the backplane of =
how this
>>> +one bank is connected to the outside through a pin controller for =
example.
>>
>> I still don't understand why do you need to know this? If you need
>> some mapping of gpio nodes into pin controller, the pin controller
>> should have a mapping using phandles.
>
> We use aliases for this:
>
> aliases {
>     gpio0 =3D &pioA;
>     gpio1 =3D &pioB;
>     [..]
> };

Which is a global number space that might not work in all cases. I
don't think gpio should be using aliases either. If you need to
describe the connections between nodes, then keep that between nodes.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
