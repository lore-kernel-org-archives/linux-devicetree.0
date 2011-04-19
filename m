From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 10:16:54 +0200
Message-ID: <4DAD44F6.1030801@monstr.eu>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
	<20110418160658.GD23814@pengutronix.de>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110418160658.GD23814-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Wolfram Sang wrote:
> Hi,
> 
>> For example with "uio" compatible string:
>> static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
>> 	{ .compatible = "uio", },
>> 	{ /* empty for now */ },
>> };
> 
> Please use a proper example with "vendor,device".
> (And after that it won't be empty anymore)
> 
>> +		/* Multiple IRQs are not supported */
>> +		irq = platform_get_irq(pdev, 0);
>> +		if (irq < 0) {
>> +			uioinfo->irq = UIO_IRQ_NONE;
>> +			dev_info(&pdev->dev, "no IRQ found\n");
>> +		} else {
>> +			uioinfo->irq = irq;
>> +			dev_info(&pdev->dev, "irq %d\n", (u32)uioinfo->irq);
>> +		}
> 
> Come to think of it, the driver so far does not print any dev_info messages,
> only err and warn. So, I'd think these messages should go, too, but this is up
> to Hans.

I used that because I wanted to see more information about UIO in bootlog. If 
you and Hans want to remove it, I will do it.

Thanks,
Michal



-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
