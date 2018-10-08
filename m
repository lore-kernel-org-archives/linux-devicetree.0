From: Andrea Merello <andrea.merello@gmail.com>
Subject: Re: [PATCH v5 4/7] dmaengine: xilinx_dma: program hardware supported
 buffer length
Date: Mon, 8 Oct 2018 08:46:41 +0200
Message-ID: <CAN8YU5Psx=O5n3HTEoTd4h3qvXDCUbDGjCEetKvxDWso=oL10g@mail.gmail.com>
References: <20180907062502.8241-1-andrea.merello@gmail.com>
 <20180907062502.8241-4-andrea.merello@gmail.com> <20180918162508.GD2613@vkoul-mobl>
 <CAN8YU5OySuzAyQ=Buad=Jidhes28koV52Gi-QJ-qOiG5TFBO=Q@mail.gmail.com> <20181002145647.GG19792@vkoul-mobl>
Reply-To: andrea.merello@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002145647.GG19792@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 2, 2018 at 4:56 PM Vinod <vkoul@kernel.org> wrote:
>
> On 28-09-18, 08:53, Andrea Merello wrote:
> > On Tue, Sep 18, 2018 at 6:25 PM Vinod <vkoul@kernel.org> wrote:
>
> > > > @@ -964,7 +968,7 @@ static int xilinx_dma_calc_copysize(struct xilinx_dma_chan *chan,
> > > >                                   int size, int done)
> > > >  {
> > > >       size_t copy = min_t(size_t, size - done,
> > > > -                  XILINX_DMA_MAX_TRANS_LEN);
> > > > +                         chan->xdev->max_buffer_len);
> > >
> > > hmm why not add max_buffer_len in patch 1 again, and then use default
> > > len as XILINX_DMA_MAX_TRANS_LEN and add multiple lengths here :)
> >
> > Sorry, I'm not getting your point. Could you please elaborate the "add
> > multiple lengths here" thing ?
>
> IIRC (sorry been travelling and vacation), add
> chan->xdev->max_buffer_len in patch 1 and initialize it to
> XILINX_DMA_MAX_TRANS_LEN. Then in subsequent patches update the length.

Ah ok. IMO introducing max_buffer_len seems more related to what 4/7
does (actually getting the max transfer len from DT,  thus it is not
constant anymore) rather than to what 1/7 does (commonizing the
calculation of transfer len as it is).. This is why I've introduced it
in 4/7..

.. But if you prefer this way, I'll change this :) .. Maybe we can
change 1/7 commit message so that this change looks less off-topic..
But I have not found a very good title yet.. Something like "Prepare
for DMA copy size calculation rework" ?

> --
> ~Vinod
