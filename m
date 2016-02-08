From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 2/5] drivers/of: add EXPORT_SYMBOL to of_irq_count
Date: Mon, 8 Feb 2016 10:54:28 -0500
Message-ID: <20160208155428.GW23093@windriver.com>
References: <1454889644-27830-1-git-send-email-paul.gortmaker@windriver.com>
 <1454889644-27830-3-git-send-email-paul.gortmaker@windriver.com>
 <2848200.MLs7SEvRJG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2848200.MLs7SEvRJG@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

[Re: [PATCH 2/5] drivers/of: add EXPORT_SYMBOL to of_irq_count] On 08/02/2016 (Mon 10:56) Arnd Bergmann wrote:

> On Sunday 07 February 2016 19:00:41 Paul Gortmaker wrote:
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index 7ee21ae305ae..0d714748a571 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -449,6 +449,7 @@ int of_irq_count(struct device_node *dev)
> >  
> >         return nr;
> >  }
> > +EXPORT_SYMBOL(of_irq_count);
> >  
> >  /**
> >   * of_irq_to_resource_table - Fill in resource table with node's IRQ info
> > -- 
> > 
> 
> I think the drivers should be changed to call platform_irq_count() instead.

I'll look into that and see if it works.

P.
