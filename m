From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 2/2] dmaengine: Add support for the Analog Devices AXI-DMAC DMA controller
Date: Thu, 20 Aug 2015 17:39:13 +0200
Message-ID: <1440085153-30927-2-git-send-email-lars@metafoo.de>
References: <1440085153-30927-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440085153-30927-1-git-send-email-lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the Analog Devices AXI-DMAC DMA controller. This contro=
ller
is a soft peripheral that can be instantiated in a FPGA and is often us=
ed
in Analog Devices' reference designs for FPGA platforms.

The peripheral has various configuration options that can be selected a=
t
synthesis time and influence the supported features of the instantiated
peripheral, those options are represented as device-tree properties to
allow the driver to behave accordingly.

The peripheral has a zero latency architecture, which means it is possi=
ble
to switch from one to the next descriptor without any delay. This is
archived by having a internal queue which can hold multiple descriptors=
=2E
The driver supports this, which means it will submit new descriptors
directly to the hardware until the queue is full and not wait for a
descriptor to complete before the next one is submitted. Interrupts are
used for the descriptor queue flow control.

Currently the driver supports SG, cyclic and interleaved slave DMA.

Signed-off-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
---
Changes since v1:
	* Use GFP_NOWAIT instead of GFP_ATOMIC
	* Add small description of the architecture of the controller
	  explaining why and that channels have a fixed direction and no
	  address on the device side.
	* Slightly simplify loop-condition in axi_dmac_transfer_done()
---
 MAINTAINERS                |   6 +
 drivers/dma/Kconfig        |  10 +
 drivers/dma/Makefile       |   1 +
 drivers/dma/dma-axi-dmac.c | 691 +++++++++++++++++++++++++++++++++++++=
++++++++
 4 files changed, 708 insertions(+)
 create mode 100644 drivers/dma/dma-axi-dmac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 569568f..aaf3682 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -728,6 +728,12 @@ X:	drivers/iio/*/adjd*
 F:	drivers/staging/iio/*/ad*
 F:	staging/iio/trigger/iio-trig-bfin-timer.c
=20
+ANALOG DEVICES INC DMA DRIVERS
+M:	Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
+W:	http://ez.analog.com/community/linux-device-drivers
+S:	Supported
+F:	drivers/dma/dma-axi-dmac.c
+
 ANDROID DRIVERS
 M:	Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
 M:	Arve Hj=C3=B8nnev=C3=A5g <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index c1744bc..6626de4 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -534,4 +534,14 @@ config QCOM_BAM_DMA
 	  Enable support for the QCOM BAM DMA controller.  This controller
 	  provides DMA capabilities for a variety of on-chip devices.
=20
+config AXI_DMAC
+	tristate "Analog Devices AXI-DMAC DMA support"
+	depends on MICROBLAZE || NIOS2 || ARCH_ZYNQ || ARCH_SOCFPGA || COMPIL=
E_TEST
+	select DMA_ENGINE
+	select DMA_VIRTUAL_CHANNELS
+	help
+	  Enable support for the Analog Devices AXI-DMAC peripheral. This DMA
+	  controller is often used in Analog Device's reference designs for F=
PGA
+	  platforms.
+
 endif
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index d056a8a..a480984 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_DMA_SUN4I) +=3D sun4i-dma.o
 obj-$(CONFIG_IMG_MDC_DMA) +=3D img-mdc-dma.o
 obj-$(CONFIG_XGENE_DMA) +=3D xgene-dma.o
 obj-$(CONFIG_ZX_DMA) +=3D zx296702_dma.o
