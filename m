From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 05/19] irqchip/mmp: do not use of_address_to_resource()
 to get mux regs
Date: Sat, 17 Aug 2019 19:17:10 +0100
Message-ID: <20190817191710.539daa01@why>
References: <20190809093158.7969-1-lkundrak@v3.sk>
 <20190809093158.7969-6-lkundrak@v3.sk>
 <16d77ca3-7ad1-3af2-650e-722cf6a931ed@kernel.org>
 <e0c0cf62a1f087fd6c1d7307e5e2a65603148341.camel@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e0c0cf62a1f087fd6c1d7307e5e2a65603148341.camel@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 16 Aug 2019 20:41:22 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> On Fri, 2019-08-09 at 13:12 +0100, Marc Zyngier wrote:
> > On 09/08/2019 10:31, Lubomir Rintel wrote:  
> > > The "regs" property of the "mrvl,mmp2-mux-intc" devices are silly. They
> > > are offsets from intc's base, not addresses on the parent bus. At this
> > > point it probably can't be fixed.
> > > 
> > > On an OLPC XO-1.75 machine, the muxes are children of the intc, not the
> > > axi bus, and thus of_address_to_resource() won't work. We should treat
> > > the values as mere integers as opposed to bus addresses.
> > > 
> > > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > 
> > > ---
> > >  drivers/irqchip/irq-mmp.c | 20 +++++++++++---------
> > >  1 file changed, 11 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
> > > index 14618dc0bd396..af9cba4a51c2e 100644
> > > --- a/drivers/irqchip/irq-mmp.c
> > > +++ b/drivers/irqchip/irq-mmp.c
> > > @@ -424,9 +424,9 @@ IRQCHIP_DECLARE(mmp2_intc, "mrvl,mmp2-intc", mmp2_of_init);
> > >  static int __init mmp2_mux_of_init(struct device_node *node,
> > >  				   struct device_node *parent)
> > >  {
> > > -	struct resource res;
> > >  	int i, ret, irq, j = 0;
> > >  	u32 nr_irqs, mfp_irq;
> > > +	u32 reg[4];
> > >  
> > >  	if (!parent)
> > >  		return -ENODEV;
> > > @@ -438,18 +438,20 @@ static int __init mmp2_mux_of_init(struct device_node *node,
> > >  		pr_err("Not found mrvl,intc-nr-irqs property\n");
> > >  		return -EINVAL;
> > >  	}
> > > -	ret = of_address_to_resource(node, 0, &res);
> > > +
> > > +	/*
> > > +	 * For historical reasonsm, the "regs" property of the
> > > +	 * mrvl,mmp2-mux-intc is not a regular * "regs" property containing
> > > +	 * addresses on the parent bus, but offsets from the intc's base.
> > > +	 * That is why we can't use of_address_to_resource() here.
> > > +	 */
> > > +	ret = of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));  
> > 
> > This will return 0 even if you've read less than your expected 4 u32s.
> > You may want to try of_property_read_variable_u32_array instead.  
> 
> Will it? Unless I'm reading the of_property_read_u32_array()
> documentation wrong, it suggests that would return -EOVERFLOW in that
> case.

You're appear to be right, and I read it wrong.

> 
> It ignores the extra values it the property is larger. I guess that is
> not a good thing and we still want to use
> of_property_read_variable_u32_array() though.

It doesn't hurt to check for all possible problems, specially given
that this machine doesn't appear to have a mainline DT (and its OF
implementation looks a bit buggy).

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
