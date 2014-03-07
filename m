From: Andy Gross <agross@codeaurora.org>
Subject: Re: [Patch v8 2/2] dmaengine: add Qualcomm BAM dma driver
Date: Fri, 7 Mar 2014 17:11:08 -0600
Message-ID: <20140307231108.GD3241@qualcomm.com>
References: <1393828245-18766-1-git-send-email-agross@codeaurora.org>
 <1393828245-18766-3-git-send-email-agross@codeaurora.org>
 <1393839482.28803.118.camel@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393839482.28803.118.camel@smile.fi.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "Koul, Vinod" <vinod.koul@intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 03, 2014 at 09:38:03AM +0000, Shevchenko, Andriy wrote:

<snip>

> > +	if (IS_ERR(bdev->bamclk))
> > +		return PTR_ERR(bdev->bamclk);
> > +
> > +	ret = clk_prepare_enable(bdev->bamclk);
> > +	if (ret) {
> > +		dev_err(bdev->dev, "failed to prepare/enable clock\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = of_property_read_u32(pdev->dev.of_node, "qcom,ee", &bdev->ee);
> > +	if (ret) {
> > +		dev_err(bdev->dev, "Execution environment unspecified\n");
> > +		return ret;
> 
> goto err_disable_clk; ?
> 
> > 
> > +	}
> > +
> > +	ret = bam_init(bdev);
> > +	if (ret)
> > +		return ret;
> 
> Ditto.
> 

Good catch.  I'll fix both of those.

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
