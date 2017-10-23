From: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH v3 05/13] irqchip: add initial support for ompic
Date: Mon, 23 Oct 2017 21:57:27 +0900
Message-ID: <20171023125727.GG2694@lianli.shorne-pla.net>
References: <20171022031600.29612-1-shorne@gmail.com>
 <20171022031600.29612-6-shorne@gmail.com>
 <86d15egupi.fsf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86d15egupi.fsf@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Openrisc <openrisc@lists.librecores.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonas Bonn <jonas@southpole.se>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 23, 2017 at 09:00:09AM +0100, Marc Zyngier wrote:
> On Sun, Oct 22 2017 at 12:15:52 pm BST, Stafford Horne <shorne@gmail.com> wrote:
> > From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> >

[...]

> > +
> > +	ret = setup_irq(irq, &ompi_ipi_irqaction);
> > +	if (ret)
> > +		goto out_irq_disp;
> 
> Is there a particular reason why this cannot be turned request_irq()
> call? setup_irq is something we try to avoid these days...

No reason, its just an old patch and I didn't know we should be avoiding
setup_irq().

I have just removed ompic_ipi_irqaction and replaced setup_irq() with this:

	ret = request_irq(irq, ompic_ipi_handler, IRQF_PERCPU,
				"ompic_ipi", NULL);
	if (ret)
		goto out_irq_disp;

I did some testing and it looks to be working fine.

> > +
> > +	set_smp_cross_call(ompic_raise_softirq);
> > +
> > +	return 0;
> > +
> > +out_irq_disp:
> > +	irq_dispose_mapping(irq);
> > +out_unmap:
> > +	iounmap(ompic_base);
> > +	ompic_base = NULL;
> > +	return ret;
> > +}
> > +IRQCHIP_DECLARE(ompic, "openrisc,ompic", ompic_of_init);
> 
> Otherwise looks good to me.

Thank You,

I will send another V once I get a bit more feedback on the other parts of the
series.

-Stafford
