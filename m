From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3] extcon: add Maxim MAX3355 driver
Date: Fri, 18 Dec 2015 00:20:25 +0300
Message-ID: <56732719.7020301@cogentembedded.com>
References: <2473780.4IzuWX8hE2@wasted.cogentembedded.com>
 <56721AFE.9020103@samsung.com> <56721F31.5060608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <56721F31.5060608@samsung.com>
Sender: linux-sh-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-sh@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 12/17/2015 05:34 AM, Chanwoo Choi wrote:

>> On 2015=EB=85=84 12=EC=9B=94 17=EC=9D=BC 03:07, Sergei Shtylyov wrot=
e:
>>> Maxim Integrated MAX3355E chip integrates a charge pump and compara=
tors to
>>> enable a system with an integrated USB OTG dual-role transceiver to
>>> function as an USB OTG dual-role device. In addition to sensing/con=
trolling
>>> Vbus, the chip also passes thru the ID signal from the USB OTG conn=
ector.
>>> On some Renesas boards, this signal is just fed into the SoC thru a=
 GPIO
>>> pin -- there's no real OTG controller, only host and gadget USB con=
trollers
>>> sharing the same USB bus; however, we'd like to allow host or gadge=
t
>>> drivers to be loaded depending on the cable type, hence the need fo=
r the
>>> MAX3355 extcon driver. The Vbus status signals are also wired to GP=
IOs
>>> (however, we aren't currently interested in them), the OFFVBUS# sig=
nal is
>>> controlled by the host controllers, there's also the SHDN# signal w=
ired to
>>> a GPIO, it should be driven high for the normal operation.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> ---
>>> Changes in version 3:
>>> - reformatted the change log.
>>>
>>> Changes in version 2:
>>> - added the USB gadget cable support;
>>> - added the remove() driver method which drives SHDN# GPIO low to s=
ave power;
>>> - dropped vendor prefix from the ID GPIO property name;
>>> - changed the GPIO property name suffix to "-gpios";
>>> - switched to usign extcon_set_cable_state_() API;
>>> - switched to using the gpiod/sleeping 'gpiolib' APIs;
>>> - addded error messages to max3355_probe();
>>> - added IRQF_NO_SUSPEND flasg to the devm_request_threaded_irq() ca=
ll;
>>> - renamed 'ret' variable to 'err' in max3355_probe();
>>> - expanded the Kconfig entry help text;
>>> - added vendor name to the patch summary, the bindings document, th=
e Kconfig
>>>    entry, the driver heading comment, the module description, and t=
he change log;
>>> - fixed up and reformatted the change log.
>>>
>>>   Documentation/devicetree/bindings/extcon/extcon-max3355.txt |   2=
1 +
>>>   drivers/extcon/Kconfig                                      |    =
8
>>>   drivers/extcon/Makefile                                     |    =
1
>>>   drivers/extcon/extcon-max3355.c                             |  15=
3 ++++++++++++
>>>   4 files changed, 183 insertions(+)
>>>
>
> [snip]
>
>>> +	return 0;
>>> +}
>>> +
>>> +static int max3355_remove(struct platform_device *pdev)
>>> +{
>>> +	struct max3355_data *data =3D platform_get_drvdata(pdev);
>>> +
>>> +	gpiod_set_value_cansleep(data->shdn_gpiod, 0);
>
> Don't need to handle the 'shdn' gpio on resume/suspend funtcion?
>
> But, if the interrput of id gpio is used for wakeup source,
> there is no reason to handle it for suspend mode.

    You told me to pass IRQF_NO_SUSPEND to devm_request_threaded_irq(),=
 didn't=20
you?

> [snip]

> Thanks,
> Chanwoo Choi

MBR, Sergei

