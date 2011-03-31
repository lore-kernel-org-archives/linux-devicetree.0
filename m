From: "Hans J. Koch" <hjk@hansjkoch.de>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Thu, 31 Mar 2011 21:23:02 +0200
Message-ID: <20110331192302.GD2734@local>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
 <1301574600-4861-2-git-send-email-monstr@monstr.eu>
 <20110331124925.GA2202@pengutronix.de>
 <4D948189.9070606@monstr.eu>
 <20110331170321.GA2734@local>
 <4D94C09B.4070506@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D94C09B.4070506@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: "Hans J. Koch" <hjk@hansjkoch.de>, Wolfram Sang <w.sang@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, john.williams@petalogix.com, linux-kernel@vger.kernel.org, hjk@linutronix.de, gregkh@suse.de
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2011 at 07:57:47PM +0200, Michal Simek wrote:
> Hans J. Koch wrote:
> >On Thu, Mar 31, 2011 at 03:28:41PM +0200, Michal Simek wrote:
> >>>>+		uioinfo->name = pdev->dev.of_node->name;
> >>>>+		/* Use version for storing full IP name for identification */
> >>>>+		uioinfo->version = pdev->dev.of_node->full_name;
> >>>I don't think this is apropriate, but will leave that to Hans.
> >>I was thinking what to add and I choose full_name because I can read
> >>this value and identify which UIO is this device.
> >>I know that there should be version but there is no version string in DTS.
> >
> >The purpose of uio_info->version is to give the userspace part of the driver
> >additional information. Kernel part and userspace part might be developed
> >independently, and there should be a chance for the userspace part to find
> >out if a certain feature is already supported by the kernel part without
> >having to do dirty kernel version checks.
> >
> >So, uio_info->version is an information about the driver, not the hardware.
> >
> >Example: You write a UIO driver for a chip you use in a project. You don't
> >need all the functionality of that chip. One year later you need additional
> >chip functionality, and it turns out that you have to do certain
> >initializations in the kernel part. Your new userspace will need the new
> >kernel driver, but there are lots of older kernels around in your customers
> >devices. In that case, your userspace part can simply check the version
> >string in sysfs and require at least your new version.
> 
> I understand reasons but this information is not in device tree and
> it must be setup.
> Grant suggested compatible string but it is not the best option too.

In uio_pdrv_genirq, uio_info->version is hardcoded in platform data. Hardware
initialization can also take place in the same platform specific file, which
is common practice on archs like ARM. Therefore, a driver specific versioning
can make sense for UIO, even if the driver code itself doesn't change.

If you have no equivalent for that in device tree, you should create a new
generic driver (uio_of_genirq?) that simply doesn't support this kind of
versioning.

Seems like sometimes it's not enough to just describe hardware...

Thanks,
Hans
