From: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v5 2/5] PCI: designware: Add ARM64 support
Date: Tue, 4 Aug 2015 10:43:06 +0000
Message-ID: <EE11001F9E5DDD47B7634E2F8A612F2E01D71A2D@lhreml503-mbs>
References: <1437794486-21134-1-git-send-email-wangzhou1@hisilicon.com>
 <1437794486-21134-3-git-send-email-wangzhou1@hisilicon.com>
 <55B71F75.5030907@hisilicon.com> <55C0872E.9060507@arm.com>
 <EE11001F9E5DDD47B7634E2F8A612F2E01D719E9@lhreml503-mbs>
 <55C09694.30506@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55C09694.30506-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, "Wangzhou (B)" <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yuanzhichang <yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhudacai <zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, zhangjukuo <zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, qiuzhenfa <qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "liudongdong (C)" <liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, qiujiang <qiujiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Kangfenglong <kangfenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "Liguozhu (Kenneth)" <liguozhu@h>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: James Morse [mailto:james.morse-5wv7dgnIgG8@public.gmane.org]
> Sent: Tuesday, August 04, 2015 11:40 AM
> To: Gabriele Paoloni; Wangzhou (B)
> Cc: Bjorn Helgaas; Jingoo Han; Pratyush Anand; Arnd Bergmann; Lorenzo
> Pieralisi; Liviu Dudau; thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org; Jason
> Cooper; robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Yuanzhichang;
> Zhudacai; zhangjukuo; qiuzhenfa; liudongdong (C); qiujiang;
> Kangfenglong; Liguozhu (Kenneth)
> Subject: Re: [PATCH v5 2/5] PCI: designware: Add ARM64 support
> 
> On 04/08/15 11:23, Gabriele Paoloni wrote:
> > Hi James
> >
> > Please see "[PATCH v6] PCI: Store PCIe bus address in struct
> of_pci_range"
> >
> > I think if you apply this patch your problem should be solved...
> >
> > If you follow the discussion you see that this patch is going to be
> part
> > of the next designware patchset...
> 
> Yes I just spotted that series after continuing through my email
> backlog.
> 
> > Wang Zhou said "You need apply Gabriele's patch before applying this
> patch."
> > but he didn't specify which one and obviously this patch should have
> been part
> > of the patch-set
> 
> I assumed he meant your patch 1 in the same series, (given the reply
> was to
> patch 2).
> 
> With the '[PATCH v6] PCI: Store PCIe bus address in struct
> of_pci_range'
> applied before patches and 1 and 2 of this series - pcie on the
> 'Freescale i.MX6 Quad SABRE Lite Board' works fine.
> 
> I can rescan the bus, load firmware, list nearby APs, and even get MSIs
> coming from the card.

This is Great NEWS! Thanks a Lot!

> 
> Tested-by: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
> 
> 
> 
> James
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
