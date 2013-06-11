From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v3 1/6] irqchip: add support for Marvell Orion SoCs
Date: Tue, 11 Jun 2013 15:45:25 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1306111539310.22970@ionos>
References: <1370536034-23956-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1370536034-23956-2-git-send-email-sebastian.hesselbarth@gmail.com>
 <alpine.LFD.2.02.1306111045520.22970@ionos>
 <alpine.LFD.2.02.1306111525180.22970@ionos>
 <51B7280B.7080604@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51B7280B.7080604-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Jun 2013, Sebastian Hesselbarth wrote:

> On 06/11/13 15:30, Thomas Gleixner wrote:
> > On Tue, 11 Jun 2013, Thomas Gleixner wrote:
> > 
> > > On Thu, 6 Jun 2013, Sebastian Hesselbarth wrote:
> > > 
> > > > This patch adds an irqchip driver for the main interrupt controller
> > > > found
> > > > on Marvell Orion SoCs (Kirkwood, Dove, Orion5x, Discovery Innovation).
> > > > Corresponding device tree documentation is also added.
> > > > 
> > > > Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > 
> > > Reviewed-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> > 
> > Second thoughts:
> > 
> > > +static void orion_bridge_irq_handler(unsigned int irq, struct irq_desc
> > > *desc)
> > > +{
> > > +	struct irq_domain *d = irq_get_handler_data(irq);
> > > +	struct irq_chip_generic *gc = irq_get_domain_generic_chip(d, irq);
> > > +	u32 stat = readl_relaxed(gc->reg_base + ORION_BRIDGE_IRQ_CAUSE) &
> > > +		gc->mask_cache;
> > 
> > In init you map the first irq of that chip and install the chain
> > handler for it. Now if that first irq fires, isn't that set in the
> > cause register as well? And what acks that first irq?
> 
> It is "acked" by acking all unmasked bridge irqs.

Ok. A comment would be nice.

But what about the bit in of that first irq in the cause register? If
it's set on entry you call generic_handle_irq() for that as well. So
if it's set you need to mask it in stat. If not, then it wants a
comment.

Thanks,

	tglx
