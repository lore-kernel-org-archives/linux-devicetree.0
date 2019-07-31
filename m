From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH 12/22] ARM: dts: imx6: Add touchscreens used on Toradex
 eval boards
Date: Wed, 31 Jul 2019 08:54:35 +0200
Message-ID: <e0f508aa-61d1-d555-040b-aa28e3ea8220@ysoft.com>
References: <20190730144649.19022-1-dev@pschenker.ch>
 <20190730144649.19022-13-dev@pschenker.ch>
 <CAOMZO5DRi6yawn3RF-Mouiejz0nc7htdsCjOBC_EXZZKUZ3nvA@mail.gmail.com>
 <60760aa2d4710252e13877c409d0c4d2267824a6.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <60760aa2d4710252e13877c409d0c4d2267824a6.camel@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>, "festevam@gmail.com" <festevam@gmail.com>
Cc: "stefan@agner.ch" <stefan@agner.ch>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Max Krummenacher <max.krummenacher@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 31. 07. 19 8:43, Philippe Schenker wrote:
> On Tue, 2019-07-30 at 17:46 -0300, Fabio Estevam wrote:
>> On Tue, Jul 30, 2019 at 11:57 AM Philippe Schenker <dev@pschenker.ch> wrote:
>>
>>> +       /* Atmel maxtouch controller */
>>> +       atmel_mxt_ts: atmel_mxt_ts@4a {
>>
>> Generic node names, please:
>>
>> touchscreen@4a
>>
>>> +               compatible = "atmel,maxtouch";
>>> +               pinctrl-names = "default";
>>> +               pinctrl-0 = <&pinctrl_pcap_1>;
>>> +               reg = <0x4a>;
>>> +               interrupt-parent = <&gpio1>;
>>> +               interrupts = <9 IRQ_TYPE_EDGE_FALLING>; /* SODIMM 28 */
>>> +               reset-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>; /* SODIMM 30 */
>>> +               status = "disabled";
>>> +       };
>>> +
>>> +       /*
>>> +        * the PCAPs use SODIMM 28/30, also used for PWM<B>, PWM<C>, aka
>>> pwm1,
>>> +        * pwm4. So if you enable one of the PCAP controllers disable the
>>> pwms.
>>> +        */
>>> +       pcap: pcap@10 {
>>
>> touchscreen@10
>>
>>> +               /* TouchRevolution Fusion 7 and 10 multi-touch controller */
>>> +               compatible = "touchrevolution,fusion-f0710a";
>>
>> I do not find this binding documented.
> 
> Thanks for your feedback Fabio, and sorry such obvious stuff went through. I
> will go through my whole patchset again more carefully lookup all the bindings.
>
Hi Philippe,
also look at the I2C sub-nodes - they should be sorted by the bus address.
In most of the patches it is not correct.

Michal
