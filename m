From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: add MAX3355 driver
Date: Wed, 21 Oct 2015 11:57:09 +0900
Message-ID: <5626FF05.80908@samsung.com>
References: <14631865.01KLlU2iKL@wasted.cogentembedded.com>
 <5490CEE2.1030900@samsung.com> <5491FC69.7090203@cogentembedded.com>
 <562685EF.7010504@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-reply-to: <562685EF.7010504@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

I think this patch is too much delay. I recommend you better to develop
this driver based on latest extcon-next branch[1].
[1] https://git.kernel.org/cgit/linux/kernel/git/chanwoo/extcon.git/log=
/?h=3Dextcon-next

Thanks,
Chanwoo Choi

On 2015=EB=85=84 10=EC=9B=94 21=EC=9D=BC 03:20, Sergei Shtylyov wrote:
> Hello.
>=20
> On 12/18/2014 12:58 AM, Sergei Shtylyov wrote:
>=20
>>>> MAX3355E chip integrates a charge pump and comparators to enable a=
 system with
>>>> an integrated USB OTG dual-role transceiver to function as a USB O=
TG dual-role
>>>> device. In addition to sensing/controlling Vbus, the chip also pas=
ses thru the
>>>> ID signal from the USB OTG connector.  On some Renesas boards, thi=
s signal  is
>>>> just  fed into the SoC thru a GPIO pin -- there's no real OTG cont=
roller, only
>>>> host and gadget USB controllers sharing the same USB bus; however,=
  we'd  like
