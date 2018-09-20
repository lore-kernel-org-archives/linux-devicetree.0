From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V5 1/3] irqchip: add C-SKY irqchip drivers
Date: Thu, 20 Sep 2018 13:47:14 +0800
Message-ID: <20180920054713.GA5198@guoren-Inspiron-7460>
References: <a70337117db84f6e1091d0b3fc28acb691ac9b35.1537087118.git.ren_guo@c-sky.com>
 <86in35mfas.wl-marc.zyngier@arm.com>
 <20180917020928.GA22452@guoren-Inspiron-7460>
 <86tvmoz22k.wl-marc.zyngier@arm.com>
 <20180918084331.GA10950@guoren>
 <86r2hqu82l.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86r2hqu82l.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Marc,

On Tue, Sep 18, 2018 at 04:41:22PM +0100, Marc Zyngier wrote:
> > +#define IPI_IRQ	15
> > +
> 
> It feels really bizarre that the function that maps the interrupt is
> specific to the interrupt controller, and yet the interrupt number is
> defined at the architecture level. I'd expect this to be just as
> interrupt controller specific.
>
Ok, move IPI_IRQ to irq-csky-mpintc.c. See my PATCH V8


> > +	irq = arch_ipi_irq_mapping();
> 
> How about checking the validity of the interrupt and that
> arch_ipi_irq_mapping is actually non-NULL?
Ok. 

> > -	rc = request_percpu_irq(IPI_IRQ, handle_ipi, "IPI Interrupt", &ipi_dummy_dev);
> > +	rc = request_percpu_irq(irq, handle_ipi, "IPI Interrupt", &ipi_dummy_dev);
> >  	if (rc)
> >  		panic("%s IRQ request failed\n", __func__);
>
> To be honest, I'd tend to question the need for this level of
> abstraction, unless you actually plan for multiple SMP-capable
> interrupt controllers... But at the end of the day, that's your call,
> and the above code looks mostly correct.
Thx for the review. I will consider your suggestion.

Best Regards
 GUo Ren
