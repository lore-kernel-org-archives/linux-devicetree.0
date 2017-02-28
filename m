From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: leds: document property for LED triggers
Date: Tue, 28 Feb 2017 16:12:20 -0600
Message-ID: <CAL_JsqL-N4HfsG=py+w1NsBOJZzS1kbRM5J6dC-EE-rg9r9C2g@mail.gmail.com>
References: <20170228120452.10043-1-zajec5@gmail.com> <a6d25fb5-db5e-5643-b150-23588944674a@gmail.com>
 <290ed068-2518-50ef-4d02-394bef8b7ee9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
In-Reply-To: <290ed068-2518-50ef-4d02-394bef8b7ee9@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 3:51 PM, Rafał Miłecki <zajec5@gmail.com> wrote:
> On 02/28/2017 10:38 PM, Jacek Anaszewski wrote:
>>
>> I think that it would be simpler if we could initially see
>> a complete sample dts implementation containing all required DT
>> nodes. The example could contain timer trigger as well as usb-port
>> trigger specific bindings.
>
>
> Please take a look at attached patch. I used it on Tenda AC9 with:

I'm not sure about this extra level of indirection. I don't see the need.

> usb_trigger: usb-trigger {
>         trigger-type = "usbport";

Why do we need to know the type? The trigger device knows what type it
is. All we should need to know here is what device(s) controls an LED.
The rest the kernel can figure out.

>         ports = <&ohci_port1>, <&ehci_port1>;
> };
>
> usb {
>         label = "bcm53xx:blue:usb";
>         gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
>         triggers = <&usb_trigger>;
> };
