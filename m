From: Leif Lindholm <leif.lindholm@linaro.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: add Hi6220 mailbox node
Date: Tue, 25 Aug 2015 10:46:30 +0100
Message-ID: <20150825094630.GU10728@bivouac.eciton.net>
References: <1439977055-1747-1-git-send-email-leo.yan@linaro.org>
 <1439977055-1747-4-git-send-email-leo.yan@linaro.org>
 <20150821184059.GB2000@svinekod>
 <20150824091845.GA28290@leoy-linaro>
 <20150824095144.GA7139@leverpostej>
 <1440411596.3517.12.camel@linaro.org>
 <20150824114903.GT10728@bivouac.eciton.net>
 <1440490427.10987.29.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440490427.10987.29.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bintian Wang <bintian.wang@huawei.com>, Yiping Xu <xuyiping@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "guodong.xu@linaro.org" <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, "kongfei@hisilicon.com" <kongfei@>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 25, 2015 at 04:13:47PM +0800, Haojian Zhuang wrote:
> On Mon, 2015-08-24 at 12:49 +0100, Leif Lindholm wrote:
> > On Mon, Aug 24, 2015 at 06:19:56PM +0800, Haojian Zhuang wrote:
> > > > If your EFI memory map describes the memory as mappable, it is wrong.
> > > 
> > > When kernel is working, kernel will create its own page table based on
> > > UEFI memory map. Since it's reserved in DTS file as Leo's patch, it'll
> > > be moved to reserved memblock. Why is it wrong?
> > > 
> > > In the second, UEFI is firmware. When it's stable, nobody should change
> > > it without any reason.
> > 
> > Much like the memory map.
> > 
> > > These reserved memory are used in mailbox driver.
> > > Look. It's driver, so it could be changed at any time.
> > 
> > No, it is a set of regions of memory set aside for use by a different
> > master in the system as well as communications with that master.
> > 
> > The fact that there is a driver somewhere that is aware of this is
> > entirely beside the point. All agents in the system must adher to this
> > protocol.
> > 
> > > Why do you want
> > > to UEFI knowing this memory range? Do you hope UEFI to change when
> > > mailbox driver is changed?
> > 
> > Yes.
> > 
> > UEFI is a runtime environment. Having random magic areas not to be
> > touched will cause random pieces of software running under it to break
> > horribly or break other things horribly.
> > Unless you mark them as reserved in the UEFI memory map.
> > At which point the Linux kernel will automatically ignore them, and
> > the proposed patch is redundant.
> > 
> > So, yes, if you want a system that can boot reliably, run testsuites
> > (like SCT or FWTS), run applications (like fastboot ... or the EFI
> > stub kernel itself), then any memory regions that is reserved for
> > mailbox communication (or other masters in the system) _must_ be
> > marked in the EFI memory map.
> 
> 1. We need support both UEFI and uboot. So the reserved buffer have to
> be declared in DTB since they are used by kernel driver, not UEFI.

The buffer may need to be declared in DTB also, but it most certanily
needs to be declared in UEFI.

And for the U-Boot case, since it is not memory available to Linux, it
should not be declared as "memory".

> 2. UEFI just loads grub. It's no time to run any other custom EFI
> application.

Apart from being completely irrelevant, how are you intending to
validate that GRUB never touches these memory regions?

Build a version once, test it, and hope the results remain valid
forever? And then when you move the regions and the previously working
GRUB now tramples all over them? Or when something changes in upstream
GRUB and its memory allocations drifts into the secretly untouchable
regions?

Are you then going to hack GRUB, release a special HiKey version of
GRUB, not support any other versions, and still can your firmware
UEFI?

Repeat again and again for any other UEFI applications - including
fastboot, SCT, FWTS and the UEFI stub kernel.

/
    Leif
