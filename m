From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v5 02/10] [media] marvell-ccic: fix DMA s/g desc number
 calculation
Date: Wed, 19 Jun 2019 10:16:23 +0200
Message-ID: <f70270d3d67b276bcde7caa6891d655c78ad128f.camel@v3.sk>
References: <20190505140031.9636-1-lkundrak@v3.sk>
         <20190505140031.9636-3-lkundrak@v3.sk>
         <20190614094128.miryq2wfzoewjoyn@uno.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614094128.miryq2wfzoewjoyn@uno.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>, Libin Yang <lbyang@marvell.com>, Albert Wang <twang13@marvell.com>, Sakari Ailus <sakari.ailus@iki.fi>
List-Id: devicetree@vger.kernel.org

On Fri, 2019-06-14 at 11:41 +0200, Jacopo Mondi wrote:
> Hi Lubomir,
> 
> On Sun, May 05, 2019 at 04:00:23PM +0200, Lubomir Rintel wrote:
> > The commit d790b7eda953 ("[media] vb2-dma-sg: move dma_(un)map_sg here")
> > left dma_desc_nent unset. It previously contained the number of DMA
> > descriptors as returned from dma_map_sg().
> > 
> > We can now (since the commit referred to above) obtain the same value from
> > the sg_table and drop dma_desc_nent altogether.
> > 
> > Tested on OLPC XO-1.75 machine. Doesn't affect the OLPC XO-1's Cafe
> > driver, since that one doesn't do DMA.
> > 
> > Fixes: d790b7eda953df474f470169ebdf111c02fa7a2d
> 
> Could you use the proper 'fixes' format here?
> Fixes: d790b7eda953 ("[media] vb2-dma-sg: move dma_(un)map_sg here")
> 
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > ---
> >  drivers/media/platform/marvell-ccic/mcam-core.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
> > index f1b301810260a..d97f39bde9bd6 100644
> > --- a/drivers/media/platform/marvell-ccic/mcam-core.c
> > +++ b/drivers/media/platform/marvell-ccic/mcam-core.c
> > @@ -200,7 +200,6 @@ struct mcam_vb_buffer {
> >  	struct list_head queue;
> >  	struct mcam_dma_desc *dma_desc;	/* Descriptor virtual address */
> >  	dma_addr_t dma_desc_pa;		/* Descriptor physical address */
> > -	int dma_desc_nent;		/* Number of mapped descriptors */
> >  };
> > 
> >  static inline struct mcam_vb_buffer *vb_to_mvb(struct vb2_v4l2_buffer *vb)
> > @@ -608,9 +607,11 @@ static void mcam_dma_contig_done(struct mcam_camera *cam, int frame)
> >  static void mcam_sg_next_buffer(struct mcam_camera *cam)
> >  {
> >  	struct mcam_vb_buffer *buf;
> > +	struct sg_table *sg_table;
> > 
> >  	buf = list_first_entry(&cam->buffers, struct mcam_vb_buffer, queue);
> >  	list_del_init(&buf->queue);
> > +	sg_table = vb2_dma_sg_plane_desc(&buf->vb_buf.vb2_buf, 0);
> >  	/*
> >  	 * Very Bad Not Good Things happen if you don't clear
> >  	 * C1_DESC_ENA before making any descriptor changes.
> > @@ -618,7 +619,7 @@ static void mcam_sg_next_buffer(struct mcam_camera *cam)
> >  	mcam_reg_clear_bit(cam, REG_CTRL1, C1_DESC_ENA);
> >  	mcam_reg_write(cam, REG_DMA_DESC_Y, buf->dma_desc_pa);
> >  	mcam_reg_write(cam, REG_DESC_LEN_Y,
> > -			buf->dma_desc_nent*sizeof(struct mcam_dma_desc));
> > +			sg_table->nents*sizeof(struct mcam_dma_desc));
> 
> Space betwen operators (it was there already, I know).
> 
> Apart for that, patch seems fine to me:
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

This has been already applied to media_tree.git, with the Fixes: tag
corrected by Mauro Chehab.

I suppose I can't make changes anymore and the space-between-operators
things is not worth fixing up in a separate commit?

> Thanks
>    j
> >  	mcam_reg_write(cam, REG_DESC_LEN_U, 0);
> >  	mcam_reg_write(cam, REG_DESC_LEN_V, 0);
> >  	mcam_reg_set_bit(cam, REG_CTRL1, C1_DESC_ENA);
> > 

Thank you
Lubo
