From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Thu, 31 Mar 2011 19:54:09 +0200
Message-ID: <4D94BFC1.5070608@monstr.eu>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
	<1301574600-4861-2-git-send-email-monstr@monstr.eu>
	<20110331164348.GI26709@ponder.secretlab.ca>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110331164348.GI26709-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Thu, Mar 31, 2011 at 02:30:00PM +0200, Michal Simek wrote:
>> Support OF support. "generic-uio" compatible property is used.
>>
>> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
>> ---
>>  drivers/uio/uio_pdrv_genirq.c |   60 ++++++++++++++++++++++++++++++++++++++--
>>  1 files changed, 57 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
>> index 7174d51..9e89806 100644
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
>> @@ -92,11 +96,44 @@ static int uio_pdrv_genirq_irqcontrol(struct uio_info *dev_info, s32 irq_on)
>>  static int uio_pdrv_genirq_probe(struct platform_device *pdev)
>>  {
>>  	struct uio_info *uioinfo = pdev->dev.platform_data;
>> -	struct uio_pdrv_genirq_platdata *priv;
>> +	struct uio_pdrv_genirq_platdata *priv = NULL;
>>  	struct uio_mem *uiomem;
>>  	int ret = -EINVAL;
>>  	int i;
>>  
>> +	if (!uioinfo) {
>> +		struct resource r_irq; /* Interrupt resources */
>> +		int rc = 0;
>> +
>> +		rc = of_address_to_resource(pdev->dev.of_node, 0,
>> +							&pdev->resource[0]);
>> +		if (rc) {
>> +			dev_err(&pdev->dev, "invalid address\n");
>> +			goto bad2;
>> +		}
>> +		pdev->num_resources = 1;
> 
> You shouldn't need this anymore.  Device tree sourced platform_devices
> get their resource table populated automatically.  Also, drivers
> should /never/ modify the resource values set in the device because it
> messes up driver rebinding.

done.

> 
>> +
>> +		/* alloc uioinfo for one device */
>> +		uioinfo = kzalloc(sizeof(*uioinfo), GFP_KERNEL);
>> +		if (!uioinfo) {
>> +			ret = -ENOMEM;
>> +			dev_err(&pdev->dev, "unable to kmalloc\n");
>> +			goto bad2;
>> +		}
>> +		uioinfo->name = pdev->dev.of_node->name;
>> +		/* Use version for storing full IP name for identification */
>> +		uioinfo->version = pdev->dev.of_node->full_name;
> 
> Comment on the binding: You should probably use the first entry in the
> compatible list for the name of the device.  Node names should be
> generic and usually they will say what a device does, but not what a
> device actually /is/ (this is the Generic Names recommended practice).
> 
> Modern convention is to rely on the first compatible entry for
> describing what ip block it is.

Is it easy to way to find it out?

M


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
