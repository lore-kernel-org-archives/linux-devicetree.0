From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: FW: [PATCH 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Fri, 16 Aug 2013 17:46:08 +0200
Message-ID: <CACRpkdZtCTnjszts03nmNBd-TcMhgYVTpTYzQtH0fW74Pvf-Bg@mail.gmail.com>
References: <1373267079-15843-1-git-send-email-thloh@altera.com>
	<CACRpkdYf_EHwcysQadtOBt2_OXmZbW9CuwOGDBF-JhnNzAd=Bg@mail.gmail.com>
	<CAJKo0K5mycRyd4i9FBa+kg2s7byF4rNgRrjE1Tuv-sTHUpTFiQ@mail.gmail.com>
	<CACRpkdY-er9k6kZh436vmR9V-yivSZ8yu+PuP-jEq3kz__1a0g@mail.gmail.com>
	<CAJKo0K5kBPtLpODjoOgf=JXzVDf9pkpB4QTZ-h8shhHXyx6oZg@mail.gmail.com>
	<CACRpkdbthw=-bdP=QugKhgyuQUV5_uV==AeBneZSqyk7Hs6muQ@mail.gmail.com>
	<0BB3B561D7068A4E89FD8E9ABFB538BEB3B6A29252@PG-ITMSG03.altera.priv.altera.com>
	<CAJKo0K5qnYpO5D-qOd6ygHDqvfCJB+3GmC+AwhytmQ2bMPyN1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAJKo0K5qnYpO5D-qOd6ygHDqvfCJB+3GmC+AwhytmQ2bMPyN1g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Loh Tien Hock <thloh@altera.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Loh Tien Hock <thloh85@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2013 at 5:06 PM, Loh Tien Hock <thloh@altera.com> wrote:
>> On Mon, Jul 29, 2013 at 6:24 PM, Loh Tien Hock <thloh@altera.com> wrote:
>>> On Tue, Jul 30, 2013 at 12:11 AM, Linus Walleij

>>> We still need to compare the altera_gc->edge_type to the expected ones
>>> (so that we don't allow incorrect configuration, eg. the GPIO is
>>> configured as rising, but set_type tries to set falling).
>>> So we should compare it with magic numbers, instead of custom defines
>>> like the example below?
>>>                if (type == IRQ_TYPE_EDGE_RISING &&
>>>                        altera_gc->edge_type == 0)
>>>                        return 0;
>>
>> And why can't altera_gc->edge_type use exactly the same enumerators so it becomes:
>>
>> (type == IRQ_TYPE_EDGE_RISING &&
>> altera_gc->edge_type == IRQ_TYPE_EDGE_RISING)
>>
>> ?
>
> We're unable to do that because the tool that generates the dts file
> had the number that way, and if we were to change to code to your
> suggestion, the tool needs to be changed and it will break backward
> compatibility.

Sorry? The values used in DTS bindings are decided on the mailing
list devicetree@vger.kernel.org, not by your proprietary tools. This
should have been discussed with the apropriate authorities *before*
implementing funny tools, DT bindings are not owned or defined by
any one company.

Please study this binding include:
include/dt-bindings/interrupt-controller/irq.h:

#define IRQ_TYPE_NONE           0
#define IRQ_TYPE_EDGE_RISING    1
#define IRQ_TYPE_EDGE_FALLING   2
#define IRQ_TYPE_EDGE_BOTH      (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING)
#define IRQ_TYPE_LEVEL_HIGH     4
#define IRQ_TYPE_LEVEL_LOW      8

Please use this binding, nothing else.

Yours,
Linus Walleij
