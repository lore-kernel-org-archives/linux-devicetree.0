From: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/2] arm64: Support Hisilicon Hip05-D02 board
Date: Sun, 6 Sep 2015 10:40:02 +0800
Message-ID: <55EBA782.7080403@huawei.com>
References: <1441421939-6236-1-git-send-email-dingtianhong@huawei.com> <20150905101854.4f5011bb@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150905101854.4f5011bb-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhizhou.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015/9/5 17:18, Marc Zyngier wrote:
> On Sat, 5 Sep 2015 10:58:57 +0800
> Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> 
>> Hip05-D02 Development Board is based on Cortex-A57, this patchset
>> contains initial support for Hip05-D02 Soc and Board. Initial support
>> is minimal and includes just the arch configuration, device tree
>> configuration.
>>
>> PSCI is enabled in device tree and there is no problem to boot all the
>> 16 cores, and the CPU hotplug is also working now, you can download and
>> compile the latest firmware based on the following link to run this
>> patch set.
>>
>> https://github.com/hisilicon/estuary/blob/master/README
>>
>> v1->v2:
>> - 1. Change the compatible name for per CPU.
>>   2. Remove the GIC_CPU_MASK_SIMPLE(xx) which is not used for gicv3
>>      from hip05.dtsi.
> 
> Please always indicate the version number in the email subject ("PATCH
> v2" is the usual scheme). It makes it otherwise difficult to keep track
> of what version I am looking at.
> 
> Thanks,
> 
Miss it, fix it in next version, thanks.

Ding


> 	M.
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
