From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH 5/6 v3] mfd: tps65910-irq: Add devicetree init support
Date: Tue, 08 May 2012 12:36:18 -0400
Message-ID: <1336494978.31930.41.camel@rklein-linux>
References: <1336502563-31789-1-git-send-email-rklein@nvidia.com>
	 <1336502563-31789-6-git-send-email-rklein@nvidia.com>
	 <20120508154820.GA15893@opensource.wolfsonmicro.com>
	 <1336504291.31930.24.camel@rklein-linux>
	 <20120508162901.GD15893@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120508162901.GD15893@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Liam Girdwood <lrg@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2012-05-08 at 09:29 -0700, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Tue, May 08, 2012 at 12:11:31PM -0700, Rhyland Klein wrote:
> 
> > Is this more what you would expect? If the dt code initialized the
> > irq_base to 0 instead of -1 then this should also work.
> 
> > pdata->irq_base = irq_alloc_descs(-1, pdata->irq_base,
> > 			tps65910->irq_num, -1);
> > if (pdata->irq_base <= 0) {
> > 	dev_err(tps65910->dev, "Failed to allocate irq descs: %d\n",
> > 		pdata->irq_base);
> > 	return pdata->irq_base;
> > }
> 
> More like:
> 
> 	if (pdata->irq_base)
> 		base = pdata->irq_base;
> 	else
> 		base = 0;
> 	pdata->irq_base = irq_alloc_descs(base, 0,

Alright, will do in next round of changes.

> 
> * Unknown Key
> * 0x6E30FDDD

-- 
nvpublic