+obj-$(CONFIG_AXI_DMAC) +=3D dma-axi-dmac.o
diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
new file mode 100644
index 0000000..5b2395e
--- /dev/null
+++ b/drivers/dma/dma-axi-dmac.c
@@ -0,0 +1,691 @@
+/*
+ * Driver for the Analog Devices AXI-DMAC core
+ *
+ * Copyright 2013-2015 Analog Devices Inc.
+ *  Author: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
+ *
+ * Licensed under the GPL-2.
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_dma.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/dma/axi-dmac.h>
+
+#include "dmaengine.h"
+#include "virt-dma.h"
+
+/*
+ * The AXI-DMAC is a soft IP core that is used in FPGA designs. The co=
re has
+ * various instantiation parameters which decided the exact feature se=
t support
+ * by the core.
+ *
+ * Each channel of the core has a source interface and a destination i=
nterface.
+ * The number of channels and the type of the channel interfaces is se=
lected at
+ * configuration time. A interface can either be a connected to a cent=
ral memory
+ * interconnect, which allows access to system memory, or it can be co=
nnected to
+ * a dedicated bus which is directly connected to a data port on a per=
ipheral.
+ * Given that those are configuration options of the core that are sel=
ected when
+ * it is instantiated this means that they can not be changed by softw=
are at
+ * runtime. By extension this means that each channel is uni-direction=
al. It can
+ * either be device to memory or memory to device, but not both. Also =
since the
+ * device side is a dedicated data bus only connected to a single peri=
pheral
+ * there is no address than can or needs to be configured for the devi=
ce side.
+ */
+
+#define AXI_DMAC_REG_IRQ_MASK		0x80
+#define AXI_DMAC_REG_IRQ_PENDING	0x84
+#define AXI_DMAC_REG_IRQ_SOURCE		0x88
+
+#define AXI_DMAC_REG_CTRL		0x400
+#define AXI_DMAC_REG_TRANSFER_ID	0x404
+#define AXI_DMAC_REG_START_TRANSFER	0x408
+#define AXI_DMAC_REG_FLAGS		0x40c
+#define AXI_DMAC_REG_DEST_ADDRESS	0x410
+#define AXI_DMAC_REG_SRC_ADDRESS	0x414
+#define AXI_DMAC_REG_X_LENGTH		0x418
+#define AXI_DMAC_REG_Y_LENGTH		0x41c
+#define AXI_DMAC_REG_DEST_STRIDE	0x420
+#define AXI_DMAC_REG_SRC_STRIDE		0x424
+#define AXI_DMAC_REG_TRANSFER_DONE	0x428
+#define AXI_DMAC_REG_ACTIVE_TRANSFER_ID 0x42c
+#define AXI_DMAC_REG_STATUS		0x430
+#define AXI_DMAC_REG_CURRENT_SRC_ADDR	0x434
+#define AXI_DMAC_REG_CURRENT_DEST_ADDR	0x438
+
+#define AXI_DMAC_CTRL_ENABLE		BIT(0)
+#define AXI_DMAC_CTRL_PAUSE		BIT(1)
+
+#define AXI_DMAC_IRQ_SOT		BIT(0)
+#define AXI_DMAC_IRQ_EOT		BIT(1)
+
+#define AXI_DMAC_FLAG_CYCLIC		BIT(0)
+
+struct axi_dmac_sg {
+	dma_addr_t src_addr;
+	dma_addr_t dest_addr;
+	unsigned int x_len;
+	unsigned int y_len;
+	unsigned int dest_stride;
+	unsigned int src_stride;
+	unsigned int id;
+};
+
+struct axi_dmac_desc {
+	struct virt_dma_desc vdesc;
+	bool cyclic;
+
+	unsigned int num_submitted;
+	unsigned int num_completed;
+	unsigned int num_sgs;
+	struct axi_dmac_sg sg[];
+};
+
+struct axi_dmac_chan {
+	struct virt_dma_chan vchan;
+
+	struct axi_dmac_desc *next_desc;
+	struct list_head active_descs;
+	enum dma_transfer_direction direction;
+
+	unsigned int src_width;
+	unsigned int dest_width;
+	unsigned int src_type;
+	unsigned int dest_type;
+
+	unsigned int max_length;
+	unsigned int align_mask;
+
+	bool hw_cyclic;
+	bool hw_2d;
+};
+
+struct axi_dmac {
+	void __iomem *base;
+	int irq;
+
+	struct clk *clk;
+
+	struct dma_device dma_dev;
+	struct axi_dmac_chan chan;
+
+	struct device_dma_parameters dma_parms;
+};
+
+static struct axi_dmac *chan_to_axi_dmac(struct axi_dmac_chan *chan)
+{
+	return container_of(chan->vchan.chan.device, struct axi_dmac,
+		dma_dev);
+}
+
+static struct axi_dmac_chan *to_axi_dmac_chan(struct dma_chan *c)
+{
+	return container_of(c, struct axi_dmac_chan, vchan.chan);
+}
+
+static struct axi_dmac_desc *to_axi_dmac_desc(struct virt_dma_desc *vd=
esc)
+{
+	return container_of(vdesc, struct axi_dmac_desc, vdesc);
+}
+
+static void axi_dmac_write(struct axi_dmac *axi_dmac, unsigned int reg=
,
+	unsigned int val)
+{
+	writel(val, axi_dmac->base + reg);
+}
+
+static int axi_dmac_read(struct axi_dmac *axi_dmac, unsigned int reg)
+{
+	return readl(axi_dmac->base + reg);
+}
+
+static int axi_dmac_src_is_mem(struct axi_dmac_chan *chan)
+{
+	return chan->src_type =3D=3D AXI_DMAC_BUS_TYPE_AXI_MM;
+}
+
+static int axi_dmac_dest_is_mem(struct axi_dmac_chan *chan)
+{
+	return chan->dest_type =3D=3D AXI_DMAC_BUS_TYPE_AXI_MM;
+}
+
+static bool axi_dmac_check_len(struct axi_dmac_chan *chan, unsigned in=
t len)
+{
+	if (len =3D=3D 0 || len > chan->max_length)
+		return false;
+	if ((len & chan->align_mask) !=3D 0) /* Not aligned */
+		return false;
+	return true;
+}
+
+static bool axi_dmac_check_addr(struct axi_dmac_chan *chan, dma_addr_t=
 addr)
