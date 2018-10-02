From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v5 4/7] dmaengine: xilinx_dma: program hardware supported
 buffer length
Date: Tue, 2 Oct 2018 20:26:47 +0530
Message-ID: <20181002145647.GG19792@vkoul-mobl>
References: <20180907062502.8241-1-andrea.merello@gmail.com>
 <20180907062502.8241-4-andrea.merello@gmail.com>
 <20180918162508.GD2613@vkoul-mobl>
 <CAN8YU5OySuzAyQ=Buad=Jidhes28koV52Gi-QJ-qOiG5TFBO=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAN8YU5OySuzAyQ=Buad=Jidhes28koV52Gi-QJ-qOiG5TFBO=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrea Merello <andrea.merello@gmail.com>
Cc: dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 28-09-18, 08:53, Andrea Merello wrote:
> On Tue, Sep 18, 2018 at 6:25 PM Vinod <vkoul@kernel.org> wrote:

> > > @@ -964,7 +968,7 @@ static int xilinx_dma_calc_copysize(struct xilinx_dma_chan *chan,
> > >                                   int size, int done)
> > >  {
> > >       size_t copy = min_t(size_t, size - done,
> > > -                  XILINX_DMA_MAX_TRANS_LEN);
> > > +                         chan->xdev->max_buffer_len);
> >
> > hmm why not add max_buffer_len in patch 1 again, and then use default
> > len as XILINX_DMA_MAX_TRANS_LEN and add multiple lengths here :)
> 
> Sorry, I'm not getting your point. Could you please elaborate the "add
> multiple lengths here" thing ?

IIRC (sorry been travelling and vacation), add
chan->xdev->max_buffer_len in patch 1 and initialize it to
XILINX_DMA_MAX_TRANS_LEN. Then in subsequent patches update the length.

-- 
~Vinod
