From: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/5] PCI: designware: Add ARM64 support
Date: Wed, 01 Jul 2015 18:32:49 +0100
Message-ID: <55942441.3050705@arm.com>
References: <1435743817-19083-1-git-send-email-wangzhou1@hisilicon.com> <1435743817-19083-3-git-send-email-wangzhou1@hisilicon.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D4E4BB@lhreml503-mbs> <5593F899.6050306@arm.com> <EE11001F9E5DDD47B7634E2F8A612F2E01D4E6A2@lhreml503-mbs>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <EE11001F9E5DDD47B7634E2F8A612F2E01D4E6A2@lhreml503-mbs>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "Wangzhou (B)" <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org" <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, "m-karicheri2-l0cyMroinI0@public.gmane.org" <m-karicheri2-l0cyMroinI0@public.gmane.org>, "Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yuanzhichang <yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhudacai <zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, zhangjukuo <zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, qiuzhenfa <qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Gabriele Paoloni wrote:
>> Both series are applied to v4.1, use the same .config file, and the
>> same dtb.
>> I will investigate further.
>>
>> (Re-testing v2 works, so this isn't an interim hardware failure)
>
> This is a bit weird....
>
> Patch 2/5 is the only one that affect platforms different from Hisilicon
>
> The only difference between V3 patch[2/5] and v2 patch[2/4] is

Between v3:2/5 and your replacement for v2:2/4, which arrived after I had
tested the v2 series. As the patch has been replaced with a different one -
neither 'tested-by' is true any more.

It looks like the BAR containing the bridge window is not being assigned,
so no devices on bus 1 are discovered.

I will send the full v2 and v3 dmesg output separately.


Thanks,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
