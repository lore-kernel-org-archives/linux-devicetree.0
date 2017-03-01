MIME-Version: 1.0
In-Reply-To: <386c5b7b-0bc0-d286-6cbb-745a5adbc1e9@gmail.com>
References: <20170228120452.10043-1-zajec5@gmail.com>
	<a6d25fb5-db5e-5643-b150-23588944674a@gmail.com>
	<290ed068-2518-50ef-4d02-394bef8b7ee9@gmail.com>
	<CAL_JsqL-N4HfsG=py+w1NsBOJZzS1kbRM5J6dC-EE-rg9r9C2g@mail.gmail.com>
	<386c5b7b-0bc0-d286-6cbb-745a5adbc1e9@gmail.com>
Date: Wed, 1 Mar 2017 16:55:19 -0600
Message-ID: <CAL_JsqKJrarV__0-CSsT-zuQuDVzbmoKN915HC30HPmfmAKZ=g@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: leds: document property for LED triggers
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 1, 2017 at 3:04 PM, Jacek Anaszewski <jacek.anaszewski@gmail.co=
m> wrote:
> On 02/28/2017 11:12 PM, Rob Herring wrote:
>> On Tue, Feb 28, 2017 at 3:51 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.c=
om> wrote:
>>> On 02/28/2017 10:38 PM, Jacek Anaszewski wrote:
>>>>
>>>> I think that it would be simpler if we could initially see
>>>> a complete sample dts implementation containing all required DT
>>>> nodes. The example could contain timer trigger as well as usb-port
>>>> trigger specific bindings.
>>>
>>>
>>> Please take a look at attached patch. I used it on Tenda AC9 with:
>>
>> I'm not sure about this extra level of indirection. I don't see the need=
.
>>
>>> usb_trigger: usb-trigger {
>>>         trigger-type =3D "usbport";
>>
>> Why do we need to know the type? The trigger device knows what type it
>> is. All we should need to know here is what device(s) controls an LED.
>> The rest the kernel can figure out.
>
> The thing is that in the proposed approach the trigger is not necessary
> a device. The trigger node is here only a container with initialization
> data.

That sounds like a questionable use of DT.

> We could have e,g, two such nodes with different set of ports
> (say usb1-trigger and usb2-trigger). Then if we had two LED nodes usb1
> and usb2, the former could have its triggers property initialized
> to &usb1-trigger and the latter to &usb2-trigger. Thanks to that both
> LEDs after executing "echo usbport > triggers" would listen to events
> from different set of usb ports.

This would still work if the trigger property points directly

> Also, e.g. for the timer trigger we could define two separate DT nodes
> with different delay intervals.

That sounds like user config to me.

>
>>>         ports =3D <&ohci_port1>, <&ehci_port1>;
>>> };
>>>
>>> usb {
>>>         label =3D "bcm53xx:blue:usb";
>>>         gpios =3D <&chipcommon 1 GPIO_ACTIVE_HIGH>;
>>>         triggers =3D <&usb_trigger>;
>>> };
>>
>
> --
> Best regards,
> Jacek Anaszewski
