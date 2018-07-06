From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 2/3] k3dma: add support to reserved minimum channels
Date: Fri, 6 Jul 2018 11:39:38 +0530
Message-ID: <20180706060938.GU22377@vkoul-mobl>
References: <20180622032416.20133-1-guodong.xu@linaro.org>
 <20180622032416.20133-3-guodong.xu@linaro.org>
 <20180628060239.GO22377@vkoul-mobl>
 <CAFGCpxwkdJQAf9bwHTLp+Zc5ASbnFQn9UDsA+zFCH7UZJy9aBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFGCpxwkdJQAf9bwHTLp+Zc5ASbnFQn9UDsA+zFCH7UZJy9aBQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dan.j.williams@intel.com, liyu65@hisilicon.com, Suzhuangluan <suzhuangluan@hisilicon.com>, "xuhongtao (A)" <xuhongtao8@hisilicon.com>, zhongkaihua <zhongkaihua@huawei.com>, Xuezhiliang <xuezhiliang@hisilicon.com>, "xupeng (Q)" <xupeng7@huawei.com>, sunliang10@huawei.com, "Fengbaopeng (kevin, Kirin Solution Dept)" <fengbaopeng@hisilicon.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06-07-18, 11:05, Guodong Xu wrote:
> On Thu, Jun 28, 2018 at 2:02 PM Vinod <vkoul@kernel.org> wrote:
> >
> > On 22-06-18, 11:24, Guodong Xu wrote:
> > > From: Li Yu <liyu65@hisilicon.com>
> > >
> > > On k3 series of SoC, DMA controller reserves some channels for
> > > other on-chip coprocessors. By adding support to dma_min_chan, kernel
> > > will not be able to use these reserved channels.
> > >
> > > One example is on Hi3660 platform, channel 0 is reserved to lpm3.
> > >
> > > Please also refer to Documentation/devicetree/bindings/dma/k3dma.txt
> >
> > and if some other platform has channel X marked for co-processor, maybe
> > a last channel or something in middle, how will this work then?
> >
> Hi， Vinod
> 
> Sorry for delayed response. We checked with Kirin hardware design
> team, so far their design strategy is all Kirin SoC series reserve
> only from minimum side, saying channel 0, then 1, then 2. That impacts
> the current SoC in upstreaming, Kirin960 (Hi3660), and next versions
> in Kirin SoC, Kirin970 and 980, which may hit upstream later.

And what guarantees that they will not change their mind..

> > I am thinking this should be a mask, rather than min.
> >
> 
> So, since this driver k3dma.c is only used by Kirin SoC DMA
> controllers, I would prefer to keep the current design dma_min_chan
> unchanged.
> 
> What do you think?

I would still prefer bitmask to expose the channels you are supposed to
use

-- 
~Vinod
