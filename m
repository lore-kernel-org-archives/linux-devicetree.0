From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 3/8] irq-imgpdc: add ImgTec PDC irqchip driver
Date: Thu, 25 Apr 2013 12:25:37 +0100
Message-ID: <517912B1.3030109@imgtec.com>
References: <1366727607-27444-1-git-send-email-james.hogan@imgtec.com> <1366727607-27444-4-git-send-email-james.hogan@imgtec.com> <alpine.LFD.2.02.1304231647400.21884@ionos>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.02.1304231647400.21884@ionos>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On 23/04/13 16:09, Thomas Gleixner wrote:
> On Tue, 23 Apr 2013, James Hogan wrote:
>> +	pdc_write(priv, PDC_IRQ_ROUTE, irq_route);
> 
>> +	spin_unlock_irqrestore(&priv->lock, flags);
>> +}
>> +
>> +static void perip_irq_unmask(struct irq_data *data)
>> +{
>> +	struct pdc_intc_priv *priv = irqd_to_priv(data);
>> +	unsigned int irq_route;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&priv->lock, flags);
>> +	irq_route = pdc_read(priv, PDC_IRQ_ROUTE);
>> +	irq_route |= 1 << data->hwirq;
>> +	pdc_write(priv, PDC_IRQ_ROUTE, irq_route);
> 
> This code is another slightly different copy of stuff which is
> available in kernel/irq/generic-chip.c
> 
> Can we please stop the code duplication and reuse existing
> infrastructure? Don't tell me it does not work for you.  I sent out a
> patch yesterday which makes the code suitable for irq domains.

If you're referring to the one that adds the IRQ_GC_MASK_FROM_HWIRQ
flag, as far as I can tell this means I'd have to call
irq_setup_generic_chip on each individual irq (since virqs may not be
linear), or else resort to creating a legacy irqdomain (which I thought
was... well for legacy use).

It feels a bit convoluted, and wrong given that it adds itself to
gc_list. Did I misunderstand how you were expecting me to make use of
the generic chip functions with a linear irqdomain?

Given that your patch presumably isn't upstream yet anyway, is it
acceptable to go with the current version (other fixes applied) and
update it later if necessary?

Thanks
James

