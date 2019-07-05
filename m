From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC,
 v3 9/9] media: platform: Add Mediatek ISP P1 shared memory device
Date: Fri, 5 Jul 2019 13:22:28 +0900
Message-ID: <CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-10-jungo.lin@mediatek.com>
 <20190701072532.GB137710@chromium.org>
 <1562297618.1212.46.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562297618.1212.46.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jungo Lin <jungo.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <sean.cheng@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>, Rob Herring <robh@kernel.org>, =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>, =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= <frankie.chiu@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, ddavenport@chromium.org, =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen@mediatek.com>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm>
List-Id: devicetree@vger.kernel.org

Hi Jungo,

On Fri, Jul 5, 2019 at 12:33 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Mon, 2019-07-01 at 16:25 +0900, Tomasz Figa wrote:
> > Hi Jungo,
> >
> > On Tue, Jun 11, 2019 at 11:53:44AM +0800, Jungo Lin wrote:
> > > The purpose of this child device is to provide shared
> > > memory management for exchanging tuning data between co-processor
> > > and the Pass 1 unit of the camera ISP system, including cache
> > > buffer handling.
> > >
> >
> > Looks like we haven't really progressed on getting this replaced with
> > something that doesn't require so much custom code. Let me propose something
> > better then.
> >
> > We already have a reserved memory mode in DT. If it has a compatible string
> > of "shared-dma-pool", it would be registered in the coherent DMA framework
> > [1]. That would make it available for consumer devices to look-up.
> >
> > Now if we add a "memory-region" property to the SCP device node and point it
> > to our reserved memory node, the SCP driver could look it up and hook to the
> > DMA mapping API using of_reserved_mem_device_init_by_idx[2].
> >
> > That basically makes any dma_alloc_*(), dma_map_*(), etc. calls on the SCP
> > struct device use the coherent DMA ops, which operate on the assigned memory
> > pool. With that, the P1 driver could just directly use those calls to
> > manage the memory, without any custom code.
> >
> > There is an example how this setup works in the s5p-mfc driver[3], but it
> > needs to be noted that it creates child nodes, because it can have more than
> > 1 DMA port, which may need its own memory pool. In our case, we wouldn't
> > need child nodes and could just use the SCP device directly.
> >
> > [1] https://elixir.bootlin.com/linux/v5.2-rc7/source/kernel/dma/coherent.c#L345
> > [2] https://elixir.bootlin.com/linux/v5.2-rc7/source/drivers/of/of_reserved_mem.c#L312
> > [3] https://elixir.bootlin.com/linux/v5.2-rc7/source/drivers/media/platform/s5p-mfc/s5p_mfc.c#L1075
> >
> > Let me also post some specific comments below, in case we end up still
> > needing any of the code.
> >
>
> Thanks your suggestions.
>
> After applying your suggestion in SCP device driver, we could remove
> mtk_cam-smem.h/c. Currently, we use dma_alloc_coherent with SCP device
> to get SCP address. We could touch the buffer with this SCP address in
> SCP processor.
>
> After that, we use dma_map_page_attrs with P1 device which supports
> IOMMU domain to get IOVA address. For this address, we will assign
> it to our ISP HW device to proceed.
>
> Below is the snippet for ISP P1 compose buffer initialization.
>
>         ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
>                                  MAX_COMPOSER_SIZE, &addr, GFP_KERNEL);
>         if (!ptr) {
>                 dev_err(dev, "failed to allocate compose memory\n");
>                 return -ENOMEM;
>         }
>         isp_ctx->scp_mem_pa = addr;

addr contains a DMA address, not a physical address. Could we call it
scp_mem_dma instead?

>         dev_dbg(dev, "scp addr:%pad\n", &addr);
>
>         /* get iova address */
>         addr = dma_map_page_attrs(dev, phys_to_page(addr), 0,

addr is a DMA address, so phys_to_page() can't be called on it. The
simplest thing here would be to use dma_map_single() with ptr as the
CPU address expected.

>                                   MAX_COMPOSER_SIZE, DMA_BIDIRECTIONAL,
>                                   DMA_ATTR_SKIP_CPU_SYNC);
>         if (dma_mapping_error(dev, addr)) {
>                 isp_ctx->scp_mem_pa = 0;

We also need to free the allocated memory.

>                 dev_err(dev, "Failed to map scp iova\n");
>                 return -ENOMEM;
>         }
>         isp_ctx->scp_mem_iova = addr;
>
> Moreover, we have another meta input buffer usage.
> For this kind of buffer, it will be allocated by V4L2 framework
> with dma_alloc_coherent with SCP device. In order to get IOVA,
> we will add dma_map_page_attrs in vb2_ops' buf_init function.
> In buf_cleanup function, we will call dma_unmap_page_attrs function.

As per above, we don't have access to the struct page we want to map.
We probably want to get the CPU VA using vb2_plane_vaddr() and call
dma_map_single() instead.

>
> Based on these current implementation, do you think it is correct?
> If we got any wrong, please let us know.
>
> Btw, we also DMA_ATTR_NO_KERNEL_MAPPING DMA attribte to
> avoid dma_sync_sg_for_device. Othewise, it will hit the KE.
> Maybe we could not get the correct sg_table.
> Do you think it is a bug and need to fix?

I think DMA_ATTR_NO_KERNEL_MAPPING is good to have for all the buffers
that don't need to be accessed from the kernel anyway, to avoid
unnecessary kernel mapping operations. However, for coherent memory
pool, it doesn't change anything, because the memory always has a
kernel mapping. We also need the kernel virtual address for
dma_map_single(). Also the flag doesn't eliminate the need to do the
sync, e.g. if the userspace accesses the buffer.

Could you give me more information about the failure you're seeing?
Where is the dma_sync_sg_for_device() called from? Where do you get
the sgtable from?

Best regards,
Tomasz
