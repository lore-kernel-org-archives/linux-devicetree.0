From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH 5/6 v3] mfd: tps65910-irq: Add devicetree init support
Date: Tue, 08 May 2012 12:11:31 -0700
Message-ID: <1336504291.31930.24.camel@rklein-linux>
References: <1336502563-31789-1-git-send-email-rklein@nvidia.com>
	 <1336502563-31789-6-git-send-email-rklein@nvidia.com>
	 <20120508154820.GA15893@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120508154820.GA15893@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Liam Girdwood <lrg@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2012-05-08 at 08:48 -0700, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Tue, May 08, 2012 at 11:42:42AM -0700, Rhyland Klein wrote:
> 
> > +	if (pdata->irq_base <= 0)
> > +		pdata->irq_base = irq_alloc_descs(-1, 0, tps65910->irq_num, -1);
> > +
> > +	if (pdata->irq_base <= 0) {
> > +		dev_err(tps65910->dev, "Failed to allocate irq descs: %d\n",
> > +			pdata->irq_base);
> > +		return pdata->irq_base;
> > +	}
> 
> I'd expect the driver to always call irq_alloc_descs() but to use the
> value specified in platform data if there is any.  This is the normal
> way of doing things, anyway.
> 

Is this more what you would expect? If the dt code initialized the
irq_base to 0 instead of -1 then this should also work.

pdata->irq_base = irq_alloc_descs(-1, pdata->irq_base,
			tps65910->irq_num, -1);

if (pdata->irq_base <= 0) {
	dev_err(tps65910->dev, "Failed to allocate irq descs: %d\n",
		pdata->irq_base);
	return pdata->irq_base;
}

> * Unknown Key
> * 0x6E30FDDD

-- 
nvpublic
