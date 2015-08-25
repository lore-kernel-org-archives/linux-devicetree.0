From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: add Hi6220 mailbox node
Date: Tue, 25 Aug 2015 16:51:22 +0200
Message-ID: <CAKv+Gu-b=QvMF++V9UjULRxrGvoz-0ytFLeuLm8Y5sQH4p53Sw@mail.gmail.com>
References: <20150821184059.GB2000@svinekod>
	<20150824091845.GA28290@leoy-linaro>
	<20150824095144.GA7139@leverpostej>
	<1440411596.3517.12.camel@linaro.org>
	<20150824114903.GT10728@bivouac.eciton.net>
	<1440490427.10987.29.camel@linaro.org>
	<20150825094630.GU10728@bivouac.eciton.net>
	<1440497710.10987.42.camel@linaro.org>
	<20150825104256.GB13471@leverpostej>
	<1440510194.10987.52.camel@linaro.org>
	<20150825142416.GW10728@bivouac.eciton.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150825142416.GW10728@bivouac.eciton.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Leif Lindholm <leif.lindholm@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Dan Zhao <dan.zhao@hisilicon.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Jian Zhang <zhangjian001@hisilicon.com>, Guangyue Zeng <zengguangyue@hisilicon.com>, Yiping Xu <xuyiping@hisilicon.com>, Jassi Brar <jassisinghbrar@gmail.com>, Wei Xu <xuwei5@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bintian Wang <bintian.wang@huawei.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "kongfei@hisilicon.com" <kongfei@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Haoju Mo <mohaoju@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "guodong.xu@linaro.org" <guodong.xu@l>
List-Id: devicetree@vger.kernel.org

On 25 August 2015 at 16:24, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> On Tue, Aug 25, 2015 at 09:43:14PM +0800, Haojian Zhuang wrote:
>> Since we discussed a lot on this, let's make a conclusion on it.
>>
>> 1. UEFI could append the reserved buffer in it's memory mapping.
>
> Yes. It needs to.
>
> (I will let Mark comment on points 2-4.)
>
>> 5. A patch is necessary in kernel. If efi stub feature is enabled,
>>    arm kernel should not parse memory node or reserved memory buffer in
>>    DT any more.
>
> This is already the case. The stub deletes any present memory nodes and
> reserved entries in drivers/firmware/efi/libstub/fdt.c:update_fdt().
>
> Then, during setup_arch(), arch/arm64/kernel/efi.c:efi_init() calls
> reserve_regions(), which adds only those memory regions available for
> use by Linux as RAM to memblock.
>
>>    Arm kernel should either fetch memory information from
>>    efi or DT.
>
> Absolutely.
>
>>    Currently arm kernel fetch both efi memory information and
>>    reserved buffer from DTB at the same time.
>
> No, it does not.
>

It should not, but it does. Due to an oversight, the stub removes
/memreserve/ entries but ignores the reserved-memory node completely.

This was reported here in fact

http://thread.gmane.org/gmane.linux.kernel.efi/5736/focus=5742

but there has not been a followup to this series.

I think it is fine to keep those memory reservations in the DT, but
you should simply understand that UEFI does not parse the DT, so you
need to tell it which memory it cannot touch. Otherwise, the firmware
itself or anything that executes under it (UEFI drivers, the UEFI
Shell, GRUB, the UEFI stub in the kernel) will think it is available
and may allocate it for its own use. This may include runtime services
regions that will remain reserved even after exiting boot services.

-- 
Ard.
