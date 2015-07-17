Return-Path: <kpc528@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20150716123548.GO5086@localhost>
References: <1434422083-8653-1-git-send-email-punnaia@xilinx.com>
	<1434422083-8653-2-git-send-email-punnaia@xilinx.com>
	<20150716123548.GO5086@localhost>
Date: Fri, 17 Jul 2015 08:03:22 +0530
Message-ID: <CAHLkNH+VLccurDfxEnwSEbr9YFv8ymZuibci7TW=WPutL7qbAQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dma: Add Xilinx zynqmp dma engine driver support
From: Punnaiah Choudary <kpc528@gmail.com>
Content-Type: multipart/alternative; boundary=001a113776b8fc349d051b0902e6
To: Vinod Koul <vinod.koul@intel.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, soren.brinkmann@xilinx.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, punnaia <kalluripunnaiahchoudary@gmail.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

--001a113776b8fc349d051b0902e6
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 16, 2015 at 6:05 PM, Vinod Koul <vinod.koul@intel.com> wrote:

> On Tue, Jun 16, 2015 at 08:04:43AM +0530, Punnaiah Choudary Kalluri wrote:
> > +/* Register Offsets */
> > +#define ISR                          0x100
> > +#define IMR                          0x104
> > +#define IER                          0x108
> > +#define IDS                          0x10C
> > +#define CTRL0                                0x110
> > +#define CTRL1                                0x114
> > +#define STATUS                               0x11C
> > +#define DATA_ATTR                    0x120
> > +#define DSCR_ATTR                    0x124
> > +#define SRC_DSCR_WRD0                        0x128
> > +#define SRC_DSCR_WRD1                        0x12C
> > +#define SRC_DSCR_WRD2                        0x130
> > +#define SRC_DSCR_WRD3                        0x134
> > +#define DST_DSCR_WRD0                        0x138
> > +#define DST_DSCR_WRD1                        0x13C
> > +#define DST_DSCR_WRD2                        0x140
> > +#define DST_DSCR_WRD3                        0x144
> > +#define SRC_START_LSB                        0x158
> > +#define SRC_START_MSB                        0x15C
> > +#define DST_START_LSB                        0x160
> > +#define DST_START_MSB                        0x164
> > +#define TOTAL_BYTE                   0x188
> > +#define RATE_CTRL                    0x18C
> > +#define IRQ_SRC_ACCT                 0x190
> > +#define IRQ_DST_ACCT                 0x194
> > +#define CTRL2                                0x200
> Can you namespace these and other defines
>
> > +struct zynqmp_dma_chan {
> > +     struct zynqmp_dma_device *xdev;
> xdev seems an odd name, i suspect copy paste error!
>
> > +     void __iomem *regs;
> > +     spinlock_t lock;
> > +     struct list_head pending_list;
> > +     struct list_head free_list;
> > +     struct list_head active_list;
> > +     struct zynqmp_dma_desc_sw *sw_desc_pool;
> > +     struct list_head done_list;
> > +     struct dma_chan common;
> > +     void *desc_pool_v;
> > +     dma_addr_t desc_pool_p;
> why two pools and one void *?
>

   One for pre-allocated sw descriptor pool and the other for the Hw BDs
    For Hw BDs, it is void * because there are two types BDs i.e linear and
    linked list in Hw with different size. But the current implementation
supports
    only linked list mode, we will add linear mode descriptor support later

   Regards,
   Punnaiah

>
> > +/**
> > + * zynqmp_dma_alloc_chan_resources - Allocate channel resources
> > + * @dchan: DMA channel
> > + *
> > + * Return: '0' on success and failure value on error
> wrong, its number of descriptors which maybe 0
>
> > + */
> > +static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
> > +{
> > +     struct zynqmp_dma_chan *chan = to_chan(dchan);
> > +     struct zynqmp_dma_desc_sw *desc;
> > +     int i;
> > +
> > +     chan->sw_desc_pool = kzalloc(sizeof(*desc) * ZYNQMP_DMA_NUM_DESCS,
> > +                                  GFP_KERNEL);
> and you are allocating the number so pls return that
>
> Btw is ZYNQMP_DMA_NUM_DESCS sw or HW limit
>
> > +static void zynqmp_dma_start_transfer(struct zynqmp_dma_chan *chan)
> > +{
> > +     struct zynqmp_dma_desc_sw *desc;
> > +
> > +     if (!zynqmp_dma_chan_is_idle(chan))
> > +             return;
> > +
> > +     desc = list_first_entry_or_null(&chan->pending_list,
> > +                                     struct zynqmp_dma_desc_sw, node);
> > +     if (!desc)
> > +             return;
> > +
> > +     if (chan->has_sg)
> > +             list_splice_tail_init(&chan->pending_list,
> &chan->active_list);
> > +     else
> > +             list_move_tail(&desc->node, &chan->active_list);
> > +
> > +     if (chan->has_sg)
> > +             zynqmp_dma_update_desc_to_ctrlr(chan, desc);
> > +     else
> > +             zynqmp_dma_config_simple_desc(chan, desc->src, desc->dst,
> > +                                           desc->len);
> > +     zynqmp_dma_start(chan);
> > +}
> Lots of the list management will get simplified if you use the vchan to do
> so
>
> > +
> > +
> > +/**
> > + * zynqmp_dma_chan_desc_cleanup - Cleanup the completed descriptors
> > + * @chan: ZynqMP DMA channel
> > + */
> > +static void zynqmp_dma_chan_desc_cleanup(struct zynqmp_dma_chan *chan)
> > +{
> > +     struct zynqmp_dma_desc_sw *desc, *next;
> > +
> > +     list_for_each_entry_safe(desc, next, &chan->done_list, node) {
> > +             dma_async_tx_callback callback;
> > +             void *callback_param;
> > +
> > +             list_del(&desc->node);
> > +
> > +             callback = desc->async_tx.callback;
> > +             callback_param = desc->async_tx.callback_param;
> > +             if (callback)
> > +                     callback(callback_param);
> > +
> and you are calling the callback with lock held and user can do further
> submissions so this is wrong!
>
> > +static enum dma_status zynqmp_dma_tx_status(struct dma_chan *dchan,
> > +                                   dma_cookie_t cookie,
> > +                                   struct dma_tx_state *txstate)
> > +{
> > +     return dma_cookie_status(dchan, cookie, txstate);
>
> no residue calculation?
>
> > +static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(
> > +                             struct dma_chan *dchan, dma_addr_t dma_dst,
> > +                             dma_addr_t dma_src, size_t len, ulong
> flags)
> > +{
> > +     struct zynqmp_dma_chan *chan;
> > +     struct zynqmp_dma_desc_sw *new, *first = NULL;
> > +     void *desc = NULL, *prev = NULL;
> > +     size_t copy;
> > +     u32 desc_cnt;
> > +
> > +     chan = to_chan(dchan);
> > +
> > +     if ((len > ZYNQMP_DMA_MAX_TRANS_LEN) && !chan->has_sg)
> why sg?
>
> > +static int zynqmp_dma_remove(struct platform_device *pdev)
> > +{
> > +     struct zynqmp_dma_device *xdev = platform_get_drvdata(pdev);
> > +
> > +     of_dma_controller_free(pdev->dev.of_node);
> > +     dma_async_device_unregister(&xdev->common);
> > +
> > +     zynqmp_dma_chan_remove(xdev->chan);
> Please free up irq here explictly and also ensure tasklet is not running
>
> --
> ~Vinod
>
>

--001a113776b8fc349d051b0902e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jul 16, 2015 at 6:05 PM, Vinod Koul <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:vinod.koul@intel.com" target=3D"_blank">vinod.koul@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb=
"><div class=3D"h5">On Tue, Jun 16, 2015 at 08:04:43AM +0530, Punnaiah Chou=
dary Kalluri wrote:<br>
&gt; +/* Register Offsets */<br>
&gt; +#define ISR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x100<br>
&gt; +#define IMR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x104<br>
&gt; +#define IER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x108<br>
&gt; +#define IDS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10C<br>
&gt; +#define CTRL0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x110<br>
&gt; +#define CTRL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x114<br>
&gt; +#define STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x11C<br>
&gt; +#define DATA_ATTR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x120<br>
&gt; +#define DSCR_ATTR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x124<br>
&gt; +#define SRC_DSCR_WRD0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x128<br>
&gt; +#define SRC_DSCR_WRD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x12C<br>
&gt; +#define SRC_DSCR_WRD2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x130<br>
&gt; +#define SRC_DSCR_WRD3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x134<br>
&gt; +#define DST_DSCR_WRD0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x138<br>
&gt; +#define DST_DSCR_WRD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x13C<br>
&gt; +#define DST_DSCR_WRD2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x140<br>
&gt; +#define DST_DSCR_WRD3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x144<br>
&gt; +#define SRC_START_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x158<br>
&gt; +#define SRC_START_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x15C<br>
&gt; +#define DST_START_LSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x160<br>
&gt; +#define DST_START_MSB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x164<br>
&gt; +#define TOTAL_BYTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x188<br>
&gt; +#define RATE_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x18C<br>
&gt; +#define IRQ_SRC_ACCT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x190<br>
&gt; +#define IRQ_DST_ACCT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x194<br>
&gt; +#define CTRL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x200<br>
</div></div>Can you namespace these and other defines<br>
<span class=3D""><br>
&gt; +struct zynqmp_dma_chan {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zynqmp_dma_device *xdev;<br>
</span>xdev seems an odd name, i suspect copy paste error!<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spinlock_t lock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct list_head pending_list;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct list_head free_list;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct list_head active_list;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zynqmp_dma_desc_sw *sw_desc_pool;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct list_head done_list;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dma_chan common;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *desc_pool_v;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_addr_t desc_pool_p;<br>
</span>why two pools and one void *?<br></blockquote><div>=C2=A0 =C2=A0</di=
v><div>=C2=A0 =C2=A0One for pre-allocated sw descriptor pool and the other =
for the Hw BDs</div><div>=C2=A0 =C2=A0 For Hw BDs, it is void * because the=
re are two types BDs i.e linear and</div><div>=C2=A0 =C2=A0 linked list in =
Hw with different size. But the current implementation supports</div><div>=
=C2=A0 =C2=A0 only linked list mode, we will add linear mode descriptor sup=
port later</div><div><br></div><div>=C2=A0 =C2=A0Regards,</div><div>=C2=A0 =
=C2=A0Punnaiah=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D""><br>
&gt; +/**<br>
&gt; + * zynqmp_dma_alloc_chan_resources - Allocate channel resources<br>
&gt; + * @dchan: DMA channel<br>
&gt; + *<br>
&gt; + * Return: &#39;0&#39; on success and failure value on error<br>
</span>wrong, its number of descriptors which maybe 0<br>
<br>
&gt; + */<br>
<span class=3D"">&gt; +static int zynqmp_dma_alloc_chan_resources(struct dm=
a_chan *dchan)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zynqmp_dma_chan *chan =3D to_chan(dchan);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zynqmp_dma_desc_sw *desc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0chan-&gt;sw_desc_pool =3D kzalloc(sizeof(*desc) *=
 ZYNQMP_DMA_NUM_DESCS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFP_KERNEL);<br>
</span>and you are allocating the number so pls return that<br>
<br>
Btw is ZYNQMP_DMA_NUM_DESCS sw or HW limit<br>
<span class=3D""><br>
&gt; +static void zynqmp_dma_start_transfer(struct zynqmp_dma_chan *chan)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zynqmp_dma_desc_sw *desc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!zynqmp_dma_chan_is_idle(chan))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0desc =3D list_first_entry_or_null(&amp;chan-&gt;p=
ending_list,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct zynqm=
p_dma_desc_sw, node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!desc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (chan-&gt;has_sg)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_splice_tail_init=
(&amp;chan-&gt;pending_list, &amp;chan-&gt;active_list);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_move_tail(&amp;d=
esc-&gt;node, &amp;chan-&gt;active_list);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (chan-&gt;has_sg)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zynqmp_dma_update_des=
c_to_ctrlr(chan, desc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zynqmp_dma_config_sim=
ple_desc(chan, desc-&gt;src, desc-&gt;dst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0desc-&gt;len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0zynqmp_dma_start(chan);<br>
&gt; +}<br>
</span>Lots of the list management will get simplified if you use the vchan=
 to do<br>
so<br>
<span class=3D""><br>
&gt; +<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * zynqmp_dma_chan_desc_cleanup - Cleanup the completed descriptors<b=
r>
&gt; + * @chan: ZynqMP DMA channel<br>
&gt; + */<br>
&gt; +static void zynqmp_dma_chan_desc_cleanup(struct zynqmp_dma_chan *chan=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zynqmp_dma_desc_sw *desc, *next;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(desc, next, &amp;chan-&g=
t;done_list, node) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_async_tx_callback=
 callback;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *callback_param;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_del(&amp;desc-&g=
t;node);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callback =3D desc-&gt=
;async_tx.callback;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0callback_param =3D de=
sc-&gt;async_tx.callback_param;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (callback)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0callback(callback_param);<br>
&gt; +<br>
</span>and you are calling the callback with lock held and user can do furt=
her<br>
submissions so this is wrong!<br>
<span class=3D""><br>
&gt; +static enum dma_status zynqmp_dma_tx_status(struct dma_chan *dchan,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_cookie_t cookie=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_tx_state=
 *txstate)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return dma_cookie_status(dchan, cookie, txstate);=
<br>
<br>
</span>no residue calculation?<br>
<span class=3D""><br>
&gt; +static struct dma_async_tx_descriptor *zynqmp_dma_prep_memcpy(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_chan *dchan, dma_addr_t dma_d=
st,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t dma_src, size_t len, ulong fl=
ags)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zynqmp_dma_chan *chan;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zynqmp_dma_desc_sw *new, *first =3D NULL;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *desc =3D NULL, *prev =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t copy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 desc_cnt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0chan =3D to_chan(dchan);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((len &gt; ZYNQMP_DMA_MAX_TRANS_LEN) &amp;&amp=
; !chan-&gt;has_sg)<br>
</span>why sg?<br>
<span class=3D""><br>
&gt; +static int zynqmp_dma_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct zynqmp_dma_device *xdev =3D platform_get_d=
rvdata(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_dma_controller_free(pdev-&gt;dev.of_node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_async_device_unregister(&amp;xdev-&gt;common)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0zynqmp_dma_chan_remove(xdev-&gt;chan);<br>
</span>Please free up irq here explictly and also ensure tasklet is not run=
ning<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
~Vinod<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a113776b8fc349d051b0902e6--
