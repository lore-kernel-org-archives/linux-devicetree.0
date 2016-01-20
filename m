From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv3 2/2] gpio: sn65hvs885: Add DT binding documentation
Date: Wed, 20 Jan 2016 16:25:54 -0600
Message-ID: <CAL_JsqLC+DWGh90qemZzBM=3sxDqH9sZ_mLKQ9u3c0g7obK-Yw@mail.gmail.com>
References: <1453198940-31410-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1453198940-31410-2-git-send-email-sean.nyekjaer@prevas.dk>
 <20160119172040.GA8857@rob-hp-laptop> <569F816D.1000309@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <569F816D.1000309@prevas.dk>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 20, 2016 at 6:45 AM, Sean Nyekj=C3=A6r <sean.nyekjaer@preva=
s.dk> wrote:
> Hi
>
> Yes i need to add the gpio-controller and #gpio-cells. But i'm not ex=
actly
> sure what gpio-cells means and its difficult to find in documentation=
=2E

#*-cells are standard properties that a producer sets for clients to
describe their connection and are necessary to know how to parse
properties such as *-gpios in this case.

> I found this in the documentation:
> #gpio-cells: The first cell is the GPIO number and the second cell is=
 used
> to specify the GPIO polarity.
>
> This device only supports inputs so the gpio-cells option needs to be=
 <1>
> or ??
> #gpio-cells =3D <1>;

Most controllers use 2 even if 2nd field is unused. You can use the
2nd field for inputs too. For example, specify that a detect line is
active high or low for detect.

Rob

>
> /Sean
>
>
> On 2016-01-19 18:20, Rob Herring wrote:
>>
>> On Tue, Jan 19, 2016 at 11:22:20AM +0100, Sean Nyekjaer wrote:
>>>
>>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
>>> ---
>>>   Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt | 9
>>> +++++++++
>>>   1 file changed, 9 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885=
=2Etxt
>>> b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
>>> new file mode 100644
>>> index 0000000..56679ac
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
>>> @@ -0,0 +1,9 @@
>>> +* TI SN65HVS885 digital-input serializer
>>> +
>>> +Example:
>>> +       sn65hvs885@3 {
>>> +               compatible =3D "sn65hvs885";
>>> +               spi-max-frequency =3D <10000000>;
>>> +               reg =3D <0>;
>>
>> What about all the standard gpio controller properties?
>>
>>> +       };
>>> +
>>> --
>>> 2.7.0
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe devicetre=
e" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
