From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 2/2] irqchip: add driver for imx-irqsteer controller
Date: Mon, 17 Dec 2018 14:41:52 +0000
Message-ID: <6a863d56-de66-c00e-ebb0-cf00fda2773f@arm.com>
References: <20181214102244.21509-1-l.stach@pengutronix.de>
 <20181214102244.21509-3-l.stach@pengutronix.de>
 <86r2ejaztt.wl-marc.zyngier@arm.com> <1545041393.5874.1.camel@pengutronix.de>
 <98217822-208a-9a92-e80b-b0b73111e527@arm.com>
 <1545054740.5874.6.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545054740.5874.6.camel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On 17/12/2018 13:52, Lucas Stach wrote:
> Am Montag, den 17.12.2018, 10:32 +0000 schrieb Marc Zyngier:
> [...]
>> OK, this is now making sense, thanks for that. I'm wondering if it'd
>> make sense to expose both IRQs in the DT for each irqsteer, and use
>> fsl,channel as the selector? It doesn't change much in the driver, but
>> seems to describe the HW in a more complete way.
>>
>> I don't care much either way, and I'll leave it for you and the DT folks
>> to decide.
> 
> At least according to the preliminary documentation available about the
> i.MX8QM not all of the channels are routed to an upstream IRQ which is
> visible to the Linux system. Some of them may also go to the Cortex-M
> subsystem, so for your suggestion to work I would need a scheme to
> describe the output interrupts with holes in between them.
> 
> I guess that complicates things a bit too much for little gain, as I
> don't see us switching the controller between different channels at
> runtime (which is the only thing I could imagine which would benefit
> from this more complete HW description). The current binding can deal
> with having some channels which route to something invisible to the
> Linux system just fine, so I'm leaning toward keeping things as they
> are now.

Fair enough. I'll freeze the tree tomorrow, so if you want this into
4.21, now is the time.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