+{
+	if ((addr & chan->align_mask) !=3D 0) /* Not aligned */
+		return false;
+	return true;
+}
+
+static void axi_dmac_start_transfer(struct axi_dmac_chan *chan)
+{
+	struct axi_dmac *dmac =3D chan_to_axi_dmac(chan);
+	struct virt_dma_desc *vdesc;
+	struct axi_dmac_desc *desc;
+	struct axi_dmac_sg *sg;
+	unsigned int flags =3D 0;
+	unsigned int val;
+
+	val =3D axi_dmac_read(dmac, AXI_DMAC_REG_START_TRANSFER);
+	if (val) /* Queue is full, wait for the next SOT IRQ */
+		return;
+
+	desc =3D chan->next_desc;
+
+	if (!desc) {
+		vdesc =3D vchan_next_desc(&chan->vchan);
+		if (!vdesc)
+			return;
+		list_move_tail(&vdesc->node, &chan->active_descs);
+		desc =3D to_axi_dmac_desc(vdesc);
+	}
+	sg =3D &desc->sg[desc->num_submitted];
+
+	desc->num_submitted++;
+	if (desc->num_submitted =3D=3D desc->num_sgs)
+		chan->next_desc =3D NULL;
+	else
+		chan->next_desc =3D desc;
+
+	sg->id =3D axi_dmac_read(dmac, AXI_DMAC_REG_TRANSFER_ID);
+
+	if (axi_dmac_dest_is_mem(chan)) {
+		axi_dmac_write(dmac, AXI_DMAC_REG_DEST_ADDRESS, sg->dest_addr);
+		axi_dmac_write(dmac, AXI_DMAC_REG_DEST_STRIDE, sg->dest_stride);
+	}
+
+	if (axi_dmac_src_is_mem(chan)) {
+		axi_dmac_write(dmac, AXI_DMAC_REG_SRC_ADDRESS, sg->src_addr);
+		axi_dmac_write(dmac, AXI_DMAC_REG_SRC_STRIDE, sg->src_stride);
+	}
+
+	/*
+	 * If the hardware supports cyclic transfers and there is no callback=
 to
+	 * call, enable hw cyclic mode to avoid unnecessary interrupts.
+	 */
+	if (chan->hw_cyclic && desc->cyclic && !desc->vdesc.tx.callback)
+		flags |=3D AXI_DMAC_FLAG_CYCLIC;
+
+	axi_dmac_write(dmac, AXI_DMAC_REG_X_LENGTH, sg->x_len - 1);
+	axi_dmac_write(dmac, AXI_DMAC_REG_Y_LENGTH, sg->y_len - 1);
+	axi_dmac_write(dmac, AXI_DMAC_REG_FLAGS, flags);
+	axi_dmac_write(dmac, AXI_DMAC_REG_START_TRANSFER, 1);
+}
+
+static struct axi_dmac_desc *axi_dmac_active_desc(struct axi_dmac_chan=
 *chan)
