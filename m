From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3] extcon: gpio: Add the support for Device tree bindings
Date: Wed, 21 Oct 2015 17:35:56 -0500
Message-ID: <CAL_JsqJczcqbNuT50aKK6RZMidJE0X=XQy8o5pe9V6qtKWkoNA@mail.gmail.com>
References: <1445402226-3912-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445402226-3912-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Sudeep Holla <Sudeep.Holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, myungjoo.ham@samsung.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 20, 2015 at 11:37 PM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> This patch adds the support for Device tree bindings of extcon-gpio driver.
> The extcon-gpio device tree node must include the both 'extcon-id' and
> 'extcon-gpio' property.

I think this is too tied to the Linux driver. Instead, think about
what the connector contains. I think you should define a usb connector
node and compatible (e.g. usb-connector or usb-ab-connector). This
probably needs to distinguish the connector type as well especially
with TypeC coming.

>
> For exmaple:
>         usb_cable: extcon-gpio-0 {
>                 compatible = "extcon-gpio";
>                 extcon-id = <EXTCON_USB>;
>                 extcon-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;

This tied to a Vbus detect circuit?

So "vbus-detect-gpios" in the connector node.

For host side (or OTG host mode), you may also need a vbus-supply
regulator property. OTG will also need an id-gpios for ID pin.

>         }
>
>         ta_cable: extcon-gpio-1 {

This is all the same connector as above?

>                 compatible = "extcon-gpio";
>                 extcon-id = <EXTCON_CHG_USB_DCP>;
>                 extcon-gpio = <&gpio3 2 GPIO_ACTIVE_LOW>;

This is just detecting D+ and D- are both pulled high?

So "dcp-detect-gpios" in the connector node.

>                 debounce-ms = <50>;     /* 50 millisecond */
>                 wakeup-source;

wakeup-source implies an interrupt as I read Sudeep's series. Either
gpios need to be allowed or these need to be defined as interrupts.

>         }
>
>         &dwc3_usb {
>                 extcon = <&usb_cable>;
>         };
>
>         &charger {
>                 extcon = <&ta_cable>;

Not sure what to do with this. Both can point to a single connector
node I think.

Rob