>>>> to allow host or gadget drivers to be loaded depending on the cabl=
e type,
>>>> hence
>>>> the need for the MAX3355 extcon driver. The Vbus status signals ar=
e also wired
>>>> to GPIOs (however, we're not currently intested in them), the  OFF=
VBUS# signal
>>>> is controlled  by the host controllers, there's also the SHDN# sig=
nal wired to
>>>> GPIO, which should be high for normal operation.
>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com=
>
>>
>>>> ---
>>>> The patch is against the 'extcon-next' branch of the 'extcon.git' =
repo.
>>
>>>>   Documentation/devicetree/bindings/extcon/extcon-max3355.txt |   =
21 ++
>>>>   drivers/extcon/Kconfig                                      |   =
 6
>>>>   drivers/extcon/Makefile                                     |   =
 1
>>>>   drivers/extcon/extcon-max3355.c                             |  1=
22
>>>> ++++++++++++
>>>>   4 files changed, 150 insertions(+)
>>
>>>> Index: extcon/Documentation/devicetree/bindings/extcon/extcon-max3=
355.txt
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> --- /dev/null
>>>> +++ extcon/Documentation/devicetree/bindings/extcon/extcon-max3355=
=2Etxt
>>>> @@ -0,0 +1,21 @@
>>>> +MAX3355 USB OTG chip
>>
>>> Need manufactor information as following :
>>>    -> Maxim MAX3355
>>
>>     Would be Maxim enough? Or perhaps I should use Maxim Integrated =
[Products]?
>=20
>    You haven't replied to my questions.
>=20
>>>> +--------------------
>>>> +
>>>> +MAX3355 integrates a charge pump and comparators to enable a syst=
em with an
>>>> +integrated USB OTG dual-role transceiver to function as a USB OTG=
 dual-role
>>>> +device.
>>>> +
>>>> +Required properties:
>>>> +- compatible: should be "maxim,max3355";
>>>> +- maxim,shdn-gpio: should contain a phandle and GPIO specifier fo=
r the
>>>> GPIO pin
>>>> +  connected to the MAX3355's SHDN# pin;
>>>> +- maxim,id-gpio: should contain a phandle and GPIO specifier for =
the GPIO pin
>>>> +  connected to the MAX3355's ID_OUT pin.
>>>> +
>>>> +Example (Koelsch board):
>>>> +
>>>> +    usb-otg {
>>>> +        compatible =3D "maxim,max3355";
>>>> +        maxim,shdn-gpio =3D <&gpio2 4 GPIO_ACTIVE_LOW>;
>>>> +        maxim,id-gpio =3D <&gpio5 31 GPIO_ACTIVE_HIGH>;
>>
>>> Kernel already supported the gpio helper function to get gpio from =
devicetree.
>>> I prefer use follwoing style by using of_get_gpio()/of_get_gpio_fla=
gs() in
>>> include/linux/of_gpio.h.
>>
>>>         gpios =3D <&gpio2 4 GPIO_ACTIVE_LOW>, <&gpio5 31 GPIO_ACTIV=
E_HIGH>;
>>
>>     OK, though Documentation/devicetree/bindings/gpio/gpio.txt does =
not seem
>> to insist on using this one...
>=20
>    Moreover, it now says "gpios" isn't allowed for the new bindings. =
So I have to strongly disagree here...
>=20
> [...]
>=20
>>>> +static irqreturn_t max3355_id_irq(int irq, void *dev_id)
>>>> +{
>>>> +    struct max3355_data *data =3D dev_id;
>>>> +    int id =3D gpio_get_value(data->id_gpio);
>>>> +
>>>> +    extcon_set_cable_state(data->edev, "USB-HOST", !id);
>>
>>> You have to get the gpio flag in the devicetree by using of_get_gpi=
o_flags()
>>> function
>>> and then you would set the cable state according to gpio state and =
flag.
>>
>>     I'm sorry but I just don't see why I have to do it. This is not =
a generic
>> GPIO driver, and the polarities of the GPIOs are determined solely b=
y the
>> MAX3355 specs.
>=20
>    Again, got not reply...
>=20
>> [...]
>>>> +static int max3355_probe(struct platform_device *pdev)
>>>> +{
>>>> +    struct device_node *np =3D pdev->dev.of_node;
>>>> +    struct max3355_data *data;
>>>> +    int gpio, irq, ret;
>>>> +
>>>> +    data =3D devm_kzalloc(&pdev->dev, sizeof(struct max3355_data)=
,
>>>> +                GFP_KERNEL);
>>>> +    if (!data)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    data->edev =3D devm_extcon_dev_allocate(&pdev->dev, max3355_c=
able);
>>>> +    if (IS_ERR(data->edev)) {
>>>> +        dev_err(&pdev->dev, "failed to allocate extcon device\n")=
;
>>>> +        return PTR_ERR(data->edev);
>>>> +    }
>>>> +    data->edev->name =3D kstrdup(np->name, GFP_KERNEL);
>>>> +
>>>> +    gpio =3D of_get_named_gpio(np, "maxim,id-gpio", 0);
>>
>>> Use of_get_gpio() or of_get_gpio_flags().
>>
>>     OK, I'll use the first one.
>=20
>    No, I won't due to not being able to use "gpios" anymore.
>=20
> [...]
>=20
>>>> +
>>>> +    ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, max3=
355_id_irq,
>>>> +                    IRQF_TRIGGER_RISING |
>>>> +                    IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>>
>>> Is it right to add both RISING and FALLING trigger?
>>
>>     How else I'm supposed to know when the OTG ID signal goes low an=
d high?
>>
>>> and need to add IRQF_NO_SUSPEND to wakeup from suspend state when i=
nterrupt
>>> happen.
>>
>>     Hm, are you sure we want to wake up on plugging another kind of =
USB cable?
>=20
>    No reply to that as well...
>=20
> [...]
>>>> +static struct platform_driver max3355_driver =3D {
>>>> +    .probe        =3D max3355_probe,
>>>> +    .driver        =3D {
>>>> +        .name    =3D "extcon-max3355",
>>>> +        .of_match_table =3D max3355_match_table,
>>>> +        .owner    =3D THIS_MODULE,
>>>> +    },
>>>> +};
>>>> +
>>>> +module_platform_driver(max3355_driver);
>>>> +
>>
>>> Don't need un-used blank line.
>>
>>     I don't understand. There's empty line in such case in extcon-gp=
io.c...
>=20
>    No reply...
>=20
> [...]
>=20
>>> Thanks,
>>> Chanwoo Choi
>=20
> MBR, Sergei
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>=20

