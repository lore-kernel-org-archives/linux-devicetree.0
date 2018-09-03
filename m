From: Andrea Merello <andrea.merello@gmail.com>
Subject: Re: [PATCH v4 2/7] dmaengine: xilinx_dma: in axidma slave_sg and
 dma_cylic mode align split descriptors
Date: Mon, 3 Sep 2018 10:46:34 +0200
Message-ID: <CAN8YU5NpOsY-J9yNA6vAmmLTVrtknwxNP7pjhLJDm=-WQ0+Fuw@mail.gmail.com>
References: <20180802141012.19970-1-andrea.merello@gmail.com>
 <20180802141012.19970-2-andrea.merello@gmail.com> <20180827053002.GT2388@vkoul-mobl>
 <CAN8YU5MOdz_sW06B8yc_kewjsxP0DP5pgB2bSu=vkNG-ezvMpQ@mail.gmail.com>
 <CAN8YU5M0tJmsU4Xp+0xDwQYtqeB8tPP_4FyBC_ctUOSV=HZNmA@mail.gmail.com> <20180830132745.GC2322@vkoul-mobl>
Reply-To: andrea.merello@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830132745.GC2322@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, dmaengine@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 30, 2018 at 3:27 PM Vinod <vkoul@kernel.org> wrote:
>
> On 30-08-18, 10:11, Andrea Merello wrote:
> > On Wed, Aug 29, 2018 at 10:12 AM Andrea Merello
> > <andrea.merello@gmail.com> wrote:
> > >
> > > On Mon, Aug 27, 2018 at 7:30 AM Vinod <vkoul@kernel.org> wrote:
> > > >
> > > > On 02-08-18, 16:10, Andrea Merello wrote:
> > > >
> > > > s/cylic/cyclic in patch title
> > >
> > > OK
> > >
> > > > > Whenever a single or cyclic transaction is prepared, the driver
> > > > > could eventually split it over several SG descriptors in order
> > > > > to deal with the HW maximum transfer length.
> > > > >
> > > > > This could end up in DMA operations starting from a misaligned
> > > > > address. This seems fatal for the HW if DRE is not enabled.
> > > >
> > > > DRE?
> > >
> > > Stands for "Data Realignment Engine". I will add this string nearby
> > > the acronym..
> > >
> > > > >
> > > > > This patch eventually adjusts the transfer size in order to make sure
> > > > > all operations start from an aligned address.
> > > > >
> > > > > Cc: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> > > > > Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> > > > > Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> > > > > ---
> > > > > Changes in v2:
> > > > >         - don't introduce copy_mask field, rather rely on already-esistent
> > > > >           copy_align field. Suggested by Radhey Shyam Pandey
> > > > >         - reword title
> > > > > Changes in v3:
> > > > >       - fix bug introduced in v2: wrong copy size when DRE is enabled
> > > > >       - use implementation suggested by Radhey Shyam Pandey
> > > > > Changes in v4:
> > > > >       - rework on the top of 1/6
> > > > > ---
> > > > >  drivers/dma/xilinx/xilinx_dma.c | 22 ++++++++++++++++++----
> > > > >  1 file changed, 18 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> > > > > index a3aaa0e34cc7..aaa6de8a70e4 100644
> > > > > --- a/drivers/dma/xilinx/xilinx_dma.c
> > > > > +++ b/drivers/dma/xilinx/xilinx_dma.c
> > > > > @@ -954,15 +954,28 @@ static int xilinx_dma_alloc_chan_resources(struct dma_chan *dchan)
> > > > >
> > > > >  /**
> > > > >   * xilinx_dma_calc_copysize - Calculate the amount of data to copy
> > > > > + * @chan: Driver specific DMA channel
> > > > >   * @size: Total data that needs to be copied
> > > > >   * @done: Amount of data that has been already copied
> > > > >   *
> > > > >   * Return: Amount of data that has to be copied
> > > > >   */
> > > > > -static int xilinx_dma_calc_copysize(int size, int done)
> > > > > +static int xilinx_dma_calc_copysize(struct xilinx_dma_chan *chan,
> > > > > +                                 int size, int done)
> > > >
> > > > please align with opening brace
> > >
> > > OK
> >
> > Sorry for getting back on this.
> > I've checked it, but it seems already aligned with opening brace in
> > the original e-mail text I've sent. (4 tabs + 4 spaces).
>
> Okay, please see that code looks fine, I will check after I apply

Yes, I confirm that here the code does look fine: the 2nd line is
aligned with opening brace indeed.

Do you want I produce now a v5 with all the other fixes you asked for
(basically commit message fixes), or you are going to apply/check this
one and should I wait for that?

> --
> ~Vinod
