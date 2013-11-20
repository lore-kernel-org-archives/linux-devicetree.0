From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/1] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Wed, 20 Nov 2013 17:40:23 -0600
Message-ID: <CAL_JsqKjrPmExaeDLEt0C2eTv+Uw7kgHfd3URoim2pzTQYeXAg@mail.gmail.com>
References: <1383778182-16941-1-git-send-email-delicious.quinoa@gmail.com>
	<1383778182-16941-2-git-send-email-delicious.quinoa@gmail.com>
	<527B8895.3050305@gmail.com>
	<CANk1AXTLR_jnNr8bbY-YcKA+s3_HgWBDzYR_BiHMqUpv2PYKFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CANk1AXTLR_jnNr8bbY-YcKA+s3_HgWBDzYR_BiHMqUpv2PYKFw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: delicious quinoa <delicious.quinoa@gmail.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@stericsson.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jamie Iles <jamie@jamieiles.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 20, 2013 at 3:47 PM, delicious quinoa
<delicious.quinoa@gmail.com> wrote:
> On Thu, Nov 7, 2013 at 6:33 AM, Sebastian Hesselbarth
> <sebastian.hesselbarth@gmail.com> wrote:
>> On 11/06/13 23:49, Alan Tull wrote:

[snip]

>> BTW, what if we get rid of port child nodes completely and rather
>> use:
>>
>> gpio: gpio-controller@20000 {
>>         compatible = "snps,dw-apb-gpio";
>>         reg = <0x20000 0x1000>;
>>         gpio-controller;
>>         #gpio-cells = <2>;
>>         interrupt-controller;
>>         interrupt-parent = <&vic1>;
>>         interrupts = <0 1 2 3 4 5 6 7>;
>>         snps,port-widths = <8 8 0 0>;
>> };
>>
>> The only draw-back compared to child-nodes is, that you'll reference
>> gpios with <&gpio 13> instead of <&banka 5>. I have no strong opinion
>> about it, so I leave the correct answer to either LinusW or DT
>> maintainers.
>
> I left this as-is for now.

I generally favor less nodes of things, but I think we discussed this
when originally posted and keeping them seemed to be the right choice.
What if you have sparsely populated banks like this:

snps,port-widths = <4 4 0 0>;
snps,port-widths = <8 0 8 0>;

Also, you would need to define how the interrupts are done. You may
have 1 per port or 1 per gpio line or a mixture if the h/w folks
really hate you.

Rob
