From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH v8 11/12] usb: phy-mxs: Add system suspend/resume API
Date: Fri, 27 Dec 2013 09:48:21 +0800
Message-ID: <20131227014820.GB6214@shlinux1.ap.freescale.net>
References: <1387857536-4996-1-git-send-email-peter.chen@freescale.com>
 <1387857536-4996-12-git-send-email-peter.chen@freescale.com>
 <20131226162520.GC3937@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131226162520.GC3937@saruman.home>
Sender: linux-doc-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 26, 2013 at 10:25:20AM -0600, Felipe Balbi wrote:
> Hi,
> 
> On Tue, Dec 24, 2013 at 11:58:55AM +0800, Peter Chen wrote:
> > @@ -398,6 +433,29 @@ static int mxs_phy_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > +static int mxs_phy_system_suspend(struct device *dev)
> > +{
> > +	struct mxs_phy *mxs_phy = dev_get_drvdata(dev);
> > +
> > +	if (device_may_wakeup(dev))
> > +		mxs_phy_enable_ldo_in_suspend(mxs_phy, true);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mxs_phy_system_resume(struct device *dev)
> > +{
> > +	struct mxs_phy *mxs_phy = dev_get_drvdata(dev);
> > +
> > +	if (device_may_wakeup(dev))
> > +		mxs_phy_enable_ldo_in_suspend(mxs_phy, false);
> > +
> > +	return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(mxs_phy_pm, mxs_phy_system_suspend,
> > +		mxs_phy_system_resume);
> 
> this will give "Defined but not used" warnings when !PM_SLEEP.
> 

Oh, sorry, will change.

-- 

Best Regards,
Peter Chen

