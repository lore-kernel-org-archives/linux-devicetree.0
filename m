From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v4] uio/pdrv_genirq: Add OF support
Date: Wed, 04 May 2011 15:21:55 +0200
Message-ID: <4DC152F3.2050500@monstr.eu>
References: <1304319115-32745-1-git-send-email-monstr@monstr.eu> <20110503203412.GA2119@pengutronix.de> <20110503221440.GB2737@local>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110503221440.GB2737@local>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>
Cc: Wolfram Sang <w.sang@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, john.williams@petalogix.com, linux-kernel@vger.kernel.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Hans J. Koch wrote:
> On Tue, May 03, 2011 at 10:34:12PM +0200, Wolfram Sang wrote:
>> On Mon, May 02, 2011 at 08:51:55AM +0200, Michal Simek wrote:
>>> Adding OF binding to genirq.
>>> Version string is setup to the "devicetree".
>>>
>>> Compatible string is not setup for now but you can add your
>>> custom compatible string to uio_of_genirq_match structure.
>>>
>>> For example with "vendor,device" compatible string:
>>> static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
>>> 	{ .compatible = "vendor,device", },
>>> 	{ /* empty for now */ },
>>> };
>>>
>>> Signed-off-by: Michal Simek <monstr@monstr.eu>
>> [...]
>>
>>> +		/* alloc uioinfo for one device */
>>> +		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
>> kfree in remove?
> 
> Oh yes. Missed that one. It should probably look like the "bad0" case in probe().

Yes, freeing uioinfo in uio_pdrv_genirq_remove make sense for CONFIG_OF.

Please correct me if I am wrong dev.of_node is not NULL for OF. I think yes 
that's why I would prefer to use this construct instead of #ifdef CONFIG_OF.

	if (pdev->dev.of_node)
		kfree(pdev->dev.platform_data);

What do you think?

Michal



-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
