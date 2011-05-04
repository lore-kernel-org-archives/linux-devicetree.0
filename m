From: "Hans J. Koch" <hjk@hansjkoch.de>
Subject: Re: [PATCH v4] uio/pdrv_genirq: Add OF support
Date: Wed, 4 May 2011 21:47:30 +0200
Message-ID: <20110504194730.GA2820@local>
References: <1304319115-32745-1-git-send-email-monstr@monstr.eu>
 <20110503203412.GA2119@pengutronix.de>
 <20110503221440.GB2737@local>
 <4DC152F3.2050500@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DC152F3.2050500@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: "Hans J. Koch" <hjk@hansjkoch.de>, Wolfram Sang <w.sang@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, john.williams@petalogix.com, linux-kernel@vger.kernel.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Wed, May 04, 2011 at 03:21:55PM +0200, Michal Simek wrote:
> Hans J. Koch wrote:
> >On Tue, May 03, 2011 at 10:34:12PM +0200, Wolfram Sang wrote:
> >>On Mon, May 02, 2011 at 08:51:55AM +0200, Michal Simek wrote:
> >>>Adding OF binding to genirq.
> >>>Version string is setup to the "devicetree".
> >>>
> >>>Compatible string is not setup for now but you can add your
> >>>custom compatible string to uio_of_genirq_match structure.
> >>>
> >>>For example with "vendor,device" compatible string:
> >>>static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
> >>>	{ .compatible = "vendor,device", },
> >>>	{ /* empty for now */ },
> >>>};
> >>>
> >>>Signed-off-by: Michal Simek <monstr@monstr.eu>
> >>[...]
> >>
> >>>+		/* alloc uioinfo for one device */
> >>>+		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
> >>kfree in remove?
> >
> >Oh yes. Missed that one. It should probably look like the "bad0" case in probe().
> 
> Yes, freeing uioinfo in uio_pdrv_genirq_remove make sense for CONFIG_OF.
> 
> Please correct me if I am wrong dev.of_node is not NULL for OF. I
> think yes that's why I would prefer to use this construct instead of
> #ifdef CONFIG_OF.
> 
> 	if (pdev->dev.of_node)
> 		kfree(pdev->dev.platform_data);

Huh? You didn't allocate platform_data, so you shouldn't free it.
It's uioinfo you allocated.

Thanks,
Hans
