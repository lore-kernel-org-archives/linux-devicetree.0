From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [RFC PATCH] of/irq: do irq resolution in platform_get_irq_byname()
Date: Tue, 20 May 2014 15:17:00 +0900
Message-ID: <20140520061700.ED542C41087@trevor.secretlab.ca>
References: <1400506259-18397-1-git-send-email-grygorii.strashko@ti.com>
 <20140519125738.GB9466@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140519125738.GB9466@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, santosh.shilimkar@ti.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 May 2014 14:57:39 +0200, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Mon, May 19, 2014 at 04:30:59PM +0300, Grygorii Strashko wrote:
> [...]
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> [...]
> >  /**
> > + * of_irq_get_byname - Decode a node's IRQ and return it as a Linux irq number
> > + * @dev: pointer to device tree node
> > + * @name: zero-based index of the irq
> 
> This is a name, not an index.
> 
> > + *
> > + * Returns Linux irq number on success, or -EPROBE_DEFER if the irq domain
> > + * is not yet created, or errorno in case of failure.
> 
> s/errorno/error code/? Also EPROBE_DEFER is also an error code, so I'm
> not sure if it's worth a special case in the description here.
> 
> > + *
> > + */
> > +int of_irq_get_byname(struct device_node *dev, const char *name)
> > +{
> > +	const char *name_irq = NULL;
> > +	int index = 0;
> > +
> > +	if (unlikely(!name))
> > +		return -EINVAL;
> > +
> > +	while (!of_property_read_string_index(dev, "interrupt-names",
> > +					      index, &name_irq))
> > +		if (!strcmp(name, name_irq))
> > +			return of_irq_get(dev, index);
> 
> Isn't this missing an index++ somewhere? Otherwise it seems like this
> would loop infinitely if there was no match on the first entry.

Better yet, use of_property_match_string().

g.

> 
> Thierry
