From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] of: Export of_irq_count for using in modules
Date: Fri, 31 May 2013 17:16:01 +0200
Message-ID: <20130531151601.GG19834@game.jcrosoft.org>
References: <6aa29b1d109a46278a7f37b598defe07d6edfe60.1369921774.git.michal.simek@xilinx.com>
 <20130530201714.GE19834@game.jcrosoft.org>
 <51A85BEE.4000009@monstr.eu>
 <20130531110045.GF19834@game.jcrosoft.org> <51A8AC4B.906@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51A8AC4B.906-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15:57 Fri 31 May     , Michal Simek wrote:
> On 05/31/2013 01:00 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 10:14 Fri 31 May     , Michal Simek wrote:
> >> Hi Jean-Christophe,
> >>
> >> On 05/30/2013 10:17 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> >>> On 15:49 Thu 30 May     , Michal Simek wrote:
> >>>> Export of_irq_count for modules.
> >>>
> >>> can you explain why do you need to call of_irq_count
> >>
> >> I need to count number of irq written in the DTS node.
> >> It is not fixed size that's why I need to proper way how to
> >> find it out.
> >>
> >> I am using this loop.
> >> 	count = of_irq_count(pdev->dev.of_node);
> >> 	/* Alloc IRQ based on DTS to be sure that no other driver will use it */
> >> 	while (count--) {
> >> 		tmp->irq = irq_of_parse_and_map(pdev->dev.of_node, count);
> >> 		dev_info(&pdev->dev, "%d: Alloc irq: %d\n", count, tmp->irq);
> >> 		ret = request_irq(tmp->irq, zynq_remoteproc_interrupt, 0,
> >> 					dev_name(&pdev->dev), &pdev->dev);
> >> 		if (ret) {
> >> 			...
> >> 		}
> >> 	}
> >>
> >> But of course if you think that this is incorrect to export it
> >> I can use what it is in of_irq_count body
> >> 368 int of_irq_count(struct device_node *dev)
> >> 369 {
> >> 370         int nr = 0;
> >> 371
> >> 372         while (of_irq_to_resource(dev, nr, NULL))
> >> 373                 nr++;
> >> 374
> >> 375         return nr;
> >> 376 }
> >>
> >> Because of_irq_to_resource is exported for modules.
> >> Or is there any better way how to loop over all interrupts in DT node?
> > 
> > can just explain me why you need to call irq_of_parse_and_map in your driver?
> > 
> > as the irq will be provided in the resources normally
> 
> It is quite a long time I have written this driver on v3.1 or 3.3.
> But is this better?
> 
> 	struct resource *res;
> 	int i = 0;
> 	do {
> 		res = platform_get_resource(pdev, IORESOURCE_IRQ, i++);
> 		if (res)
> 			do something
> 	} while(res);
> 
> Also what about of_irq_to_resource()? Is it deprecated and all drivers
> shouldn't use it?
> 
> I have no problem to rewrite the driver to use platform_get_resource.
yeah it's better but be aware there is a but in DT that I'm working on to fix
if you use irq that are registered by a pdev this will not work

I hope to fix it for 3.11
and already send an RFC that fix it

Best Regards,
J.
> 
> Thanks,
> Michal
> 
> -- 
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
> Maintainer of Linux kernel - Xilinx Zynq ARM architecture
> Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform
> 
> 