+{
+	return list_first_entry_or_null(&chan->active_descs,
+		struct axi_dmac_desc, vdesc.node);
+}
+
+static void axi_dmac_transfer_done(struct axi_dmac_chan *chan,
+	unsigned int completed_transfers)
+{
+	struct axi_dmac_desc *active;
+	struct axi_dmac_sg *sg;
+
+	active =3D axi_dmac_active_desc(chan);
+	if (!active)
+		return;
+
+	if (active->cyclic) {
+		vchan_cyclic_callback(&active->vdesc);
+	} else {
+		do {
+			sg =3D &active->sg[active->num_completed];
+			if (!(BIT(sg->id) & completed_transfers))
+				break;
+			active->num_completed++;
+			if (active->num_completed =3D=3D active->num_sgs) {
+				list_del(&active->vdesc.node);
+				vchan_cookie_complete(&active->vdesc);
+				active =3D axi_dmac_active_desc(chan);
+			}
+		} while (active);
+	}
+}
+
+static irqreturn_t axi_dmac_interrupt_handler(int irq, void *devid)
+{
+	struct axi_dmac *dmac =3D devid;
+	unsigned int pending;
+
+	pending =3D axi_dmac_read(dmac, AXI_DMAC_REG_IRQ_PENDING);
+	axi_dmac_write(dmac, AXI_DMAC_REG_IRQ_PENDING, pending);
+
+	spin_lock(&dmac->chan.vchan.lock);
+	/* One or more transfers have finished */
+	if (pending & AXI_DMAC_IRQ_EOT) {
+		unsigned int completed;
+
+		completed =3D axi_dmac_read(dmac, AXI_DMAC_REG_TRANSFER_DONE);
+		axi_dmac_transfer_done(&dmac->chan, completed);
+	}
+	/* Space has become available in the descriptor queue */
+	if (pending & AXI_DMAC_IRQ_SOT)
+		axi_dmac_start_transfer(&dmac->chan);
+	spin_unlock(&dmac->chan.vchan.lock);
+
+	return IRQ_HANDLED;
+}
+
+static int axi_dmac_terminate_all(struct dma_chan *c)
+{
+	struct axi_dmac_chan *chan =3D to_axi_dmac_chan(c);
+	struct axi_dmac *dmac =3D chan_to_axi_dmac(chan);
+	unsigned long flags;
+	LIST_HEAD(head);
+
+	spin_lock_irqsave(&chan->vchan.lock, flags);
+	axi_dmac_write(dmac, AXI_DMAC_REG_CTRL, 0);
+	chan->next_desc =3D NULL;
+	vchan_get_all_descriptors(&chan->vchan, &head);
+	list_splice_tail_init(&chan->active_descs, &head);
+	spin_unlock_irqrestore(&chan->vchan.lock, flags);
+
+	vchan_dma_desc_free_list(&chan->vchan, &head);
+
+	return 0;
+}
+
+static void axi_dmac_issue_pending(struct dma_chan *c)
+{
+	struct axi_dmac_chan *chan =3D to_axi_dmac_chan(c);
+	struct axi_dmac *dmac =3D chan_to_axi_dmac(chan);
+	unsigned long flags;
+
+	axi_dmac_write(dmac, AXI_DMAC_REG_CTRL, AXI_DMAC_CTRL_ENABLE);
+
+	spin_lock_irqsave(&chan->vchan.lock, flags);
+	if (vchan_issue_pending(&chan->vchan))
+		axi_dmac_start_transfer(chan);
+	spin_unlock_irqrestore(&chan->vchan.lock, flags);
+}
+
+static struct axi_dmac_desc *axi_dmac_alloc_desc(unsigned int num_sgs)
+{
+	struct axi_dmac_desc *desc;
+
+	desc =3D kzalloc(sizeof(struct axi_dmac_desc) +
+		sizeof(struct axi_dmac_sg) * num_sgs, GFP_NOWAIT);
+	if (!desc)
+		return NULL;
+
+	desc->num_sgs =3D num_sgs;
+
+	return desc;
+}
+
+static struct dma_async_tx_descriptor *axi_dmac_prep_slave_sg(
+	struct dma_chan *c, struct scatterlist *sgl,
+	unsigned int sg_len, enum dma_transfer_direction direction,
+	unsigned long flags, void *context)
+{
+	struct axi_dmac_chan *chan =3D to_axi_dmac_chan(c);
+	struct axi_dmac_desc *desc;
+	struct scatterlist *sg;
+	unsigned int i;
+
+	if (direction !=3D chan->direction)
+		return NULL;
+
+	desc =3D axi_dmac_alloc_desc(sg_len);
+	if (!desc)
+		return NULL;
+
+	for_each_sg(sgl, sg, sg_len, i) {
+		if (!axi_dmac_check_addr(chan, sg_dma_address(sg)) ||
+		    !axi_dmac_check_len(chan, sg_dma_len(sg))) {
+			kfree(desc);
+			return NULL;
+		}
+
+		if (direction =3D=3D DMA_DEV_TO_MEM)
+			desc->sg[i].dest_addr =3D sg_dma_address(sg);
+		else
+			desc->sg[i].src_addr =3D sg_dma_address(sg);
+		desc->sg[i].x_len =3D sg_dma_len(sg);
+		desc->sg[i].y_len =3D 1;
+	}
+
+	desc->cyclic =3D false;
+
+	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
+}
+
+static struct dma_async_tx_descriptor *axi_dmac_prep_dma_cyclic(
+	struct dma_chan *c, dma_addr_t buf_addr, size_t buf_len,
+	size_t period_len, enum dma_transfer_direction direction,
+	unsigned long flags)
+{
+	struct axi_dmac_chan *chan =3D to_axi_dmac_chan(c);
+	struct axi_dmac_desc *desc;
+	unsigned int num_periods, i;
+
+	if (direction !=3D chan->direction)
+		return NULL;
+
+	if (!axi_dmac_check_len(chan, buf_len) ||
+	    !axi_dmac_check_addr(chan, buf_addr))
+		return NULL;
+
+	if (period_len =3D=3D 0 || buf_len % period_len)
+		return NULL;
+
+	num_periods =3D buf_len / period_len;
+
+	desc =3D axi_dmac_alloc_desc(num_periods);
+	if (!desc)
+		return NULL;
+
+	for (i =3D 0; i < num_periods; i++) {
+		if (direction =3D=3D DMA_DEV_TO_MEM)
+			desc->sg[i].dest_addr =3D buf_addr;
+		else
+			desc->sg[i].src_addr =3D buf_addr;
+		desc->sg[i].x_len =3D period_len;
+		desc->sg[i].y_len =3D 1;
+		buf_addr +=3D period_len;
+	}
+
+	desc->cyclic =3D true;
+
+	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
+}
+
+static struct dma_async_tx_descriptor *axi_dmac_prep_interleaved(
+	struct dma_chan *c, struct dma_interleaved_template *xt,
+	unsigned long flags)
+{
+	struct axi_dmac_chan *chan =3D to_axi_dmac_chan(c);
+	struct axi_dmac_desc *desc;
+	size_t dst_icg, src_icg;
+
+	if (xt->frame_size !=3D 1)
+		return NULL;
+
+	if (xt->dir !=3D chan->direction)
+		return NULL;
+
+	if (axi_dmac_src_is_mem(chan)) {
+		if (!xt->src_inc || !axi_dmac_check_addr(chan, xt->src_start))
+			return NULL;
+	}
+
+	if (axi_dmac_dest_is_mem(chan)) {
+		if (!xt->dst_inc || !axi_dmac_check_addr(chan, xt->dst_start))
+			return NULL;
+	}
+
+	dst_icg =3D dmaengine_get_dst_icg(xt, &xt->sgl[0]);
+	src_icg =3D dmaengine_get_src_icg(xt, &xt->sgl[0]);
+
+	if (chan->hw_2d) {
+		if (!axi_dmac_check_len(chan, xt->sgl[0].size) ||
+		    !axi_dmac_check_len(chan, xt->numf))
+			return NULL;
+		if (xt->sgl[0].size + dst_icg > chan->max_length ||
+		    xt->sgl[0].size + src_icg > chan->max_length)
+			return NULL;
+	} else {
+		if (dst_icg !=3D 0 || src_icg !=3D 0)
+			return NULL;
+		if (chan->max_length / xt->sgl[0].size < xt->numf)
+			return NULL;
+		if (!axi_dmac_check_len(chan, xt->sgl[0].size * xt->numf))
+			return NULL;
+	}
+
+	desc =3D axi_dmac_alloc_desc(1);
+	if (!desc)
+		return NULL;
+
+	if (axi_dmac_src_is_mem(chan)) {
+		desc->sg[0].src_addr =3D xt->src_start;
+		desc->sg[0].src_stride =3D xt->sgl[0].size + src_icg;
+	}
+
+	if (axi_dmac_dest_is_mem(chan)) {
+		desc->sg[0].dest_addr =3D xt->dst_start;
+		desc->sg[0].dest_stride =3D xt->sgl[0].size + dst_icg;
+	}
+
+	if (chan->hw_2d) {
+		desc->sg[0].x_len =3D xt->sgl[0].size;
+		desc->sg[0].y_len =3D xt->numf;
+	} else {
+		desc->sg[0].x_len =3D xt->sgl[0].size * xt->numf;
+		desc->sg[0].y_len =3D 1;
+	}
+
+	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
+}
+
+static void axi_dmac_free_chan_resources(struct dma_chan *c)
+{
+	vchan_free_chan_resources(to_virt_chan(c));
+}
+
+static void axi_dmac_desc_free(struct virt_dma_desc *vdesc)
+{
+	kfree(container_of(vdesc, struct axi_dmac_desc, vdesc));
+}
+
+/*
+ * The configuration stored in the devicetree matches the configuratio=
n
+ * parameters of the peripheral instance and allows the driver to know=
 which
+ * features are implemented and how it should behave.
+ */
+static int axi_dmac_parse_chan_dt(struct device_node *of_chan,
+	struct axi_dmac_chan *chan)
+{
+	u32 val;
+	int ret;
+
+	ret =3D of_property_read_u32(of_chan, "reg", &val);
+	if (ret)
+		return ret;
+
+	/* We only support 1 channel for now */
+	if (val !=3D 0)
+		return -EINVAL;
+
+	ret =3D of_property_read_u32(of_chan, "adi,source-bus-type", &val);
+	if (ret)
+		return ret;
+	if (val > AXI_DMAC_BUS_TYPE_FIFO)
+		return -EINVAL;
+	chan->src_type =3D val;
+
+	ret =3D of_property_read_u32(of_chan, "adi,destination-bus-type", &va=
l);
+	if (ret)
+		return ret;
+	if (val > AXI_DMAC_BUS_TYPE_FIFO)
+		return -EINVAL;
+	chan->dest_type =3D val;
+
+	ret =3D of_property_read_u32(of_chan, "adi,source-bus-width", &val);
+	if (ret)
+		return ret;
+	chan->src_width =3D val / 8;
+
+	ret =3D of_property_read_u32(of_chan, "adi,destination-bus-width", &v=
al);
+	if (ret)
+		return ret;
+	chan->dest_width =3D val / 8;
+
+	ret =3D of_property_read_u32(of_chan, "adi,length-width", &val);
+	if (ret)
+		return ret;
+
+	if (val >=3D 32)
+		chan->max_length =3D UINT_MAX;
+	else
+		chan->max_length =3D (1ULL << val) - 1;
+
+	chan->align_mask =3D max(chan->dest_width, chan->src_width) - 1;
+
+	if (axi_dmac_dest_is_mem(chan) && axi_dmac_src_is_mem(chan))
+		chan->direction =3D DMA_MEM_TO_MEM;
+	else if (!axi_dmac_dest_is_mem(chan) && axi_dmac_src_is_mem(chan))
+		chan->direction =3D DMA_MEM_TO_DEV;
+	else if (axi_dmac_dest_is_mem(chan) && !axi_dmac_src_is_mem(chan))
+		chan->direction =3D DMA_DEV_TO_MEM;
+	else
+		chan->direction =3D DMA_DEV_TO_DEV;
+
+	chan->hw_cyclic =3D of_property_read_bool(of_chan, "adi,cyclic");
+	chan->hw_2d =3D of_property_read_bool(of_chan, "adi,2d");
+
+	return 0;
+}
+
+static int axi_dmac_probe(struct platform_device *pdev)
+{
+	struct device_node *of_channels, *of_chan;
+	struct dma_device *dma_dev;
+	struct axi_dmac *dmac;
+	struct resource *res;
+	int ret;
+
+	dmac =3D devm_kzalloc(&pdev->dev, sizeof(*dmac), GFP_KERNEL);
+	if (!dmac)
+		return -ENOMEM;
+
+	dmac->irq =3D platform_get_irq(pdev, 0);
+	if (dmac->irq <=3D 0)
+		return -EINVAL;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	dmac->base =3D devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(dmac->base))
+		return PTR_ERR(dmac->base);
+
+	dmac->clk =3D devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(dmac->clk))
+		return PTR_ERR(dmac->clk);
+
+	INIT_LIST_HEAD(&dmac->chan.active_descs);
+
+	of_channels =3D of_get_child_by_name(pdev->dev.of_node, "adi,channels=
");
+	if (of_channels =3D=3D NULL)
+		return -ENODEV;
+
+	for_each_child_of_node(of_channels, of_chan) {
+		ret =3D axi_dmac_parse_chan_dt(of_chan, &dmac->chan);
+		if (ret) {
+			of_node_put(of_chan);
+			of_node_put(of_channels);
+			return -EINVAL;
+		}
+	}
+	of_node_put(of_channels);
+
+	pdev->dev.dma_parms =3D &dmac->dma_parms;
+	dma_set_max_seg_size(&pdev->dev, dmac->chan.max_length);
+
+	dma_dev =3D &dmac->dma_dev;
+	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
+	dma_cap_set(DMA_CYCLIC, dma_dev->cap_mask);
+	dma_dev->device_free_chan_resources =3D axi_dmac_free_chan_resources;
+	dma_dev->device_tx_status =3D dma_cookie_status;
+	dma_dev->device_issue_pending =3D axi_dmac_issue_pending;
+	dma_dev->device_prep_slave_sg =3D axi_dmac_prep_slave_sg;
+	dma_dev->device_prep_dma_cyclic =3D axi_dmac_prep_dma_cyclic;
+	dma_dev->device_prep_interleaved_dma =3D axi_dmac_prep_interleaved;
+	dma_dev->device_terminate_all =3D axi_dmac_terminate_all;
+	dma_dev->dev =3D &pdev->dev;
+	dma_dev->chancnt =3D 1;
+	dma_dev->src_addr_widths =3D BIT(dmac->chan.src_width);
+	dma_dev->dst_addr_widths =3D BIT(dmac->chan.dest_width);
+	dma_dev->directions =3D BIT(dmac->chan.direction);
+	dma_dev->residue_granularity =3D DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
+	INIT_LIST_HEAD(&dma_dev->channels);
+
+	dmac->chan.vchan.desc_free =3D axi_dmac_desc_free;
+	vchan_init(&dmac->chan.vchan, dma_dev);
+
+	ret =3D clk_prepare_enable(dmac->clk);
+	if (ret < 0)
+		return ret;
+
+	axi_dmac_write(dmac, AXI_DMAC_REG_IRQ_MASK, 0x00);
+
+	ret =3D dma_async_device_register(dma_dev);
+	if (ret)
+		goto err_clk_disable;
+
+	ret =3D of_dma_controller_register(pdev->dev.of_node,
+		of_dma_xlate_by_chan_id, dma_dev);
+	if (ret)
+		goto err_unregister_device;
+
+	ret =3D request_irq(dmac->irq, axi_dmac_interrupt_handler, 0,
+		dev_name(&pdev->dev), dmac);
+	if (ret)
+		goto err_unregister_of;
+
+	platform_set_drvdata(pdev, dmac);
+
+	return 0;
+
+err_unregister_of:
+	of_dma_controller_free(pdev->dev.of_node);
+err_unregister_device:
+	dma_async_device_unregister(&dmac->dma_dev);
+err_clk_disable:
+	clk_disable_unprepare(dmac->clk);
+
+	return ret;
+}
+
+static int axi_dmac_remove(struct platform_device *pdev)
+{
+	struct axi_dmac *dmac =3D platform_get_drvdata(pdev);
+
+	of_dma_controller_free(pdev->dev.of_node);
+	free_irq(dmac->irq, dmac);
+	tasklet_kill(&dmac->chan.vchan.task);
+	dma_async_device_unregister(&dmac->dma_dev);
+	clk_disable_unprepare(dmac->clk);
+
+	return 0;
+}
+
+static const struct of_device_id axi_dmac_of_match_table[] =3D {
+	{ .compatible =3D "adi,axi-dmac-1.00.a" },
+	{ },
+};
+
+static struct platform_driver axi_dmac_driver =3D {
+	.driver =3D {
+		.name =3D "dma-axi-dmac",
+		.of_match_table =3D axi_dmac_of_match_table,
+	},
+	.probe =3D axi_dmac_probe,
+	.remove =3D axi_dmac_remove,
+};
+module_platform_driver(axi_dmac_driver);
+
+MODULE_AUTHOR("Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>");
+MODULE_DESCRIPTION("DMA controller driver for the AXI-DMAC controller"=
);
+MODULE_LICENSE("GPL v2");
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
