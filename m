From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: add MAX3355 driver
Date: Tue, 10 Nov 2015 08:52:26 +0900
Message-ID: <564131BA.9010809@samsung.com>
References: <14631865.01KLlU2iKL@wasted.cogentembedded.com>
 <5490CEE2.1030900@samsung.com> <5491FC69.7090203@cogentembedded.com>
 <562685EF.7010504@cogentembedded.com> <5629CBFA.4020605@samsung.com>
 <5640E4D5.4020001@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5640E4D5.4020001@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

I received the reply from you after too long time (17~18day).
You better to reply it more a little more quickly
if you have the question or new patches.

On 2015=EB=85=84 11=EC=9B=94 10=EC=9D=BC 03:24, Sergei Shtylyov wrote:
> Hello.
>=20
> On 10/23/2015 08:56 AM, Chanwoo Choi wrote:
>=20
>>>>>> MAX3355E chip integrates a charge pump and comparators to enable=
 a system with
>>>>>> an integrated USB OTG dual-role transceiver to function as a USB=
 OTG dual-role
>>>>>> device. In addition to sensing/controlling Vbus, the chip also p=
asses thru the
>>>>>> ID signal from the USB OTG connector.  On some Renesas boards, t=
his signal  is
>>>>>> just  fed into the SoC thru a GPIO pin -- there's no real OTG co=
ntroller, only
>>>>>> host and gadget USB controllers sharing the same USB bus; howeve=
r,  we'd  like
>>>>>> to allow host or gadget drivers to be loaded depending on the ca=
ble type,
>>>>>> hence
>>>>>> the need for the MAX3355 extcon driver. The Vbus status signals =
are also wired
>>>>>> to GPIOs (however, we're not currently intested in them), the  O=
=46FVBUS# signal
>>>>>> is controlled  by the host controllers, there's also the SHDN# s=
ignal wired to
>>>>>> GPIO, which should be high for normal operation.
>>>>
>>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.c=
om>
>>>>
>>>>>> ---
>>>>>> The patch is against the 'extcon-next' branch of the 'extcon.git=
' repo.
>>>>
>>>>>>    Documentation/devicetree/bindings/extcon/extcon-max3355.txt |=
   21 ++
>>>>>>    drivers/extcon/Kconfig                                      |=
    6
>>>>>>    drivers/extcon/Makefile                                     |=
    1
>>>>>>    drivers/extcon/extcon-max3355.c                             |=
  122
>>>>>> ++++++++++++
>>>>>>    4 files changed, 150 insertions(+)
>>>>
>>>>>> Index: extcon/Documentation/devicetree/bindings/extcon/extcon-ma=
x3355.txt
>>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> --- /dev/null
>>>>>> +++ extcon/Documentation/devicetree/bindings/extcon/extcon-max33=
55.txt
>>>>>> @@ -0,0 +1,21 @@
>>>>>> +MAX3355 USB OTG chip
>>>>
>>>>> Need manufactor information as following :
>>>>>     -> Maxim MAX3355
>>>>
>>>>      Would be Maxim enough? Or perhaps I should use Maxim Integrat=
ed [Products]?
>>>
>>>     You haven't replied to my questions.
>>>
>>>>>> +--------------------
>>>>>> +
>>>>>> +MAX3355 integrates a charge pump and comparators to enable a sy=
stem with an
>>>>>> +integrated USB OTG dual-role transceiver to function as a USB O=
TG dual-role
>>>>>> +device.
>>>>>> +
>>>>>> +Required properties:
>>>>>> +- compatible: should be "maxim,max3355";
>>>>>> +- maxim,shdn-gpio: should contain a phandle and GPIO specifier =
for the
>>>>>> GPIO pin
>>>>>> +  connected to the MAX3355's SHDN# pin;
>>>>>> +- maxim,id-gpio: should contain a phandle and GPIO specifier fo=
r the GPIO pin
>>>>>> +  connected to the MAX3355's ID_OUT pin.
>>>>>> +
>>>>>> +Example (Koelsch board):
>>>>>> +
>>>>>> +    usb-otg {
>>>>>> +        compatible =3D "maxim,max3355";
>>>>>> +        maxim,shdn-gpio =3D <&gpio2 4 GPIO_ACTIVE_LOW>;
>>>>>> +        maxim,id-gpio =3D <&gpio5 31 GPIO_ACTIVE_HIGH>;
>>>>
>>>>> Kernel already supported the gpio helper function to get gpio fro=
m devicetree.
>>>>> I prefer use follwoing style by using of_get_gpio()/of_get_gpio_f=
lags() in
>>>>> include/linux/of_gpio.h.
>>>>
>>>>>          gpios =3D <&gpio2 4 GPIO_ACTIVE_LOW>, <&gpio5 31 GPIO_AC=
TIVE_HIGH>;
>>>>
>>>>      OK, though Documentation/devicetree/bindings/gpio/gpio.txt do=
es not seem
>>>> to insist on using this one...
>>>
>>>     Moreover, it now says "gpios" isn't allowed for the new binding=
s. So I have to strongly disagree here...
>>
>> OK. But, I recommend you use the 'gpiod' with devm_gpiod_get
>> instead of using devm_gpio_request_one() directly as following:
>> You can refer drivers/extcon/extcon-usb-gpio.c about using gpiod.
>>
>> For example,
>>     data->shdn_gpiod =3D devm_gpiod_get(dev, "maxim,shdn", GPIOD_IN)=
;
>>     data->id_gpiod =3D devm_gpiod_get(dev, "maxim,id", GPIOD_IN);
>=20
>    Thanks, done now. I just had another idea: how about I add an opti=
onal "enable-gpio" property to the 'extcon-usb-gpio' driver? I wouldn't=
 need my own driver then at all... :-)

What is meaning of 'enable-gpio' property?
You better to explain your goal about 'enable-gpio' property

Also, If you think that it is generic way about
adding 'enable-gpio' property to extcon-usb-gpio.c,
you can try it.

Thanks,
Chanwoo Choi
