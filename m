From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: Re: [PATCH v2 02/15] [media] mtk-mipicsi: add mediatek mipicsi
 driver for mt2712
Date: Fri, 19 Apr 2019 13:28:15 +0800
Message-ID: <1555651695.9968.11.camel@mtksdccf07>
References: <1555407015-18130-1-git-send-email-stu.hsieh@mediatek.com>
 <1555407015-18130-3-git-send-email-stu.hsieh@mediatek.com>
 <1555551269.2407.9.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1555551269.2407.9.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, CK:

On Thu, 2019-04-18 at 09:34 +0800, CK Hu wrote:
> Hi, Stu:
> 
> On Tue, 2019-04-16 at 17:30 +0800, Stu Hsieh wrote:
> > This patch add mediatek mipicsi driver for mt2712,
> > including probe function to get the value from device tree,
> > and register to v4l2 the host device.
> > 
> > Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> > ---
> >  drivers/media/platform/mtk-mipicsi/Makefile   |   4 +
> >  .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 767 ++++++++++++++++++
> >  2 files changed, 771 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-mipicsi/Makefile
> >  create mode 100644 drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> > 
> > diff --git a/drivers/media/platform/mtk-mipicsi/Makefile b/drivers/media/platform/mtk-mipicsi/Makefile
> > new file mode 100644
> > index 000000000000..326a5e3808fa
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-mipicsi/Makefile
> > @@ -0,0 +1,4 @@
> > +mtk-mipicsi-y += mtk_mipicsi.o
> > +
> > +obj-$(CONFIG_VIDEO_MEDIATEK_MIPICSI) += mtk-mipicsi.o
> > +
> > diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> > new file mode 100644
> > index 000000000000..e26bebe17fe5
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
> > @@ -0,0 +1,767 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2017 MediaTek Inc.
> > + * Author: Ricky Zhang <ricky.zhang@mediatek.com>
> > + *         Baoyin Zhang <baoyin.zhang@mediatek.com>
> > + *         Alan Yue <alan.yue@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * http://www.gnu.org/licenses/gpl-2.0.html for more details.
> > + */
> > +
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/io.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/fs.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mm.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/clk.h>
> > +#include <linux/sched.h>
> > +#include <linux/slab.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/iommu.h>
> > +#include <linux/of.h>
> > +#include <linux/of_platform.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-dev.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <media/soc_camera.h>
> > +#include <media/drv-intf/soc_mediabus.h>
> > +#include <media/videobuf2-core.h>
> > +#include <linux/videodev2.h>
> > +#include <soc/mediatek/smi.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +
> > +#ifdef CONFIG_VB2_MEDIATEK_DMA_SG
> > +#include "mtkbuf-dma-cache-sg.h"
> > +#endif
> > +
> > +#define MTK_MIPICSI_DRV_NAME "mtk-mipicsi"
> > +#define MTK_PLATFORM_STR "platform:mt2712"
> > +#define MIPICSI_COMMON_CLK 2
> > +#define MTK_CAMDMA_MAX_NUM 4U
> > +#define MIPICSI_CLK (MIPICSI_COMMON_CLK + MTK_CAMDMA_MAX_NUM)
> > +#define MTK_DATAWIDTH_8					(0x01U << 7U)
> > +#define MAX_SUPPORT_WIDTH             4096U
> > +#define MAX_SUPPORT_HEIGHT            4096U
> > +#define MAX_BUFFER_NUM			32U
> > +#define VID_LIMIT_BYTES			(100U * 1024U * 1024U)
> > +
> > +/* buffer for one video frame */
> > +struct mtk_mipicsi_buf {
> > +	struct list_head queue;
> > +	struct vb2_buffer *vb;
> > +	dma_addr_t vb_dma_addr_phy;
> > +	int prepare_flag;
> > +};
> > +
> > +struct mtk_mipicsi_dev {
> > +	struct soc_camera_host	soc_host;
> > +	struct platform_device *pdev;
> > +	unsigned int camsv_num;
> > +	struct v4l2_device	v4l2_dev;
> > +	struct device *larb_pdev;
> > +	void __iomem		*ana;
> > +	void __iomem		*seninf_ctrl;
> 
> Separating register control to another patch looks strange to me.
> Register control is the bottom part and this patch is the top part. You
> send a top part first then the bottom part. 'seninf_ctrl' is useless in
> this patch, you may move this to the patch that use this variable or
> merge that patch into this patch.
> 
> Regards,
> CK
> 

In patch "[PATCH v2 07/15] [media] mtk-mipicsi: add mipicsi reg setting
for mt2712", there are register control.
This driver use mtk_mipicsi_reg_init(mipicsi) to set the register and
the struct mipicsi is get from "struct soc_camera_host *ici".
So I send  top part first then the bottom part, because the soc_camera
need to register first.

Regards,
Stu

> > +	void __iomem		*seninf;
> > +	struct regmap		*seninf_top;
> > +	void __iomem		*seninf_mux[MTK_CAMDMA_MAX_NUM];
> > +	void __iomem		*camsv[MTK_CAMDMA_MAX_NUM];
> > +	const struct soc_camera_format_xlate *current_fmt;
> > +	u16				width_flags;	/* max 12 bits */
> > +	struct list_head	capture_list[MTK_CAMDMA_MAX_NUM];
> > +	struct list_head	fb_list;
> > +	spinlock_t		lock;
> > +	spinlock_t		queue_lock;
> > +	struct mtk_mipicsi_buf	cam_buf[MAX_BUFFER_NUM];
> > +	bool streamon;
> > +	unsigned long frame_cnt[MTK_CAMDMA_MAX_NUM];
> > +	unsigned int link;
> > +	unsigned long enqueue_cnt;
> > +	unsigned long dequeue_cnt;
> > +	struct v4l2_ctrl_handler ctrl_hdl;
> > +	char drv_name[16];
> > +	u32 id;
> > +	int clk_num;
> > +	struct clk		*clk[MIPICSI_CLK];
> > +};
> > +
> 
