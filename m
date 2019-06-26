From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH V2 2/2] mailbox: introduce ARM SMC based mailbox
Date: Wed, 26 Jun 2019 09:44:06 -0700
Message-ID: <e49278ba-f734-e019-ab44-53afe558bd85@gmail.com>
References: <20190603083005.4304-1-peng.fan@nxp.com>
 <20190603083005.4304-3-peng.fan@nxp.com>
 <CABb+yY1wW-arSMQSYjrezXOZ0Ar_shAr78MOyUD3hBxXohWx3g@mail.gmail.com>
 <AM0PR04MB44813A4DE544E53EB7B6F02B88E30@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CABb+yY38MAZqVOhjyV+GByPvpFcTfKbNG1rJ8YDRd1vi1F4fqg@mail.gmail.com>
 <AM0PR04MB44814D3BD59033ECDDE3094C88E20@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB44814D3BD59033ECDDE3094C88E20@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peng Fan <peng.fan@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, ", Sascha Hauer" <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, "van.freenix@gmail.com" <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 6/26/19 6:31 AM, Peng Fan wrote:
>>> The firmware driver might not have func-id, such as SCMI/SCPI.
>>> So add an optional func-id to let smc mailbox driver could
>>> use smc SiP func id.
>>>
>> There is no end to conforming to protocols. Controller drivers should
>> be written having no particular client in mind.
> 
> If the func-id needs be passed from user, then the chan_id suggested
> by Sudeep should also be passed from user, not in mailbox driver.
> 
> Jassi, so from your point, arm_smc_send_data just send a0 - a6
> to firmware, right?
> 
> Sudeep, Andre, Florian,
> 
> What's your suggestion? SCMI not support, do you have
> plan to add smc transport in SCMI?

On the platforms that I work with, we have taken the liberty of
implementing SCMI in our monitor firmware because the other MCU we use
for dynamic voltage and frequency scaling did not have enough memory to
support that and we still had the ability to make that firmware be
trusted enough we could give it power management responsibilities. I
would certainly feel more comfortable if the SCMI specification was
amended to indicate that the Agent could be such a software entity,
still residing on the same host CPU as the Platform(s), but if not,
that's fine.

This has lead us to implement a mailbox driver that uses a proprietary
SMC call for the P2A path ("tx" channel) and the return being done via
either that same SMC or through SGI. You can take a look at it in our
downstream tree here actually:

https://github.com/Broadcom/stblinux-4.9/blob/master/linux/drivers/mailbox/brcmstb-mailbox.c

If we can get rid of our own driver and uses a standard SMC based
mailbox driver that supports our use case that involves interrupts (we
can always change their kind without our firmware/boot loader since FDT
is generated from that component), that would be great.
-- 
Florian
