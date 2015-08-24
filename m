From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: add Hi6220 mailbox node
Date: Mon, 24 Aug 2015 17:18:45 +0800
Message-ID: <20150824091845.GA28290@leoy-linaro>
References: <1439977055-1747-1-git-send-email-leo.yan@linaro.org>
 <1439977055-1747-4-git-send-email-leo.yan@linaro.org>
 <20150821184059.GB2000@svinekod>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150821184059.GB2000@svinekod>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bintian Wang <bintian.wang@huawei.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Yiping Xu <xuyiping@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "guodong.xu@linaro.org" <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, "kongfei@hisilicon.com" <kongfei@hisilicon.com>, Guangyu
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Fri, Aug 21, 2015 at 07:40:59PM +0100, Mark Rutland wrote:
> On Wed, Aug 19, 2015 at 10:37:35AM +0100, Leo Yan wrote:
> > On Hi6220, below memory regions in DDR have specific purpose:
> > 
> >   0x05e0,0000 - 0x05ef,ffff: For MCU firmware using at runtime;
> >   0x0740,f000 - 0x0740,ffff: For MCU firmware's section;
> >   0x06df,f000 - 0x06df,ffff: For mailbox message data.
> > 
> > This patch reserves these memory regions and add device node for
> > mailbox in dts.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 20 +++++++++++++++++---
> >  arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |  8 ++++++++
> >  2 files changed, 25 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> > index e36a539..d5470d3 100644
> > --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> > +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> > @@ -7,9 +7,6 @@
> >  
> >  /dts-v1/;
> >  
> > -/*Reserved 1MB memory for MCU*/
> > -/memreserve/ 0x05e00000 0x00100000;
> > -
> >  #include "hi6220.dtsi"
> >  
> >  / {
> > @@ -28,4 +25,21 @@
> >  		device_type = "memory";
> >  		reg = <0x0 0x0 0x0 0x40000000>;
> >  	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		mcu-buf@05e00000 {
> > +			no-map;
> > +			reg = <0x0 0x05e00000 0x0 0x00100000>,	/* MCU firmware buffer */
> > +			      <0x0 0x0740f000 0x0 0x00001000>;	/* MCU firmware section */
> > +		};
> > +
> > +		mbox-buf@06dff000 {
> > +			no-map;
> > +			reg = <0x0 0x06dff000 0x0 0x00001000>;	/* Mailbox message buf */
> > +		};
> > +	};
> 
> As far as I can see, it would be simpler to simply carve these out of the
> memory node.
> 
> I don't see why you need reserved-memory here, given you're not referring to
> these regions by phandle anyway.

- Now we have enabled EFI_STUB, so the memory node will be removed in
  kernel:
    efi_entry()
      \-> allocate_new_fdt_and_exit_boot()
            \-> update_fdt();

  Finally in kernel it cannot use memory node to carve out reseved
  memory regions.

- On the other hand, DTS's the memory node is to "describes the
  physical memory layout for the system"; so it's better to use it only
  to describe the hardware info for memory. We can use reserved-memory
  to help manage the memory regions which are reserved from software
  perspective.

According to upper info, we still need to use reserved-memory node to
depict the reserved memory regions. i have no knowledge about EFI_STUB,
so please confirm or correct as needed.

Thanks,
Leo Yan
