From: Andrea Merello <andrea.merello@gmail.com>
Subject: Re: [PATCH v4 2/7] dmaengine: xilinx_dma: in axidma slave_sg and
 dma_cylic mode align split descriptors
Date: Wed, 29 Aug 2018 10:12:06 +0200
Message-ID: <CAN8YU5MOdz_sW06B8yc_kewjsxP0DP5pgB2bSu=vkNG-ezvMpQ@mail.gmail.com>
References: <20180802141012.19970-1-andrea.merello@gmail.com>
 <20180802141012.19970-2-andrea.merello@gmail.com> <20180827053002.GT2388@vkoul-mobl>
Reply-To: andrea.merello@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827053002.GT2388@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, dmaengine@vger.kernel.org, v4-000linux-arm-kernel@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27, 2018 at 7:30 AM Vinod <vkoul@kernel.org> wrote:
>
> On 02-08-18, 16:10, Andrea Merello wrote:
>
> s/cylic/cyclic in patch title

OK

> > Whenever a single or cyclic transaction is prepared, the driver
> > could eventually split it over several SG descriptors in order
> > to deal with the HW maximum transfer length.
> >
> > This could end up in DMA operations starting from a misaligned
> > address. This seems fatal for the HW if DRE is not enabled.
>
> DRE?

Stands for "Data Realignment Engine". I will add this string nearby
the acronym..

> >
> > This patch eventually adjusts the transfer size in order to make sure
> > all operations start from an aligned address.
> >
> > Cc: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> > Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> > Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> > ---
> > Changes in v2:
> >         - don't introduce copy_mask field, rather rely on already-esistent
> >           copy_align field. Suggested by Radhey Shyam Pandey
> >         - reword title
> > Changes in v3:
> >       - fix bug introduced in v2: wrong copy size when DRE is enabled
> >       - use implementation suggested by Radhey Shyam Pandey
> > Changes in v4:
> >       - rework on the top of 1/6
> > ---
> >  drivers/dma/xilinx/xilinx_dma.c | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> > index a3aaa0e34cc7..aaa6de8a70e4 100644
> > --- a/drivers/dma/xilinx/xilinx_dma.c
> > +++ b/drivers/dma/xilinx/xilinx_dma.c
> > @@ -954,15 +954,28 @@ static int xilinx_dma_alloc_chan_resources(struct dma_chan *dchan)
> >
> >  /**
> >   * xilinx_dma_calc_copysize - Calculate the amount of data to copy
> > + * @chan: Driver specific DMA channel
> >   * @size: Total data that needs to be copied
> >   * @done: Amount of data that has been already copied
> >   *
> >   * Return: Amount of data that has to be copied
> >   */
> > -static int xilinx_dma_calc_copysize(int size, int done)
> > +static int xilinx_dma_calc_copysize(struct xilinx_dma_chan *chan,
> > +                                 int size, int done)
>
> please align with opening brace

OK

> >  {
> > -     return min_t(size_t, size - done,
> > +     size_t copy = min_t(size_t, size - done,
> >                    XILINX_DMA_MAX_TRANS_LEN);
> > +
> > +     if ((copy + done < size) &&
> > +         chan->xdev->common.copy_align) {
> > +             /*
> > +              * If this is not the last descriptor, make sure
> > +              * the next one will be properly aligned
> > +              */
> > +             copy = rounddown(copy,
> > +                              (1 << chan->xdev->common.copy_align));
> > +     }
> > +     return copy;
> >  }
> >
> >  /**
> > @@ -1804,7 +1817,7 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
> >                        * Calculate the maximum number of bytes to transfer,
> >                        * making sure it is less than the hw limit
> >                        */
> > -                     copy = xilinx_dma_calc_copysize(sg_dma_len(sg),
> > +                     copy = xilinx_dma_calc_copysize(chan, sg_dma_len(sg),
> >                                                       sg_used);
> >                       hw = &segment->hw;
> >
> > @@ -1909,7 +1922,8 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
> >                        * Calculate the maximum number of bytes to transfer,
> >                        * making sure it is less than the hw limit
> >                        */
> > -                     copy = xilinx_dma_calc_copysize(period_len, sg_used);
> > +                     copy = xilinx_dma_calc_copysize(chan,
> > +                                                     period_len, sg_used);
> >                       hw = &segment->hw;
> >                       xilinx_axidma_buf(chan, hw, buf_addr, sg_used,
> >                                         period_len * i);
> > --
> > 2.17.1
>
> --
> ~Vinod
