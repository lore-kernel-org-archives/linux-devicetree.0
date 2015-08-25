From: Leif Lindholm <leif.lindholm@linaro.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: add Hi6220 mailbox node
Date: Tue, 25 Aug 2015 11:40:53 +0100
Message-ID: <20150825104053.GV10728@bivouac.eciton.net>
References: <1439977055-1747-1-git-send-email-leo.yan@linaro.org>
 <1439977055-1747-4-git-send-email-leo.yan@linaro.org>
 <20150821184059.GB2000@svinekod>
 <20150824091845.GA28290@leoy-linaro>
 <20150824095144.GA7139@leverpostej>
 <1440411596.3517.12.camel@linaro.org>
 <20150824114903.GT10728@bivouac.eciton.net>
 <1440490427.10987.29.camel@linaro.org>
 <20150825094630.GU10728@bivouac.eciton.net>
 <1440497710.10987.42.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440497710.10987.42.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bintian Wang <bintian.wang@huawei.com>, Yiping Xu <xuyiping@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "guodong.xu@linaro.org" <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, "kongfei@hisilicon.com" <kongfei@>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 25, 2015 at 06:15:10PM +0800, Haojian Zhuang wrote:
> > > 1. We need support both UEFI and uboot. So the reserved buffer have to
> > > be declared in DTB since they are used by kernel driver, not UEFI.
> > 
> > The buffer may need to be declared in DTB also, but it most certanily
> > needs to be declared in UEFI.
> > 
> > And for the U-Boot case, since it is not memory available to Linux, it
> > should not be declared as "memory".
> 
> Something are messed at here. We have these buffer are used in mailbox.
> They should be allocated as non-cacheable.

That is a completely different issue, and if that is not currently
possible, then we need to fix that. But it needs to be fixed in the
right place.

> If these buffers are contained in memory memblock in kernel, it means
> that they exist in kernel page table with cachable property. When it's
> used in mailbox driver with non-cachable property, it'll only cause
> cache maintenance issue. So Leo declared these buffers as reserved
> in DT with "no-map" property. It's the key. It could avoid the cache
> maintenance issue.

Yes, when not booting with UEFI.

> > > 2. UEFI just loads grub. It's no time to run any other custom EFI
> > > application.
> > 
> > Apart from being completely irrelevant, how are you intending to
> > validate that GRUB never touches these memory regions?
> 
> GRUB is just a part of bootloader. When linux kernel is running,
> who cares GRUB? GRUB's lifetime is already finished.

We don't care once Linux is running - we care between UEFI boot
services starting and Linux memblock being initialised.

> By the way, UEFI code region is at [0x3Dxx_xxxx, 0x3DFF_FFFF]. Those
> mailbox buffer is in [0x05e0_xxxx, 0x06f0_xxxx]. Then I can make sure
> UEFI won't touch the reserved buffer.

And if a UEFI application explicitly requests to map an area
elsewhere, will your UEFI reject that request? How will it do that
without having information in its memory map about areas it must not
access?

> Even if UEFI touched the reserved
> buffer, is it an issue? Definitely it's not. UEFI's lifetime is end
> when linux kernel is running at hikey. Even if UEFI runtime service
> is enabled, the runtime data area is at [0x38xx_xxxx, 0x38xx_xxxx].

The runtime data area is currently, in your current image, at
[0x38xx_xxxx, 0x38xx_xxxx].

What happens if a UEFI application registers a configuration table?
Or registers a protocol for use at runtime?

Areas of memory that are not available for UEFI _must_ be marked as
such in the UEFI memory map. Once they are, we can deal with them in
the kernel. If this is not currently being done, that is a bug that
needs fixing.

> > Build a version once, test it, and hope the results remain valid
> > forever? And then when you move the regions and the previously working
> > GRUB now tramples all over them? Or when something changes in upstream
> > GRUB and its memory allocations drifts into the secretly untouchable
> > regions?
> 
> As I said above, UEFI won't touch it. And even UEFI touch it, kernel
> doesn't care since UEFI's lifetime is end.

UEFI's lifetime doesn't end until reset.

> > Are you then going to hack GRUB, release a special HiKey version of
> > GRUB, not support any other versions, and still can your firmware
> > UEFI?
> 
> I don't need to hack GRUB at all.

You will if you're running it under a "UEFI" which has areas you can't
touch and aren't telling it about that.

/
    Leif
