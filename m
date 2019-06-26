From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
Date: Wed, 26 Jun 2019 10:07:45 -0700
Message-ID: <886589a4-cc51-1c01-6ade-4a6a683407d2@gmail.com>
References: <20190603083005.4304-1-peng.fan@nxp.com>
 <20190603083005.4304-3-peng.fan@nxp.com>
 <CABb+yY1wW-arSMQSYjrezXOZ0Ar_shAr78MOyUD3hBxXohWx3g@mail.gmail.com>
 <AM0PR04MB4481210CE83416353575C3D988E30@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20c6cd30-642d-5f6e-15b8-2ef925ed90a6@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20c6cd30-642d-5f6e-15b8-2ef925ed90a6@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>, Peng Fan <peng.fan@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, ", Sascha Hauer" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

On 6/26/19 10:05 AM, André Przywara wrote:
>> So I introduced interrupt in V2. In my testcase, after smc call done,
>> it means firmware->smc mailbox->firmware done. Interrupt notification
>> from firmware->Linux, means firmware has done the operation.
>>
>> When using interrupts, we could not know res.a0 as smc sync call.
>>
>> Interrupts is not a must in my testcase, Florian, Andre, do you have
>> any comments? Should I keep interrupts in V3 or drop it as Jassi comments?
> 
> The smc mailbox is by its very design a one-way channel - and it's
> synchronous. I think this is all the mailbox driver should be concerned
> about. The fact that there is a protocol user that would benefit from a
> return channel is a separate issue.
> The SCMI binding explicitly mentions *two* mailboxes, one TX, one RX, so
> the return channel could be very well implemented by a separate driver.
> I am wondering if we get away without a functioning return channel, at
> least for a subset of SCMI functionality? Can we use some dummy driver?
> Or specify another smc channel with some unhandled/ignored channel ID
> for that purpose?
> 
> So I would leave the IRQ return channel out for now, unless we
> desperately need it.

That's fine, the initial point was specifically about the binding
already defining an optional interrupt property, but that can be removed
too if this is too much confusion or opens up the discussion beyond this
submission.
-- 
Florian
