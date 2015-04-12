From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 3/3] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Sun, 12 Apr 2015 11:57:35 +0100
Message-ID: <7a9107efdfe64b0d9e9d93421595badb@www.loen.fr>
References: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
 <1423128277-10297-4-git-send-email-bintian.wang@huawei.com>
 <20150205193017.GF20735@leverpostej>
 <CAAS=xmgsuY=c8-n_pDiZjLe2u+SPX7msRje7h0sNkRtT3HLfQA@mail.gmail.com>
 <CAAS=xmgySDmwNpx5xpHd15M-1eJLvPBhudhGu+cRqw3g_X_SZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAS=xmgySDmwNpx5xpHd15M-1eJLvPBhudhGu+cRqw3g_X_SZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brent Wang <wangbintian@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, dan.zhao@hisilicon.com, btw@mail.itp.ac.cn, Catalin Marinas <catalin.marinas@arm.com>, wangbinghui@hisilicon.com, Will Deacon <will.deacon@arm.com>, huxinwei@huawei.com, khilman@linaro.org, haojian.zhuang@linaro.org, yanhaifeng@gmail.com, rob.herring@linaro.org, mturquette@linaro.org, victor.lixin@hisilicon.com, xuwei5@hisilicon.com, jh80.chung@samsung.com, sledge.yanwei@huawei.com, kong.kongxinwei@hisilicon.com, heyunlei@huawei.com, w.f@huawei.com, zhangfei.gao@linaro.org, z.liuxinliang@huawei.com, devicetree@vger.kernel.org, Bintian Wang <bintian.wang@huawei.com>, Pawel Moll <pawel.moll@arm.com>, ijc+devicetree@hellion.org.uk, puck.chen@hisilicon.com, olof@lixom.net, robh+dt@kernel.org, linux@arm.linux.org.uk, zhenwei.wang@hisilicon.com, linux-arm-kernel@lists.infradead.org, gu
List-Id: devicetree@vger.kernel.org

On 2015-04-12 07:40, Brent Wang wrote:
> Hello Mark,
>
> 2015-02-06 16:42 GMT+08:00 Brent Wang <wangbintian@gmail.com>:
> [...]
>>>
>>>> +     gic: interrupt-controller@f6800000 {
>>>> +             compatible = "arm,gic-400", "arm,cortex-a15-gic";
>>>
>>> Surely there's no need for the "arm,cortex-a15-gic" fallback entry? 
>>> What
>>> am I missing?
>> Remove it in next version.
> After remove "arm,cortex-a15-gic", I get the following error during
> kernel booting:
> -----
> kvm [1]: Using HYP init bounce page @396d9000
> kvm [1]: error: no compatible GIC node found
> kvm [1]: error initializing Hyp mode: -19
> -----
>
> Check code "virt/kvm/arm/vgic.c", gicv2 only "cortex-a15-gic" and
> gicv3 support kvm now,
> so I think we should keep it, how about your idea?

Please look at commit 0f37247574b3 that is queued for merge in 4.1.
It adds the required compatibility strings to KVM, so Mark is perfectly
right to ask you to drop this "cortex-a15-gic" from your DT.

This DT won't be merged before 4.1 anyway, so there is no point trying
to make it work with older kernels.

Thanks,

         M.
-- 
Fast, cheap, reliable. Pick two.
