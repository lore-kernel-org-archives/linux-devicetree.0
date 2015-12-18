From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] extcon: add Maxim MAX3355 driver
Date: Fri, 18 Dec 2015 10:04:13 +0900
Message-ID: <56735B8D.7030705@samsung.com>
References: <2473780.4IzuWX8hE2@wasted.cogentembedded.com>
 <56721AFE.9020103@samsung.com> <56721F31.5060608@samsung.com>
 <56732719.7020301@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <56732719.7020301-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 12=EC=9B=94 18=EC=9D=BC 06:20, Sergei Shtylyov wrote:
> Hello.
>=20
> On 12/17/2015 05:34 AM, Chanwoo Choi wrote:
>=20
>>> On 2015=EB=85=84 12=EC=9B=94 17=EC=9D=BC 03:07, Sergei Shtylyov wro=
te:
>>>> Maxim Integrated MAX3355E chip integrates a charge pump and compar=
ators to
>>>> enable a system with an integrated USB OTG dual-role transceiver t=
o
>>>> function as an USB OTG dual-role device. In addition to sensing/co=
ntrolling
>>>> Vbus, the chip also passes thru the ID signal from the USB OTG con=
nector.
>>>> On some Renesas boards, this signal is just fed into the SoC thru =
a GPIO
>>>> pin -- there's no real OTG controller, only host and gadget USB co=
ntrollers
>>>> sharing the same USB bus; however, we'd like to allow host or gadg=
et
>>>> drivers to be loaded depending on the cable type, hence the need f=
or the
>>>> MAX3355 extcon driver. The Vbus status signals are also wired to G=
PIOs
>>>> (however, we aren't currently interested in them), the OFFVBUS# si=
gnal is
>>>> controlled by the host controllers, there's also the SHDN# signal =
wired to
>>>> a GPIO, it should be driven high for the normal operation.
>>>>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org=
>
>>>>
>>>> ---
>>>> Changes in version 3:
>>>> - reformatted the change log.
>>>>
>>>> Changes in version 2:
>>>> - added the USB gadget cable support;
>>>> - added the remove() driver method which drives SHDN# GPIO low to =
save power;
>>>> - dropped vendor prefix from the ID GPIO property name;
>>>> - changed the GPIO property name suffix to "-gpios";
>>>> - switched to usign extcon_set_cable_state_() API;
>>>> - switched to using the gpiod/sleeping 'gpiolib' APIs;
>>>> - addded error messages to max3355_probe();
>>>> - added IRQF_NO_SUSPEND flasg to the devm_request_threaded_irq() c=
all;
>>>> - renamed 'ret' variable to 'err' in max3355_probe();
>>>> - expanded the Kconfig entry help text;
>>>> - added vendor name to the patch summary, the bindings document, t=
he Kconfig
>>>>    entry, the driver heading comment, the module description, and =
the change log;
>>>> - fixed up and reformatted the change log.
>>>>
>>>>   Documentation/devicetree/bindings/extcon/extcon-max3355.txt |   =
21 +
>>>>   drivers/extcon/Kconfig                                      |   =
 8
>>>>   drivers/extcon/Makefile                                     |   =
 1
>>>>   drivers/extcon/extcon-max3355.c                             |  1=
53 ++++++++++++
>>>>   4 files changed, 183 insertions(+)
>>>>
>>
>> [snip]
>>
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int max3355_remove(struct platform_device *pdev)
>>>> +{
>>>> +    struct max3355_data *data =3D platform_get_drvdata(pdev);
>>>> +
>>>> +    gpiod_set_value_cansleep(data->shdn_gpiod, 0);
>>
>> Don't need to handle the 'shdn' gpio on resume/suspend funtcion?
>>
>> But, if the interrput of id gpio is used for wakeup source,
>> there is no reason to handle it for suspend mode.
>=20
>    You told me to pass IRQF_NO_SUSPEND to devm_request_threaded_irq()=
, didn't you?

Yes. You add the this flag on v4 patch. Looks good to me.

Thanks,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
