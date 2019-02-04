From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 3/9] mfd: pm8xxx: convert to v2 irq interfaces to support
 hierarchical IRQ chips
Date: Mon, 4 Feb 2019 05:20:09 -0500
Message-ID: <20190204102009.GA1887@basecamp>
References: <20190125162302.14036-1-masneyb@onstation.org>
 <20190125162302.14036-4-masneyb@onstation.org>
 <20190130132739.GE4701@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190130132739.GE4701@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 01:27:39PM +0000, Lee Jones wrote:
> > @@ -303,6 +303,7 @@ static int pm8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
> >  {
> >  	struct pm_irq_chip *chip = irq_data_get_irq_chip_data(d);
> >  	unsigned int pmirq = irqd_to_hwirq(d);
> > +	irq_flow_handler_t flow_handler;
> >  	int irq_bit;
> >  	u8 block, config;
> >  
> > @@ -316,6 +317,8 @@ static int pm8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
> >  			chip->config[pmirq] &= ~PM_IRQF_MASK_RE;
> >  		if (flow_type & IRQF_TRIGGER_FALLING)
> >  			chip->config[pmirq] &= ~PM_IRQF_MASK_FE;
> > +
> > +		flow_handler = handle_edge_irq;
> >  	} else {
> >  		chip->config[pmirq] |= PM_IRQF_LVL_SEL;
> >  
> > @@ -323,8 +326,12 @@ static int pm8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
> >  			chip->config[pmirq] &= ~PM_IRQF_MASK_RE;
> >  		else
> >  			chip->config[pmirq] &= ~PM_IRQF_MASK_FE;
> > +
> > +		flow_handler = handle_level_irq;
> >  	}
> >  
> > +	irq_set_handler_locked(d, flow_handler);
> > +
> 
> Why don't you save yourself 3 lines of code and a variable and just
> call irq_set_handler_locked() where you set flow_handler?
> 
> Apart from that nit, the code looks good to me.

OK.... I'll fix this up in v2.

I'll let this ssbi-gpio series sit on the list for a few weeks before I
send out v2. I ordered a Sony Xperia Z on eBay but it won't be here
until the beginning of March. I'd like to have this series tested on
actual hardware before this series is merged just to be sure it works
properly. If someone else has time to test it sooner, then please do.

Brian
