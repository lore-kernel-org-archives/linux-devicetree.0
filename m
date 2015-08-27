From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: add Hi6220 mailbox node
Date: Thu, 27 Aug 2015 17:46:17 +0100
Message-ID: <20150827164617.GB31748@leverpostej>
References: <20150824095144.GA7139@leverpostej>
 <1440411596.3517.12.camel@linaro.org>
 <20150824114903.GT10728@bivouac.eciton.net>
 <1440490427.10987.29.camel@linaro.org>
 <20150825094630.GU10728@bivouac.eciton.net>
 <1440497710.10987.42.camel@linaro.org>
 <20150825104256.GB13471@leverpostej>
 <1440510194.10987.52.camel@linaro.org>
 <20150825160030.GA3774@leoy-linaro>
 <1440552341.10987.53.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440552341.10987.53.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: "leo.yan@linaro.org" <leo.yan@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bintian Wang <bintian.wang@huawei.com>, Yiping Xu <xuyiping@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "guodong.xu@linaro.org" <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, kongfei@hisil
List-Id: devicetree@vger.kernel.org

> > Option 2:
> > 
> > 	memory@0 {
> > 		device_type = "memory";
> > 		reg = <0x0 0x0 0x0 0x40000000>;
> > 	};
> > 
> > 	reserved-memory {
> > 		#address-cells = <2>;
> > 		#size-cells = <2>;
> > 		ranges;
> > 
> > 		mcu_reserved: mcu_reserved@06dff000 {
> > 			no-map;
> > 			reg = <0x0 0x06dff000 0x0 0x00001000>,	/* MCU mailbox buffer */
> > 			      <0x0 0x05e00000 0x0 0x00100000>,	/* MCU firmware buffer */
> > 			      <0x0 0x0740f000 0x0 0x00001000>;	/* MCU firmware section */
> > 		};
> > 	};
> > 
> >         [...]
> > 
> > 	mailbox: mailbox@f7510000 {
> > 		#mbox-cells = <1>;
> > 		compatible = "hisilicon,hi6220-mbox";
> > 		reg = <0x0 0xf7510000 0x0 0x1000>; /* IPC_S */
> > 		memory-region = <&mcu_reserved>;   /* Mailbox buffer */
> > 		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> > 	};
> 
> I prefer the second one. From my view, memory node should only describe
> the hardware information of memory.

That doesn't align with the spec. Per ePAPR, in the description of a
memory node:

	The client program may access memory not covered by any memory
	reservations (see section 8.3) using any storage attributes it
	chooses. However, before changing the storage attributes used to
	access a real page, the client program is responsible for
	performing actions required by the architecture and
	implementation, possibly including flushing the real page from
	the caches.

Note that in this context, memory reservation applies to /memreserve/.
We can only expect other software to handle /memreserve/, and not
reserved-memory, as the latter was introduced by Linux and has not
existed for anywhere near as long.

Additionally, the OS is permitted to map reserved memory with cacheable
attributes.

So the memory nodes have never been about the raw hardware layout, but
rather the regions that the OS may map. If (outside of the driver
responsible for the region) the OS should not map a region of memory,
that region should not appear in any memory node.

As mentioned in my other reply, for a region that the OS could map but
cannot use, I don't see much point in listing that memory in any memory
node.

Thanks,
Mark
