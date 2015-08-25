From: Leif Lindholm <leif.lindholm@linaro.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: add Hi6220 mailbox node
Date: Tue, 25 Aug 2015 16:37:54 +0100
Message-ID: <20150825153754.GY10728@bivouac.eciton.net>
References: <20150824095144.GA7139@leverpostej>
 <1440411596.3517.12.camel@linaro.org>
 <20150824114903.GT10728@bivouac.eciton.net>
 <1440490427.10987.29.camel@linaro.org>
 <20150825094630.GU10728@bivouac.eciton.net>
 <1440497710.10987.42.camel@linaro.org>
 <20150825104256.GB13471@leverpostej>
 <1440510194.10987.52.camel@linaro.org>
 <20150825142416.GW10728@bivouac.eciton.net>
 <CAKv+Gu-b=QvMF++V9UjULRxrGvoz-0ytFLeuLm8Y5sQH4p53Sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-b=QvMF++V9UjULRxrGvoz-0ytFLeuLm8Y5sQH4p53Sw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Dan Zhao <dan.zhao@hisilicon.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Jian Zhang <zhangjian001@hisilicon.com>, Guangyue Zeng <zengguangyue@hisilicon.com>, Yiping Xu <xuyiping@hisilicon.com>, Jassi Brar <jassisinghbrar@gmail.com>, Wei Xu <xuwei5@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bintian Wang <bintian.wang@huawei.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "kongfei@hisilicon.com" <kongfei@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Haoju Mo <mohaoju@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "guodong.xu@linaro.org" <guodong.xu@l>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 25, 2015 at 04:51:22PM +0200, Ard Biesheuvel wrote:
> >>    Arm kernel should either fetch memory information from
> >>    efi or DT.
> >
> > Absolutely.
> >
> >>    Currently arm kernel fetch both efi memory information and
> >>    reserved buffer from DTB at the same time.
> >
> > No, it does not.
> 
> It should not, but it does. Due to an oversight, the stub removes
> /memreserve/ entries but ignores the reserved-memory node completely.

Urgh.

> This was reported here in fact
> 
> http://thread.gmane.org/gmane.linux.kernel.efi/5736/focus=5742
> 
> but there has not been a followup to this series.

Are all of those patches still relevant, or did some of them go in
already?

Haojian: can you give that patch a spin and see if it does what you
need, combined with adding the reserved areas to the UEFI memory map?

/
    Leif
