From: Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/6] PCI: designware: move calculation of bus addresses
 to DRA7xx
Date: Wed, 12 Aug 2015 21:10:20 +0530
Message-ID: <CAHM4w1muj4+OBcsDQ9ePjV77t+iPh7TYY8h5MF66GjD=2ktRew@mail.gmail.com>
References: <1438848559-232109-1-git-send-email-wangzhou1@hisilicon.com>
	<1438848559-232109-2-git-send-email-wangzhou1@hisilicon.com>
	<55C44A80.20308@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55C44A80.20308-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zhichang Yuan <yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Zhang Jukuo <zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiujiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kangfenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Liguozhu <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jingoo Han <jing>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 7, 2015 at 11:34 AM, Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org> wrote:
> [+cc jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>
> On 2015/8/6 16:09, Zhou Wang wrote:
>> From: gabriele paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>
>> Commit f4c55c5a3f7f "PCI: designware: Program ATU with untranslated
>> address" added the calculation of PCI BUS addresses in designware,
>> storing them in new fields added in "struct pcie_port". This
>> calculation is done for every designware user even if is only
>> applicable to DRA7xx.
>> This patch moves the calculation of the bus addresses to the DRA7xx
>> driver and is needed to allow the rework of designware to use
>> the new DT parsing API.
>>
>> Signed-off-by: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>


Looks fine to me
Acked-by: Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
