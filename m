From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: Add Spreadtrum DMA controller driver
Date: Tue, 25 Jul 2017 09:08:58 +0530
Message-ID: <20170725033856.GV3053@localhost>
References: <63f2b93b3e484862f736e37d6d422b5566637163.1500361078.git.baolin.wang@spreadtrum.com>
 <4331ea088a26f515fe1f1912c568bfd07d539e9d.1500361078.git.baolin.wang@spreadtrum.com>
 <20170722075730.GU3053@localhost>
 <20170724064600.GB22149@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170724064600.GB22149-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 24, 2017 at 02:46:00PM +0800, Baolin Wang wrote:
> Hi,
> 
> On 六,  7月 22, 2017 at 01:27:31下午 +0530, Vinod Koul wrote:
> > On Tue, Jul 18, 2017 at 03:06:12PM +0800, Baolin Wang wrote:

> > > +static void sprd_dma_set_uid(struct sprd_dma_chn *mchan)
> > > +{
> > > +	struct sprd_dma_dev *sdev = to_sprd_dma_dev(&mchan->chan);
> > > +	u32 dev_id = mchan->dev_id;
> > > +
> > > +	if (dev_id != DMA_SOFTWARE_UID)
> > 
> > Whats a UID?
> 
> It is for users, every user was assigned one unique hardware ID.
> Then the user can trigger the DMA to transfer by the user ID.

sounds like a slave id to me (hint read again struct dma_slave_config)

> > > +	u32 fragmens_len;
> > > +	u32 block_len;
> > 
> > oh please, I think I will stop here now :(
> > 
> > > +	u32 transcation_len;
> > > +	u32 src_step;
> > > +	u32 des_step;
> > > +	u32 src_frag_step;
> > > +	u32 dst_frag_step;
> > > +	u32 src_blk_step;
> > > +	u32 dst_blk_step;
> > > +	u32 wrap_ptr;
> > > +	u32 wrap_to;
> > > +	u32 dev_id;
> > > +	enum dma_end_type is_end;
> > 
> > Looking at this I think these are overkill, many of them can be handled
> > properly by current dmaengine interfaces, so please use those before you
> > invent your own...
> > 
> > Also the code is bloated because you don't use virt-dma, pls use that. I
> > skipped many parts of the driver as I feel driver needs more work.
> 
> OK. I will check the virt-dma. Thanks for your commnets.

Ok, but the bigger concern is that people have defined generic interfaces
for everyone to use, so you should also use them, the hw doesn't seem
anything special which cannot be accommodated in the current fwk, if not do
tell me which parts don't fit before you invent your own interfaces...

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
