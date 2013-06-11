From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 1/6] irqchip: add support for Marvell Orion SoCs
Date: Tue, 11 Jun 2013 16:13:31 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1306111609110.22970@ionos>
References: <1370536034-23956-1-git-send-email-sebastian.hesselbarth@gmail.com> <1370536034-23956-2-git-send-email-sebastian.hesselbarth@gmail.com> <alpine.LFD.2.02.1306111045520.22970@ionos> <alpine.LFD.2.02.1306111525180.22970@ionos> <51B7280B.7080604@gmail.com>
 <alpine.LFD.2.02.1306111539310.22970@ionos> <51B72F5C.5020806@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51B72F5C.5020806@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, John Stultz <john.stultz@linaro.org>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Jun 2013, Sebastian Hesselbarth wrote:
> On 06/11/13 15:45, Thomas Gleixner wrote:
> > But what about the bit in of that first irq in the cause register? If
> > it's set on entry you call generic_handle_irq() for that as well. So
> > if it's set you need to mask it in stat. If not, then it wants a
> > comment.
> 
> I am not sure I can follow. orion_bridge_irq_init() maps the first
> parent irq, i.e. hwirq 0 of orion_irq. The parent irq controller
> clears that irq cause when all corresponding chained irqs are
> cleared. The chained (bridge) irqs are cleared by
> orion_bridge_irq_handler above.

That makes sense. I got confused by:

        irq = irq_of_parse_and_map(np, 0);

but now I see that it's mapping irq 0 of the parent interrupt
controller. I'll add a comment before merging it.

Thanks,

	tglx



 
