From: Brent Wang <wangbintian@gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Sun, 12 Apr 2015 21:07:43 +0800
Message-ID: <CAAS=xmh1j3H6Dj2-4UgWCtcXSnm_ASiEhee3XDawg7Gi2pTJmw@mail.gmail.com>
References: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
	<1423128277-10297-4-git-send-email-bintian.wang@huawei.com>
	<20150205193017.GF20735@leverpostej>
	<CAAS=xmgsuY=c8-n_pDiZjLe2u+SPX7msRje7h0sNkRtT3HLfQA@mail.gmail.com>
	<CAAS=xmgySDmwNpx5xpHd15M-1eJLvPBhudhGu+cRqw3g_X_SZA@mail.gmail.com>
	<7a9107efdfe64b0d9e9d93421595badb@www.loen.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7a9107efdfe64b0d9e9d93421595badb@www.loen.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, "btw@mail.itp.ac.cn" <btw@mail.itp.ac.cn>, Catalin Marinas <catalin.marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, Will Deacon <will.deacon@arm.com>, "huxinwei@huawei.com" <huxinwei@huawei.com>, Kevin Hilman <khilman@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Haifeng Yan <yanhaifeng@gmail.com>, Rob Herring <rob.herring@linaro.org>, Mike Turquette <mturquette@linaro.org>, "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>, Xu Wei <xuwei5@hisilicon.com>, Jaehoon Chung <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, XinWei Kong <kong.kongxinwei@hisilicon.com>, "heyunlei@huawei.com" <heyunlei@huawei.com>, "w.f@huawei.com" <w.f@huawei.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, z.liuxinliang@huawei.
List-Id: devicetree@vger.kernel.org

Hello Marc,

2015-04-12 18:57 GMT+08:00 Marc Zyngier <marc.zyngier@arm.com>:
> On 2015-04-12 07:40, Brent Wang wrote:
>>
>> Hello Mark,
>>
>> 2015-02-06 16:42 GMT+08:00 Brent Wang <wangbintian@gmail.com>:
>> [...]
>>>>
>>>>
>>>>> +     gic: interrupt-controller@f6800000 {
>>>>> +             compatible = "arm,gic-400", "arm,cortex-a15-gic";
>>>>
>>>>
>>>> Surely there's no need for the "arm,cortex-a15-gic" fallback entry? What
>>>> am I missing?
>>>
>>> Remove it in next version.
>>
>> After remove "arm,cortex-a15-gic", I get the following error during
>> kernel booting:
>> -----
>> kvm [1]: Using HYP init bounce page @396d9000
>> kvm [1]: error: no compatible GIC node found
>> kvm [1]: error initializing Hyp mode: -19
>> -----
>>
>> Check code "virt/kvm/arm/vgic.c", gicv2 only "cortex-a15-gic" and
>> gicv3 support kvm now,
>> so I think we should keep it, how about your idea?
>
>
> Please look at commit 0f37247574b3 that is queued for merge in 4.1.
> It adds the required compatibility strings to KVM, so Mark is perfectly
> right to ask you to drop this "cortex-a15-gic" from your DT.

Thanks for the information.

> This DT won't be merged before 4.1 anyway, so there is no point trying
> to make it work with older kernels.
>
> Thanks,
>
>         M.
> --
> Fast, cheap, reliable. Pick two.



-- 
Best Regards,

Bintian
===========================
Don't be nervous, just be happy!
