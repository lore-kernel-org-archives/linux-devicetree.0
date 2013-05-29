From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] [PATCH 3/3] IRQ: irq domain: defer of irq ressoure
 resolve at platform_drv_probe
Date: Wed, 29 May 2013 13:26:51 +0200
Message-ID: <20130529112651.GC30411@game.jcrosoft.org>
References: <20130528145219.GA30411@game.jcrosoft.org>
 <1369753729-12997-1-git-send-email-plagnioj@jcrosoft.com>
 <1369753729-12997-3-git-send-email-plagnioj@jcrosoft.com>
 <51A53363.6040004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51A53363.6040004-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > + */
> > +int of_device_init_irq(struct platform_device *dev)
> > +{
> > +	struct device_node *np = dev->dev.of_node;
> > +	int num_irq;
> > +	int ret;
> > +	struct resource *res = dev->resource;
> > +
> > +	if (!np)
> > +		return 0;
> > +
> > +	num_irq = of_irq_count(np);
> > +	if (!num_irq)
> > +		return 0;
> > +
> > +	res += dev->num_resources - num_irq;
> 
> This looks fragile to me as it relies on how of_device_alloc happens to
> be implemented.
> 
> > +	ret = of_irq_to_resource_table(np, res, num_irq);
> > +	if (ret != num_irq)
> > +		return -EPROBE_DEFER;

I could reduce the depency on the resource allocation order
but I do want to preallocate the ressource

Best Regards,
J.
