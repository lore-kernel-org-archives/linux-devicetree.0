From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 3/9] mfd: pm8xxx: convert to v2 irq interfaces to support
 hierarchical IRQ chips
Date: Wed, 6 Feb 2019 09:10:34 -0500
Message-ID: <20190206141034.GA5833@basecamp>
References: <20190125162302.14036-1-masneyb@onstation.org>
 <20190125162302.14036-4-masneyb@onstation.org>
 <CACRpkdZMe+JEQOa1yBfOoAErrC41Q9rggwxNb=_uwq1m2QKWyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZMe+JEQOa1yBfOoAErrC41Q9rggwxNb=_uwq1m2QKWyw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Wed, Feb 06, 2019 at 02:07:52PM +0100, Linus Walleij wrote:
> > +struct pm_irq_data {
> > +       int num_irqs;
> > +       struct irq_chip *irq_chip;
> > +       void (*irq_handler)(struct irq_desc *desc);
> > +};
> > +
> >  struct pm_irq_chip {
> >         struct regmap           *regmap;
> >         spinlock_t              pm_irq_lock;
> >         struct irq_domain       *irqdomain;
> > -       unsigned int            num_irqs;
> >         unsigned int            num_blocks;
> >         unsigned int            num_masters;
> >         u8                      config[0];
> > -};
> > -
> > -struct pm_irq_data {
> > -       int num_irqs;
> > -       const struct irq_domain_ops  *irq_domain_ops;
> > -       void (*irq_handler)(struct irq_desc *desc);
> > +       const struct pm_irq_data *pm_irq_data;
> >  };
> 
> This doesn't work: the config[0] must be the tail element
> of the struct since we allocate dynamically the trailing
> config[] bytes.
> 
> As it looks now, the *pm_irq_data gets overwritten by
> the configs and it crashes.

Thank you for testing all of this on actual hardware. You can either
send out the little issues like this that need corrected and I'll
collect everything up, and send out a V2 once you are done with testing.
Or, you can just take my patches, incorporate the fixes, and add me
with a Co-developed-by tag to the relevant patches. Whatever is easier
for you. I assume that the latter approach may be easier since you're
already making the changes in your tree for testing.

Brian
