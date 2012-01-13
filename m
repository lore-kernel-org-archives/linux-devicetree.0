From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] versatile: sic: add device tree bindings
Date: Fri, 13 Jan 2012 11:41:51 -0700
Message-ID: <20120113184151.GC22767@ponder.secretlab.ca>
References: <1326415441-17695-1-git-send-email-jamie@jamieiles.com>
 <1326415441-17695-2-git-send-email-jamie@jamieiles.com>
 <20120113104842.GS1068@n2100.arm.linux.org.uk>
 <20120113105834.GF14007@page>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120113105834.GF14007@page>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2012 at 10:58:34AM +0000, Jamie Iles wrote:
> On Fri, Jan 13, 2012 at 10:48:42AM +0000, Russell King - ARM Linux wrote:
> > On Fri, Jan 13, 2012 at 12:44:00AM +0000, Jamie Iles wrote:
> > > +#ifdef CONFIG_OF
> > > +int __init sic_of_init(struct device_node *np, struct device_node *parent)
> > > +{
> > > +	struct fpga_irq_data *sic_data = kzalloc(sizeof(*sic_data), GFP_KERNEL);
> > > +	int err = -ENOMEM, irq;
> > > +
> > > +	if (WARN_ON(!sic_data))
> > > +		return err;
> > > +
> > > +	sic_data->base = of_iomap(np, 0);
> > > +	if (WARN_ON(!sic_data->base))
> > > +		goto out_free_data;
> > > +
> > > +	irq = irq_of_parse_and_map(np, 0);
> > > +	if (irq < 0)
> > > +		goto out_free_data;
> > > +
> > > +	sic_data->irq_start = irq_alloc_descs(-1, 0, 32, numa_node_id());
> > > +	if (WARN_ON(sic_data->irq_start < 0)) {
> > > +		err = sic_data->irq_start;
> > > +		goto out_unmap;
> > > +	}
> > > +	sic_data->domain.of_node = of_node_get(np);
> > > +
> > > +	fpga_irq_init(irq, ~0, sic_data);
> > 
> > I notice that you completely ignore the validity mask, and initialize all
> > 32 interrupts.  This is wrong.  You don't think I put the validity mask
> > there just to obfuscate the code?
> 
> OK, that is wrong.  The validity mask is used for the non-DT platforms, 
> for the DT one I'll add a property stating the valid mask:
> 
> 	arm,valid-irq-mask = <0x001fffff>;
> 
> to the node in the trees.

Shouldn't be necessary when the driver is converted to using the
linear mapping.  When that happens, only the requested irqs will get
mapped.
