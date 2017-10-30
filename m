From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v4 05/13] irqchip: add initial support for ompic
Date: Mon, 30 Oct 2017 06:11:40 +0000
Message-ID: <86vaix5fmr.fsf@arm.com>
References: <20171029231123.27281-1-shorne@gmail.com>
        <20171029231123.27281-6-shorne@gmail.com> <86mv4974ht.fsf@arm.com>
        <20171030041806.GA29237@lianli.shorne-pla.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171030041806.GA29237@lianli.shorne-pla.net> (Stafford Horne's
        message of "Mon, 30 Oct 2017 13:18:06 +0900")
Sender: linux-kernel-owner@vger.kernel.org
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonas Bonn <jonas@southpole.se>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, openrisc@lists.librecores.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 30 2017 at  1:18:06 pm GMT, Stafford Horne <shorne@gmail.com> wrote:
> On Mon, Oct 30, 2017 at 02:29:18AM +0000, Marc Zyngier wrote:
>> On Mon, Oct 30 2017 at  8:11:15 am GMT, Stafford Horne <shorne@gmail.com> wrote:
>> > From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
>> >
>> > IPI driver for the Open Multi-Processor Interrupt Controller (ompic) as
>> > described in the Multi-core support section of the OpenRISC 1.2
>> > architecture specification:
>> >
>> >   https://github.com/openrisc/doc/raw/master/openrisc-arch-1.2-rev0.pdf
>> >
>> > Each OpenRISC core contains a full interrupt controller which is used in
>> > the SMP architecture for interrupt balancing.  This IPI device, the
>> > ompic, is the only external device required for enabling SMP on
>> > OpenRISC.
>> >
>> > Pending ops are stored in a memory bit mask which can allow multiple
>> > pending operations to be set and serviced at a time. This is mostly
>> > borrowed from the alpha IPI implementation.
>> >
>> > Cc: Marc Zyngier <marc.zyngier@arm.com>
>> > Acked-by: Rob Herring <robh@kernel.org>
>> > Signed-off-by: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
>> > [shorne@gmail.com: converted ops to bitmask, wrote commit message]
>> > Signed-off-by: Stafford Horne <shorne@gmail.com>
>> 
>> Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>
>
> Thanks
>
>> Side question: what is your merge strategy for this? I can take it
>> through the irqchip tree as it is standalone, but I'm open to other
>> suggestions.
>
> For me its easier if I just take it through the openrisc tree, as
> there are dependencies between this series and the irqchip driver.
> If you are ok with that I can make a note to Linus indicating so in
> the pull request.

No problem, that's OK with me.

> My plan is to send this series during the 4.15 merge window.

Make sure this is in -next (when it comes back to life...).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
