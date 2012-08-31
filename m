From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add devres version of of_iomap
Date: Thu, 30 Aug 2012 21:53:03 -0500
Message-ID: <5040270F.6060302@gmail.com>
References: <1346340744-22218-1-git-send-email-m-karicheri2@ti.com>
 <503FB074.7080702@gmail.com>
 <3E54258959B69E4282D79E01AB1F32B7041AD91C@DFLE12.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <3E54258959B69E4282D79E01AB1F32B7041AD91C-GR6MelrUkc+IQmiDNMet8wC/G2K4zDHf@public.gmane.org>
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
To: "Karicheri, Muralidharan" <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/30/2012 05:09 PM, Karicheri, Muralidharan wrote:
>>> -----Original Message-----
>>> From: Rob Herring [mailto:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>>> Sent: Thursday, August 30, 2012 2:27 PM
>>> To: Karicheri, Muralidharan
>>> Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-
>>> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Subject: Re: [PATCH] of: add devres version of of_iomap
>>>
>>> On 08/30/2012 10:32 AM, Murali Karicheri wrote:
>>>> This adds devres version of the of_iomap() to allow resource to be cleaned
>>>> through devres.
>>>
>>> If you have a struct device, then don't you already have a resource and
>>> can just use devm_ioremap in a driver? New drivers should not be using
>>> of_iomap.
>>>
> 
> That is the point. If you do a grep under driver, there are many drivers using the pattern
> like this. This helper function is mean to replace this code.
> 
> From dma/sirf-dma.c
> 
>         ret = of_address_to_resource(dn, 0, &res);
>         if (ret) {
>                 dev_err(dev, "Error parsing memory region!\n");
> 	       goto error;
>         }
> 
>         regs_start = res.start;
>         regs_size = resource_size(&res);
> 
>         base = devm_ioremap(dev, regs_start, regs_size);
>         if (!base) {
>                 dev_err(dev, "Error mapping memory region!\n");
> 	       goto error;
>         }
> 

That's wrong and should be fixed. The resource is already setup and
available to the probe function.

> Other instances.
> 
> edac/mpc85xx_edac.c
> media/video/fsl-viu.c
> mtd/nand/mpc5121_nfc.c

All PPC drivers that used the old of_platform_driver and also need to be
updated.

> 
> Some of these code uses devm_request_mem_region() as well. Isn't a good idea to add this helper
> that can be called by new drivers to replace this sequence? I could update the patch to do this call
> as well?

devm_request_and_ioremap

Rob
