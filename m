From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Thu, 31 Mar 2011 19:57:47 +0200
Message-ID: <4D94C09B.4070506@monstr.eu>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu> <1301574600-4861-2-git-send-email-monstr@monstr.eu> <20110331124925.GA2202@pengutronix.de> <4D948189.9070606@monstr.eu> <20110331170321.GA2734@local>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110331170321.GA2734@local>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, john.williams@petalogix.com, linux-kernel@vger.kernel.org, hjk@linutronix.de, gregkh@suse.de
List-Id: devicetree@vger.kernel.org

Hans J. Koch wrote:
> On Thu, Mar 31, 2011 at 03:28:41PM +0200, Michal Simek wrote:
>>>> +		uioinfo->name = pdev->dev.of_node->name;
>>>> +		/* Use version for storing full IP name for identification */
>>>> +		uioinfo->version = pdev->dev.of_node->full_name;
>>> I don't think this is apropriate, but will leave that to Hans.
>> I was thinking what to add and I choose full_name because I can read
>> this value and identify which UIO is this device.
>> I know that there should be version but there is no version string in DTS.
> 
> The purpose of uio_info->version is to give the userspace part of the driver
> additional information. Kernel part and userspace part might be developed
> independently, and there should be a chance for the userspace part to find
> out if a certain feature is already supported by the kernel part without
> having to do dirty kernel version checks.
> 
> So, uio_info->version is an information about the driver, not the hardware.
> 
> Example: You write a UIO driver for a chip you use in a project. You don't
> need all the functionality of that chip. One year later you need additional
> chip functionality, and it turns out that you have to do certain
> initializations in the kernel part. Your new userspace will need the new
> kernel driver, but there are lots of older kernels around in your customers
> devices. In that case, your userspace part can simply check the version
> string in sysfs and require at least your new version.

I understand reasons but this information is not in device tree and it must be 
setup.
Grant suggested compatible string but it is not the best option too.


> 
>>>> +		/* Get IRQ for the device */
>>>> +		rc = of_irq_to_resource(pdev->dev.of_node, 0, &r_irq);
>>>> +		if (rc == NO_IRQ)
>>>> +			dev_err(&pdev->dev, "no IRQ found\n");
>>> No error, I think. Sometimes just mmaping the registers is enough.
>> OK. Let's changed it to dev_info if you like.
> 
> The correct thing is to set uio_info->irq to UIO_IRQ_NONE.

ok, done.


Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
