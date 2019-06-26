From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
Date: Wed, 26 Jun 2019 18:05:47 +0100
Message-ID: <20c6cd30-642d-5f6e-15b8-2ef925ed90a6@arm.com>
References: <20190603083005.4304-1-peng.fan@nxp.com>
 <20190603083005.4304-3-peng.fan@nxp.com>
 <CABb+yY1wW-arSMQSYjrezXOZ0Ar_shAr78MOyUD3hBxXohWx3g@mail.gmail.com>
 <AM0PR04MB4481210CE83416353575C3D988E30@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB4481210CE83416353575C3D988E30@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, ", Sascha Hauer" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

On 25/06/2019 08:20, Peng Fan wrote:
> Hi Jassi,
> 
>> -----Original Message-----
>> From: Jassi Brar [mailto:jassisinghbrar@gmail.com]
>> Sent: 2019年6月21日 0:50
>> To: Peng Fan <peng.fan@nxp.com>
>> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
>> <mark.rutland@arm.com>; Sudeep Holla <sudeep.holla@arm.com>; Florian
>> Fainelli <f.fainelli@gmail.com>; , Sascha Hauer <kernel@pengutronix.de>;
>> dl-linux-imx <linux-imx@nxp.com>; Shawn Guo <shawnguo@kernel.org>;
>> festevam@gmail.com; Devicetree List <devicetree@vger.kernel.org>; Linux
>> Kernel Mailing List <linux-kernel@vger.kernel.org>;
>> linux-arm-kernel@lists.infradead.org; Andre Przywara
>> <andre.przywara@arm.com>; van.freenix@gmail.com
>> Subject: Re: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
>>
>> On Mon, Jun 3, 2019 at 3:28 AM <peng.fan@nxp.com> wrote:
>>>
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> This mailbox driver implements a mailbox which signals transmitted
>>> data via an ARM smc (secure monitor call) instruction. The mailbox
>>> receiver is implemented in firmware and can synchronously return data
>>> when it returns execution to the non-secure world again.
>>> An asynchronous receive path is not implemented.
>>> This allows the usage of a mailbox to trigger firmware actions on SoCs
>>> which either don't have a separate management processor or on which
>>> such a core is not available. A user of this mailbox could be the SCP
>>> interface.
>>>
>>> Modified from Andre Przywara's v2 patch
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
>>> .kernel.org%2Fpatchwork%2Fpatch%2F812999%2F&amp;data=02%7C01%7
>> Cpeng.fa
>>>
>> n%40nxp.com%7C1237677cb01044ad714508d6f59f648f%7C686ea1d3bc2b4
>> c6fa92cd
>>>
>> 99c5c301635%7C0%7C0%7C636966462272457978&amp;sdata=Hzgeu43m5
>> ZkeRMtL8Bx
>>> gUm3%2B6FBObib1OPHPlSccE%2B0%3D&amp;reserved=0
>>>
>>> Cc: Andre Przywara <andre.przywara@arm.com>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>
>>> V2:
>>>  Add interrupts notification support.
>>>
>>>  drivers/mailbox/Kconfig                 |   7 ++
>>>  drivers/mailbox/Makefile                |   2 +
>>>  drivers/mailbox/arm-smc-mailbox.c       | 190
>> ++++++++++++++++++++++++++++++++
>>>  include/linux/mailbox/arm-smc-mailbox.h |  10 ++
>>>  4 files changed, 209 insertions(+)
>>>  create mode 100644 drivers/mailbox/arm-smc-mailbox.c  create mode
>>> 100644 include/linux/mailbox/arm-smc-mailbox.h
>>>
>>> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig index
>>> 595542bfae85..c3bd0f1ddcd8 100644
>>> --- a/drivers/mailbox/Kconfig
>>> +++ b/drivers/mailbox/Kconfig
>>> @@ -15,6 +15,13 @@ config ARM_MHU
>>>           The controller has 3 mailbox channels, the last of which can be
>>>           used in Secure mode only.
>>>
>>> +config ARM_SMC_MBOX
>>> +       tristate "Generic ARM smc mailbox"
>>> +       depends on OF && HAVE_ARM_SMCCC
>>> +       help
>>> +         Generic mailbox driver which uses ARM smc calls to call into
>>> +         firmware for triggering mailboxes.
>>> +
>>>  config IMX_MBOX
>>>         tristate "i.MX Mailbox"
>>>         depends on ARCH_MXC || COMPILE_TEST diff --git
>>> a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile index
>>> c22fad6f696b..93918a84c91b 100644
>>> --- a/drivers/mailbox/Makefile
>>> +++ b/drivers/mailbox/Makefile
>>> @@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)      += mailbox-test.o
>>>
>>>  obj-$(CONFIG_ARM_MHU)  += arm_mhu.o
>>>
>>> +obj-$(CONFIG_ARM_SMC_MBOX)     += arm-smc-mailbox.o
>>> +
>>>  obj-$(CONFIG_IMX_MBOX) += imx-mailbox.o
>>>
>>>  obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)    +=
>> armada-37xx-rwtm-mailbox.o
>>> diff --git a/drivers/mailbox/arm-smc-mailbox.c
>>> b/drivers/mailbox/arm-smc-mailbox.c
>>> new file mode 100644
>>> index 000000000000..fef6e38d8b98
>>> --- /dev/null
>>> +++ b/drivers/mailbox/arm-smc-mailbox.c
>>> @@ -0,0 +1,190 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2016,2017 ARM Ltd.
>>> + * Copyright 2019 NXP
>>> + */
>>> +
>>> +#include <linux/arm-smccc.h>
>>> +#include <linux/device.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/mailbox_controller.h> #include
>>> +<linux/mailbox/arm-smc-mailbox.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#define ARM_SMC_MBOX_USE_HVC   BIT(0)
>>> +#define ARM_SMC_MBOX_USB_IRQ   BIT(1)
>>> +
>> IRQ bit is unused (and unnecessary IMO)
> 
> This will be removed in next version.
> 
>>
>>> +struct arm_smc_chan_data {
>>> +       u32 function_id;
>>> +       u32 flags;
>>> +       int irq;
>>> +};
>>> +
>>> +static int arm_smc_send_data(struct mbox_chan *link, void *data) {
>>> +       struct arm_smc_chan_data *chan_data = link->con_priv;
>>> +       struct arm_smccc_mbox_cmd *cmd = data;
>>> +       struct arm_smccc_res res;
>>> +       u32 function_id;
>>> +
>>> +       if (chan_data->function_id != UINT_MAX)
>>> +               function_id = chan_data->function_id;
>>> +       else
>>> +               function_id = cmd->a0;
>>> +
>> Not sure about chan_data->function_id.  Why restrict from DT?
>> 'a0' is the function_id register, let the user pass func-id via the 'a0' like other
>> values via 'a[1-7]'
>>
>>
>>> +       if (chan_data->flags & ARM_SMC_MBOX_USE_HVC)
>>> +               arm_smccc_hvc(function_id, cmd->a1, cmd->a2,
>> cmd->a3, cmd->a4,
>>> +                             cmd->a5, cmd->a6, cmd->a7, &res);
>>> +       else
>>> +               arm_smccc_smc(function_id, cmd->a1, cmd->a2,
>> cmd->a3, cmd->a4,
>>> +                             cmd->a5, cmd->a6, cmd->a7, &res);
>>> +
>>> +       if (chan_data->irq)
>>> +               return 0;
>>> +
>> This irq thing seems like oob signalling, that is, a protocol thing.
>> And then it provides lesser info via chan_irq_handler (returns NULL) than
>> res.a0 - which can always be ignored if not needed.
>> So the irq should be implemented in the upper layer if the protocol needs it.
> 
> The interrupts was added here because in v1, Florian suggest
> "
> I would just put a
> provision in the binding to support an optional interrupt such that
> asynchronism gets reasonably easy to plug in when it is available (and
> desirable).
> "
> 
> So I introduced interrupt in V2. In my testcase, after smc call done,
> it means firmware->smc mailbox->firmware done. Interrupt notification
> from firmware->Linux, means firmware has done the operation.
> 
> When using interrupts, we could not know res.a0 as smc sync call.
> 
> Interrupts is not a must in my testcase, Florian, Andre, do you have
> any comments? Should I keep interrupts in V3 or drop it as Jassi comments?

The smc mailbox is by its very design a one-way channel - and it's
synchronous. I think this is all the mailbox driver should be concerned
about. The fact that there is a protocol user that would benefit from a
return channel is a separate issue.
The SCMI binding explicitly mentions *two* mailboxes, one TX, one RX, so
the return channel could be very well implemented by a separate driver.
I am wondering if we get away without a functioning return channel, at
least for a subset of SCMI functionality? Can we use some dummy driver?
Or specify another smc channel with some unhandled/ignored channel ID
for that purpose?

So I would leave the IRQ return channel out for now, unless we
desperately need it.

Cheers,
Andre.
