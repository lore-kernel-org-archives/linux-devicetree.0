From: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v6 3/6] PCI: designware: Add ARM64 support
Date: Fri, 14 Aug 2015 14:55:07 +0000
Message-ID: <EE11001F9E5DDD47B7634E2F8A612F2E01D7BC19@lhreml503-mbs>
References: <1438848559-232109-1-git-send-email-wangzhou1@hisilicon.com>
 <1438848559-232109-4-git-send-email-wangzhou1@hisilicon.com>
 <55C44B18.4010103@hisilicon.com> <55CDFFC0.40604@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55CDFFC0.40604-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, "Wangzhou (B)" <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yuanzhichang <yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhudacai <zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, zhangjukuo <zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, qiuzhenfa <qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "liudongdong (C)" <liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, qiujiang <qiujiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Kangfenglong <kangfen>
List-Id: devicetree@vger.kernel.org

> 
> I've tested this whole series on an ARM32 PCIe board:'Freescale i.MX6
> Quad
> SABRE Lite Board' with an Intel wireless card on v4.2-rc6.
> 
> I can rescan the bus, load firmware, list nearby APs, and even get MSIs
> coming from the card.
> 
> Tested-By: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
> 
> 
> Thanks,
> 
> James

Many Thanks for this James!

Gab
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
