From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC,
 v3 9/9] media: platform: Add Mediatek ISP P1 shared memory device
Date: Tue, 23 Jul 2019 16:20:23 +0900
Message-ID: <CAAFQd5AaNFpMGCVJREY85n8UetEwd99TOka8-ECoLzMbMkos_g@mail.gmail.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-10-jungo.lin@mediatek.com>
 <20190701072532.GB137710@chromium.org>
 <1562297618.1212.46.camel@mtksdccf07>
 <CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
 <1562313579.1212.73.camel@mtksdccf07>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1562313579.1212.73.camel@mtksdccf07>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <sean.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= <frankie.chiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, ddavenport-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm>
List-Id: devicetree@vger.kernel.org

Hi Jungo,

On Fri, Jul 5, 2019 at 4:59 PM Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Hi Tomasz:
>
> On Fri, 2019-07-05 at 13:22 +0900, Tomasz Figa wrote:
> > Hi Jungo,
> >
> > On Fri, Jul 5, 2019 at 12:33 PM Jungo Lin <jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > > Hi Tomasz,
>
> [snip]
>
> > > After applying your suggestion in SCP device driver, we could remove
> > > mtk_cam-smem.h/c. Currently, we use dma_alloc_coherent with SCP device
> > > to get SCP address. We could touch the buffer with this SCP address in
> > > SCP processor.
> > >
> > > After that, we use dma_map_page_attrs with P1 device which supports
> > > IOMMU domain to get IOVA address. For this address, we will assign
> > > it to our ISP HW device to proceed.
> > >
> > > Below is the snippet for ISP P1 compose buffer initialization.
> > >
> > >         ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
> > >                                  MAX_COMPOSER_SIZE, &addr, GFP_KERNEL);
> > >         if (!ptr) {
> > >                 dev_err(dev, "failed to allocate compose memory\n");
> > >                 return -ENOMEM;
> > >         }
> > >         isp_ctx->scp_mem_pa = addr;
> >
> > addr contains a DMA address, not a physical address. Could we call it
> > scp_mem_dma instead?
> >
> > >         dev_dbg(dev, "scp addr:%pad\n", &addr);
> > >
> > >         /* get iova address */
> > >         addr = dma_map_page_attrs(dev, phys_to_page(addr), 0,
> >
> > addr is a DMA address, so phys_to_page() can't be called on it. The
> > simplest thing here would be to use dma_map_single() with ptr as the
> > CPU address expected.
> >
>
> We have changed to use ma_map_single() with ptr, but encounter IOMMU
> error. From the debug log of iommu_dma_map_page[3], we got
> 0x0000000054800000 instead of expected address: 0x0000000050800000[2].
> There is a address offset(0x4000000). If we change to use
> dma_map_page_attrs with phys_to_page(addr), the address is correct as we
> expected[2]. Do you have any suggestion on this issue? Do we miss
> something?

Sorry for the late reply. Could you show me the code changes you made
to use dma_map_single()? It would sound like the virtual address
passed to dma_map_single() isn't correct.

Best regards,
Tomasz

>
> [1]
> [    1.344786] __dma_alloc_from_coherent: 0x800000 PAGE_SHIFT:12
> device_base:0x0000000050000000 dma:0x0000000050800000
> virt_base:ffffff8014000000 va:ffffff8014800000
>
> [    1.346890] mtk-cam 1a000000.camisp: scp addr:0x0000000050800000
> va:ffffff8014800000
>
> [    1.347864] iommu_dma_map_page:0x0000000054800000 offset:0
> [    1.348562] mtk-cam 1a000000.camisp: iova addr:0x00000000fde00000
>
> [2]
> [    1.346738] __dma_alloc_from_coherent: 0x800000 PAGE_SHIFT:12
> device_base:0x0000000050000000 dma:0x0000000050800000
> virt_base:ffffff8014000000 va:ffffff8014800000
> [    1.348841] mtk-cam 1a000000.camisp: scp addr:0x0000000050800000
> va:ffffff8014800000
> [    1.349816] iommu_dma_map_page:0x0000000050800000 offset:0
> [    1.350514] mtk-cam 1a000000.camisp: iova addr:0x00000000fde00000
>
>
> [3]
> dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
>                 unsigned long offset, size_t size, int prot)
> {
>         phys_addr_t phys = page_to_phys(page);
>         pr_err("iommu_dma_map_page:%pa offset:%lu\n", &phys, offset);
>
>         return __iommu_dma_map(dev, page_to_phys(page) + offset, size, prot,
>                         iommu_get_dma_domain(dev));
> }
>
> [snip]
>
> Best regards,
>
> Jungo
>
