From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 10:15:18 +0200
Message-ID: <4DAD4496.8050902@monstr.eu>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu> <20110419060816.GA5252@ponder.secretlab.ca>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110419060816.GA5252@ponder.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, john.williams@petalogix.com, linux-kernel@vger.kernel.org, hjk@hansjkoch.de, w.sang@pengutronix.de, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Mon, Apr 18, 2011 at 10:50:54AM +0200, Michal Simek wrote:
>> Adding OF binding to genirq.
>> Version string is setup to the "devicetree".
>>
>> Compatible string is not setup for now but you can add your
>> custom compatible string to uio_of_genirq_match structure.
>>
>> For example with "uio" compatible string:
>> static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
>> 	{ .compatible = "uio", },
>> 	{ /* empty for now */ },
>> };
>>
>> Signed-off-by: Michal Simek <monstr@monstr.eu>
>>
>> ---
>>
>> v3: Fix irq binding
>>     Use "devicetree" as version string
>>
>> v2: Remove additional resource binding
>>     Setup correct version string
>>     Clear compatible string
>> ---
>>  drivers/uio/uio_pdrv_genirq.c |   42 +++++++++++++++++++++++++++++++++++++++++
>>  1 files changed, 42 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
>> index 7174d51..c8d565a 100644
>> --- a/drivers/uio/uio_pdrv_genirq.c
>> +++ b/drivers/uio/uio_pdrv_genirq.c
>> @@ -23,6 +23,10 @@
>>  #include <linux/pm_runtime.h>
>>  #include <linux/slab.h>
>>  
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_address.h>
>> +
>>  #define DRIVER_NAME "uio_pdrv_genirq"
>>  
>>  struct uio_pdrv_genirq_platdata {
>> @@ -97,6 +101,30 @@ static int uio_pdrv_genirq_probe(struct platform_device *pdev)
>>  	int ret = -EINVAL;
>>  	int i;
>>  
>> +	if (!uioinfo) {
>> +		int irq;
>> +
>> +		/* alloc uioinfo for one device */
>> +		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
>> +		if (!uioinfo) {
>> +			ret = -ENOMEM;
>> +			dev_err(&pdev->dev, "unable to kmalloc\n");
>> +			goto bad2;
>> +		}
>> +		uioinfo->name = pdev->dev.of_node->name;
>> +		uioinfo->version = "devicetree";
>> +
>> +		/* Multiple IRQs are not supported */
>> +		irq = platform_get_irq(pdev, 0);
>> +		if (irq < 0) {
> 
> PowerPC and x86 will return 0 for an unassigned IRQ, as will most platforms.

Not for Microblaze but anyway I am OK to change it and I will look at that 
(maybe even your) patch to fix Microblaze code to return 0 for an unassigned IRQs.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
