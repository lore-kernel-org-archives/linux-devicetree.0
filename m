From: chenfeng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH V2 3/3] Add dts node for smmu on hi6220 SoC
Date: Tue, 20 Oct 2015 18:17:13 +0800
Message-ID: <562614A9.8050501@hisilicon.com>
References: <1445330724-129401-1-git-send-email-puck.chen@hisilicon.com>
 <1445330724-129401-3-git-send-email-puck.chen@hisilicon.com>
 <39316856.jTQkIxu0yn@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <39316856.jTQkIxu0yn@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, qijiwen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, weidong2-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, puck.chen-Dw/NWeUnuQfQT0dZR+AlfA@public.gmane.org, yudongbin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, peter.panshilin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, saberlily.xia-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


Thanks for review.
On 2015/10/20 17:00, Arnd Bergmann wrote:
> On Tuesday 20 October 2015 16:45:24 Chen Feng wrote:
>> +
>> +               smmu@f4210000 {
> 
> I think the canonical name for an IOMMU device is 'iommu', not 'smmu'.
Accept.
> 
>> +                       compatible = "hisilicon,hi6220-smmu";
>> +                       reg = <0x0 0xf4210000 0x0 0x1000>;
>> +                       interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&sys_ctrl HI6220_MMU_CLK>,
>> +                                <&media_ctrl HI6220_MED_MMU>,
>> +                                <&sys_ctrl HI6220_MEDIA_PLL_SRC>;
>> +                       clock-names = "smmu_clk",
>> +                                     "media_sc_clk",
>> +                                     "smmu_peri_clk";
> 
> 
> Better avoid underscores in strings, and drop the "_clk" postfix in
> the clock names.
> 
> I did not receive patch 1/3 this time, but I see in version 1, that
> you forgot to document the strings:
> 
Accept, I will change this.
>> +- clock-names: The name to enable clock with clock framework.
> 
> This needs to list the names of the clock inputs to the smmu.
> 
> 	Arnd
> _______________________________________________
> linuxarm mailing list
> linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
> http://rnd-openeuler.huawei.com/mailman/listinfo/linuxarm
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
