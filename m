From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] phy: intel-lgm-emmc: Add support for eMMC PHY
Date: Tue, 20 Aug 2019 16:59:21 +0300
Message-ID: <20190820135921.GO30120@smile.fi.intel.com>
References: <20190820103133.53776-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190820103133.53776-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190820135602.GN30120@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820135602.GN30120@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 04:56:02PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 20, 2019 at 06:31:33PM +0800, Ramuthevar,Vadivel MuruganX wrote:

> > +#define DR_TY_50OHM(x)		((~(x) << 28) & DR_TY_MASK)
> 
> For consistency it should be
> 
> #define DR_TY_SHIFT(x)		(((x) << 28) & DR_TY_MASK)
> 
> with explanation about 50 Ohm in the code below.

> > +	/* Drive impedance: 50 Ohm */
> 
> Nice, you have already a comment here. Just use DR_TY_SHIFT(1)

It should be DR_TY_SHIFT(6) now since I dropped the negation.

-- 
With Best Regards,
Andy Shevchenko
