From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Date: Fri, 6 Jan 2017 09:49:30 +0100
Message-ID: <20170106094930.0f579dca@bbrezillon>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
        <1481557252-13656-2-git-send-email-clg@kaod.org>
        <5566c62d-cc72-f207-e1dd-5a59e6947c24@wedev4u.fr>
        <a7cb781c-a4a8-f0f7-e7db-5cd9f19da0aa@kaod.org>
        <2bec1e91-a196-b894-fb66-590b8f4f35c3@atmel.com>
        <645db8c4-7f3c-f8bf-ddd9-3f513ce2ed14@kaod.org>
        <4c5cf674-06f9-ad6b-05bf-a1d39aaa7ed5@atmel.com>
        <20170104185005.7fcafd2d@bbrezillon>
        <4c0b4498-12c7-303d-c8f8-4f27a02d6c12@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4c0b4498-12c7-303d-c8f8-4f27a02d6c12-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Cédric,

On Thu, 5 Jan 2017 14:39:14 +0100
Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:

> Hello Cyrille, Boris 
> 
> On 01/04/2017 06:50 PM, Boris Brezillon wrote:
> > Cyrille, Cédric,
> > 
> > On Wed, 4 Jan 2017 15:52:07 +0100
> > Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> >   
> >>>     
> >>>> Anyway, since the review is done now, on my side I won't ask you to remove
> >>>> or split the support of the 'Command' mode in a separated patch.
> >>>> I let you do as you want, if it help you to introduce some part of the
> >>>> support of this 'Command' mode now even if not completed yet, no problem on
> >>>> my side :)
> >>>>
> >>>> I was just giving you some pieces of advice for the next time if you want
> >>>> to speed up the review of another patch introducing new features.
> >>>>
> >>>> However, I will just ask you one more version handling the dummy cycles
> >>>> properly as it would help us for the global maintenance of the spi-nor
> >>>> subsystem. This is the only mandatory modification I ask you, after that I
> >>>> think it would be ok for me and since Marek has already reviewed your
> >>>> driver, it would be ready to be merged into the spi-nor tree.    
> >>>
> >>> Sending a v5 which should address your comments. 
> >>>
> >>> I have removed the label property and will start a new thread in the 
> >>> topic. Any hints on which binding we could add this label prop ?  
> >>>    
> >>
> >> Here I will provide just few thoughts about this new DT property. I don't
> >> pretend this is what should be done. I still think other mtd maintainers
> >> should be involved to discuss this topic.
> >>
> >> First the DT property name "label" sounds good to me: it is consistent with
> >> "label" DT property used to name mtd partitions. However, I don't think it
> >> should be documented in jedec,spi-nor.txt but *maybe* in partition.txt as
> >> the purpose of this new DT property seems very close to the "label"
> >> property of partition nodes: let's think about some hard-disk device
> >> (/dev/sda) and its partition devices (/dev/sdaX).  
> 
> yes this is very similar. I first looked at introducing a name to 
> an overall containing partition but the partition binding is not 
> designed for that. There are constraints on the start address and
> the size which does not fit the purpose.
> 
> > Hm, partition.txt may not be appropriate here. We're not documenting
> > the MTD partition binding, but the MTD device one. Maybe we should
> > create mtd.txt and put all generic MTD dev properties here.  
> >>
> >> Besides, the concept of this memory label is not limited to SPI NOR but
> >> could also apply to NAND memories or any other MTD handled memories.  
> > 
> > Definitely. Actually I think I'll need that for the Atmel NAND
> > controller driver rework I'm currently working on, to keep mtdparts
> > parser happy even after changing the NAND device naming scheme.
> >   
> >> Hence the DT property might be handled by drivers/mtd/ofpart.c instead of
> >> being handled by spi-nor.c or by each SPI NOR memory controller driver.  
> > 
> > Actually, that could be done at the mtdcore level in
> > mtd_set_dev_defaults() [1].  
> 
> that would be perfect.
> 
> >> Finally, I guess we should take time to discuss and all agree what should
> >> be done precisely before introducing a new DT property because one general
> >> rule with DTB files is that users should be able to update their kernel
> >> image (zImage, uImage, ...) without changing their DTB: device trees should
> >> be backward compatible. Hence if we make a wrong choice today, we are
> >> likely to have to live with it and keep supporting that bad choice.  
> > 
> > Rob already acked the patch, so, if all MTD maintainers agree that this
> > new property is acceptable, we should be fine ;-).  
> 
> yes but we would need to move the binding property to another file. 
> What I sent applied to "jedec,spi-nor" and we want to generalize the 
> property to other devices.

We could create an new file under
Documentation/devicetree/bindings/mtd/, or we could rename
partition.txt into something else (generic.txt or common.txt) and
document more than the partition binding.

Can you take care of that (in a separate patch series of course)?

Thanks,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
