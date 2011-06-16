From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 03/11] dt/irq: add irq_domain_add_simple() helper
Date: Thu, 16 Jun 2011 10:56:24 -0600
Message-ID: <20110616165624.GG3795@ponder.secretlab.ca>
References: <20110616042653.29371.2052.stgit@ponder>
	<20110616044141.29371.76366.stgit@ponder>
	<4DFA0D83.6070604@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4DFA0D83.6070604-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2011 at 09:04:51AM -0500, Rob Herring wrote:
> Grant,
> 
> On 06/15/2011 11:41 PM, Grant Likely wrote:
> > irq_domain_add_simple() is an easy way to generate an irq translation
> > domain for simple irq controllers.  It assumes a flat 1:1 mapping from
> > hardware irq number to an offset of the first linux irq number assigned
> > to the controller
> > 
> > Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > ---
> >  include/linux/irq.h    |   11 +++++++++
> >  kernel/irq/irqdomain.c |   58 +++++++++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 68 insertions(+), 1 deletions(-)
> > 
> > diff --git a/include/linux/irq.h b/include/linux/irq.h
> > index a103c01..50830fc 100644
> > --- a/include/linux/irq.h
> > +++ b/include/linux/irq.h
> > @@ -797,6 +797,17 @@ extern unsigned int irq_domain_map(struct irq_domain *domain,
> >  				   irq_hw_number_t hwirq);
> >  extern void irq_domain_unmap(struct irq_domain *domain, irq_hw_number_t hw);
> >  
> > +struct of_device_id;
> > +#ifdef CONFIG_OF
> > +extern void irq_domain_add_simple(struct device_node *controller, int irq_base);
> > +extern void irq_domain_generate_simple(struct of_device_id *match,
> 
> match should be const

yup

> 
> > +					u64 phys_base, unsigned int irq_start);
> > +#else
> 
> Empty function for irq_domain_add_simple?

Haven't needed it yet.  I'll add it if it comes up.  Honestly, I'm not
even sure if this patch will survive very long once the IRQ
controllers start using irq_domains directly.  This is more of an easy
way to get an irq_domain registration so that DT translations work.

g.
