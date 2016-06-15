From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4,4/5] usb: Add MediaTek USB3 DRD Driver
Date: Wed, 15 Jun 2016 11:07:19 +0800
Message-ID: <1465960040-768-5-git-send-email-chunfeng.yun@mediatek.com>
References: <1465960040-768-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465960040-768-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for the MediaTek USB3 controller
integrated into MT8173. It can be configured as Dual-Role
Device (DRD), Peripheral Only and Host Only (xHCI) modes.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/Kconfig                |    2 +
 drivers/usb/Makefile               |    1 +
 drivers/usb/mtu3/Kconfig           |   48 ++
 drivers/usb/mtu3/Makefile          |   21 +
 drivers/usb/mtu3/mtu3.h            |  424 +++++++++++++++++
 drivers/usb/mtu3/mtu3_core.c       |  879 ++++++++++++++++++++++++++++++++++++
 drivers/usb/mtu3/mtu3_dr.c         |  375 +++++++++++++++
 drivers/usb/mtu3/mtu3_dr.h         |  108 +++++
 drivers/usb/mtu3/mtu3_gadget.c     |  731 ++++++++++++++++++++++++++++++
 drivers/usb/mtu3/mtu3_gadget_ep0.c |  879 ++++++++++++++++++++++++++++++++++++
 drivers/usb/mtu3/mtu3_host.c       |  294 ++++++++++++
 drivers/usb/mtu3/mtu3_hw_regs.h    |  474 +++++++++++++++++++
 drivers/usb/mtu3/mtu3_plat.c       |  490 ++++++++++++++++++++
 drivers/usb/mtu3/mtu3_qmu.c        |  599 ++++++++++++++++++++++++
 drivers/usb/mtu3/mtu3_qmu.h        |   43 ++
 15 files changed, 5368 insertions(+)
 create mode 100644 drivers/usb/mtu3/Kconfig
 create mode 100644 drivers/usb/mtu3/Makefile
 create mode 100644 drivers/usb/mtu3/mtu3.h
 create mode 100644 drivers/usb/mtu3/mtu3_core.c
 create mode 100644 drivers/usb/mtu3/mtu3_dr.c
 create mode 100644 drivers/usb/mtu3/mtu3_dr.h
 create mode 100644 drivers/usb/mtu3/mtu3_gadget.c
 create mode 100644 drivers/usb/mtu3/mtu3_gadget_ep0.c
 create mode 100644 drivers/usb/mtu3/mtu3_host.c
 create mode 100644 drivers/usb/mtu3/mtu3_hw_regs.h
 create mode 100644 drivers/usb/mtu3/mtu3_plat.c
 create mode 100644 drivers/usb/mtu3/mtu3_qmu.c
 create mode 100644 drivers/usb/mtu3/mtu3_qmu.h

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index 8689dcb..9ca0bf0 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -95,6 +95,8 @@ source "drivers/usb/usbip/Kconfig"
 
 endif
 
+source "drivers/usb/mtu3/Kconfig"
+
 source "drivers/usb/musb/Kconfig"
 
 source "drivers/usb/dwc3/Kconfig"
diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index dca7856..7791af6 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_USB_DWC2)		+= dwc2/
 obj-$(CONFIG_USB_ISP1760)	+= isp1760/
 
 obj-$(CONFIG_USB_MON)		+= mon/
+obj-$(CONFIG_USB_MTU3)		+= mtu3/
 
 obj-$(CONFIG_PCI)		+= host/
 obj-$(CONFIG_USB_EHCI_HCD)	+= host/
diff --git a/drivers/usb/mtu3/Kconfig b/drivers/usb/mtu3/Kconfig
new file mode 100644
index 0000000..929ff51
--- /dev/null
+++ b/drivers/usb/mtu3/Kconfig
@@ -0,0 +1,48 @@
+# For MTK USB3.0 IP
+
+config USB_MTU3
+	tristate "MediaTek USB3 Dual Role controller"
+	depends on EXTCON && (USB || USB_GADGET) && HAS_DMA
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	select USB_XHCI_MTK if USB_SUPPORT && USB_XHCI_HCD
+	help
+	  Say Y or M here if your system runs on MediaTek SoCs with
+	  Dual Role SuperSpeed USB controller. You can select usb
+	  mode as peripheral role or host role, or both.
+
+	  If you don't know what this is, please say N.
+
+	  Choose M here to compile this driver as a module, and it
+	  will be called mtu3.ko.
+
+
+if USB_MTU3
+choice
+	bool "MTU3 Mode Selection"
+	default USB_MTU3_DUAL_ROLE if (USB && USB_GADGET)
+	default USB_MTU3_HOST if (USB && !USB_GADGET)
+	default USB_MTU3_GADGET if (!USB && USB_GADGET)
+
+config USB_MTU3_HOST
+	bool "Host only mode"
+	depends on USB=y || USB=USB_MTU3
+	help
+	  Select this when you want to use MTU3 in host mode only,
+	  thereby the gadget feature will be regressed.
+
+config USB_MTU3_GADGET
+	bool "Gadget only mode"
+	depends on USB_GADGET=y || USB_GADGET=USB_MTU3
+	help
+	  Select this when you want to use MTU3 in gadget mode only,
+	  thereby the host feature will be regressed.
+
+config USB_MTU3_DUAL_ROLE
+	bool "Dual Role mode"
+	depends on ((USB=y || USB=USB_MTU3) && (USB_GADGET=y || USB_GADGET=USB_MTU3))
+	help
+	  This is the default mode of working of MTU3 controller where
+	  both host and gadget features are enabled.
+
+endchoice
+endif
diff --git a/drivers/usb/mtu3/Makefile b/drivers/usb/mtu3/Makefile
new file mode 100644
index 0000000..4307ab9
--- /dev/null
+++ b/drivers/usb/mtu3/Makefile
@@ -0,0 +1,21 @@
+
+#ifeq ($(CONFIG_USB_DEBUG),y)
+	ccflags-y	+= -DDEBUG
+#endif
+
+obj-$(CONFIG_USB_MTU3)	+= mtu3.o
+
+mtu3-y	:= mtu3_plat.o
+
+ifneq ($(filter y,$(CONFIG_USB_MTU3_HOST) $(CONFIG_USB_MTU3_DUAL_ROLE)),)
+	mtu3-y	+= mtu3_host.o
+endif
+
+ifneq ($(filter y,$(CONFIG_USB_MTU3_GADGET) $(CONFIG_USB_MTU3_DUAL_ROLE)),)
+	mtu3-y	+= mtu3_core.o mtu3_gadget_ep0.o mtu3_gadget.o mtu3_qmu.o
+endif
+
+ifneq ($(CONFIG_USB_MTU3_DUAL_ROLE),)
+	mtu3-y	+= mtu3_dr.o
+endif
+
diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
new file mode 100644
index 0000000..f57b45e
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3.h
@@ -0,0 +1,424 @@
+/*
+ * mtu3.h - MediaTek USB3 DRD header
+ *
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef __MTU3_H__
+#define __MTU3_H__
+
+#include <linux/device.h>
+#include <linux/dmapool.h>
+#include <linux/extcon.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/phy/phy.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb.h>
+#include <linux/usb/ch9.h>
+#include <linux/usb/gadget.h>
+#include <linux/usb/otg.h>
+#include <linux/workqueue.h>
+
+struct mtu3;
+struct mtu3_ep;
+struct mtu3_request;
+
+#include "mtu3_hw_regs.h"
+#include "mtu3_qmu.h"
+
+#define	MU3D_EP_TXCR0(epnum)	(U3D_TX1CSR0 + (((epnum) - 1) * 0x10))
+#define	MU3D_EP_TXCR1(epnum)	(U3D_TX1CSR1 + (((epnum) - 1) * 0x10))
+#define	MU3D_EP_TXCR2(epnum)	(U3D_TX1CSR2 + (((epnum) - 1) * 0x10))
+
+#define	MU3D_EP_RXCR0(epnum)	(U3D_RX1CSR0 + (((epnum) - 1) * 0x10))
+#define	MU3D_EP_RXCR1(epnum)	(U3D_RX1CSR1 + (((epnum) - 1) * 0x10))
+#define	MU3D_EP_RXCR2(epnum)	(U3D_RX1CSR2 + (((epnum) - 1) * 0x10))
+#define	MU3D_EP_RXCR3(epnum)	(U3D_RX1CSR3 + (((epnum) - 1) * 0x10))
+
+#define USB_QMU_RQCSR(epnum)	(U3D_RXQCSR1 + (((epnum) - 1) * 0x10))
+#define USB_QMU_RQSAR(epnum)	(U3D_RXQSAR1 + (((epnum) - 1) * 0x10))
+#define USB_QMU_RQCPR(epnum)	(U3D_RXQCPR1 + (((epnum) - 1) * 0x10))
+#define USB_QMU_RQLDPR(epnum)	(U3D_RXQLDPR1 + (((epnum) - 1) * 0x10))
+
+#define USB_QMU_TQCSR(epnum)	(U3D_TXQCSR1 + (((epnum) - 1) * 0x10))
+#define USB_QMU_TQSAR(epnum)	(U3D_TXQSAR1 + (((epnum) - 1) * 0x10))
+#define USB_QMU_TQCPR(epnum)	(U3D_TXQCPR1 + (((epnum) - 1) * 0x10))
+
+#define SSUSB_U3_CTRL(p)	(U3D_SSUSB_U3_CTRL_0P + ((p) * 0x08))
+#define SSUSB_U2_CTRL(p)	(U3D_SSUSB_U2_CTRL_0P + ((p) * 0x08))
+
+#define MTU3_DRIVER_NAME	"mtu3"
+#define	DMA_ADDR_INVALID	(~(dma_addr_t)0)
+
+#define MTU3_EP_ENABLED		BIT(0)
+#define MTU3_EP_STALL		BIT(1)
+#define MTU3_EP_WEDGE		BIT(2)
+#define MTU3_EP_BUSY		BIT(3)
+
+#define MTU3_U3_IP_SLOT_DEFAULT 2
+#define MTU3_U2_IP_SLOT_DEFAULT 1
+
+/**
+ * Normally the device works on HS or SS, to simplify fifo management,
+ * devide fifo into some 512B parts, use bitmap to manage it; And
+ * 128 bits size of bitmap is large enough, that means it can manage
+ * up to 64KB fifo size.
+ * NOTE: MTU3_EP_FIFO_UNIT should be power of two
+ */
+#define MTU3_EP_FIFO_UNIT		(1 << 9)
+#define MTU3_FIFO_BIT_SIZE		128
+#define MTU3_U2_IP_EP0_FIFO_SIZE	64
+
+/**
+ * Maximum size of ep0 response buffer for ch9 requests,
+ * the set_sel request uses 6 so far, get_status is 2
+ */
+#define EP0_RESPONSE_BUF  6
+
+/* device operated link and speed got from DEVICE_CONF register */
+enum mtu3_speed {
+	MTU3_SPEED_INACTIVE = 0,
+	MTU3_SPEED_FULL = 1,
+	MTU3_SPEED_HIGH = 3,
+	MTU3_SPEED_SUPER = 4,
+};
+
+/**
+ * @MU3D_EP0_STATE_SETUP: waits for SETUP or received a SETUP
+ *		without data stage.
+ * @MU3D_EP0_STATE_TX: IN data stage
+ * @MU3D_EP0_STATE_RX: OUT data stage
+ * @MU3D_EP0_STATE_TX_END: the last IN data is transferred, and
+ *		waits for its completion ineterrupt
+ * @MU3D_EP0_STATE_STALL: ep0 is in stall status, will be auto-cleared
+ *		after receives a SETUP.
+ */
+enum mtu3_g_ep0_state {
+	MU3D_EP0_STATE_SETUP = 1,
+	MU3D_EP0_STATE_TX,
+	MU3D_EP0_STATE_RX,
+	MU3D_EP0_STATE_TX_END,
+	MU3D_EP0_STATE_STALL,
+};
+
+/**
+ * @base: the base address of fifo
+ * @limit: the bitmap size in bits
+ * @bitmap: fifo bitmap in unit of @MTU3_EP_FIFO_UNIT
+ */
+struct mtu3_fifo_info {
+	u32 base;
+	u32 limit;
+	DECLARE_BITMAP(bitmap, MTU3_FIFO_BIT_SIZE);
+};
+
+/**
+ * General Purpose Descriptor (GPD):
+ *	The format of TX GPD is a little different from RX one.
+ *	And the size of GPD is 16 bytes.
+ *
+ * @flag:
+ *	bit0: Hardware Own (HWO);
+ *	bit1: Buffer Descriptor Present (BDP), always 0, BD is not supported;
+ *	bit2: Bypass (BPS), 1: HW skips this GPD if HWO = 1;
+ *	bit7: Interrupt On Completion (IOC);
+ * @chksum: This is used to validate the contents of this GPD;
+ *	If TXQ_CS_EN / RXQ_CS_EN bit is set, an interrupt is issued
+ *	when checksum validation fails;
+ *	Checksum value is calculated over the 16 bytes of the GPD by default;
+ * @data_buf_len: (RX ONLY) This value indicates the length of
+ *	the assigned data buffer
+ * @next_gpd: Physical address of the next GPD
+ * @buffer: Physical address of the data buffer
+ * @buf_len:
+ *	(TX): This value indicates the length of the assigned data buffer
+ *	(RX): The total length of data received
+ * @ext_len: reserved
+ * @ext_flag:
+ *	bit5: (TX ONLY) Zero Length Packet (ZLP),
+ */
+struct qmu_gpd {
+	u8 flag;
+	u8 chksum;
+	u16 data_buf_len;
+	u32 next_gpd;
+	u32 buffer;
+	u16 buf_len;
+	u8 ext_len;
+	u8 ext_flag;
+} __packed;
+
+/**
+* dma: physical base address of GPD segment
+* start: virtual base address of GPD segment
+* end: the last gpd element
+* enqueue: the first empty gpd to use
+* dequeue: the first completed gpd serviced by ISR
+* NOTE: the ring elements of the gpd should be >= 2
+*/
+struct mtu3_gpd_ring {
+	dma_addr_t dma;
+	struct qmu_gpd *start;
+	struct qmu_gpd *end;
+	struct qmu_gpd *enqueue;
+	struct qmu_gpd *dequeue;
+};
+
+/**
+* @vbus: vbus 5V used by host mode
+* @edev: external connector used to detect vbus and iddig changes
+* @vbus_nb: notifier for vbus detection
+* @vbus_nb: notifier for iddig(idpin) detection
+* @extcon_reg_dwork: delay work for extcon notifier register, waiting for
+*		xHCI driver initialized, it's necessary for system bootup
+*		as device.
+* @is_u3_drd: whether port0 supports usb3.0 dual-role device or not
+* @id_*: used to maually switch between host and device modes by inpin
+* @manual_drd_enabled: it's true when receptacle is TYPE-A, and supports dual
+*		role devices by an interface to switch host/device modes
+*		depending on user input.
+*/
+struct otg_switch_mtk {
+	struct regulator *vbus;
+	struct extcon_dev *edev;
+	struct notifier_block vbus_nb;
+	struct notifier_block id_nb;
+	struct delayed_work extcon_reg_dwork;
+	bool is_u3_drd;
+	/* dual-role switch by sysfs interface */
+	struct pinctrl *id_pinctrl;
+	struct pinctrl_state *id_float;
+	struct pinctrl_state *id_ground;
+	bool manual_drd_enabled;
+};
+
+/**
+ * @mac_base: register base address of mu3d device MAC, exclude xhci's
+ * @ippc_base: register base address of ip port controller interface
+ * @vusb33: usb3.3V shared by device/host ip
+ * @sys_clk: system clock of usb, shared by device/host ip
+ * @dr_mode: supports which driver mode:
+ *		host only, device only or dual-role mode
+ * @u2_ports: number of usb2.0 host ports
+ * @u3_ports: number of usb3.0 host ports
+ * @dbgfs_root: only used when supports manual dual-role switch via debugfs
+ * @wakeup_en: it's true when supports remote wakeup in host mode
+ * @wk_deb_p0: port0's wakeup debounce clock
+ * @wk_deb_p1: it's optional, and depends on port1 is supported or not
+ */
+struct ssusb_mtk {
+	struct device *dev;
+	struct mtu3 *u3d;
+	void __iomem *mac_base;
+	void __iomem *ippc_base;
+	struct phy **phys;
+	int num_phys;
+	/* common power & clock */
+	struct regulator *vusb33;
+	struct clk *sys_clk;
+	/* otg */
+	struct otg_switch_mtk otg_switch;
+	enum usb_dr_mode dr_mode;
+	bool is_host;
+	int u2_ports;
+	int u3_ports;
+	struct dentry *dbgfs_root;
+	/* usb wakeup for host mode */
+	bool wakeup_en;
+	struct clk *wk_deb_p0;
+	struct clk *wk_deb_p1;
+	struct regmap *pericfg;
+};
+
+/**
+ * @fifo_size: it is (@slot + 1) * @fifo_seg_size
+ * @fifo_seg_size: it is roundup_pow_of_two(@maxp)
+ */
+struct mtu3_ep {
+	struct usb_ep ep;
+	char name[12];
+	struct mtu3 *mtu;
+	u8 epnum;
+	u8 type;
+	u8 is_in;
+	u16 maxp;
+	int slot;
+	u32 fifo_size;
+	u32 fifo_addr;
+	u32 fifo_seg_size;
+	struct mtu3_fifo_info *fifo;
+
+	struct list_head req_list;
+	struct mtu3_gpd_ring gpd_ring;
+	const struct usb_ss_ep_comp_descriptor *comp_desc;
+	const struct usb_endpoint_descriptor *desc;
+
+	int flags;
+	u8 wedged;
+	u8 busy;
+};
+
+struct mtu3_request {
+	struct usb_request request;
+	struct list_head list;
+	struct mtu3_ep *mep;
+	struct mtu3 *mtu;
+	struct qmu_gpd *gpd;
+	int epnum;
+};
+
+static inline struct ssusb_mtk *dev_to_ssusb(struct device *dev)
+{
+	return dev_get_drvdata(dev);
+}
+
+/**
+ * struct mtu3 - device driver instance data.
+ * @slot: MTU3_U2_IP_SLOT_DEFAULT for U2 IP only,
+ *		MTU3_U3_IP_SLOT_DEFAULT for U3 IP
+ * @may_wakeup: means device's remote wakeup is enabled
+ * @is_self_powered: is reported in device status and the config descriptor
+ * @ep0_req: dummy request used while handling standard USB requests
+ *		for GET_STATUS and SET_SEL
+ * @setup_buf: ep0 response buffer for GET_STATUS and SET_SEL requests
+ */
+struct mtu3 {
+	spinlock_t lock;
+	struct ssusb_mtk *ssusb;
+	struct device *dev;
+	void __iomem *mac_base;
+	void __iomem *ippc_base;
+	int irq;
+
+	struct mtu3_fifo_info tx_fifo;
+	struct mtu3_fifo_info rx_fifo;
+
+	struct mtu3_ep *ep_array;
+	struct mtu3_ep *in_eps;
+	struct mtu3_ep *out_eps;
+	struct mtu3_ep *ep0;
+	int num_eps;
+	int slot;
+	int active_ep;
+
+	struct dma_pool	*qmu_gpd_pool;
+	struct tasklet_struct qmu_done;
+	u32 qmu_done_intr;
+
+	enum mtu3_g_ep0_state ep0_state;
+	struct usb_gadget g;	/* the gadget */
+	struct usb_gadget_driver *gadget_driver;
+	struct mtu3_request ep0_req;
+	u8 setup_buf[EP0_RESPONSE_BUF];
+	u32 max_speed;
+
+	unsigned is_active:1;
+	unsigned may_wakeup:1;
+	unsigned is_self_powered:1;
+	unsigned test_mode:1;
+	unsigned softconnect:1;
+	unsigned u1_enable:1;
+	unsigned u2_enable:1;
+	unsigned is_u3_ip:1;
+
+	u8 address;
+	u8 test_mode_nr;
+	u32 hw_version;
+};
+
+static inline struct mtu3 *gadget_to_mtu3(struct usb_gadget *g)
+{
+	return container_of(g, struct mtu3, g);
+}
+
+static inline int is_first_entry(const struct list_head *list,
+	const struct list_head *head)
+{
+	return list_is_last(head, list);
+}
+
+static inline struct mtu3_request *to_mtu3_request(struct usb_request *req)
+{
+	return req ? container_of(req, struct mtu3_request, request) : NULL;
+}
+
+static inline struct mtu3_ep *to_mtu3_ep(struct usb_ep *ep)
+{
+	return ep ? container_of(ep, struct mtu3_ep, ep) : NULL;
+}
+
+static inline struct mtu3_request *next_request(struct mtu3_ep *mep)
+{
+	struct list_head *queue = &mep->req_list;
+
+	if (list_empty(queue))
+		return NULL;
+
+	return list_first_entry(queue, struct mtu3_request, list);
+}
+
+static inline void mtu3_writel(void __iomem *base, u32 offset, u32 data)
+{
+	writel(data, base + offset);
+}
+
+static inline u32 mtu3_readl(void __iomem *base, u32 offset)
+{
+	return readl(base + offset);
+}
+
+static inline void mtu3_setbits(void __iomem *base, u32 offset, u32 bits)
+{
+	void __iomem *addr = base + offset;
+	u32 tmp = readl(addr);
+
+	writel((tmp | (bits)), addr);
+}
+
+static inline void mtu3_clrbits(void __iomem *base, u32 offset, u32 bits)
+{
+	void __iomem *addr = base + offset;
+	u32 tmp = readl(addr);
+
+	writel((tmp & ~(bits)), addr);
+}
+
+int ssusb_check_clocks(struct ssusb_mtk *ssusb, u32 ex_clks);
+struct usb_request *mtu3_alloc_request(struct usb_ep *ep, gfp_t gfp_flags);
+void mtu3_free_request(struct usb_ep *ep, struct usb_request *req);
+void mtu3_req_complete(struct mtu3_ep *mep,
+		struct usb_request *req, int status);
+
+int mtu3_config_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
+		int interval, int burst, int mult);
+void mtu3_deconfig_ep(struct mtu3 *mtu, struct mtu3_ep *mep);
+void mtu3_ep_stall_set(struct mtu3_ep *mep, bool set);
+void mtu3_ep0_setup(struct mtu3 *mtu);
+void mtu3_start(struct mtu3 *mtu);
+void mtu3_stop(struct mtu3 *mtu);
+void mtu3_dev_on_off(struct mtu3 *mtu, int is_on);
+
+int mtu3_gadget_setup(struct mtu3 *mtu);
+void mtu3_gadget_cleanup(struct mtu3 *mtu);
+void mtu3_gadget_reset(struct mtu3 *mtu);
+void mtu3_gadget_suspend(struct mtu3 *mtu);
+void mtu3_gadget_resume(struct mtu3 *mtu);
+void mtu3_gadget_disconnect(struct mtu3 *mtu);
+
+irqreturn_t mtu3_ep0_isr(struct mtu3 *mtu);
+extern const struct usb_ep_ops mtu3_ep0_ops;
+
+#endif
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
new file mode 100644
index 0000000..756824f
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -0,0 +1,879 @@
+/*
+ * mtu3_core.c - hardware access layer and gadget init/exit of
+ *                     MediaTek usb3 Dual-Role Controller Driver
+ *
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+
+#include "mtu3.h"
+
+static int ep_fifo_alloc(struct mtu3_ep *mep, u32 seg_size)
+{
+	struct mtu3_fifo_info *fifo = mep->fifo;
+	u32 free_bits = DIV_ROUND_UP(seg_size, MTU3_EP_FIFO_UNIT);
+	u32 start_bit;
+
+	free_bits = roundup_pow_of_two(free_bits);
+	if (free_bits > fifo->limit)
+		return -EINVAL;
+
+	mep->fifo_seg_size = free_bits * MTU3_EP_FIFO_UNIT;
+	free_bits = free_bits * (mep->slot + 1);
+	start_bit = bitmap_find_next_zero_area(fifo->bitmap,
+			fifo->limit, 0, free_bits, 0);
+	if (start_bit >= fifo->limit)
+		return -EOVERFLOW;
+
+	bitmap_set(fifo->bitmap, start_bit, free_bits);
+	mep->fifo_size = free_bits * MTU3_EP_FIFO_UNIT;
+	mep->fifo_addr = fifo->base + MTU3_EP_FIFO_UNIT * start_bit;
+
+	dev_dbg(mep->mtu->dev, "%s fifo:%#x/%#x, start_bit: %d\n",
+		__func__, mep->fifo_seg_size, mep->fifo_size, start_bit);
+
+	return mep->fifo_addr;
+}
+
+static void ep_fifo_free(struct mtu3_ep *mep)
+{
+	struct mtu3_fifo_info *fifo = mep->fifo;
+	u32 addr = mep->fifo_addr;
+	u32 bits = mep->fifo_size / MTU3_EP_FIFO_UNIT;
+	u32 start_bit;
+
+	if (unlikely(addr < fifo->base || bits > fifo->limit))
+		return;
+
+	start_bit = (addr - fifo->base) / MTU3_EP_FIFO_UNIT;
+	bitmap_clear(fifo->bitmap, start_bit, bits);
+	mep->fifo_size = 0;
+	mep->fifo_seg_size = 0;
+
+	dev_dbg(mep->mtu->dev, "%s size:%#x/%#x, start_bit: %d\n",
+		__func__, mep->fifo_seg_size, mep->fifo_size, start_bit);
+}
+
+/* enable/disable U3D SS function */
+static void mtu3_ss_func_set(struct mtu3 *mtu, bool enable)
+{
+	/* If usb3_en==0, LTSSM will go to SS.Disable state */
+	if (enable)
+		mtu3_setbits(mtu->mac_base, U3D_USB3_CONFIG, USB3_EN);
+	else
+		mtu3_clrbits(mtu->mac_base, U3D_USB3_CONFIG, USB3_EN);
+
+	dev_dbg(mtu->dev, "USB3_EN = %d\n", !!enable);
+}
+
+/* set/clear U3D HS device soft connect */
+static void mtu3_hs_softconn_set(struct mtu3 *mtu, bool enable)
+{
+	if (enable) {
+		mtu3_setbits(mtu->mac_base, U3D_POWER_MANAGEMENT,
+			SOFT_CONN | SUSPENDM_ENABLE);
+	} else {
+		mtu3_clrbits(mtu->mac_base, U3D_POWER_MANAGEMENT,
+			SOFT_CONN | SUSPENDM_ENABLE);
+	}
+	dev_dbg(mtu->dev, "SOFTCONN = %d\n", !!enable);
+}
+
+/* only port0 of U2/U3 supports device mode */
+static int mtu3_device_enable(struct mtu3 *mtu)
+{
+	void __iomem *ibase = mtu->ippc_base;
+	u32 check_clk = 0;
+
+	mtu3_clrbits(ibase, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
+
+	if (mtu->is_u3_ip) {
+		check_clk = SSUSB_U3_MAC_RST_B_STS;
+		mtu3_clrbits(ibase, SSUSB_U3_CTRL(0),
+			(SSUSB_U3_PORT_DIS | SSUSB_U3_PORT_PDN |
+			SSUSB_U3_PORT_HOST_SEL));
+	}
+	mtu3_clrbits(ibase, SSUSB_U2_CTRL(0),
+		(SSUSB_U2_PORT_DIS | SSUSB_U2_PORT_PDN |
+		SSUSB_U2_PORT_HOST_SEL));
+
+	mtu3_setbits(ibase, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_OTG_SEL);
+
+	return ssusb_check_clocks(mtu->ssusb, check_clk);
+}
+
+static void mtu3_device_disable(struct mtu3 *mtu)
+{
+	void __iomem *ibase = mtu->ippc_base;
+
+	if (mtu->is_u3_ip)
+		mtu3_setbits(ibase, SSUSB_U3_CTRL(0),
+			(SSUSB_U3_PORT_DIS | SSUSB_U3_PORT_PDN));
+
+	mtu3_setbits(ibase, SSUSB_U2_CTRL(0),
+		SSUSB_U2_PORT_DIS | SSUSB_U2_PORT_PDN);
+
+	mtu3_clrbits(ibase, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_OTG_SEL);
+
+	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
+}
+
+/* reset U3D all dev module. */
+static void mtu3_device_reset(struct mtu3 *mtu)
+{
+	void __iomem *ibase = mtu->ippc_base;
+
+	mtu3_setbits(ibase, U3D_SSUSB_DEV_RST_CTRL, SSUSB_DEV_SW_RST);
+	udelay(1);
+	mtu3_clrbits(ibase, U3D_SSUSB_DEV_RST_CTRL, SSUSB_DEV_SW_RST);
+}
+
+/* disable all interrupts */
+static void mtu3_intr_disable(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+
+	/* Disable level 1 interrupts */
+	mtu3_writel(mbase, U3D_LV1IECR, ~0x0);
+
+	/* Disable endpoint interrupts */
+	mtu3_writel(mbase, U3D_EPIECR, ~0x0);
+}
+
+static void mtu3_intr_status_clear(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+
+	/* Clear EP0 and Tx/Rx EPn interrupts status */
+	mtu3_writel(mbase, U3D_EPISR, ~0x0);
+
+	/* Clear U2 USB common interrupt status */
+	mtu3_writel(mbase, U3D_COMMON_USB_INTR, ~0x0);
+
+	/* Clear U3 LTSSM interrupt status */
+	mtu3_writel(mbase, U3D_LTSSM_INTR, ~0x0);
+
+	/* Clear speed change interrupt status */
+	mtu3_writel(mbase, U3D_DEV_LINK_INTR, ~0x0);
+}
+
+/* enable system global interrupt */
+static void mtu3_intr_enable(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+	u32 value;
+
+	/*Enable level 1 interrupt (BMU, QMU, MAC3, DMA, MAC2, EPCTL) */
+	value = BMU_INTR | QMU_INTR | MAC3_INTR | MAC2_INTR | EP_CTRL_INTR;
+	mtu3_writel(mbase, U3D_LV1IESR, value);
+
+	/* Enable U2 common USB interrupt */
+	value = SUSPEND_INTR | RESUME_INTR | RESET_INTR;
+	mtu3_writel(mbase, U3D_COMMON_USB_INTR_ENABLE, value);
+
+	if (mtu->is_u3_ip) {
+		/* Enable U3 LTSSM interrupt */
+		value = HOT_RST_INTR | WARM_RST_INTR | VBUS_RISE_INTR |
+		    VBUS_FALL_INTR | ENTER_U3_INTR | EXIT_U3_INTR;
+		mtu3_writel(mbase, U3D_LTSSM_INTR_ENABLE, value);
+	}
+
+	/* Enable QMU interrupt. */
+	value = TXQ_CSERR_INT | TXQ_LENERR_INT | RXQ_CSERR_INT |
+			RXQ_LENERR_INT | RXQ_ZLPERR_INT;
+	mtu3_writel(mbase, U3D_QIESR1, value);
+
+	/* Enable speed change interrupt */
+	mtu3_writel(mbase, U3D_DEV_LINK_INTR_ENABLE, SSUSB_DEV_SPEED_CHG_INTR);
+}
+
+/* set/clear the stall and toggle bits for non-ep0 */
+void mtu3_ep_stall_set(struct mtu3_ep *mep, bool set)
+{
+	struct mtu3 *mtu = mep->mtu;
+	void __iomem *mbase = mtu->mac_base;
+	u8 epnum = mep->epnum;
+	u32 csr;
+
+	if (mep->is_in) {	/* TX */
+		csr = mtu3_readl(mbase, MU3D_EP_TXCR0(epnum)) & TX_W1C_BITS;
+		if (set)
+			csr |= TX_SENDSTALL;
+		else
+			csr = (csr & (~TX_SENDSTALL)) | TX_SENTSTALL;
+		mtu3_writel(mbase, MU3D_EP_TXCR0(epnum), csr);
+
+	} else {	/* RX */
+		csr = mtu3_readl(mbase, MU3D_EP_RXCR0(epnum)) & RX_W1C_BITS;
+		if (set)
+			csr |= RX_SENDSTALL;
+		else
+			csr = (csr & (~RX_SENDSTALL)) | RX_SENTSTALL;
+		mtu3_writel(mbase, MU3D_EP_RXCR0(epnum), csr);
+
+	}
+
+	if (!set) {
+		mtu3_setbits(mbase, U3D_EP_RST, EP_RST(mep->is_in, epnum));
+		mtu3_clrbits(mbase, U3D_EP_RST, EP_RST(mep->is_in, epnum));
+		mep->flags &= ~MTU3_EP_STALL;
+	} else {
+		mep->flags |= MTU3_EP_STALL;
+	}
+
+	dev_dbg(mtu->dev, "%s: %s\n", mep->name,
+		set ? "SEND STALL" : "CLEAR STALL, with EP RESET");
+}
+
+void mtu3_dev_on_off(struct mtu3 *mtu, int is_on)
+{
+	if (mtu->is_u3_ip && (mtu->max_speed == USB_SPEED_SUPER))
+		mtu3_ss_func_set(mtu, is_on);
+	else
+		mtu3_hs_softconn_set(mtu, is_on);
+
+	dev_info(mtu->dev, "gadget (%s) pullup D%s\n",
+		usb_speed_string(mtu->max_speed), is_on ? "+" : "-");
+}
+
+void mtu3_start(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+
+	dev_dbg(mtu->dev, "%s devctl 0x%02x\n", __func__,
+		(u8)mtu3_readl(mbase, U3D_DEVICE_CONTROL));
+
+	mtu3_clrbits(mtu->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
+
+	/*
+	 * When disable U2 port, USB2_CSR's register will be reset to
+	 * default value after re-enable it again(HS is enabled by default).
+	 * So if force mac to work as FS, disable HS function.
+	 */
+	if (mtu->max_speed == USB_SPEED_FULL)
+		mtu3_clrbits(mbase, U3D_POWER_MANAGEMENT, HS_ENABLE);
+
+	/* Initialize the default interrupts */
+	mtu3_intr_enable(mtu);
+
+	mtu->is_active = 1;
+
+	if (mtu->softconnect)
+		mtu3_dev_on_off(mtu, 1);
+
+}
+
+void mtu3_stop(struct mtu3 *mtu)
+{
+	dev_dbg(mtu->dev, "%s\n", __func__);
+
+	mtu3_intr_disable(mtu);
+	mtu3_intr_status_clear(mtu);
+
+	if (mtu->softconnect)
+		mtu3_dev_on_off(mtu, 0);
+
+	mtu->is_active = 0;
+	mtu3_setbits(mtu->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
+}
+
+int mtu3_config_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
+			int interval, int burst, int mult)
+{
+	void __iomem *mbase = mtu->mac_base;
+	int epnum = mep->epnum;
+	u32 csr0, csr1, csr2;
+	u32 fifosz = 0;
+	u32 max_pkt;
+	int fifo_addr;
+
+	fifo_addr = ep_fifo_alloc(mep, mep->maxp);
+	if (fifo_addr < 0) {
+		dev_err(mtu->dev, "alloc ep fifo failed(%d)\n", fifosz);
+		return -ENOMEM;
+	}
+	fifosz = ilog2(mep->fifo_seg_size);
+	dev_dbg(mtu->dev, "%s fifosz: %x(%x/%x)\n", __func__, fifosz,
+		mep->fifo_seg_size, mep->fifo_size);
+
+	if (mep->is_in) {
+		csr0 = TX_TXMAXPKTSZ(mep->maxp);
+		csr0 |= TX_DMAREQEN;
+
+		max_pkt = (burst + 1) * (mult + 1) - 1;
+		csr1 = TX_SS_BURST(burst) | TX_SLOT(mep->slot);
+		csr1 |= TX_MAX_PKT(max_pkt) | TX_MULT(mult);
+
+		csr2 = TX_FIFOADDR(fifo_addr >> 4);
+		csr2 |= TX_FIFOSEGSIZE(fifosz);
+
+		switch (mep->type) {
+		case USB_ENDPOINT_XFER_BULK:
+			csr1 |= TX_TYPE(TYPE_BULK);
+			break;
+		case USB_ENDPOINT_XFER_ISOC:
+			csr1 |= TX_TYPE(TYPE_ISO);
+			csr2 |= TX_BINTERVAL(interval);
+			break;
+		case USB_ENDPOINT_XFER_INT:
+			csr1 |= TX_TYPE(TYPE_INT);
+			csr2 |= TX_BINTERVAL(interval);
+			break;
+		}
+
+		/* Enable QMU Done interrupt */
+		mtu3_setbits(mbase, U3D_QIESR0, QMU_TX_DONE_INT(epnum));
+
+		mtu3_writel(mbase, MU3D_EP_TXCR0(epnum), csr0);
+		mtu3_writel(mbase, MU3D_EP_TXCR1(epnum), csr1);
+		mtu3_writel(mbase, MU3D_EP_TXCR2(epnum), csr2);
+
+		dev_dbg(mtu->dev, "U3D_TX%d CSR0:%#x, CSR1:%#x, CSR2:%#x\n",
+			epnum, mtu3_readl(mbase, MU3D_EP_TXCR0(epnum)),
+			mtu3_readl(mbase, MU3D_EP_TXCR1(epnum)),
+			mtu3_readl(mbase, MU3D_EP_TXCR2(epnum)));
+
+	} else {
+
+		csr0 = RX_RXMAXPKTSZ(mep->maxp);
+		csr0 |= RX_DMAREQEN;
+
+		max_pkt = (burst + 1) * (mult + 1) - 1;
+		csr1 = RX_SS_BURST(burst) | RX_SLOT(mep->slot);
+		csr1 |= RX_MAX_PKT(max_pkt) | RX_MULT(mult);
+
+		csr2 = RX_FIFOADDR(fifo_addr >> 4);
+		csr2 |= RX_FIFOSEGSIZE(fifosz);
+
+		switch (mep->type) {
+		case USB_ENDPOINT_XFER_BULK:
+			csr1 |= RX_TYPE(TYPE_BULK);
+			break;
+		case USB_ENDPOINT_XFER_ISOC:
+			csr1 |= RX_TYPE(TYPE_ISO);
+			csr2 |= RX_BINTERVAL(interval);
+			break;
+		case USB_ENDPOINT_XFER_INT:
+			csr1 |= RX_TYPE(TYPE_INT);
+			csr2 |= RX_BINTERVAL(interval);
+			break;
+		}
+
+		/*Enable QMU Done interrupt */
+		mtu3_setbits(mbase, U3D_QIESR0, QMU_RX_DONE_INT(epnum));
+
+		mtu3_writel(mbase, MU3D_EP_RXCR0(epnum), csr0);
+		mtu3_writel(mbase, MU3D_EP_RXCR1(epnum), csr1);
+		mtu3_writel(mbase, MU3D_EP_RXCR2(epnum), csr2);
+
+		dev_dbg(mtu->dev, "U3D_RX%d CSR0:%#x, CSR1:%#x, CSR2:%#x\n",
+			epnum, mtu3_readl(mbase, MU3D_EP_RXCR0(epnum)),
+			mtu3_readl(mbase, MU3D_EP_RXCR1(epnum)),
+			mtu3_readl(mbase, MU3D_EP_RXCR2(epnum)));
+
+	}
+
+	dev_dbg(mtu->dev, "csr0:%#x, csr1:%#x, csr2:%#x\n", csr0, csr1, csr2);
+	dev_dbg(mtu->dev, "%s: %s, fifo-addr:%#x, fifo-size:%#x(%#x/%#x)\n",
+		__func__, mep->name, mep->fifo_addr, mep->fifo_size, fifosz,
+		mep->fifo_seg_size);
+
+	return 0;
+}
+
+void mtu3_deconfig_ep(struct mtu3 *mtu, struct mtu3_ep *mep)
+{
+	void __iomem *mbase = mtu->mac_base;
+	int epnum = mep->epnum;
+
+	if (mep->is_in) {
+		mtu3_writel(mbase, MU3D_EP_TXCR0(epnum), 0);
+		mtu3_writel(mbase, MU3D_EP_TXCR1(epnum), 0);
+		mtu3_writel(mbase, MU3D_EP_TXCR2(epnum), 0);
+		mtu3_setbits(mbase, U3D_QIECR0, QMU_TX_DONE_INT(epnum));
+	} else {
+		mtu3_writel(mbase, MU3D_EP_RXCR0(epnum), 0);
+		mtu3_writel(mbase, MU3D_EP_RXCR1(epnum), 0);
+		mtu3_writel(mbase, MU3D_EP_RXCR2(epnum), 0);
+		mtu3_setbits(mbase, U3D_QIECR0, QMU_RX_DONE_INT(epnum));
+	}
+
+	ep_fifo_free(mep);
+
+	dev_dbg(mtu->dev, "%s: %s\n", __func__, mep->name);
+}
+
+/*
+ * Two scenarios:
+ * 1. when device IP supports SS, the fifo of EP0, TX EPs, RX EPs
+ *	are separated;
+ * 2. when only supports HS, the fifo is shared for all eps, and
+ *	the capability registers of @EPNTXFFSZ or @EPNRXFFSZ indicate
+ *	the total fifo size of non-ep0, and ep0's is 64B, so the total fifo
+ *	size is 64B + @EPNTXFFSZ;
+ *	Because the first 64B should be reserved for EP0, so non-ep0's fifo
+ *	starts from offset 64, and are divided into two equal parts for
+ *	TX or RX EPs for simplification.
+ */
+static void get_ep_fifo_config(struct mtu3 *mtu)
+{
+	struct mtu3_fifo_info *tx_fifo;
+	struct mtu3_fifo_info *rx_fifo;
+	u32 fifosize;
+
+	if (mtu->is_u3_ip) {
+		fifosize = mtu3_readl(mtu->mac_base, U3D_CAP_EPNTXFFSZ);
+		tx_fifo = &mtu->tx_fifo;
+		tx_fifo->base = 0;
+		tx_fifo->limit = fifosize / MTU3_EP_FIFO_UNIT;
+		bitmap_zero(tx_fifo->bitmap, MTU3_FIFO_BIT_SIZE);
+
+		fifosize = mtu3_readl(mtu->mac_base, U3D_CAP_EPNRXFFSZ);
+		rx_fifo = &mtu->rx_fifo;
+		rx_fifo->base = 0;
+		rx_fifo->limit = fifosize / MTU3_EP_FIFO_UNIT;
+		bitmap_zero(rx_fifo->bitmap, MTU3_FIFO_BIT_SIZE);
+		mtu->slot = MTU3_U3_IP_SLOT_DEFAULT;
+	} else {
+		fifosize = mtu3_readl(mtu->mac_base, U3D_CAP_EPNTXFFSZ);
+		tx_fifo = &mtu->tx_fifo;
+		tx_fifo->base = MTU3_U2_IP_EP0_FIFO_SIZE;
+		tx_fifo->limit = (fifosize / MTU3_EP_FIFO_UNIT) >> 1;
+		bitmap_zero(tx_fifo->bitmap, MTU3_FIFO_BIT_SIZE);
+
+		rx_fifo = &mtu->rx_fifo;
+		rx_fifo->base =
+			tx_fifo->base + tx_fifo->limit * MTU3_EP_FIFO_UNIT;
+		rx_fifo->limit = tx_fifo->limit;
+		bitmap_zero(rx_fifo->bitmap, MTU3_FIFO_BIT_SIZE);
+		mtu->slot = MTU3_U2_IP_SLOT_DEFAULT;
+	}
+
+	dev_dbg(mtu->dev, "%s, TX: base-%d, limit-%d; RX: base-%d, limit-%d\n",
+		__func__, tx_fifo->base, tx_fifo->limit,
+		rx_fifo->base, rx_fifo->limit);
+}
+
+void mtu3_ep0_setup(struct mtu3 *mtu)
+{
+	u32 maxpacket = mtu->g.ep0->maxpacket;
+	u32 csr;
+
+	dev_dbg(mtu->dev, "%s maxpacket: %d\n", __func__, maxpacket);
+
+	csr = mtu3_readl(mtu->mac_base, U3D_EP0CSR);
+	csr &= ~EP0_MAXPKTSZ_MSK;
+	csr |= EP0_MAXPKTSZ(maxpacket);
+	csr &= EP0_W1C_BITS;
+	mtu3_writel(mtu->mac_base, U3D_EP0CSR, csr);
+
+	/* Enable EP0 interrupt */
+	mtu3_writel(mtu->mac_base, U3D_EPIESR, EP0ISR);
+}
+
+static int mtu3_mem_alloc(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+	struct mtu3_ep *ep_array;
+	int in_ep_num, out_ep_num;
+	u32 cap_epinfo, cap_dev;
+	int ret;
+	int i;
+
+	mtu->hw_version = mtu3_readl(mtu->ippc_base, U3D_SSUSB_HW_ID);
+
+	cap_dev = mtu3_readl(mtu->ippc_base, U3D_SSUSB_IP_DEV_CAP);
+	mtu->is_u3_ip = !!SSUSB_IP_DEV_U3_PORT_NUM(cap_dev);
+
+	cap_epinfo = mtu3_readl(mbase, U3D_CAP_EPINFO);
+	in_ep_num = CAP_TX_EP_NUM(cap_epinfo);
+	out_ep_num = CAP_RX_EP_NUM(cap_epinfo);
+
+	dev_info(mtu->dev, "IP version 0x%x(%s IP)\n", mtu->hw_version,
+		mtu->is_u3_ip ? "U3" : "U2");
+	dev_info(mtu->dev, "fifosz/epnum: Tx=%#x/%d, Rx=%#x/%d\n",
+		 mtu3_readl(mbase, U3D_CAP_EPNTXFFSZ), in_ep_num,
+		 mtu3_readl(mbase, U3D_CAP_EPNRXFFSZ), out_ep_num);
+
+	/* one for ep0, another is reserved */
+	mtu->num_eps = min(in_ep_num, out_ep_num) + 1;
+	ep_array = kcalloc(mtu->num_eps * 2, sizeof(*ep_array), GFP_KERNEL);
+	if (ep_array == NULL)
+		return -ENOMEM;
+
+	mtu->ep_array = ep_array;
+	mtu->in_eps = ep_array;
+	mtu->out_eps = &ep_array[mtu->num_eps];
+	/* ep0 use in_eps[0], out_eps[0] is reserved */
+	mtu->ep0 = mtu->in_eps;
+
+	mtu->ep0->mtu = mtu;
+	mtu->ep0->epnum = 0;
+
+	for (i = 1; i < mtu->num_eps; i++) {
+		struct mtu3_ep *mep = mtu->in_eps + i;
+
+		mep->fifo = &mtu->tx_fifo;
+		mep = mtu->out_eps + i;
+		mep->fifo = &mtu->rx_fifo;
+	}
+
+	get_ep_fifo_config(mtu);
+
+	ret = mtu3_qmu_init(mtu);
+	if (ret)
+		kfree(mtu->ep_array);
+
+	return ret;
+}
+
+static void mtu3_mem_free(struct mtu3 *mtu)
+{
+	mtu3_qmu_exit(mtu);
+	kfree(mtu->ep_array);
+}
+
+static void mtu3_set_speed(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+
+	if (!mtu->is_u3_ip && (mtu->max_speed > USB_SPEED_HIGH))
+		mtu->max_speed = USB_SPEED_HIGH;
+
+	if (mtu->max_speed == USB_SPEED_FULL) {
+		/* disable U3 SS function */
+		mtu3_clrbits(mbase, U3D_USB3_CONFIG, USB3_EN);
+		/* disable HS function */
+		mtu3_clrbits(mbase, U3D_POWER_MANAGEMENT, HS_ENABLE);
+	} else if (mtu->max_speed == USB_SPEED_HIGH) {
+		mtu3_clrbits(mbase, U3D_USB3_CONFIG, USB3_EN);
+		/* HS/FS detected by HW */
+		mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, HS_ENABLE);
+	}
+	dev_info(mtu->dev, "max_speed: %s\n",
+		usb_speed_string(mtu->max_speed));
+}
+
+static void mtu3_regs_init(struct mtu3 *mtu)
+{
+
+	void __iomem *mbase = mtu->mac_base;
+
+	/* be sure interrupts are disabled before registration of ISR */
+	mtu3_intr_disable(mtu);
+	mtu3_intr_status_clear(mtu);
+
+	if (mtu->is_u3_ip) {
+		/* disable LGO_U1/U2 by default */
+		mtu3_clrbits(mbase, U3D_LINK_POWER_CONTROL,
+				SW_U1_ACCEPT_ENABLE | SW_U2_ACCEPT_ENABLE |
+				SW_U1_REQUEST_ENABLE | SW_U2_REQUEST_ENABLE);
+		/* device responses to u3_exit from host automatically */
+		mtu3_clrbits(mbase, U3D_LTSSM_CTRL, SOFT_U3_EXIT_EN);
+	}
+
+	mtu3_set_speed(mtu);
+
+	/* delay about 0.1us from detecting reset to send chirp-K */
+	mtu3_clrbits(mbase, U3D_LINK_RESET_INFO, WTCHRP_MSK);
+
+	/* U2/U3 detected by HW */
+	mtu3_writel(mbase, U3D_DEVICE_CONF, 0);
+
+	/* enable QMU 16B checksum */
+	mtu3_setbits(mbase, U3D_QCR0, QMU_CS16B_EN);
+
+	/* vbus detected by HW */
+	mtu3_clrbits(mbase, U3D_MISC_CTRL, VBUS_FRC_EN | VBUS_ON);
+}
+
+static irqreturn_t mtu3_link_isr(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+	enum usb_device_speed udev_speed;
+	u32 maxpkt = 64;
+	u32 link;
+	u32 speed;
+
+	link = mtu3_readl(mbase, U3D_DEV_LINK_INTR);
+	link &= mtu3_readl(mbase, U3D_DEV_LINK_INTR_ENABLE);
+	mtu3_writel(mbase, U3D_DEV_LINK_INTR, link); /* W1C */
+	dev_dbg(mtu->dev, "=== LINK[%x] ===\n", link);
+
+	if (!(link & SSUSB_DEV_SPEED_CHG_INTR))
+		return IRQ_NONE;
+
+	speed = SSUSB_DEV_SPEED(mtu3_readl(mbase, U3D_DEVICE_CONF));
+
+	switch (speed) {
+	case MTU3_SPEED_FULL:
+		udev_speed = USB_SPEED_FULL;
+		/*BESLCK = 4 < BESLCK_U3 = 10 < BESLDCK = 15 */
+		mtu3_writel(mbase, U3D_USB20_LPM_PARAMETER, LPM_BESLDCK(0xf)
+				| LPM_BESLCK(4) | LPM_BESLCK_U3(0xa));
+		mtu3_setbits(mbase, U3D_POWER_MANAGEMENT,
+				LPM_BESL_STALL | LPM_BESLD_STALL);
+		break;
+	case MTU3_SPEED_HIGH:
+		udev_speed = USB_SPEED_HIGH;
+		/*BESLCK = 4 < BESLCK_U3 = 10 < BESLDCK = 15 */
+		mtu3_writel(mbase, U3D_USB20_LPM_PARAMETER, LPM_BESLDCK(0xf)
+				| LPM_BESLCK(4) | LPM_BESLCK_U3(0xa));
+		mtu3_setbits(mbase, U3D_POWER_MANAGEMENT,
+				LPM_BESL_STALL | LPM_BESLD_STALL);
+		break;
+	case MTU3_SPEED_SUPER:
+		udev_speed = USB_SPEED_SUPER;
+		maxpkt = 512;
+		break;
+	default:
+		udev_speed = USB_SPEED_UNKNOWN;
+		break;
+	}
+	dev_dbg(mtu->dev, "%s: %s\n", __func__, usb_speed_string(udev_speed));
+
+	mtu->g.speed = udev_speed;
+	mtu->g.ep0->maxpacket = maxpkt;
+	mtu->ep0_state = MU3D_EP0_STATE_SETUP;
+
+	if (udev_speed == USB_SPEED_UNKNOWN)
+		mtu3_gadget_disconnect(mtu);
+	else
+		mtu3_ep0_setup(mtu);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mtu3_u3_ltssm_isr(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+	u32 ltssm;
+
+	ltssm = mtu3_readl(mbase, U3D_LTSSM_INTR);
+	ltssm &= mtu3_readl(mbase, U3D_LTSSM_INTR_ENABLE);
+	mtu3_writel(mbase, U3D_LTSSM_INTR, ltssm); /* W1C */
+	dev_dbg(mtu->dev, "=== LTSSM[%x] ===\n", ltssm);
+
+	if (ltssm & HOT_RST_INTR)
+		mtu3_gadget_reset(mtu);
+
+	if (ltssm & WARM_RST_INTR)
+		mtu3_gadget_reset(mtu);
+
+	if (ltssm & VBUS_FALL_INTR)
+		mtu3_ss_func_set(mtu, false);
+
+	if (ltssm & VBUS_RISE_INTR)
+		mtu3_ss_func_set(mtu, true);
+
+	if (ltssm & EXIT_U3_INTR)
+		mtu3_gadget_resume(mtu);
+
+	if (ltssm & ENTER_U3_INTR)
+		mtu3_gadget_suspend(mtu);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+	u32 u2comm;
+
+	u2comm = mtu3_readl(mbase, U3D_COMMON_USB_INTR);
+	u2comm &= mtu3_readl(mbase, U3D_COMMON_USB_INTR_ENABLE);
+	mtu3_writel(mbase, U3D_COMMON_USB_INTR, u2comm); /* W1C */
+	dev_dbg(mtu->dev, "=== U2COMM[%x] ===\n", u2comm);
+
+	if (u2comm & SUSPEND_INTR)
+		mtu3_gadget_suspend(mtu);
+
+	if (u2comm & RESUME_INTR)
+		mtu3_gadget_resume(mtu);
+
+	if (u2comm & RESET_INTR)
+		mtu3_gadget_reset(mtu);
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t mtu3_irq(int irq, void *data)
+{
+	struct mtu3 *mtu = (struct mtu3 *)data;
+	unsigned long flags;
+	u32 level1;
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	/* U3D_LV1ISR is RU */
+	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
+	level1 &= mtu3_readl(mtu->mac_base, U3D_LV1IER);
+
+	if (level1 & EP_CTRL_INTR)
+		mtu3_link_isr(mtu);
+
+	if (level1 & MAC2_INTR)
+		mtu3_u2_common_isr(mtu);
+
+	if (level1 & MAC3_INTR)
+		mtu3_u3_ltssm_isr(mtu);
+
+	if (level1 & BMU_INTR)
+		mtu3_ep0_isr(mtu);
+
+	if (level1 & QMU_INTR)
+		mtu3_qmu_isr(mtu);
+
+	spin_unlock_irqrestore(&mtu->lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+static int mtu3_hw_init(struct mtu3 *mtu)
+{
+	int ret;
+
+	mtu3_device_reset(mtu);
+
+	ret = mtu3_device_enable(mtu);
+	if (ret) {
+		dev_err(mtu->dev, "device enable failed %d\n", ret);
+		return ret;
+	}
+
+	ret = mtu3_mem_alloc(mtu);
+	if (ret) {
+		dev_err(mtu->dev, "mem alloc failed, aborting\n");
+		return -ENOMEM;
+	}
+
+	mtu3_regs_init(mtu);
+
+	return 0;
+}
+
+static void mtu3_hw_exit(struct mtu3 *mtu)
+{
+	mtu3_device_disable(mtu);
+	mtu3_mem_free(mtu);
+}
+
+/*-------------------------------------------------------------------------*/
+
+int ssusb_gadget_init(struct ssusb_mtk *ssusb)
+{
+	struct device *dev = ssusb->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct mtu3 *mtu = NULL;
+	struct resource *res;
+	int ret = -ENOMEM;
+
+	mtu = devm_kzalloc(dev, sizeof(struct mtu3), GFP_KERNEL);
+	if (mtu == NULL)
+		return -ENOMEM;
+
+	mtu->irq = platform_get_irq(pdev, 0);
+	if (mtu->irq <= 0) {
+		dev_err(dev, "fail to get irq number\n");
+		return -ENODEV;
+	}
+	dev_info(dev, "irq %d\n", mtu->irq);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mac");
+	mtu->mac_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(mtu->mac_base)) {
+		dev_err(dev, "error mapping memory for dev mac\n");
+		return PTR_ERR(mtu->mac_base);
+	}
+
+	spin_lock_init(&mtu->lock);
+	mtu->dev = dev;
+	mtu->ippc_base = ssusb->ippc_base;
+	ssusb->mac_base	= mtu->mac_base;
+	ssusb->u3d = mtu;
+	mtu->ssusb = ssusb;
+	mtu->max_speed = usb_get_maximum_speed(dev);
+
+	/* check the max_speed parameter */
+	switch (mtu->max_speed) {
+	case USB_SPEED_FULL:
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+		break;
+	default:
+		dev_err(dev, "invalid max_speed: %s\n",
+			usb_speed_string(mtu->max_speed));
+		/* fall through */
+	case USB_SPEED_UNKNOWN:
+		/* default as SS */
+		mtu->max_speed = USB_SPEED_SUPER;
+		break;
+	}
+
+	dev_dbg(dev, "mac_base=0x%p, ippc_base=0x%p\n",
+		mtu->mac_base, mtu->ippc_base);
+
+	ret = mtu3_hw_init(mtu);
+	if (ret) {
+		dev_err(dev, "mtu3 hw init failed:%d\n", ret);
+		return ret;
+	}
+
+	ret = devm_request_irq(dev, mtu->irq, mtu3_irq, 0, dev_name(dev), mtu);
+	if (ret) {
+		dev_err(dev, "request irq %d failed!\n", mtu->irq);
+		goto irq_err;
+	}
+
+	device_init_wakeup(dev, true);
+
+	ret = mtu3_gadget_setup(mtu);
+	if (ret) {
+		dev_err(dev, "mtu3 gadget init failed:%d\n", ret);
+		goto gadget_err;
+	}
+
+	/* init as host mode, power down device IP for power saving */
+	if (mtu->ssusb->dr_mode == USB_DR_MODE_OTG)
+		mtu3_stop(mtu);
+
+	dev_dbg(dev, " %s() done...\n", __func__);
+
+	return 0;
+
+gadget_err:
+	device_init_wakeup(dev, false);
+
+irq_err:
+	mtu3_hw_exit(mtu);
+	ssusb->u3d = NULL;
+	dev_err(dev, " %s() fail...\n", __func__);
+
+	return ret;
+}
+
+void ssusb_gadget_exit(struct ssusb_mtk *ssusb)
+{
+	struct mtu3 *mtu = ssusb->u3d;
+
+	mtu3_gadget_cleanup(mtu);
+	device_init_wakeup(ssusb->dev, false);
+	mtu3_hw_exit(mtu);
+}
diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
new file mode 100644
index 0000000..bb39723
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -0,0 +1,375 @@
+/*
+ * mtu3_dr.c - dual role switch and host glue layer
+ *
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/debugfs.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/seq_file.h>
+#include <linux/uaccess.h>
+
+#include "mtu3.h"
+#include "mtu3_dr.h"
+
+#define USB2_PORT 2
+#define USB3_PORT 3
+
+enum mtu3_vbus_id_state {
+	MTU3_ID_FLOAT = 1,
+	MTU3_ID_GROUND,
+	MTU3_VBUS_OFF,
+	MTU3_VBUS_VALID,
+};
+
+static void toggle_opstate(struct ssusb_mtk *ssusb)
+{
+	if (!ssusb->otg_switch.is_u3_drd) {
+		mtu3_setbits(ssusb->mac_base, U3D_DEVICE_CONTROL, DC_SESSION);
+		mtu3_setbits(ssusb->mac_base, U3D_POWER_MANAGEMENT, SOFT_CONN);
+	}
+}
+
+/* only port0 supports dual-role mode */
+static int ssusb_port0_switch(struct ssusb_mtk *ssusb,
+	int version, bool tohost)
+{
+	void __iomem *ibase = ssusb->ippc_base;
+	u32 temp;
+
+	dev_dbg(ssusb->dev, "%s (switch u%d port0 to %s)\n", __func__,
+		version, tohost ? "host" : "device");
+
+	if (version == USB2_PORT) {
+		/* 1. power off and disable u2 port0 */
+		temp = mtu3_readl(ibase, SSUSB_U2_CTRL(0));
+		temp |= SSUSB_U2_PORT_PDN | SSUSB_U2_PORT_DIS;
+		mtu3_writel(ibase, SSUSB_U2_CTRL(0), temp);
+
+		/* 2. power on, enable u2 port0 and select its mode */
+		temp = mtu3_readl(ibase, SSUSB_U2_CTRL(0));
+		temp &= ~(SSUSB_U2_PORT_PDN | SSUSB_U2_PORT_DIS);
+		temp = tohost ? (temp | SSUSB_U2_PORT_HOST_SEL) :
+			(temp & (~SSUSB_U2_PORT_HOST_SEL));
+		mtu3_writel(ibase, SSUSB_U2_CTRL(0), temp);
+	} else {
+		/* 1. power off and disable u3 port0 */
+		temp = mtu3_readl(ibase, SSUSB_U3_CTRL(0));
+		temp |= SSUSB_U3_PORT_PDN | SSUSB_U3_PORT_DIS;
+		mtu3_writel(ibase, SSUSB_U3_CTRL(0), temp);
+
+		/* 2. power on, enable u3 port0 and select its mode */
+		temp = mtu3_readl(ibase, SSUSB_U3_CTRL(0));
+		temp &= ~(SSUSB_U3_PORT_PDN | SSUSB_U3_PORT_DIS);
+		temp = tohost ? (temp | SSUSB_U3_PORT_HOST_SEL) :
+			(temp & (~SSUSB_U3_PORT_HOST_SEL));
+		mtu3_writel(ibase, SSUSB_U3_CTRL(0), temp);
+	}
+
+	return 0;
+}
+
+static void switch_port_to_host(struct ssusb_mtk *ssusb)
+{
+	u32 check_clk = 0;
+
+	dev_dbg(ssusb->dev, "%s\n", __func__);
+
+	ssusb_port0_switch(ssusb, USB2_PORT, true);
+
+	if (ssusb->otg_switch.is_u3_drd) {
+		ssusb_port0_switch(ssusb, USB3_PORT, true);
+		check_clk = SSUSB_U3_MAC_RST_B_STS;
+	}
+
+	ssusb_check_clocks(ssusb, check_clk);
+
+	/* after all clocks are stable */
+	toggle_opstate(ssusb);
+}
+
+static void switch_port_to_device(struct ssusb_mtk *ssusb)
+{
+	u32 check_clk = 0;
+
+	dev_dbg(ssusb->dev, "%s\n", __func__);
+
+	ssusb_port0_switch(ssusb, USB2_PORT, false);
+
+	if (ssusb->otg_switch.is_u3_drd) {
+		ssusb_port0_switch(ssusb, USB3_PORT, false);
+		check_clk = SSUSB_U3_MAC_RST_B_STS;
+	}
+
+	ssusb_check_clocks(ssusb, check_clk);
+}
+
+int ssusb_set_vbus(struct otg_switch_mtk *otg_sx, int is_on)
+{
+	struct ssusb_mtk *ssusb =
+		container_of(otg_sx, struct ssusb_mtk, otg_switch);
+	struct regulator *vbus = otg_sx->vbus;
+	int ret;
+
+	/* vbus is optional */
+	if (!vbus)
+		return 0;
+
+	dev_dbg(ssusb->dev, "%s: turn %s\n", __func__, is_on ? "on" : "off");
+
+	if (is_on) {
+		ret = regulator_enable(vbus);
+		if (ret) {
+			dev_err(ssusb->dev, "vbus regulator enable failed\n");
+			return ret;
+		}
+	} else {
+		regulator_disable(vbus);
+	}
+
+	return 0;
+}
+
+/*
+ * switch to host: -> MTU3_VBUS_OFF --> MTU3_ID_GROUND
+ * switch to device: -> MTU3_ID_FLOAT --> MTU3_VBUS_VALID
+ */
+static void ssusb_set_mailbox(struct otg_switch_mtk *otg_sx,
+	enum mtu3_vbus_id_state status)
+{
+	struct ssusb_mtk *ssusb =
+		container_of(otg_sx, struct ssusb_mtk, otg_switch);
+	struct mtu3 *mtu = ssusb->u3d;
+
+	dev_dbg(ssusb->dev, "mailbox state(%d)\n", status);
+
+	switch (status) {
+	case MTU3_ID_GROUND:
+		switch_port_to_host(ssusb);
+		ssusb_set_vbus(otg_sx, 1);
+		ssusb->is_host = true;
+		break;
+	case MTU3_ID_FLOAT:
+		ssusb->is_host = false;
+		ssusb_set_vbus(otg_sx, 0);
+		switch_port_to_device(ssusb);
+		break;
+	case MTU3_VBUS_OFF:
+		mtu3_stop(mtu);
+		pm_relax(ssusb->dev);
+		break;
+	case MTU3_VBUS_VALID:
+		/* avoid suspend when works as device */
+		pm_stay_awake(ssusb->dev);
+		mtu3_start(mtu);
+		break;
+	default:
+		dev_err(ssusb->dev, "invalid state\n");
+	}
+}
+
+static int ssusb_id_notifier(struct notifier_block *nb,
+	unsigned long event, void *ptr)
+{
+	struct otg_switch_mtk *otg_sx =
+		container_of(nb, struct otg_switch_mtk, id_nb);
+
+	if (event)
+		ssusb_set_mailbox(otg_sx, MTU3_ID_GROUND);
+	else
+		ssusb_set_mailbox(otg_sx, MTU3_ID_FLOAT);
+
+	return NOTIFY_DONE;
+}
+
+static int ssusb_vbus_notifier(struct notifier_block *nb,
+	unsigned long event, void *ptr)
+{
+	struct otg_switch_mtk *otg_sx =
+		container_of(nb, struct otg_switch_mtk, vbus_nb);
+
+	if (event)
+		ssusb_set_mailbox(otg_sx, MTU3_VBUS_VALID);
+	else
+		ssusb_set_mailbox(otg_sx, MTU3_VBUS_OFF);
+
+	return NOTIFY_DONE;
+}
+
+static int ssusb_extcon_register(struct otg_switch_mtk *otg_sx)
+{
+	struct ssusb_mtk *ssusb =
+		container_of(otg_sx, struct ssusb_mtk, otg_switch);
+	struct extcon_dev *edev = otg_sx->edev;
+	int ret;
+
+	/* extcon is optional */
+	if (!edev)
+		return 0;
+
+	otg_sx->vbus_nb.notifier_call = ssusb_vbus_notifier;
+	ret = extcon_register_notifier(edev, EXTCON_USB,
+					&otg_sx->vbus_nb);
+	if (ret < 0)
+		dev_err(ssusb->dev, "failed to register notifier for USB\n");
+
+	otg_sx->id_nb.notifier_call = ssusb_id_notifier;
+	ret = extcon_register_notifier(edev, EXTCON_USB_HOST,
+					&otg_sx->id_nb);
+	if (ret < 0)
+		dev_err(ssusb->dev, "failed to register notifier for USB-HOST\n");
+
+	dev_dbg(ssusb->dev, "EXTCON_USB: %d, EXTCON_USB_HOST: %d\n",
+		extcon_get_cable_state_(edev, EXTCON_USB),
+		extcon_get_cable_state_(edev, EXTCON_USB_HOST));
+
+	/* default as host, switch to device mode if needed */
+	if (extcon_get_cable_state_(edev, EXTCON_USB_HOST) == false)
+		ssusb_set_mailbox(otg_sx, MTU3_ID_FLOAT);
+	if (extcon_get_cable_state_(edev, EXTCON_USB) == true)
+		ssusb_set_mailbox(otg_sx, MTU3_VBUS_VALID);
+
+	return 0;
+}
+
+static void extcon_register_dwork(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct otg_switch_mtk *otg_sx =
+	    container_of(dwork, struct otg_switch_mtk, extcon_reg_dwork);
+
+	ssusb_extcon_register(otg_sx);
+}
+
+/*
+ * We provide an interface via debugfs to switch between host and device modes
+ * depending on user input.
+ * This is useful in special cases, such as uses TYPE-A receptacle but also
+ * wants to support dual-role mode.
+ * It generates cable state changes by pulling up/down IDPIN and
+ * notifies driver to switch mode by "extcon-usb-gpio".
+ * NOTE: when use MICRO receptacle, should not enable this interface.
+ */
+static void ssusb_mode_manual_switch(struct ssusb_mtk *ssusb, int to_host)
+{
+	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
+
+	if (to_host)
+		pinctrl_select_state(otg_sx->id_pinctrl, otg_sx->id_ground);
+	else
+		pinctrl_select_state(otg_sx->id_pinctrl, otg_sx->id_float);
+}
+
+
+static int ssusb_mode_show(struct seq_file *sf, void *unused)
+{
+	struct ssusb_mtk *ssusb = sf->private;
+
+	seq_printf(sf, "current mode: %s(%s drd)\n(echo device/host)\n",
+		ssusb->is_host ? "host" : "device",
+		ssusb->otg_switch.manual_drd_enabled ? "manual" : "auto");
+
+	return 0;
+}
+
+static int ssusb_mode_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, ssusb_mode_show, inode->i_private);
+}
+
+static ssize_t ssusb_mode_write(struct file *file,
+	const char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct seq_file *sf = file->private_data;
+	struct ssusb_mtk *ssusb = sf->private;
+	char buf[16];
+
+	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	if (!strncmp(buf, "host", 4) && !ssusb->is_host)
+		ssusb_mode_manual_switch(ssusb, 1);
+	else if (!strncmp(buf, "device", 6) && ssusb->is_host)
+		ssusb_mode_manual_switch(ssusb, 0);
+	else
+		dev_err(ssusb->dev, "wrong or duplicated setting\n");
+
+	return count;
+}
+
+static const struct file_operations ssusb_mode_fops = {
+	.open = ssusb_mode_open,
+	.write = ssusb_mode_write,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void ssusb_debugfs_init(struct ssusb_mtk *ssusb)
+{
+	struct dentry *root;
+	struct dentry *file;
+
+	root = debugfs_create_dir(dev_name(ssusb->dev), usb_debug_root);
+	if (IS_ERR_OR_NULL(root)) {
+		if (!root)
+			dev_err(ssusb->dev, "create debugfs root failed\n");
+		return;
+	}
+	ssusb->dbgfs_root = root;
+
+	file = debugfs_create_file("mode", S_IRUGO | S_IWUSR, root,
+			ssusb, &ssusb_mode_fops);
+	if (!file)
+		dev_dbg(ssusb->dev, "create debugfs mode failed\n");
+}
+
+static void ssusb_debugfs_exit(struct ssusb_mtk *ssusb)
+{
+	debugfs_remove_recursive(ssusb->dbgfs_root);
+}
+
+int ssusb_otg_switch_init(struct ssusb_mtk *ssusb)
+{
+	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
+
+	INIT_DELAYED_WORK(&otg_sx->extcon_reg_dwork, extcon_register_dwork);
+
+	if (otg_sx->manual_drd_enabled)
+		ssusb_debugfs_init(ssusb);
+
+	/* It is enough to delay 1s for waiting for host initialization */
+	schedule_delayed_work(&otg_sx->extcon_reg_dwork, HZ);
+
+	return 0;
+}
+
+void ssusb_otg_switch_exit(struct ssusb_mtk *ssusb)
+{
+	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
+
+	if (otg_sx->edev) {
+		extcon_unregister_notifier(otg_sx->edev,
+			EXTCON_USB, &otg_sx->vbus_nb);
+		extcon_unregister_notifier(otg_sx->edev,
+			EXTCON_USB_HOST, &otg_sx->id_nb);
+	}
+
+	if (otg_sx->manual_drd_enabled)
+		ssusb_debugfs_exit(ssusb);
+}
diff --git a/drivers/usb/mtu3/mtu3_dr.h b/drivers/usb/mtu3/mtu3_dr.h
new file mode 100644
index 0000000..9b228b5
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_dr.h
@@ -0,0 +1,108 @@
+/*
+ * mtu3_dr.h - dual role switch and host glue layer header
+ *
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef _MTU3_DR_H_
+#define _MTU3_DR_H_
+
+#if IS_ENABLED(CONFIG_USB_MTU3_HOST) || IS_ENABLED(CONFIG_USB_MTU3_DUAL_ROLE)
+
+int ssusb_host_init(struct ssusb_mtk *ssusb, struct device_node *parent_dn);
+void ssusb_host_exit(struct ssusb_mtk *ssusb);
+int ssusb_wakeup_of_property_parse(struct ssusb_mtk *ssusb,
+				struct device_node *dn);
+int ssusb_host_enable(struct ssusb_mtk *ssusb);
+int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend);
+int ssusb_wakeup_enable(struct ssusb_mtk *ssusb);
+void ssusb_wakeup_disable(struct ssusb_mtk *ssusb);
+
+#else
+
+static inline int ssusb_host_init(struct ssusb_mtk *ssusb,
+
+	struct device_node *parent_dn)
+{
+	return 0;
+}
+
+static inline void ssusb_host_exit(struct ssusb_mtk *ssusb)
+{}
+
+static inline int ssusb_wakeup_of_property_parse(
+	struct ssusb_mtk *ssusb, struct device_node *dn)
+{
+	return 0;
+}
+
+static inline int ssusb_host_enable(struct ssusb_mtk *ssusb)
+{
+	return 0;
+}
+
+static inline int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend)
+{
+	return 0;
+}
+
+static inline int ssusb_wakeup_enable(struct ssusb_mtk *ssusb)
+{
+	return 0;
+}
+
+static inline void ssusb_wakeup_disable(struct ssusb_mtk *ssusb)
+{}
+
+#endif
+
+
+#if IS_ENABLED(CONFIG_USB_MTU3_GADGET) || IS_ENABLED(CONFIG_USB_MTU3_DUAL_ROLE)
+int ssusb_gadget_init(struct ssusb_mtk *ssusb);
+void ssusb_gadget_exit(struct ssusb_mtk *ssusb);
+#else
+static inline int ssusb_gadget_init(struct ssusb_mtk *ssusb)
+{
+	return 0;
+}
+
+static inline void ssusb_gadget_exit(struct ssusb_mtk *ssusb)
+{}
+#endif
+
+
+#if IS_ENABLED(CONFIG_USB_MTU3_DUAL_ROLE)
+int ssusb_otg_switch_init(struct ssusb_mtk *ssusb);
+void ssusb_otg_switch_exit(struct ssusb_mtk *ssusb);
+int ssusb_set_vbus(struct otg_switch_mtk *otg_sx, int is_on);
+
+#else
+
+static inline int ssusb_otg_switch_init(struct ssusb_mtk *ssusb)
+{
+	return 0;
+}
+
+static inline void ssusb_otg_switch_exit(struct ssusb_mtk *ssusb)
+{}
+
+static inline int ssusb_set_vbus(struct otg_switch_mtk *otg_sx, int is_on)
+{
+	return 0;
+}
+
+#endif
+
+#endif		/* _MTU3_DR_H_ */
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
new file mode 100644
index 0000000..2a255e7
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -0,0 +1,731 @@
+/*
+ * mtu3_gadget.c - MediaTek usb3 DRD peripheral support
+ *
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include "mtu3.h"
+
+void mtu3_req_complete(struct mtu3_ep *mep,
+		     struct usb_request *req, int status)
+__releases(mep->mtu->lock)
+__acquires(mep->mtu->lock)
+{
+	struct mtu3_request *mreq;
+	struct mtu3 *mtu;
+	int busy = mep->busy;
+
+	mreq = to_mtu3_request(req);
+	list_del(&mreq->list);
+	if (mreq->request.status == -EINPROGRESS)
+		mreq->request.status = status;
+
+	mtu = mreq->mtu;
+	mep->busy = 1;
+	spin_unlock(&mtu->lock);
+
+	/* ep0 makes use of PIO, needn't unmap it */
+	if (mep->epnum)
+		usb_gadget_unmap_request(&mtu->g, req, mep->is_in);
+
+	dev_dbg(mtu->dev, "%s complete req: %p, sts %d, %d/%d\n", mep->name,
+		req, req->status, mreq->request.actual, mreq->request.length);
+
+	usb_gadget_giveback_request(&mep->ep, &mreq->request);
+
+	spin_lock(&mtu->lock);
+	mep->busy = busy;
+}
+
+static void nuke(struct mtu3_ep *mep, const int status)
+{
+	struct mtu3_request *mreq = NULL;
+
+	mep->busy = 1;
+	if (list_empty(&mep->req_list))
+		return;
+
+	dev_dbg(mep->mtu->dev, "abort %s's req: sts %d\n", mep->name, status);
+
+	/* exclude EP0 */
+	if (mep->epnum)
+		mtu3_qmu_flush(mep);
+
+	while (!list_empty(&mep->req_list)) {
+		mreq = list_first_entry(&mep->req_list,
+					struct mtu3_request, list);
+		mtu3_req_complete(mep, &mreq->request, status);
+	}
+}
+
+static int mtu3_ep_enable(struct mtu3_ep *mep)
+{
+	const struct usb_endpoint_descriptor *desc;
+	const struct usb_ss_ep_comp_descriptor *comp_desc;
+	struct mtu3 *mtu = mep->mtu;
+	u32 interval = 0;
+	u32 multi = 0;
+	u32 burst = 0;
+	int max_packet;
+	int ret;
+
+	desc = mep->desc;
+	comp_desc = mep->comp_desc;
+	mep->type = usb_endpoint_type(desc);
+	max_packet = usb_endpoint_maxp(desc);
+	mep->maxp = max_packet & GENMASK(10, 0);
+
+	switch (mtu->g.speed) {
+	case USB_SPEED_SUPER:
+		if (usb_endpoint_xfer_int(desc) ||
+				usb_endpoint_xfer_isoc(desc)) {
+			interval = desc->bInterval;
+			interval = clamp_val(interval, 1, 16) - 1;
+			if (usb_endpoint_xfer_isoc(desc) && comp_desc)
+				multi = comp_desc->bmAttributes;
+		}
+		if (comp_desc)
+			burst = comp_desc->bMaxBurst;
+
+		break;
+	case USB_SPEED_HIGH:
+		if (usb_endpoint_xfer_isoc(desc) ||
+				usb_endpoint_xfer_int(desc)) {
+			interval = desc->bInterval;
+			interval = clamp_val(interval, 1, 16) - 1;
+			burst = (max_packet & GENMASK(12, 11)) >> 11;
+		}
+		break;
+	default:
+		break; /*others are ignored */
+	}
+
+	dev_dbg(mtu->dev, "%s maxp:%d, interval:%d, burst:%d, multi:%d\n",
+		__func__, mep->maxp, interval, burst, multi);
+
+	mep->ep.maxpacket = mep->maxp;
+	mep->ep.desc = desc;
+	mep->ep.comp_desc = comp_desc;
+
+	/* slot mainly affects bulk/isoc transfer, so ignore int */
+	mep->slot = usb_endpoint_xfer_int(desc) ? 0 : mtu->slot;
+
+	ret = mtu3_config_ep(mtu, mep, interval, burst, multi);
+	if (ret < 0)
+		return ret;
+
+	ret = mtu3_gpd_ring_alloc(mep);
+	if (ret < 0) {
+		mtu3_deconfig_ep(mtu, mep);
+		return ret;
+	}
+
+	mtu3_qmu_start(mep);
+
+	return 0;
+}
+
+static int mtu3_ep_disable(struct mtu3_ep *mep)
+{
+	struct mtu3 *mtu = mep->mtu;
+
+	mtu3_qmu_stop(mep);
+
+	/* abort all pending requests */
+	nuke(mep, -ESHUTDOWN);
+	mtu3_deconfig_ep(mtu, mep);
+	mtu3_gpd_ring_free(mep);
+
+	mep->desc = NULL;
+	mep->ep.desc = NULL;
+	mep->comp_desc = NULL;
+	mep->type = 0;
+	mep->flags = 0;
+
+	return 0;
+}
+
+static int mtu3_gadget_ep_enable(struct usb_ep *ep,
+		const struct usb_endpoint_descriptor *desc)
+{
+	struct mtu3_ep *mep;
+	struct mtu3 *mtu;
+	unsigned long flags;
+	int ret = -EINVAL;
+
+	if (!ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
+		pr_debug("%s invalid parameters\n", __func__);
+		return -EINVAL;
+	}
+
+	if (!desc->wMaxPacketSize) {
+		pr_debug("%s missing wMaxPacketSize\n", __func__);
+		return -EINVAL;
+	}
+	mep = to_mtu3_ep(ep);
+	mtu = mep->mtu;
+
+	/* check ep number and direction against endpoint */
+	if (usb_endpoint_num(desc) != mep->epnum)
+		return -EINVAL;
+
+	if (!!usb_endpoint_dir_in(desc) ^ !!mep->is_in)
+		return -EINVAL;
+
+	dev_dbg(mtu->dev, "%s %s\n", __func__, ep->name);
+
+	if (mep->flags & MTU3_EP_ENABLED) {
+		dev_WARN_ONCE(mtu->dev, true, "%s is already enabled\n",
+				mep->name);
+		return 0;
+	}
+
+	spin_lock_irqsave(&mtu->lock, flags);
+	mep->desc = desc;
+	mep->comp_desc = ep->comp_desc;
+
+	ret = mtu3_ep_enable(mep);
+	if (ret)
+		goto error;
+
+	mep->busy = 0;
+	mep->wedged = 0;
+	mep->flags |= MTU3_EP_ENABLED;
+	mtu->active_ep++;
+
+error:
+	spin_unlock_irqrestore(&mtu->lock, flags);
+
+	dev_dbg(mtu->dev, "%s active_ep=%d\n", __func__, mtu->active_ep);
+
+	return ret;
+}
+
+static int mtu3_gadget_ep_disable(struct usb_ep *ep)
+{
+	struct mtu3_ep *mep = to_mtu3_ep(ep);
+	struct mtu3 *mtu = mep->mtu;
+	unsigned long flags;
+
+	dev_dbg(mtu->dev, "%s %s\n", __func__, mep->name);
+
+	if (!(mep->flags & MTU3_EP_ENABLED)) {
+		dev_warn(mtu->dev, "%s is already disabled\n", mep->name);
+		return 0;
+	}
+
+	spin_lock_irqsave(&mtu->lock, flags);
+	mtu3_ep_disable(mep);
+	mep->flags &= ~MTU3_EP_ENABLED;
+	mtu->active_ep--;
+	spin_unlock_irqrestore(&(mtu->lock), flags);
+
+	dev_dbg(mtu->dev, "%s active_ep=%d, mtu3 is_active=%d\n",
+		__func__, mtu->active_ep, mtu->is_active);
+
+	return 0;
+}
+
+struct usb_request *mtu3_alloc_request(struct usb_ep *ep, gfp_t gfp_flags)
+{
+	struct mtu3_ep *mep = to_mtu3_ep(ep);
+	struct mtu3_request *mreq;
+
+	mreq = kzalloc(sizeof(*mreq), gfp_flags);
+	if (!mreq)
+		return NULL;
+
+	mreq->request.dma = DMA_ADDR_INVALID;
+	mreq->epnum = mep->epnum;
+	mreq->mep = mep;
+
+	return &mreq->request;
+}
+
+void mtu3_free_request(struct usb_ep *ep, struct usb_request *req)
+{
+	kfree(to_mtu3_request(req));
+}
+
+static int mtu3_gadget_queue(struct usb_ep *ep,
+		struct usb_request *req, gfp_t gfp_flags)
+{
+	struct mtu3_ep *mep;
+	struct mtu3_request *mreq;
+	struct mtu3 *mtu;
+	unsigned long flags;
+	int ret = 0;
+
+	if (!ep || !req)
+		return -EINVAL;
+
+	if (!req->buf)
+		return -ENODATA;
+
+	mep = to_mtu3_ep(ep);
+	mtu = mep->mtu;
+	mreq = to_mtu3_request(req);
+	mreq->mtu = mtu;
+
+	if (mreq->mep != mep)
+		return -EINVAL;
+
+	dev_dbg(mtu->dev, "%s %s EP%d(%s), req=%p, maxp=%d, len#%d\n",
+		__func__, mep->is_in ? "TX" : "RX", mreq->epnum, ep->name,
+		mreq, ep->maxpacket, mreq->request.length);
+
+	if (req->length > GPD_BUF_SIZE) {
+		dev_warn(mtu->dev,
+			"req length > supported MAX:%d requested:%d\n",
+			GPD_BUF_SIZE, req->length);
+		return -EOPNOTSUPP;
+	}
+
+	/* don't queue if the ep is down */
+	if (!mep->desc) {
+		dev_dbg(mtu->dev, "req=%p queued to %s while it's disabled\n",
+			req, ep->name);
+		return -ESHUTDOWN;
+	}
+
+	mreq->request.actual = 0;
+	mreq->request.status = -EINPROGRESS;
+
+	ret = usb_gadget_map_request(&mtu->g, req, mep->is_in);
+	if (ret) {
+		dev_err(mtu->dev, "dma mapping failed\n");
+		return ret;
+	}
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	if (mtu3_prepare_transfer(mep)) {
+		ret = -EAGAIN;
+		goto error;
+	}
+
+	list_add_tail(&mreq->list, &mep->req_list);
+	mtu3_insert_gpd(mep, mreq);
+	mtu3_qmu_resume(mep);
+
+error:
+	spin_unlock_irqrestore(&mtu->lock, flags);
+
+	return ret;
+}
+
+static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
+{
+	struct mtu3_ep *mep = to_mtu3_ep(ep);
+	struct mtu3_request *mreq = to_mtu3_request(req);
+	struct mtu3_request *r;
+	unsigned long flags;
+	int ret = 0;
+	struct mtu3 *mtu = mep->mtu;
+
+	if (!ep || !req || mreq->mep != mep)
+		return -EINVAL;
+
+	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	list_for_each_entry(r, &mep->req_list, list) {
+		if (r == mreq)
+			break;
+	}
+	if (r != mreq) {
+		dev_dbg(mtu->dev, "req=%p not queued to %s\n", req, ep->name);
+		ret = -EINVAL;
+		goto done;
+	}
+
+	mtu3_qmu_flush(mep);  /* REVISIT: set BPS ?? */
+	mtu3_req_complete(mep, req, -ECONNRESET);
+	mtu3_qmu_start(mep);
+
+done:
+	spin_unlock_irqrestore(&mtu->lock, flags);
+
+	return ret;
+}
+
+/*
+ * Set or clear the halt bit of an EP.
+ * A halted EP won't TX/RX any data but will queue requests.
+ */
+static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
+{
+	struct mtu3_ep *mep = to_mtu3_ep(ep);
+	struct mtu3 *mtu = mep->mtu;
+	struct mtu3_request *mreq;
+	unsigned long flags;
+	int ret = 0;
+
+	if (!ep)
+		return -EINVAL;
+
+	dev_dbg(mtu->dev, "%s : %s...", __func__, ep->name);
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	if (mep->type == USB_ENDPOINT_XFER_ISOC) {
+		ret = -EINVAL;
+		goto done;
+	}
+
+	mreq = next_request(mep);
+	if (value) {
+		/*
+		 * If there is not request for TX-EP, QMU will not transfer
+		 * data to TX-FIFO, so no need check whether TX-FIFO
+		 * holds bytes or not here
+		 */
+		if (mreq) {
+			dev_dbg(mtu->dev, "req in progress, cannot halt %s\n",
+				ep->name);
+			ret = -EAGAIN;
+			goto done;
+		}
+	} else {
+		mep->wedged = 0;
+	}
+
+	dev_dbg(mtu->dev, "%s %s stall\n", ep->name, value ? "set" : "clear");
+
+	mtu3_ep_stall_set(mep, value);
+
+done:
+	spin_unlock_irqrestore(&mtu->lock, flags);
+
+	return ret;
+}
+
+/* Sets the halt feature with the clear requests ignored */
+static int mtu3_gadget_ep_set_wedge(struct usb_ep *ep)
+{
+	struct mtu3_ep *mep = to_mtu3_ep(ep);
+
+	if (!ep)
+		return -EINVAL;
+
+	mep->wedged = 1;
+
+	return usb_ep_set_halt(ep);
+}
+
+static const struct usb_ep_ops mtu3_ep_ops = {
+	.enable = mtu3_gadget_ep_enable,
+	.disable = mtu3_gadget_ep_disable,
+	.alloc_request = mtu3_alloc_request,
+	.free_request = mtu3_free_request,
+	.queue = mtu3_gadget_queue,
+	.dequeue = mtu3_gadget_dequeue,
+	.set_halt = mtu3_gadget_ep_set_halt,
+	.set_wedge = mtu3_gadget_ep_set_wedge,
+};
+
+static int mtu3_gadget_get_frame(struct usb_gadget *gadget)
+{
+	struct mtu3 *mtu = gadget_to_mtu3(gadget);
+
+	return (int)mtu3_readl(mtu->mac_base, U3D_USB20_FRAME_NUM);
+}
+
+static int mtu3_gadget_wakeup(struct usb_gadget *gadget)
+{
+	struct mtu3 *mtu = gadget_to_mtu3(gadget);
+	unsigned long flags;
+
+	dev_dbg(mtu->dev, "%s\n", __func__);
+
+	/* remote wakeup feature not enabled by host */
+	if (!mtu->may_wakeup)
+		return  -EOPNOTSUPP;
+
+	spin_lock_irqsave(&mtu->lock, flags);
+	if (mtu->g.speed == USB_SPEED_SUPER) {
+		mtu3_setbits(mtu->mac_base, U3D_LINK_POWER_CONTROL, UX_EXIT);
+	} else {
+		mtu3_setbits(mtu->mac_base, U3D_POWER_MANAGEMENT, RESUME);
+		spin_unlock_irqrestore(&mtu->lock, flags);
+		usleep_range(10000, 11000);
+		spin_lock_irqsave(&mtu->lock, flags);
+		mtu3_clrbits(mtu->mac_base, U3D_POWER_MANAGEMENT, RESUME);
+	}
+	spin_unlock_irqrestore(&mtu->lock, flags);
+	return 0;
+}
+
+static int mtu3_gadget_set_self_powered(struct usb_gadget *gadget,
+		int is_selfpowered)
+{
+	struct mtu3 *mtu = gadget_to_mtu3(gadget);
+
+	mtu->is_self_powered = !!is_selfpowered;
+	return 0;
+}
+
+static int mtu3_gadget_pullup(struct usb_gadget *gadget, int is_on)
+{
+	struct mtu3 *mtu = gadget_to_mtu3(gadget);
+	unsigned long flags;
+
+	dev_dbg(mtu->dev, "%s (%s) for %sactive device\n", __func__,
+		is_on ? "on" : "off", mtu->is_active ? "" : "in");
+
+	/* we'd rather not pullup unless the device is active. */
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	is_on = !!is_on;
+	if (mtu->is_active == 0) {
+		/* save it for mtu3_start() to process the request */
+		mtu->softconnect = is_on;
+	} else if (is_on != mtu->softconnect) {
+		mtu->softconnect = is_on;
+		mtu3_dev_on_off(mtu, is_on);
+	}
+
+	spin_unlock_irqrestore(&mtu->lock, flags);
+
+	return 0;
+}
+
+static int mtu3_gadget_start(struct usb_gadget *gadget,
+		struct usb_gadget_driver *driver)
+{
+	struct mtu3 *mtu = gadget_to_mtu3(gadget);
+	unsigned long flags;
+
+	if (mtu->gadget_driver) {
+		dev_err(mtu->dev, "%s is already bound to %s\n",
+			mtu->g.name, mtu->gadget_driver->driver.name);
+		return -EBUSY;
+	}
+
+	dev_dbg(mtu->dev, "bind driver %s\n", driver->function);
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	mtu->softconnect = 0;
+	mtu->gadget_driver = driver;
+
+	if (mtu->ssusb->dr_mode == USB_DR_MODE_PERIPHERAL)
+		mtu3_start(mtu);
+
+	spin_unlock_irqrestore(&mtu->lock, flags);
+
+	return 0;
+}
+
+static void stop_activity(struct mtu3 *mtu)
+{
+	struct usb_gadget_driver *driver = mtu->gadget_driver;
+	int i;
+
+	/* don't disconnect if it's not connected */
+	if (mtu->g.speed == USB_SPEED_UNKNOWN)
+		driver = NULL;
+	else
+		mtu->g.speed = USB_SPEED_UNKNOWN;
+
+	/* deactivate the hardware */
+	if (mtu->softconnect) {
+		mtu->softconnect = 0;
+		mtu3_dev_on_off(mtu, 0);
+	}
+
+	/*
+	 * killing any outstanding requests will quiesce the driver;
+	 * then report disconnect
+	 */
+	nuke(mtu->ep0, -ESHUTDOWN);
+	for (i = 1; i < mtu->num_eps; i++) {
+		nuke(mtu->in_eps + i, -ESHUTDOWN);
+		nuke(mtu->out_eps + i, -ESHUTDOWN);
+	}
+
+	if (driver) {
+		spin_unlock(&mtu->lock);
+		driver->disconnect(&mtu->g);
+		spin_lock(&mtu->lock);
+	}
+}
+
+static int mtu3_gadget_stop(struct usb_gadget *g)
+{
+	struct mtu3 *mtu = gadget_to_mtu3(g);
+	unsigned long flags;
+
+	dev_dbg(mtu->dev, "%s\n", __func__);
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	stop_activity(mtu);
+	mtu->gadget_driver = NULL;
+
+	if (mtu->ssusb->dr_mode == USB_DR_MODE_PERIPHERAL)
+		mtu3_stop(mtu);
+
+	spin_unlock_irqrestore(&mtu->lock, flags);
+
+	return 0;
+}
+
+static const struct usb_gadget_ops mtu3_gadget_ops = {
+	.get_frame = mtu3_gadget_get_frame,
+	.wakeup = mtu3_gadget_wakeup,
+	.set_selfpowered = mtu3_gadget_set_self_powered,
+	.pullup = mtu3_gadget_pullup,
+	.udc_start = mtu3_gadget_start,
+	.udc_stop = mtu3_gadget_stop,
+};
+
+static void init_hw_ep(struct mtu3 *mtu, struct mtu3_ep *mep,
+		u32 epnum, u32 is_in)
+{
+	mep->epnum = epnum;
+	mep->mtu = mtu;
+	mep->is_in = is_in;
+
+	INIT_LIST_HEAD(&mep->req_list);
+
+	sprintf(mep->name, "ep%d%s", epnum,
+		!epnum ? "" : (is_in ? "in" : "out"));
+
+	mep->ep.name = mep->name;
+	INIT_LIST_HEAD(&mep->ep.ep_list);
+
+	/* initialize maxpacket as SS */
+	if (!epnum) {
+		usb_ep_set_maxpacket_limit(&mep->ep, 512);
+		mep->ep.caps.type_control = true;
+		mep->ep.ops = &mtu3_ep0_ops;
+		mtu->g.ep0 = &mep->ep;
+	} else {
+		usb_ep_set_maxpacket_limit(&mep->ep, 1024);
+		mep->ep.caps.type_iso = true;
+		mep->ep.caps.type_bulk = true;
+		mep->ep.caps.type_int = true;
+		mep->ep.ops = &mtu3_ep_ops;
+		list_add_tail(&mep->ep.ep_list, &mtu->g.ep_list);
+	}
+
+	dev_dbg(mtu->dev, "%s, name=%s, maxp=%d\n", __func__, mep->ep.name,
+		 mep->ep.maxpacket);
+
+	if (!epnum) {
+		mep->ep.caps.dir_in = true;
+		mep->ep.caps.dir_out = true;
+	} else if (is_in) {
+		mep->ep.caps.dir_in = true;
+	} else {
+		mep->ep.caps.dir_out = true;
+	}
+}
+
+static void mtu3_gadget_init_eps(struct mtu3 *mtu)
+{
+	u8 epnum;
+
+	/* initialize endpoint list just once */
+	INIT_LIST_HEAD(&(mtu->g.ep_list));
+
+	dev_dbg(mtu->dev, "%s num_eps(1 for a pair of tx&rx ep)=%d\n",
+		__func__, mtu->num_eps);
+
+	init_hw_ep(mtu, mtu->ep0, 0, 0);
+	for (epnum = 1; epnum < mtu->num_eps; epnum++) {
+		init_hw_ep(mtu, mtu->in_eps + epnum, epnum, 1);
+		init_hw_ep(mtu, mtu->out_eps + epnum, epnum, 0);
+	}
+}
+
+int mtu3_gadget_setup(struct mtu3 *mtu)
+{
+	int ret;
+
+	mtu->g.ops = &mtu3_gadget_ops;
+	mtu->g.max_speed = mtu->max_speed;
+	mtu->g.speed = USB_SPEED_UNKNOWN;
+	mtu->g.sg_supported = 0;
+	mtu->g.name = MTU3_DRIVER_NAME;
+	mtu->is_active = 0;
+
+	mtu3_gadget_init_eps(mtu);
+
+	ret = usb_add_gadget_udc(mtu->dev, &mtu->g);
+	if (ret) {
+		dev_err(mtu->dev, "failed to register udc\n");
+		return ret;
+	}
+
+	usb_gadget_set_state(&mtu->g, USB_STATE_NOTATTACHED);
+
+	return 0;
+}
+
+void mtu3_gadget_cleanup(struct mtu3 *mtu)
+{
+	usb_del_gadget_udc(&mtu->g);
+}
+
+void mtu3_gadget_resume(struct mtu3 *mtu)
+{
+	dev_dbg(mtu->dev, "gadget RESUME\n");
+	if (mtu->gadget_driver && mtu->gadget_driver->resume) {
+		spin_unlock(&mtu->lock);
+		mtu->gadget_driver->resume(&mtu->g);
+		spin_lock(&mtu->lock);
+	}
+}
+
+/* called when SOF packets stop for 3+ msec */
+void mtu3_gadget_suspend(struct mtu3 *mtu)
+{
+	dev_dbg(mtu->dev, "gadget SUSPEND\n");
+	if (mtu->gadget_driver && mtu->gadget_driver->suspend) {
+		spin_unlock(&mtu->lock);
+		mtu->gadget_driver->suspend(&mtu->g);
+		spin_lock(&mtu->lock);
+	}
+}
+
+/* called when VBUS drops below session threshold, and in other cases */
+void mtu3_gadget_disconnect(struct mtu3 *mtu)
+{
+	dev_dbg(mtu->dev, "gadget DISCONNECT\n");
+	if (mtu->gadget_driver && mtu->gadget_driver->disconnect) {
+		spin_unlock(&mtu->lock);
+		mtu->gadget_driver->disconnect(&mtu->g);
+		spin_lock(&mtu->lock);
+	}
+
+	usb_gadget_set_state(&mtu->g, USB_STATE_NOTATTACHED);
+}
+
+void mtu3_gadget_reset(struct mtu3 *mtu)
+{
+	dev_dbg(mtu->dev, "HS RESET\n");
+
+	/* report disconnect, if we didn't flush EP state */
+	if (mtu->g.speed != USB_SPEED_UNKNOWN)
+		mtu3_gadget_disconnect(mtu);
+
+	mtu->address = 0;
+	mtu->ep0_state = MU3D_EP0_STATE_SETUP;
+	mtu->may_wakeup = 0;
+}
+
diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
new file mode 100644
index 0000000..14bff37
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -0,0 +1,879 @@
+/*
+ * mtu3_gadget_ep0.c - MediaTek USB3 DRD peripheral driver ep0 handling
+ *
+ * Copyright (c) 2016 MediaTek Inc.
+ *
+ * Author:  Chunfeng.Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include "mtu3.h"
+
+/* ep0 is always mtu3->in_eps[0] */
+#define	next_ep0_request(mtu)	next_request((mtu)->ep0)
+
+/* for high speed test mode; see USB 2.0 spec 7.1.20 */
+static const u8 mtu3_test_packet[53] = {
+	/* implicit SYNC then DATA0 to start */
+
+	/* JKJKJKJK x9 */
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	/* JJKKJJKK x8 */
+	0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+	/* JJJJKKKK x8 */
+	0xee, 0xee, 0xee, 0xee, 0xee, 0xee, 0xee, 0xee,
+	/* JJJJJJJKKKKKKK x8 */
+	0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+	/* JJJJJJJK x8 */
+	0x7f, 0xbf, 0xdf, 0xef, 0xf7, 0xfb, 0xfd,
+	/* JKKKKKKK x10, JK */
+	0xfc, 0x7e, 0xbf, 0xdf, 0xef, 0xf7, 0xfb, 0xfd, 0x7e,
+	/* implicit CRC16 then EOP to end */
+};
+
+static char *decode_ep0_state(struct mtu3 *mtu)
+{
+	switch (mtu->ep0_state) {
+	case MU3D_EP0_STATE_SETUP:
+		return "SETUP";
+	case MU3D_EP0_STATE_TX:
+		return "IN";
+	case MU3D_EP0_STATE_RX:
+		return "OUT";
+	case MU3D_EP0_STATE_TX_END:
+		return "TX-END";
+	case MU3D_EP0_STATE_STALL:
+		return "STALL";
+	default:
+		return "??";
+	}
+}
+
+static void ep0_req_giveback(struct mtu3 *mtu, struct usb_request *req)
+{
+	mtu3_req_complete(mtu->ep0, req, 0);
+}
+
+static int
+forward_to_driver(struct mtu3 *mtu, const struct usb_ctrlrequest *setup)
+__releases(mtu->lock)
+__acquires(mtu->lock)
+{
+	int ret;
+
+	if (!mtu->gadget_driver)
+		return -EOPNOTSUPP;
+
+	spin_unlock(&mtu->lock);
+	ret = mtu->gadget_driver->setup(&mtu->g, setup);
+	spin_lock(&mtu->lock);
+
+	dev_dbg(mtu->dev, "%s ret %d\n", __func__, ret);
+	return ret;
+}
+
+static void ep0_write_fifo(struct mtu3_ep *mep, const u8 *src, u16 len)
+{
+	void __iomem *fifo = mep->mtu->mac_base + U3D_FIFO0;
+	u16 index = 0;
+
+	dev_dbg(mep->mtu->dev, "%s: ep%din, len=%d, buf=%p\n",
+		__func__, mep->epnum, len, src);
+
+	if (len >= 4) {
+		iowrite32_rep(fifo, src, len >> 2);
+		index = len & ~0x03;
+	}
+	if (len & 0x02) {
+		writew(*(u16 *)&src[index], fifo);
+		index += 2;
+	}
+	if (len & 0x01)
+		writeb(src[index], fifo);
+}
+
+static void ep0_read_fifo(struct mtu3_ep *mep, u8 *dst, u16 len)
+{
+	void __iomem *fifo = mep->mtu->mac_base + U3D_FIFO0;
+	u32 temp;
+	u16 index = 0;
+
+	dev_dbg(mep->mtu->dev, "%s: ep%dout len=%d buf=%p\n",
+		 __func__, mep->epnum, len, dst);
+
+	if (len >= 4) {
+		ioread32_rep(fifo, dst, len >> 2);
+		index = len & ~0x03;
+	}
+	if (len & 0x3) {
+		temp = readl(fifo);
+		memcpy(&dst[index], &temp, len & 0x3);
+	}
+
+}
+
+static void ep0_load_test_packet(struct mtu3 *mtu)
+{
+	/*
+	 * because the length of test packet is less than max packet of HS ep0,
+	 * write it into fifo directly.
+	 */
+	ep0_write_fifo(mtu->ep0, mtu3_test_packet, sizeof(mtu3_test_packet));
+}
+
+/*
+ * A. send STALL for setup transfer without data stage:
+ *		set SENDSTALL and SETUPPKTRDY at the same time;
+ * B. send STALL for other cases:
+ *		set SENDSTALL only.
+ */
+static void ep0_stall_set(struct mtu3_ep *mep0, bool set, u32 pktrdy)
+{
+	struct mtu3 *mtu = mep0->mtu;
+	void __iomem *mbase = mtu->mac_base;
+	u32 csr;
+
+	/* EP0_SENTSTALL is W1C */
+	csr = mtu3_readl(mbase, U3D_EP0CSR) & EP0_W1C_BITS;
+	if (set)
+		csr |= EP0_SENDSTALL | pktrdy;
+	else
+		csr = (csr & ~EP0_SENDSTALL) | EP0_SENTSTALL;
+	mtu3_writel(mtu->mac_base, U3D_EP0CSR, csr);
+
+	mtu->ep0_state = MU3D_EP0_STATE_SETUP;
+
+	dev_dbg(mtu->dev, "ep0: %s STALL, ep0_state: %s\n",
+		set ? "SEND" : "CLEAR", decode_ep0_state(mtu));
+}
+
+static int ep0_queue(struct mtu3_ep *mep0, struct mtu3_request *mreq);
+
+static void ep0_dummy_complete(struct usb_ep *ep, struct usb_request *req)
+{}
+
+static void ep0_set_sel_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct mtu3_request *mreq;
+	struct mtu3 *mtu;
+	struct usb_set_sel_req sel;
+
+	memcpy(&sel, req->buf, sizeof(sel));
+
+	mreq = to_mtu3_request(req);
+	mtu = mreq->mtu;
+	dev_dbg(mtu->dev, "u1sel:%d, u1pel:%d, u2sel:%d, u2pel:%d\n",
+		sel.u1_sel, sel.u1_pel, sel.u2_sel, sel.u2_pel);
+}
+
+/* queue data stage to handle 6 byte SET_SEL request */
+static int ep0_set_sel(struct mtu3 *mtu, struct usb_ctrlrequest *setup)
+{
+	int ret;
+
+	if (unlikely(setup->wLength != 6)) {
+		dev_err(mtu->dev, "%s wrong wLength:%d\n",
+			__func__, setup->wLength);
+		return -EINVAL;
+	}
+
+	mtu->ep0_req.mep = mtu->ep0;
+	mtu->ep0_req.request.length = 6;
+	mtu->ep0_req.request.buf = mtu->setup_buf;
+	mtu->ep0_req.request.complete = ep0_set_sel_complete;
+	ret = ep0_queue(mtu->ep0, &mtu->ep0_req);
+
+	return ret < 0 ? ret : 1;
+}
+
+static int
+ep0_get_status(struct mtu3 *mtu, const struct usb_ctrlrequest *setup)
+{
+	struct mtu3_ep *mep = NULL;
+	int handled = 1;
+	u8 result[2] = {0, 0};
+	u8 epnum = 0;
+	int is_in;
+
+	switch (setup->bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		result[0] = mtu->is_self_powered << USB_DEVICE_SELF_POWERED;
+		result[0] |= mtu->may_wakeup << USB_DEVICE_REMOTE_WAKEUP;
+		/* superspeed only */
+		if (mtu->g.speed == USB_SPEED_SUPER) {
+			result[0] |= mtu->u1_enable << USB_DEV_STAT_U1_ENABLED;
+			result[0] |= mtu->u2_enable << USB_DEV_STAT_U2_ENABLED;
+		}
+
+		dev_dbg(mtu->dev, "%s result=%x, U1=%x, U2=%x\n", __func__,
+			result[0], mtu->u1_enable, mtu->u2_enable);
+
+		break;
+	case USB_RECIP_INTERFACE:
+		break;
+	case USB_RECIP_ENDPOINT:
+		epnum = (u8) setup->wIndex;
+		is_in = epnum & USB_DIR_IN;
+		epnum &= USB_ENDPOINT_NUMBER_MASK;
+
+		if (epnum >= mtu->num_eps) {
+			handled = -EINVAL;
+			break;
+		}
+		if (!epnum)
+			break;
+
+		mep = (is_in ? mtu->in_eps : mtu->out_eps) + epnum;
+		if (!mep->desc) {
+			handled = -EINVAL;
+			break;
+		}
+
+		if (mep->flags & MTU3_EP_STALL)
+			result[0] |= 1 << USB_ENDPOINT_HALT;
+
+		break;
+	default:
+		/* class, vendor, etc ... delegate */
+		handled = 0;
+		break;
+	}
+
+	if (handled > 0) {
+		int ret;
+
+		/* prepare a data stage for GET_STATUS */
+		dev_dbg(mtu->dev, "get_status=%x\n", *(u16 *)result);
+		memcpy(mtu->setup_buf, result, sizeof(result));
+		mtu->ep0_req.mep = mtu->ep0;
+		mtu->ep0_req.request.length = 2;
+		mtu->ep0_req.request.buf = &mtu->setup_buf;
+		mtu->ep0_req.request.complete = ep0_dummy_complete;
+		ret = ep0_queue(mtu->ep0, &mtu->ep0_req);
+		if (ret < 0)
+			handled = ret;
+	}
+	return handled;
+}
+
+static int handle_test_mode(struct mtu3 *mtu, struct usb_ctrlrequest *setup)
+{
+	void __iomem *mbase = mtu->mac_base;
+	int handled = 1;
+
+	switch (setup->wIndex >> 8) {
+	case TEST_J:
+		dev_dbg(mtu->dev, "TEST_J\n");
+		mtu->test_mode_nr = TEST_J_MODE;
+		break;
+	case TEST_K:
+		dev_dbg(mtu->dev, "TEST_K\n");
+		mtu->test_mode_nr = TEST_K_MODE;
+		break;
+	case TEST_SE0_NAK:
+		dev_dbg(mtu->dev, "TEST_SE0_NAK\n");
+		mtu->test_mode_nr = TEST_SE0_NAK_MODE;
+		break;
+	case TEST_PACKET:
+		dev_dbg(mtu->dev, "TEST_PACKET\n");
+		mtu->test_mode_nr = TEST_PACKET_MODE;
+		break;
+	default:
+		handled = -EINVAL;
+		goto out;
+	}
+
+	mtu->test_mode = true;
+
+	/* no TX completion interrupt, and need restart platform after test */
+	if (mtu->test_mode_nr == TEST_PACKET_MODE)
+		ep0_load_test_packet(mtu);
+
+	mtu3_writel(mbase, U3D_USB2_TEST_MODE, mtu->test_mode_nr);
+
+	mtu->ep0_state = MU3D_EP0_STATE_SETUP;
+
+out:
+	return handled;
+}
+
+static int ep0_handle_feature_dev(struct mtu3 *mtu,
+		struct usb_ctrlrequest *setup, bool set)
+{
+	void __iomem *mbase = mtu->mac_base;
+	int handled = -EINVAL;
+	u32 lpc;
+
+	switch (setup->wValue) {
+	case USB_DEVICE_REMOTE_WAKEUP:
+		mtu->may_wakeup = !!set;
+		handled = 1;
+		break;
+	case USB_DEVICE_TEST_MODE:
+		if (!set || (mtu->g.speed != USB_SPEED_HIGH) ||
+			(setup->wIndex & 0xff))
+			break;
+
+		handled = handle_test_mode(mtu, setup);
+		break;
+	case USB_DEVICE_U1_ENABLE:
+		if (mtu->g.speed != USB_SPEED_SUPER ||
+			mtu->g.state != USB_STATE_CONFIGURED)
+			break;
+
+		lpc = mtu3_readl(mbase, U3D_LINK_POWER_CONTROL);
+		if (set)
+			lpc |= SW_U1_ACCEPT_ENABLE;
+		else
+			lpc &= ~SW_U1_ACCEPT_ENABLE;
+		mtu3_writel(mbase, U3D_LINK_POWER_CONTROL, lpc);
+
+		mtu->u1_enable = !!set;
+		handled = 1;
+		break;
+	case USB_DEVICE_U2_ENABLE:
+		if (mtu->g.speed != USB_SPEED_SUPER ||
+			mtu->g.state != USB_STATE_CONFIGURED)
+			break;
+
+		lpc = mtu3_readl(mbase, U3D_LINK_POWER_CONTROL);
+		if (set)
+			lpc |= SW_U2_ACCEPT_ENABLE;
+		else
+			lpc &= ~SW_U2_ACCEPT_ENABLE;
+		mtu3_writel(mbase, U3D_LINK_POWER_CONTROL, lpc);
+
+		mtu->u2_enable = !!set;
+		handled = 1;
+		break;
+	default:
+		handled = -EINVAL;
+		break;
+	}
+	return handled;
+}
+
+static int ep0_handle_feature(struct mtu3 *mtu,
+		struct usb_ctrlrequest *setup, bool set)
+{
+	struct mtu3_ep *mep;
+	int handled = -EINVAL;
+	int is_in;
+	u8 epnum;
+
+	switch (setup->bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		handled = ep0_handle_feature_dev(mtu, setup, set);
+		break;
+	case USB_RECIP_INTERFACE:
+		/* superspeed only */
+		if ((setup->wValue == USB_INTRF_FUNC_SUSPEND)
+			&& (mtu->g.speed == USB_SPEED_SUPER)) {
+			/*
+			 * forward the request because function drivers
+			 * should handle it
+			 */
+			handled = 0;
+		}
+		break;
+	case USB_RECIP_ENDPOINT:
+		epnum = setup->wIndex & USB_ENDPOINT_NUMBER_MASK;
+		if (epnum == 0 || epnum >= mtu->num_eps ||
+			setup->wValue != USB_ENDPOINT_HALT)
+			break;
+
+		is_in = setup->wIndex & USB_DIR_IN;
+		mep = (is_in ? mtu->in_eps : mtu->out_eps) + epnum;
+		if (!mep->desc)
+			break;
+
+		handled = 1;
+		/* ignore request if endpoint is wedged */
+		if (mep->wedged)
+			break;
+
+		mtu3_ep_stall_set(mep, set);
+		break;
+	default:
+		/* class, vendor, etc ... delegate */
+		handled = 0;
+		break;
+	}
+	return handled;
+}
+
+/*
+ * handle all control requests can be handled
+ * returns:
+ *	negative errno - error happened
+ *	zero - need delegate SETUP to gadget driver
+ *	positive - already handled
+ */
+static int handle_standard_request(struct mtu3 *mtu,
+			  struct usb_ctrlrequest *setup)
+{
+	void __iomem *mbase = mtu->mac_base;
+	enum usb_device_state state = mtu->g.state;
+	int handled = -EINVAL;
+	u32 dev_conf;
+
+	/* the gadget driver handles everything except what we must handle */
+	switch (setup->bRequest) {
+	case USB_REQ_SET_ADDRESS:
+		/* change it after the status stage */
+		mtu->address = (u8) (setup->wValue & 0x7f);
+		dev_dbg(mtu->dev, "set address to 0x%x\n", mtu->address);
+
+		dev_conf = mtu3_readl(mbase, U3D_DEVICE_CONF);
+		dev_conf &= ~DEV_ADDR_MSK;
+		dev_conf |= DEV_ADDR(mtu->address);
+		mtu3_writel(mbase, U3D_DEVICE_CONF, dev_conf);
+
+		if (mtu->address)
+			usb_gadget_set_state(&mtu->g, USB_STATE_ADDRESS);
+		else
+			usb_gadget_set_state(&mtu->g, USB_STATE_DEFAULT);
+
+		handled = 1;
+		break;
+	case USB_REQ_SET_CONFIGURATION:
+		if (state == USB_STATE_ADDRESS) {
+			usb_gadget_set_state(&mtu->g,
+					USB_STATE_CONFIGURED);
+		} else if (state == USB_STATE_CONFIGURED) {
+			/*
+			 * USB2 spec sec 9.4.7, if wValue is 0 then dev
+			 * is moved to addressed state
+			 */
+			if (!setup->wValue)
+				usb_gadget_set_state(&mtu->g,
+						USB_STATE_ADDRESS);
+		}
+		handled = 0;
+		break;
+	case USB_REQ_CLEAR_FEATURE:
+		handled = ep0_handle_feature(mtu, setup, 0);
+		break;
+	case USB_REQ_SET_FEATURE:
+		handled = ep0_handle_feature(mtu, setup, 1);
+		break;
+	case USB_REQ_GET_STATUS:
+		handled = ep0_get_status(mtu, setup);
+		break;
+	case USB_REQ_SET_SEL:
+		handled = ep0_set_sel(mtu, setup);
+		break;
+	case USB_REQ_SET_ISOCH_DELAY:
+		handled = 1;
+		break;
+	default:
+		/* delegate SET_CONFIGURATION, etc */
+		handled = 0;
+	}
+
+	return handled;
+}
+
+/* receive an data packet (OUT) */
+static void ep0_rx_state(struct mtu3 *mtu)
+{
+	struct mtu3_request *mreq;
+	struct usb_request *req;
+	void __iomem *mbase = mtu->mac_base;
+	u32 maxp;
+	u32 csr;
+	u16 count = 0;
+
+	dev_dbg(mtu->dev, "%s\n", __func__);
+
+	csr = mtu3_readl(mbase, U3D_EP0CSR) & EP0_W1C_BITS;
+	mreq = next_ep0_request(mtu);
+	req = &mreq->request;
+
+	/* read packet and ack; or stall because of gadget driver bug */
+	if (req) {
+		void *buf = req->buf + req->actual;
+		unsigned int len = req->length - req->actual;
+
+		/* read the buffer */
+		count = mtu3_readl(mbase, U3D_RXCOUNT0);
+		if (count > len) {
+			req->status = -EOVERFLOW;
+			count = len;
+		}
+		ep0_read_fifo(mtu->ep0, buf, count);
+		req->actual += count;
+		csr |= EP0_RXPKTRDY;
+
+		maxp = mtu->g.ep0->maxpacket;
+		if (count < maxp || req->actual == req->length) {
+			mtu->ep0_state = MU3D_EP0_STATE_SETUP;
+			dev_dbg(mtu->dev, "ep0 state: %s\n",
+				decode_ep0_state(mtu));
+
+			csr |= EP0_DATAEND;
+		} else {
+			req = NULL;
+		}
+	} else {
+		csr |= EP0_RXPKTRDY | EP0_SENDSTALL;
+		dev_dbg(mtu->dev, "%s: SENDSTALL\n", __func__);
+	}
+
+	mtu3_writel(mbase, U3D_EP0CSR, csr);
+
+	/* give back the request if have received all data */
+	if (req)
+		ep0_req_giveback(mtu, req);
+
+}
+
+/* transmitting to the host (IN) */
+static void ep0_tx_state(struct mtu3 *mtu)
+{
+	struct mtu3_request *mreq = next_ep0_request(mtu);
+	struct usb_request *req;
+	u32 csr;
+	u8 *src;
+	u8 count;
+	u32 maxp;
+
+	dev_dbg(mtu->dev, "%s\n", __func__);
+
+	if (!mreq)
+		return;
+
+	maxp = mtu->g.ep0->maxpacket;
+	req = &mreq->request;
+
+	/* load the data */
+	src = (u8 *)req->buf + req->actual;
+	count = min(maxp, req->length - req->actual);
+	if (count)
+		ep0_write_fifo(mtu->ep0, src, count);
+
+	dev_dbg(mtu->dev, "%s act=%d, len=%d, cnt=%d, maxp=%d zero=%d\n",
+		 __func__, req->actual, req->length, count, maxp, req->zero);
+
+	req->actual += count;
+
+	if ((count < maxp)
+		|| ((req->actual == req->length) && !req->zero))
+		mtu->ep0_state = MU3D_EP0_STATE_TX_END;
+
+	/* send it out, triggering a "txpktrdy cleared" irq */
+	csr = mtu3_readl(mtu->mac_base, U3D_EP0CSR) & EP0_W1C_BITS;
+	mtu3_writel(mtu->mac_base, U3D_EP0CSR, csr | EP0_TXPKTRDY);
+
+	dev_dbg(mtu->dev, "%s ep0csr=0x%x\n", __func__,
+		mtu3_readl(mtu->mac_base, U3D_EP0CSR));
+}
+
+/*
+ * USB2 spec sec8.1, multiple byte fields in standard descriptors, requests,
+ * and responses are interpreted as and moved over the bus in little-endian
+ * order, and MTK SoCs based on ARM is also little-endian, so no need
+ * to convert setup data temp. If need, will add it later
+ */
+static void ep0_read_setup(struct mtu3 *mtu, struct usb_ctrlrequest *setup)
+{
+	struct mtu3_request *mreq;
+	u32 count;
+	u32 csr;
+
+	csr = mtu3_readl(mtu->mac_base, U3D_EP0CSR) & EP0_W1C_BITS;
+	count = mtu3_readl(mtu->mac_base, U3D_RXCOUNT0);
+
+	ep0_read_fifo(mtu->ep0, (u8 *)setup, count);
+
+	dev_dbg(mtu->dev, "SETUP req%02x.%02x v%04x i%04x l%04x\n",
+		 setup->bRequestType, setup->bRequest, setup->wValue,
+		 setup->wIndex, setup->wLength);
+
+	/* clean up any leftover transfers */
+	mreq = next_ep0_request(mtu);
+	if (mreq)
+		ep0_req_giveback(mtu, &mreq->request);
+
+	if (setup->wLength == 0) {
+		;	/* no data stage, nothing to do */
+	} else if (setup->bRequestType & USB_DIR_IN) {
+		mtu3_writel(mtu->mac_base, U3D_EP0CSR,
+			csr | EP0_SETUPPKTRDY | EP0_DPHTX);
+		mtu->ep0_state = MU3D_EP0_STATE_TX;
+	} else {
+		mtu3_writel(mtu->mac_base, U3D_EP0CSR,
+			(csr | EP0_SETUPPKTRDY) & (~EP0_DPHTX));
+		mtu->ep0_state = MU3D_EP0_STATE_RX;
+	}
+}
+
+static int ep0_handle_setup(struct mtu3 *mtu)
+__releases(mtu->lock)
+__acquires(mtu->lock)
+{
+	struct usb_ctrlrequest setup;
+	struct mtu3_request *mreq;
+	void __iomem *mbase = mtu->mac_base;
+	int handled = 0;
+
+	ep0_read_setup(mtu, &setup);
+
+	if ((setup.bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD)
+		handled = handle_standard_request(mtu, &setup);
+
+	dev_dbg(mtu->dev, "handled %d, ep0_state: %s\n",
+		 handled, decode_ep0_state(mtu));
+
+	if (handled < 0)
+		goto stall;
+	else if (handled > 0)
+		goto finish;
+
+	handled = forward_to_driver(mtu, &setup);
+	if (handled < 0) {
+stall:
+		dev_err(mtu->dev, "%s stall (%d)\n", __func__, handled);
+
+		ep0_stall_set(mtu->ep0, true,
+				setup.wLength ? 0 : EP0_SETUPPKTRDY);
+
+		return 0;
+	}
+
+finish:
+	if (mtu->test_mode) {
+		;	/* nothing to do */
+	} else if (setup.wLength == 0) { /* no data stage */
+
+		mtu3_writel(mbase, U3D_EP0CSR,
+			(mtu3_readl(mbase, U3D_EP0CSR) & EP0_W1C_BITS)
+			| EP0_SETUPPKTRDY | EP0_DATAEND);
+
+		/* complete zlp request directly */
+		mreq = next_ep0_request(mtu);
+		if (mreq && !mreq->request.length)
+			ep0_req_giveback(mtu, &mreq->request);
+	}
+
+	return 0;
+}
+
+irqreturn_t mtu3_ep0_isr(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+	struct mtu3_request *mreq;
+	u32 int_status;
+	irqreturn_t ret = IRQ_NONE;
+	u32 csr;
+	u32 len;
+
+	int_status = mtu3_readl(mbase, U3D_EPISR);
+	int_status &= mtu3_readl(mbase, U3D_EPIER);
+	mtu3_writel(mbase, U3D_EPISR, int_status); /* W1C */
+
+	/* only handle ep0's */
+	if (!(int_status & EP0ISR))
+		return IRQ_NONE;
+
+	csr = mtu3_readl(mbase, U3D_EP0CSR);
+
+	dev_dbg(mtu->dev, "%s csr=0x%x\n", __func__, csr);
+
+	/* we sent a stall.. need to clear it now.. */
+	if (csr & EP0_SENTSTALL) {
+		ep0_stall_set(mtu->ep0, false, 0);
+		csr = mtu3_readl(mbase, U3D_EP0CSR);
+		ret = IRQ_HANDLED;
+	}
+	dev_dbg(mtu->dev, "ep0_state: %s\n", decode_ep0_state(mtu));
+
+	switch (mtu->ep0_state) {
+	case MU3D_EP0_STATE_TX:
+		/* irq on clearing txpktrdy */
+		if ((csr & EP0_FIFOFULL) == 0) {
+			ep0_tx_state(mtu);
+			ret = IRQ_HANDLED;
+		}
+		break;
+	case MU3D_EP0_STATE_RX:
+		/* irq on set rxpktrdy */
+		if (csr & EP0_RXPKTRDY) {
+			ep0_rx_state(mtu);
+			ret = IRQ_HANDLED;
+		}
+		break;
+	case MU3D_EP0_STATE_TX_END:
+		mtu3_writel(mbase, U3D_EP0CSR,
+			(csr & EP0_W1C_BITS) | EP0_DATAEND);
+
+		mreq = next_ep0_request(mtu);
+		if (mreq)
+			ep0_req_giveback(mtu, &mreq->request);
+
+		mtu->ep0_state = MU3D_EP0_STATE_SETUP;
+		ret = IRQ_HANDLED;
+		dev_dbg(mtu->dev, "ep0_state: %s\n", decode_ep0_state(mtu));
+		break;
+	case MU3D_EP0_STATE_SETUP:
+		if (!(csr & EP0_SETUPPKTRDY))
+			break;
+
+		len = mtu3_readl(mbase, U3D_RXCOUNT0);
+		if (len != 8) {
+			dev_err(mtu->dev, "SETUP packet len %d != 8 ?\n", len);
+			break;
+		}
+
+		ep0_handle_setup(mtu);
+		ret = IRQ_HANDLED;
+		break;
+	default:
+		/* can't happen */
+		ep0_stall_set(mtu->ep0, true, 0);
+		WARN_ON(1);
+		break;
+	}
+
+	return ret;
+}
+
+
+static int mtu3_ep0_enable(struct usb_ep *ep,
+	const struct usb_endpoint_descriptor *desc)
+{
+	/* always enabled */
+	return -EINVAL;
+}
+
+static int mtu3_ep0_disable(struct usb_ep *ep)
+{
+	/* always enabled */
+	return -EINVAL;
+}
+
+static int ep0_queue(struct mtu3_ep *mep, struct mtu3_request *mreq)
+{
+	struct mtu3 *mtu = mep->mtu;
+
+	mreq->mtu = mtu;
+	mreq->request.actual = 0;
+	mreq->request.status = -EINPROGRESS;
+
+	dev_dbg(mtu->dev, "%s %s (ep0_state: %s), len#%d\n", __func__,
+		mep->name, decode_ep0_state(mtu), mreq->request.length);
+
+	if (!list_empty(&mep->req_list))
+		return -EBUSY;
+
+	switch (mtu->ep0_state) {
+	case MU3D_EP0_STATE_SETUP:
+	case MU3D_EP0_STATE_RX:	/* control-OUT data */
+	case MU3D_EP0_STATE_TX:	/* control-IN data */
+		break;
+	default:
+		dev_err(mtu->dev, "%s, error in ep0 state %s\n", __func__,
+			decode_ep0_state(mtu));
+		return -EINVAL;
+	}
+
+	list_add_tail(&mreq->list, &mep->req_list);
+
+	/* sequence #1, IN ... start writing the data */
+	if (mtu->ep0_state == MU3D_EP0_STATE_TX)
+		ep0_tx_state(mtu);
+
+	return 0;
+}
+
+static int mtu3_ep0_queue(struct usb_ep *ep,
+	struct usb_request *req, gfp_t gfp)
+{
+	struct mtu3_ep *mep;
+	struct mtu3_request *mreq;
+	struct mtu3 *mtu;
+	unsigned long flags;
+	int ret = 0;
+
+	if (!ep || !req)
+		return -EINVAL;
+
+	mep = to_mtu3_ep(ep);
+	mtu = mep->mtu;
+	mreq = to_mtu3_request(req);
+
+	spin_lock_irqsave(&mtu->lock, flags);
+	ret = ep0_queue(mep, mreq);
+	spin_unlock_irqrestore(&mtu->lock, flags);
+	return ret;
+}
+
+static int mtu3_ep0_dequeue(struct usb_ep *ep, struct usb_request *req)
+{
+	/* we just won't support this */
+	return -EINVAL;
+}
+
+static int mtu3_ep0_halt(struct usb_ep *ep, int value)
+{
+	struct mtu3_ep *mep;
+	struct mtu3 *mtu;
+	unsigned long flags;
+	int ret = 0;
+
+	if (!ep || !value)
+		return -EINVAL;
+
+	mep = to_mtu3_ep(ep);
+	mtu = mep->mtu;
+
+	dev_dbg(mtu->dev, "%s\n", __func__);
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	if (!list_empty(&mep->req_list)) {
+		ret = -EBUSY;
+		goto cleanup;
+	}
+
+	switch (mtu->ep0_state) {
+	/*
+	 * stalls are usually issued after parsing SETUP packet, either
+	 * directly in irq context from setup() or else later.
+	 */
+	case MU3D_EP0_STATE_TX:
+	case MU3D_EP0_STATE_TX_END:
+	case MU3D_EP0_STATE_RX:
+	case MU3D_EP0_STATE_SETUP:
+		ep0_stall_set(mtu->ep0, true, 0);
+		break;
+	default:
+		dev_dbg(mtu->dev, "ep0 can't halt in state %s\n",
+			decode_ep0_state(mtu));
+		ret = -EINVAL;
+	}
+
+cleanup:
+	spin_unlock_irqrestore(&mtu->lock, flags);
+	return ret;
+}
+
+const struct usb_ep_ops mtu3_ep0_ops = {
+	.enable = mtu3_ep0_enable,
+	.disable = mtu3_ep0_disable,
+	.alloc_request = mtu3_alloc_request,
+	.free_request = mtu3_free_request,
+	.queue = mtu3_ep0_queue,
+	.dequeue = mtu3_ep0_dequeue,
+	.set_halt = mtu3_ep0_halt,
+};
+
diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
new file mode 100644
index 0000000..373c0c4
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -0,0 +1,294 @@
+/*
+ * mtu3_dr.c - dual role switch and host glue layer
+ *
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+#include "mtu3.h"
+#include "mtu3_dr.h"
+
+#define PERI_WK_CTRL1		0x404
+#define UWK_CTL1_IS_C(x)	(((x) & 0xf) << 26)
+#define UWK_CTL1_IS_E		BIT(25)
+#define UWK_CTL1_IDDIG_C(x)	(((x) & 0xf) << 11)  /* cycle debounce */
+#define UWK_CTL1_IDDIG_E	BIT(10) /* enable debounce */
+#define UWK_CTL1_IDDIG_P	BIT(9)  /* polarity */
+#define UWK_CTL1_IS_P		BIT(6)  /* polarity for ip sleep */
+
+/*
+ * ip-sleep wakeup mode:
+ * all clocks can be turn off, but power domain should be kept on
+ */
+static void ssusb_wakeup_ip_sleep_en(struct ssusb_mtk *ssusb)
+{
+	u32 tmp;
+	struct regmap *pericfg = ssusb->pericfg;
+
+	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
+	tmp &= ~UWK_CTL1_IS_P;
+	tmp &= ~(UWK_CTL1_IS_C(0xf));
+	tmp |= UWK_CTL1_IS_C(0x8);
+	regmap_write(pericfg, PERI_WK_CTRL1, tmp);
+	regmap_write(pericfg, PERI_WK_CTRL1, tmp | UWK_CTL1_IS_E);
+
+	regmap_read(pericfg, PERI_WK_CTRL1, &tmp);
+	dev_dbg(ssusb->dev, "%s(): WK_CTRL1[P6,E25,C26:29]=%#x\n",
+		__func__, tmp);
+}
+
+static void ssusb_wakeup_ip_sleep_dis(struct ssusb_mtk *ssusb)
+{
+	u32 tmp;
+
+	regmap_read(ssusb->pericfg, PERI_WK_CTRL1, &tmp);
+	tmp &= ~UWK_CTL1_IS_E;
+	regmap_write(ssusb->pericfg, PERI_WK_CTRL1, tmp);
+}
+
+int ssusb_wakeup_of_property_parse(struct ssusb_mtk *ssusb,
+				struct device_node *dn)
+{
+	struct device *dev = ssusb->dev;
+
+	/*
+	 * Wakeup function is optional, so it is not an error if this property
+	 * does not exist, and in such case, no need to get relative
+	 * properties anymore.
+	 */
+	ssusb->wakeup_en = of_property_read_bool(dn, "mediatek,enable-wakeup");
+	if (!ssusb->wakeup_en)
+		return 0;
+
+	ssusb->wk_deb_p0 = devm_clk_get(dev, "wakeup_deb_p0");
+	if (IS_ERR(ssusb->wk_deb_p0)) {
+		dev_err(dev, "fail to get wakeup_deb_p0\n");
+		return PTR_ERR(ssusb->wk_deb_p0);
+	}
+
+	if (of_property_read_bool(dn, "wakeup_deb_p1")) {
+		ssusb->wk_deb_p1 = devm_clk_get(dev, "wakeup_deb_p1");
+		if (IS_ERR(ssusb->wk_deb_p1)) {
+			dev_err(dev, "fail to get wakeup_deb_p1\n");
+			return PTR_ERR(ssusb->wk_deb_p1);
+		}
+	}
+
+	ssusb->pericfg = syscon_regmap_lookup_by_phandle(dn,
+						"mediatek,syscon-wakeup");
+	if (IS_ERR(ssusb->pericfg)) {
+		dev_err(dev, "fail to get pericfg regs\n");
+		return PTR_ERR(ssusb->pericfg);
+	}
+
+	return 0;
+}
+
+static int ssusb_wakeup_clks_enable(struct ssusb_mtk *ssusb)
+{
+	int ret;
+
+	ret = clk_prepare_enable(ssusb->wk_deb_p0);
+	if (ret) {
+		dev_err(ssusb->dev, "failed to enable wk_deb_p0\n");
+		goto usb_p0_err;
+	}
+
+	ret = clk_prepare_enable(ssusb->wk_deb_p1);
+	if (ret) {
+		dev_err(ssusb->dev, "failed to enable wk_deb_p1\n");
+		goto usb_p1_err;
+	}
+
+	return 0;
+
+usb_p1_err:
+	clk_disable_unprepare(ssusb->wk_deb_p0);
+usb_p0_err:
+	return -EINVAL;
+}
+
+static void ssusb_wakeup_clks_disable(struct ssusb_mtk *ssusb)
+{
+	clk_disable_unprepare(ssusb->wk_deb_p1);
+	clk_disable_unprepare(ssusb->wk_deb_p0);
+}
+
+static void host_ports_num_get(struct ssusb_mtk *ssusb)
+{
+	u32 xhci_cap;
+
+	xhci_cap = mtu3_readl(ssusb->ippc_base, U3D_SSUSB_IP_XHCI_CAP);
+	ssusb->u2_ports = SSUSB_IP_XHCI_U2_PORT_NUM(xhci_cap);
+	ssusb->u3_ports = SSUSB_IP_XHCI_U3_PORT_NUM(xhci_cap);
+
+	dev_dbg(ssusb->dev, "host - u2_ports:%d, u3_ports:%d\n",
+		 ssusb->u2_ports, ssusb->u3_ports);
+}
+
+/* only configure ports will be used later */
+int ssusb_host_enable(struct ssusb_mtk *ssusb)
+{
+	void __iomem *ibase = ssusb->ippc_base;
+	int num_u3p = ssusb->u3_ports;
+	int num_u2p = ssusb->u2_ports;
+	u32 check_clk;
+	u32 value;
+	int i;
+
+	/* power on host ip */
+	mtu3_clrbits(ibase, U3D_SSUSB_IP_PW_CTRL1, SSUSB_IP_HOST_PDN);
+
+	/* power on and enable all u3 ports */
+	for (i = 0; i < num_u3p; i++) {
+		value = mtu3_readl(ibase, SSUSB_U3_CTRL(i));
+		value &= ~(SSUSB_U3_PORT_PDN | SSUSB_U3_PORT_DIS);
+		value |= SSUSB_U3_PORT_HOST_SEL;
+		mtu3_writel(ibase, SSUSB_U3_CTRL(i), value);
+	}
+
+	/* power on and enable all u2 ports */
+	for (i = 0; i < num_u2p; i++) {
+		value = mtu3_readl(ibase, SSUSB_U2_CTRL(i));
+		value &= ~(SSUSB_U2_PORT_PDN | SSUSB_U2_PORT_DIS);
+		value |= SSUSB_U2_PORT_HOST_SEL;
+		mtu3_writel(ibase, SSUSB_U2_CTRL(i), value);
+	}
+
+	check_clk = SSUSB_XHCI_RST_B_STS;
+	if (num_u3p)
+		check_clk = SSUSB_U3_MAC_RST_B_STS;
+
+	return ssusb_check_clocks(ssusb, check_clk);
+}
+
+int ssusb_host_disable(struct ssusb_mtk *ssusb, bool suspend)
+{
+	void __iomem *ibase = ssusb->ippc_base;
+	int num_u3p = ssusb->u3_ports;
+	int num_u2p = ssusb->u2_ports;
+	u32 value;
+	int ret;
+	int i;
+
+	/* power down and disable all u3 ports */
+	for (i = 0; i < num_u3p; i++) {
+		value = mtu3_readl(ibase, SSUSB_U3_CTRL(i));
+		value |= SSUSB_U3_PORT_PDN;
+		value |= suspend ? 0 : SSUSB_U3_PORT_DIS;
+		mtu3_writel(ibase, SSUSB_U3_CTRL(i), value);
+	}
+
+	/* power down and disable all u2 ports */
+	for (i = 0; i < num_u2p; i++) {
+		value = mtu3_readl(ibase, SSUSB_U2_CTRL(i));
+		value |= SSUSB_U2_PORT_PDN;
+		value |= suspend ? 0 : SSUSB_U2_PORT_DIS;
+		mtu3_writel(ibase, SSUSB_U2_CTRL(i), value);
+	}
+
+	/* power down host ip */
+	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL1, SSUSB_IP_HOST_PDN);
+
+	if (!suspend)
+		return 0;
+
+	/* wait for host ip to sleep */
+	ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS1, value,
+			  (value & SSUSB_IP_SLEEP_STS), 100, 100000);
+	if (ret)
+		dev_err(ssusb->dev, "ip sleep failed!!!\n");
+
+	return ret;
+}
+
+static void ssusb_host_setup(struct ssusb_mtk *ssusb)
+{
+	host_ports_num_get(ssusb);
+
+	/*
+	 * power on host and power on/enable all ports
+	 * if support OTG, gadget driver will switch port0 to device mode
+	 */
+	ssusb_host_enable(ssusb);
+
+	/* if port0 supports dual-role, works as host mode by default */
+	ssusb_set_vbus(&ssusb->otg_switch, 1);
+}
+
+static void ssusb_host_cleanup(struct ssusb_mtk *ssusb)
+{
+	if (ssusb->is_host)
+		ssusb_set_vbus(&ssusb->otg_switch, 0);
+
+	ssusb_host_disable(ssusb, false);
+}
+
+/*
+ * If host supports multiple ports, the VBUSes(5V) of ports except port0
+ * when it supports OTG are better to be enabled by default in DTS.
+ * Because the host driver will keep link with devices attached when system
+ * enters suspend mode, so no need to control VBUSes after initialization.
+ */
+int ssusb_host_init(struct ssusb_mtk *ssusb, struct device_node *parent_dn)
+{
+	struct device *parent_dev = ssusb->dev;
+	int ret;
+
+	ssusb_host_setup(ssusb);
+
+	ret = of_platform_populate(parent_dn, NULL, NULL, parent_dev);
+	if (ret) {
+		dev_dbg(parent_dev, "failed to create child devices at %s\n",
+				parent_dn->full_name);
+		return ret;
+	}
+
+	dev_info(parent_dev, "xHCI platform device register success...\n");
+
+	return 0;
+}
+
+void ssusb_host_exit(struct ssusb_mtk *ssusb)
+{
+	of_platform_depopulate(ssusb->dev);
+	ssusb_host_cleanup(ssusb);
+}
+
+int ssusb_wakeup_enable(struct ssusb_mtk *ssusb)
+{
+	int ret = 0;
+
+	if (ssusb->wakeup_en) {
+		ret = ssusb_wakeup_clks_enable(ssusb);
+		ssusb_wakeup_ip_sleep_en(ssusb);
+	}
+	return ret;
+}
+
+void ssusb_wakeup_disable(struct ssusb_mtk *ssusb)
+{
+	if (ssusb->wakeup_en) {
+		ssusb_wakeup_ip_sleep_dis(ssusb);
+		ssusb_wakeup_clks_disable(ssusb);
+	}
+}
diff --git a/drivers/usb/mtu3/mtu3_hw_regs.h b/drivers/usb/mtu3/mtu3_hw_regs.h
new file mode 100644
index 0000000..713a75c
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_hw_regs.h
@@ -0,0 +1,474 @@
+/*
+ * mtu3_hw_regs.h - MediaTek USB3 DRD register and field definitions
+ *
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef _SSUSB_HW_REGS_H_
+#define _SSUSB_HW_REGS_H_
+
+/* segment offset of MAC register */
+#define SSUSB_DEV_BASE		0x0000
+#define SSUSB_EPCTL_CSR_BASE	0x0800
+#define SSUSB_USB3_MAC_CSR_BASE	0x1400
+#define SSUSB_USB3_SYS_CSR_BASE	0x1400
+#define SSUSB_USB2_CSR_BASE	0x2400
+
+/* IPPC register in Infra */
+#define SSUSB_SIFSLV_IPPC_BASE	0x0000
+
+/* --------------- SSUSB_DEV REGISTER DEFINITION --------------- */
+
+#define U3D_LV1ISR		(SSUSB_DEV_BASE + 0x0000)
+#define U3D_LV1IER		(SSUSB_DEV_BASE + 0x0004)
+#define U3D_LV1IESR		(SSUSB_DEV_BASE + 0x0008)
+#define U3D_LV1IECR		(SSUSB_DEV_BASE + 0x000C)
+
+#define U3D_EPISR		(SSUSB_DEV_BASE + 0x0080)
+#define U3D_EPIER		(SSUSB_DEV_BASE + 0x0084)
+#define U3D_EPIESR		(SSUSB_DEV_BASE + 0x0088)
+#define U3D_EPIECR		(SSUSB_DEV_BASE + 0x008C)
+
+#define U3D_EP0CSR		(SSUSB_DEV_BASE + 0x0100)
+#define U3D_RXCOUNT0		(SSUSB_DEV_BASE + 0x0108)
+#define U3D_RESERVED		(SSUSB_DEV_BASE + 0x010C)
+#define U3D_TX1CSR0		(SSUSB_DEV_BASE + 0x0110)
+#define U3D_TX1CSR1		(SSUSB_DEV_BASE + 0x0114)
+#define U3D_TX1CSR2		(SSUSB_DEV_BASE + 0x0118)
+
+#define U3D_RX1CSR0		(SSUSB_DEV_BASE + 0x0210)
+#define U3D_RX1CSR1		(SSUSB_DEV_BASE + 0x0214)
+#define U3D_RX1CSR2		(SSUSB_DEV_BASE + 0x0218)
+#define U3D_RX1CSR3		(SSUSB_DEV_BASE + 0x021C)
+
+#define U3D_FIFO0		(SSUSB_DEV_BASE + 0x0300)
+
+#define U3D_QCR0		(SSUSB_DEV_BASE + 0x0400)
+#define U3D_QCR1		(SSUSB_DEV_BASE + 0x0404)
+#define U3D_QCR2		(SSUSB_DEV_BASE + 0x0408)
+#define U3D_QCR3		(SSUSB_DEV_BASE + 0x040C)
+
+#define U3D_TXQCSR1		(SSUSB_DEV_BASE + 0x0510)
+#define U3D_TXQSAR1		(SSUSB_DEV_BASE + 0x0514)
+#define U3D_TXQCPR1		(SSUSB_DEV_BASE + 0x0518)
+
+#define U3D_RXQCSR1		(SSUSB_DEV_BASE + 0x0610)
+#define U3D_RXQSAR1		(SSUSB_DEV_BASE + 0x0614)
+#define U3D_RXQCPR1		(SSUSB_DEV_BASE + 0x0618)
+#define U3D_RXQLDPR1		(SSUSB_DEV_BASE + 0x061C)
+
+#define U3D_QISAR0		(SSUSB_DEV_BASE + 0x0700)
+#define U3D_QIER0		(SSUSB_DEV_BASE + 0x0704)
+#define U3D_QIESR0		(SSUSB_DEV_BASE + 0x0708)
+#define U3D_QIECR0		(SSUSB_DEV_BASE + 0x070C)
+#define U3D_QISAR1		(SSUSB_DEV_BASE + 0x0710)
+#define U3D_QIER1		(SSUSB_DEV_BASE + 0x0714)
+#define U3D_QIESR1		(SSUSB_DEV_BASE + 0x0718)
+#define U3D_QIECR1		(SSUSB_DEV_BASE + 0x071C)
+
+#define U3D_TQERRIR0		(SSUSB_DEV_BASE + 0x0780)
+#define U3D_TQERRIER0		(SSUSB_DEV_BASE + 0x0784)
+#define U3D_TQERRIESR0		(SSUSB_DEV_BASE + 0x0788)
+#define U3D_TQERRIECR0		(SSUSB_DEV_BASE + 0x078C)
+#define U3D_RQERRIR0		(SSUSB_DEV_BASE + 0x07C0)
+#define U3D_RQERRIER0		(SSUSB_DEV_BASE + 0x07C4)
+#define U3D_RQERRIESR0		(SSUSB_DEV_BASE + 0x07C8)
+#define U3D_RQERRIECR0		(SSUSB_DEV_BASE + 0x07CC)
+#define U3D_RQERRIR1		(SSUSB_DEV_BASE + 0x07D0)
+#define U3D_RQERRIER1		(SSUSB_DEV_BASE + 0x07D4)
+#define U3D_RQERRIESR1		(SSUSB_DEV_BASE + 0x07D8)
+#define U3D_RQERRIECR1		(SSUSB_DEV_BASE + 0x07DC)
+
+#define U3D_CAP_EP0FFSZ		(SSUSB_DEV_BASE + 0x0C04)
+#define U3D_CAP_EPNTXFFSZ	(SSUSB_DEV_BASE + 0x0C08)
+#define U3D_CAP_EPNRXFFSZ	(SSUSB_DEV_BASE + 0x0C0C)
+#define U3D_CAP_EPINFO		(SSUSB_DEV_BASE + 0x0C10)
+#define U3D_MISC_CTRL		(SSUSB_DEV_BASE + 0x0C84)
+
+/*---------------- SSUSB_DEV FIELD DEFINITION ---------------*/
+
+/* U3D_LV1ISR */
+#define EP_CTRL_INTR		BIT(5)
+#define MAC2_INTR		BIT(4)
+#define DMA_INTR		BIT(3)
+#define MAC3_INTR		BIT(2)
+#define QMU_INTR		BIT(1)
+#define BMU_INTR		BIT(0)
+
+/* U3D_LV1IECR */
+#define LV1IECR_MSK		GENMASK(31, 0)
+
+/* U3D_EPISR */
+#define EPRISR(x)		(BIT(16) << (x))
+#define EPTISR(x)		(BIT(0) << (x))
+#define EP0ISR			BIT(0)
+
+/* U3D_EP0CSR */
+#define EP0_SENDSTALL		BIT(25)
+#define EP0_FIFOFULL		BIT(23)
+#define EP0_SENTSTALL		BIT(22)
+#define EP0_DPHTX		BIT(20)
+#define EP0_DATAEND		BIT(19)
+#define EP0_TXPKTRDY		BIT(18)
+#define EP0_SETUPPKTRDY		BIT(17)
+#define EP0_RXPKTRDY		BIT(16)
+#define EP0_MAXPKTSZ_MSK	GENMASK(9, 0)
+#define EP0_MAXPKTSZ(x)		((x) & EP0_MAXPKTSZ_MSK)
+#define EP0_W1C_BITS	(~(EP0_RXPKTRDY | EP0_SETUPPKTRDY | EP0_SENTSTALL))
+
+/* U3D_TX1CSR0 */
+#define TX_DMAREQEN		BIT(29)
+#define TX_FIFOFULL		BIT(25)
+#define TX_FIFOEMPTY		BIT(24)
+#define TX_SENTSTALL		BIT(22)
+#define TX_SENDSTALL		BIT(21)
+#define TX_TXPKTRDY		BIT(16)
+#define TX_TXMAXPKTSZ_MSK	GENMASK(10, 0)
+#define TX_TXMAXPKTSZ(x)	((x) & TX_TXMAXPKTSZ_MSK)
+#define TX_W1C_BITS		(~(TX_SENTSTALL))
+
+/* U3D_TX1CSR1 */
+#define TX_MULT(x)		(((x) & 0x3) << 22)
+#define TX_MAX_PKT(x)		(((x) & 0x3f) << 16)
+#define TX_SLOT(x)		(((x) & 0x3f) << 8)
+#define TX_TYPE(x)		(((x) & 0x3) << 4)
+#define TX_SS_BURST(x)		(((x) & 0xf) << 0)
+
+/* for TX_TYPE & RX_TYPE */
+#define TYPE_BULK		(0x0)
+#define TYPE_INT		(0x1)
+#define TYPE_ISO		(0x2)
+#define TYPE_MASK		(0x3)
+
+/* U3D_TX1CSR2 */
+#define TX_BINTERVAL(x)		(((x) & 0xff) << 24)
+#define TX_FIFOSEGSIZE(x)	(((x) & 0xf) << 16)
+#define TX_FIFOADDR(x)		(((x) & 0x1fff) << 0)
+
+/* U3D_RX1CSR0 */
+#define RX_DMAREQEN		BIT(29)
+#define RX_SENTSTALL		BIT(22)
+#define RX_SENDSTALL		BIT(21)
+#define RX_RXPKTRDY		BIT(16)
+#define RX_RXMAXPKTSZ_MSK	GENMASK(10, 0)
+#define RX_RXMAXPKTSZ(x)	((x) & RX_RXMAXPKTSZ_MSK)
+#define RX_W1C_BITS		(~(RX_SENTSTALL | RX_RXPKTRDY))
+
+/* U3D_RX1CSR1 */
+#define RX_MULT(x)		(((x) & 0x3) << 22)
+#define RX_MAX_PKT(x)		(((x) & 0x3f) << 16)
+#define RX_SLOT(x)		(((x) & 0x3f) << 8)
+#define RX_TYPE(x)		(((x) & 0x3) << 4)
+#define RX_SS_BURST(x)		(((x) & 0xf) << 0)
+
+/* U3D_RX1CSR2 */
+#define RX_BINTERVAL(x)		(((x) & 0xff) << 24)
+#define RX_FIFOSEGSIZE(x)	(((x) & 0xf) << 16)
+#define RX_FIFOADDR(x)		(((x) & 0x1fff) << 0)
+
+/* U3D_QCR0 */
+#define QMU_RX_CS_EN(x)		(BIT(16) << (x))
+#define QMU_TX_CS_EN(x)		(BIT(0) << (x))
+#define QMU_CS16B_EN		BIT(0)
+
+/* U3D_QCR1 */
+#define QMU_TX_ZLP(x)		(BIT(0) << (x))
+
+/* U3D_QCR3 */
+#define QMU_RX_COZ(x)		(BIT(16) << (x))
+#define QMU_RX_ZLP(x)		(BIT(0) << (x))
+
+/* U3D_TXQCSR1 */
+/* U3D_RXQCSR1 */
+#define QMU_Q_ACTIVE		BIT(15)
+#define QMU_Q_STOP		BIT(2)
+#define QMU_Q_RESUME		BIT(1)
+#define QMU_Q_START		BIT(0)
+
+/* U3D_QISAR0, U3D_QIER0, U3D_QIESR0, U3D_QIECR0 */
+#define QMU_RX_DONE_INT(x)	(BIT(16) << (x))
+#define QMU_TX_DONE_INT(x)	(BIT(0) << (x))
+
+/* U3D_QISAR1, U3D_QIER1, U3D_QIESR1, U3D_QIECR1 */
+#define RXQ_ZLPERR_INT		BIT(20)
+#define RXQ_LENERR_INT		BIT(18)
+#define RXQ_CSERR_INT		BIT(17)
+#define RXQ_EMPTY_INT		BIT(16)
+#define TXQ_LENERR_INT		BIT(2)
+#define TXQ_CSERR_INT		BIT(1)
+#define TXQ_EMPTY_INT		BIT(0)
+
+/* U3D_TQERRIR0, U3D_TQERRIER0, U3D_TQERRIESR0, U3D_TQERRIECR0 */
+#define QMU_TX_LEN_ERR(x)	(BIT(16) << (x))
+#define QMU_TX_CS_ERR(x)	(BIT(0) << (x))
+
+/* U3D_RQERRIR0, U3D_RQERRIER0, U3D_RQERRIESR0, U3D_RQERRIECR0 */
+#define QMU_RX_LEN_ERR(x)	(BIT(16) << (x))
+#define QMU_RX_CS_ERR(x)	(BIT(0) << (x))
+
+/* U3D_RQERRIR1, U3D_RQERRIER1, U3D_RQERRIESR1, U3D_RQERRIECR1 */
+#define QMU_RX_ZLP_ERR(n)	(BIT(16) << (n))
+
+/* U3D_CAP_EPINFO */
+#define CAP_RX_EP_NUM(x)	(((x) >> 8) & 0x1f)
+#define CAP_TX_EP_NUM(x)	((x) & 0x1f)
+
+/* U3D_MISC_CTRL */
+#define VBUS_ON			BIT(1)
+#define VBUS_FRC_EN		BIT(0)
+
+
+/*---------------- SSUSB_EPCTL_CSR REGISTER DEFINITION ----------------*/
+
+#define U3D_DEVICE_CONF			(SSUSB_EPCTL_CSR_BASE + 0x0000)
+#define U3D_EP_RST			(SSUSB_EPCTL_CSR_BASE + 0x0004)
+
+#define U3D_DEV_LINK_INTR_ENABLE	(SSUSB_EPCTL_CSR_BASE + 0x0050)
+#define U3D_DEV_LINK_INTR		(SSUSB_EPCTL_CSR_BASE + 0x0054)
+
+/*---------------- SSUSB_EPCTL_CSR FIELD DEFINITION ----------------*/
+
+/* U3D_DEVICE_CONF */
+#define DEV_ADDR_MSK		GENMASK(30, 24)
+#define DEV_ADDR(x)		((0x7f & (x)) << 24)
+#define HW_USB2_3_SEL		BIT(18)
+#define SW_USB2_3_SEL_EN	BIT(17)
+#define SW_USB2_3_SEL		BIT(16)
+#define SSUSB_DEV_SPEED(x)	((x) & 0x7)
+
+/* U3D_EP_RST */
+#define EP1_IN_RST		BIT(17)
+#define EP1_OUT_RST		BIT(1)
+#define EP_RST(is_in, epnum)	(((is_in) ? BIT(16) : BIT(0)) << (epnum))
+#define EP0_RST			BIT(0)
+
+/* U3D_DEV_LINK_INTR_ENABLE */
+/* U3D_DEV_LINK_INTR */
+#define SSUSB_DEV_SPEED_CHG_INTR	BIT(0)
+
+
+/*---------------- SSUSB_USB3_MAC_CSR REGISTER DEFINITION ----------------*/
+
+#define U3D_LTSSM_CTRL		(SSUSB_USB3_MAC_CSR_BASE + 0x0010)
+#define U3D_USB3_CONFIG		(SSUSB_USB3_MAC_CSR_BASE + 0x001C)
+
+#define U3D_LTSSM_INTR_ENABLE	(SSUSB_USB3_MAC_CSR_BASE + 0x013C)
+#define U3D_LTSSM_INTR		(SSUSB_USB3_MAC_CSR_BASE + 0x0140)
+
+/*---------------- SSUSB_USB3_MAC_CSR FIELD DEFINITION ----------------*/
+
+/* U3D_LTSSM_CTRL */
+#define FORCE_POLLING_FAIL	BIT(4)
+#define FORCE_RXDETECT_FAIL	BIT(3)
+#define SOFT_U3_EXIT_EN		BIT(2)
+#define COMPLIANCE_EN		BIT(1)
+#define U1_GO_U2_EN		BIT(0)
+
+/* U3D_USB3_CONFIG */
+#define USB3_EN			BIT(0)
+
+/* U3D_LTSSM_INTR_ENABLE */
+/* U3D_LTSSM_INTR */
+#define U3_RESUME_INTR		BIT(18)
+#define U3_LFPS_TMOUT_INTR	BIT(17)
+#define VBUS_FALL_INTR		BIT(16)
+#define VBUS_RISE_INTR		BIT(15)
+#define RXDET_SUCCESS_INTR	BIT(14)
+#define EXIT_U3_INTR		BIT(13)
+#define EXIT_U2_INTR		BIT(12)
+#define EXIT_U1_INTR		BIT(11)
+#define ENTER_U3_INTR		BIT(10)
+#define ENTER_U2_INTR		BIT(9)
+#define ENTER_U1_INTR		BIT(8)
+#define ENTER_U0_INTR		BIT(7)
+#define RECOVERY_INTR		BIT(6)
+#define WARM_RST_INTR		BIT(5)
+#define HOT_RST_INTR		BIT(4)
+#define LOOPBACK_INTR		BIT(3)
+#define COMPLIANCE_INTR		BIT(2)
+#define SS_DISABLE_INTR		BIT(1)
+#define SS_INACTIVE_INTR	BIT(0)
+
+/*---------------- SSUSB_USB3_SYS_CSR REGISTER DEFINITION ----------------*/
+
+#define U3D_LINK_UX_INACT_TIMER	(SSUSB_USB3_SYS_CSR_BASE + 0x020C)
+#define U3D_LINK_POWER_CONTROL	(SSUSB_USB3_SYS_CSR_BASE + 0x0210)
+#define U3D_LINK_ERR_COUNT	(SSUSB_USB3_SYS_CSR_BASE + 0x0214)
+
+/*---------------- SSUSB_USB3_SYS_CSR FIELD DEFINITION ----------------*/
+
+/* U3D_LINK_UX_INACT_TIMER */
+#define DEV_U2_INACT_TIMEOUT_MSK	GENMASK(23, 16)
+#define DEV_U2_INACT_TIMEOUT_VALUE(x)	(((x) & 0xff) << 16)
+#define U2_INACT_TIMEOUT_MSK		GENMASK(15, 8)
+#define U1_INACT_TIMEOUT_MSK		GENMASK(7, 0)
+#define U1_INACT_TIMEOUT_VALUE(x)	((x) & 0xff)
+
+/* U3D_LINK_POWER_CONTROL */
+#define SW_U2_ACCEPT_ENABLE	BIT(9)
+#define SW_U1_ACCEPT_ENABLE	BIT(8)
+#define UX_EXIT			BIT(5)
+#define LGO_U3			BIT(4)
+#define LGO_U2			BIT(3)
+#define LGO_U1			BIT(2)
+#define SW_U2_REQUEST_ENABLE	BIT(1)
+#define SW_U1_REQUEST_ENABLE	BIT(0)
+
+/* U3D_LINK_ERR_COUNT */
+#define CLR_LINK_ERR_CNT	BIT(16)
+#define LINK_ERROR_COUNT	GENMASK(15, 0)
+
+/*---------------- SSUSB_USB2_CSR REGISTER DEFINITION ----------------*/
+
+#define U3D_POWER_MANAGEMENT		(SSUSB_USB2_CSR_BASE + 0x0004)
+#define U3D_DEVICE_CONTROL		(SSUSB_USB2_CSR_BASE + 0x000C)
+#define U3D_USB2_TEST_MODE		(SSUSB_USB2_CSR_BASE + 0x0014)
+#define U3D_COMMON_USB_INTR_ENABLE	(SSUSB_USB2_CSR_BASE + 0x0018)
+#define U3D_COMMON_USB_INTR		(SSUSB_USB2_CSR_BASE + 0x001C)
+#define U3D_LINK_RESET_INFO		(SSUSB_USB2_CSR_BASE + 0x0024)
+#define U3D_USB20_FRAME_NUM		(SSUSB_USB2_CSR_BASE + 0x003C)
+#define U3D_USB20_LPM_PARAMETER		(SSUSB_USB2_CSR_BASE + 0x0044)
+#define U3D_USB20_MISC_CONTROL		(SSUSB_USB2_CSR_BASE + 0x004C)
+
+/*---------------- SSUSB_USB2_CSR FIELD DEFINITION ----------------*/
+
+/* U3D_POWER_MANAGEMENT */
+#define LPM_BESL_STALL		BIT(14)
+#define LPM_BESLD_STALL		BIT(13)
+#define LPM_RWP			BIT(11)
+#define LPM_HRWE		BIT(10)
+#define LPM_MODE(x)		(((x) & 0x3) << 8)
+#define ISO_UPDATE		BIT(7)
+#define SOFT_CONN		BIT(6)
+#define HS_ENABLE		BIT(5)
+#define RESUME			BIT(2)
+#define SUSPENDM_ENABLE		BIT(0)
+
+/* U3D_DEVICE_CONTROL */
+#define DC_HOSTREQ		BIT(1)
+#define DC_SESSION		BIT(0)
+
+/* U3D_USB2_TEST_MODE */
+#define U2U3_AUTO_SWITCH	BIT(10)
+#define LPM_FORCE_STALL		BIT(8)
+#define FIFO_ACCESS		BIT(6)
+#define FORCE_FS		BIT(5)
+#define FORCE_HS		BIT(4)
+#define TEST_PACKET_MODE	BIT(3)
+#define TEST_K_MODE		BIT(2)
+#define TEST_J_MODE		BIT(1)
+#define TEST_SE0_NAK_MODE	BIT(0)
+
+/* U3D_COMMON_USB_INTR_ENABLE */
+/* U3D_COMMON_USB_INTR */
+#define LPM_RESUME_INTR		BIT(9)
+#define LPM_INTR		BIT(8)
+#define DISCONN_INTR		BIT(5)
+#define CONN_INTR		BIT(4)
+#define SOF_INTR		BIT(3)
+#define RESET_INTR		BIT(2)
+#define RESUME_INTR		BIT(1)
+#define SUSPEND_INTR		BIT(0)
+
+/* U3D_LINK_RESET_INFO */
+#define WTCHRP_MSK		GENMASK(19, 16)
+
+/* U3D_USB20_LPM_PARAMETER */
+#define LPM_BESLCK_U3(x)	(((x) & 0xf) << 12)
+#define LPM_BESLCK(x)		(((x) & 0xf) << 8)
+#define LPM_BESLDCK(x)		(((x) & 0xf) << 4)
+#define LPM_BESL		GENMASK(3, 0)
+
+/* U3D_USB20_MISC_CONTROL */
+#define LPM_U3_ACK_EN		BIT(0)
+
+/*---------------- SSUSB_SIFSLV_IPPC REGISTER DEFINITION ----------------*/
+
+#define U3D_SSUSB_IP_PW_CTRL0	(SSUSB_SIFSLV_IPPC_BASE + 0x0000)
+#define U3D_SSUSB_IP_PW_CTRL1	(SSUSB_SIFSLV_IPPC_BASE + 0x0004)
+#define U3D_SSUSB_IP_PW_CTRL2	(SSUSB_SIFSLV_IPPC_BASE + 0x0008)
+#define U3D_SSUSB_IP_PW_CTRL3	(SSUSB_SIFSLV_IPPC_BASE + 0x000C)
+#define U3D_SSUSB_IP_PW_STS1	(SSUSB_SIFSLV_IPPC_BASE + 0x0010)
+#define U3D_SSUSB_IP_PW_STS2	(SSUSB_SIFSLV_IPPC_BASE + 0x0014)
+#define U3D_SSUSB_OTG_STS	(SSUSB_SIFSLV_IPPC_BASE + 0x0018)
+#define U3D_SSUSB_OTG_STS_CLR	(SSUSB_SIFSLV_IPPC_BASE + 0x001C)
+#define U3D_SSUSB_IP_XHCI_CAP	(SSUSB_SIFSLV_IPPC_BASE + 0x0024)
+#define U3D_SSUSB_IP_DEV_CAP	(SSUSB_SIFSLV_IPPC_BASE + 0x0028)
+#define U3D_SSUSB_OTG_INT_EN	(SSUSB_SIFSLV_IPPC_BASE + 0x002C)
+#define U3D_SSUSB_U3_CTRL_0P	(SSUSB_SIFSLV_IPPC_BASE + 0x0030)
+#define U3D_SSUSB_U2_CTRL_0P	(SSUSB_SIFSLV_IPPC_BASE + 0x0050)
+#define U3D_SSUSB_REF_CK_CTRL	(SSUSB_SIFSLV_IPPC_BASE + 0x008C)
+#define U3D_SSUSB_DEV_RST_CTRL	(SSUSB_SIFSLV_IPPC_BASE + 0x0098)
+#define U3D_SSUSB_HW_ID		(SSUSB_SIFSLV_IPPC_BASE + 0x00A0)
+#define U3D_SSUSB_HW_SUB_ID	(SSUSB_SIFSLV_IPPC_BASE + 0x00A4)
+#define U3D_SSUSB_IP_SPARE0	(SSUSB_SIFSLV_IPPC_BASE + 0x00C8)
+
+/*---------------- SSUSB_SIFSLV_IPPC FIELD DEFINITION ----------------*/
+
+/* U3D_SSUSB_IP_PW_CTRL0 */
+#define SSUSB_IP_SW_RST			BIT(0)
+
+/* U3D_SSUSB_IP_PW_CTRL1 */
+#define SSUSB_IP_HOST_PDN		BIT(0)
+
+/* U3D_SSUSB_IP_PW_CTRL2 */
+#define SSUSB_IP_DEV_PDN		BIT(0)
+
+/* U3D_SSUSB_IP_PW_CTRL3 */
+#define SSUSB_IP_PCIE_PDN		BIT(0)
+
+/* U3D_SSUSB_IP_PW_STS1 */
+#define SSUSB_IP_SLEEP_STS		BIT(30)
+#define SSUSB_U3_MAC_RST_B_STS		BIT(16)
+#define SSUSB_XHCI_RST_B_STS		BIT(11)
+#define SSUSB_SYS125_RST_B_STS		BIT(10)
+#define SSUSB_REF_RST_B_STS		BIT(8)
+#define SSUSB_SYSPLL_STABLE		BIT(0)
+
+/* U3D_SSUSB_IP_PW_STS2 */
+#define SSUSB_U2_MAC_SYS_RST_B_STS	BIT(0)
+
+/* U3D_SSUSB_OTG_STS */
+#define SSUSB_VBUS_VALID		BIT(9)
+
+/* U3D_SSUSB_OTG_STS_CLR */
+#define SSUSB_VBUS_INTR_CLR		BIT(6)
+
+/* U3D_SSUSB_IP_XHCI_CAP */
+#define SSUSB_IP_XHCI_U2_PORT_NUM(x)	(((x) >> 8) & 0xff)
+#define SSUSB_IP_XHCI_U3_PORT_NUM(x)	((x) & 0xff)
+
+/* U3D_SSUSB_IP_DEV_CAP */
+#define SSUSB_IP_DEV_U3_PORT_NUM(x)	((x) & 0xff)
+
+/* U3D_SSUSB_OTG_INT_EN */
+#define SSUSB_VBUS_CHG_INT_A_EN		BIT(7)
+#define SSUSB_VBUS_CHG_INT_B_EN		BIT(6)
+
+/* U3D_SSUSB_U3_CTRL_0P */
+#define SSUSB_U3_PORT_HOST_SEL		BIT(2)
+#define SSUSB_U3_PORT_PDN		BIT(1)
+#define SSUSB_U3_PORT_DIS		BIT(0)
+
+/* U3D_SSUSB_U2_CTRL_0P */
+#define SSUSB_U2_PORT_OTG_SEL		BIT(7)
+#define SSUSB_U2_PORT_HOST_SEL		BIT(2)
+#define SSUSB_U2_PORT_PDN		BIT(1)
+#define SSUSB_U2_PORT_DIS		BIT(0)
+
+/* U3D_SSUSB_DEV_RST_CTRL */
+#define SSUSB_DEV_SW_RST		BIT(0)
+
+#endif	/* _SSUSB_HW_REGS_H_ */
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
new file mode 100644
index 0000000..d74bd9e
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -0,0 +1,490 @@
+/*
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+
+#include "mtu3.h"
+#include "mtu3_dr.h"
+
+/* u2-port0 should be powered on and enabled; */
+int ssusb_check_clocks(struct ssusb_mtk *ssusb, u32 ex_clks)
+{
+	void __iomem *ibase = ssusb->ippc_base;
+	u32 value, check_val;
+	int ret;
+
+	check_val = ex_clks | SSUSB_SYS125_RST_B_STS | SSUSB_SYSPLL_STABLE |
+			SSUSB_REF_RST_B_STS;
+
+	ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS1, value,
+			(check_val == (value & check_val)), 100, 20000);
+	if (ret) {
+		dev_err(ssusb->dev, "clks of sts1 are not stable!\n");
+		return ret;
+	}
+
+	ret = readl_poll_timeout(ibase + U3D_SSUSB_IP_PW_STS2, value,
+			(value & SSUSB_U2_MAC_SYS_RST_B_STS), 100, 10000);
+	if (ret) {
+		dev_err(ssusb->dev, "mac2 clock is not stable\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ssusb_phy_init(struct ssusb_mtk *ssusb)
+{
+	int i;
+	int ret;
+
+	for (i = 0; i < ssusb->num_phys; i++) {
+		ret = phy_init(ssusb->phys[i]);
+		if (ret)
+			goto exit_phy;
+	}
+	return 0;
+
+exit_phy:
+	for (; i > 0; i--)
+		phy_exit(ssusb->phys[i - 1]);
+
+	return ret;
+}
+
+static int ssusb_phy_exit(struct ssusb_mtk *ssusb)
+{
+	int i;
+
+	for (i = 0; i < ssusb->num_phys; i++)
+		phy_exit(ssusb->phys[i]);
+
+	return 0;
+}
+
+static int ssusb_phy_power_on(struct ssusb_mtk *ssusb)
+{
+	int i;
+	int ret;
+
+	for (i = 0; i < ssusb->num_phys; i++) {
+		ret = phy_power_on(ssusb->phys[i]);
+		if (ret)
+			goto power_off_phy;
+	}
+	return 0;
+
+power_off_phy:
+	for (; i > 0; i--)
+		phy_power_off(ssusb->phys[i - 1]);
+
+	return ret;
+}
+
+static void ssusb_phy_power_off(struct ssusb_mtk *ssusb)
+{
+	unsigned int i;
+
+	for (i = 0; i < ssusb->num_phys; i++)
+		phy_power_off(ssusb->phys[i]);
+}
+
+static int ssusb_common_init(struct ssusb_mtk *ssusb)
+{
+	int ret = 0;
+
+	ret = regulator_enable(ssusb->vusb33);
+	if (ret) {
+		dev_err(ssusb->dev, "failed to enable vusb33\n");
+		goto vusb33_err;
+	}
+
+	ret = clk_prepare_enable(ssusb->sys_clk);
+	if (ret) {
+		dev_err(ssusb->dev, "failed to enable sys_clk\n");
+		goto clk_err;
+	}
+
+	ret = ssusb_phy_init(ssusb);
+	if (ret) {
+		dev_err(ssusb->dev, "failed to init phy\n");
+		goto phy_init_err;
+	}
+
+	ret = ssusb_phy_power_on(ssusb);
+	if (ret) {
+		dev_err(ssusb->dev, "failed to power on phy\n");
+		goto phy_err;
+	}
+
+	return 0;
+
+phy_err:
+	ssusb_phy_exit(ssusb);
+
+phy_init_err:
+	clk_disable_unprepare(ssusb->sys_clk);
+
+clk_err:
+	regulator_disable(ssusb->vusb33);
+
+vusb33_err:
+
+	return ret;
+}
+
+static void ssusb_common_exit(struct ssusb_mtk *ssusb)
+{
+	clk_disable_unprepare(ssusb->sys_clk);
+	regulator_disable(ssusb->vusb33);
+	ssusb_phy_power_off(ssusb);
+	ssusb_phy_exit(ssusb);
+}
+
+static void ssusb_ip_sw_reset(struct ssusb_mtk *ssusb)
+{
+	/* reset whole ip (xhci & u3d) */
+	mtu3_setbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL0, SSUSB_IP_SW_RST);
+	udelay(1);
+	mtu3_clrbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL0, SSUSB_IP_SW_RST);
+}
+
+static int get_iddig_pinctrl(struct ssusb_mtk *ssusb)
+{
+	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
+
+	otg_sx->id_pinctrl = devm_pinctrl_get(ssusb->dev);
+	if (IS_ERR(otg_sx->id_pinctrl)) {
+		dev_err(ssusb->dev, "Cannot find id pinctrl!\n");
+		return PTR_ERR(otg_sx->id_pinctrl);
+	}
+
+	otg_sx->id_float =
+		pinctrl_lookup_state(otg_sx->id_pinctrl, "id_float");
+	if (IS_ERR(otg_sx->id_float)) {
+		dev_err(ssusb->dev, "Cannot find pinctrl id_float!\n");
+		return PTR_ERR(otg_sx->id_float);
+	}
+
+	otg_sx->id_ground =
+		pinctrl_lookup_state(otg_sx->id_pinctrl, "id_ground");
+	if (IS_ERR(otg_sx->id_ground)) {
+		dev_err(ssusb->dev, "Cannot find pinctrl id_ground!\n");
+		return PTR_ERR(otg_sx->id_ground);
+	}
+
+	return 0;
+}
+
+static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
+	struct device *dev = &pdev->dev;
+	struct regulator *vbus;
+	struct resource *res;
+	int i;
+	int ret;
+
+	ssusb->num_phys = of_count_phandle_with_args(node,
+			"phys", "#phy-cells");
+	if (ssusb->num_phys > 0) {
+		ssusb->phys = devm_kcalloc(dev, ssusb->num_phys,
+					sizeof(*ssusb->phys), GFP_KERNEL);
+		if (!ssusb->phys)
+			return -ENOMEM;
+	} else {
+		ssusb->num_phys = 0;
+	}
+
+	for (i = 0; i < ssusb->num_phys; i++) {
+		ssusb->phys[i] = devm_of_phy_get_by_index(dev, node, i);
+		if (IS_ERR(ssusb->phys[i])) {
+			dev_err(dev, "failed to get phy-%d\n", i);
+			return PTR_ERR(ssusb->phys[i]);
+		}
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ippc");
+	ssusb->ippc_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(ssusb->ippc_base)) {
+		dev_err(dev, "failed to map memory for ippc\n");
+		return PTR_ERR(ssusb->ippc_base);
+	}
+
+	ssusb->vusb33 = devm_regulator_get(&pdev->dev, "vusb33");
+	if (IS_ERR(ssusb->vusb33)) {
+		dev_err(dev, "failed to get vusb33\n");
+		return PTR_ERR(ssusb->vusb33);
+	}
+
+	ssusb->sys_clk = devm_clk_get(dev, "sys_ck");
+	if (IS_ERR(ssusb->sys_clk)) {
+		dev_err(dev, "failed to get sys clock\n");
+		return PTR_ERR(ssusb->sys_clk);
+	}
+
+	ssusb->dr_mode = usb_get_dr_mode(dev);
+	if (ssusb->dr_mode == USB_DR_MODE_UNKNOWN) {
+		dev_err(dev, "dr_mode is error\n");
+		return -EINVAL;
+	}
+
+	if (ssusb->dr_mode == USB_DR_MODE_PERIPHERAL)
+		return 0;
+
+	/* if host role is supported */
+	ret = ssusb_wakeup_of_property_parse(ssusb, node);
+	if (ret)
+		return ret;
+
+	if (ssusb->dr_mode != USB_DR_MODE_OTG)
+		return 0;
+
+	/* if dual-role mode is supported */
+	vbus = devm_regulator_get(&pdev->dev, "vbus");
+	if (IS_ERR(vbus)) {
+		dev_err(dev, "failed to get vbus\n");
+		return PTR_ERR(vbus);
+	}
+	otg_sx->vbus = vbus;
+
+	otg_sx->is_u3_drd = of_property_read_bool(node, "mediatek,usb3-drd");
+	otg_sx->manual_drd_enabled =
+		of_property_read_bool(node, "enable-manual-drd");
+
+	if (of_property_read_bool(node, "extcon")) {
+		otg_sx->edev = extcon_get_edev_by_phandle(ssusb->dev, 0);
+		if (IS_ERR(otg_sx->edev)) {
+			dev_err(ssusb->dev, "couldn't get extcon device\n");
+			return -EPROBE_DEFER;
+		}
+		if (otg_sx->manual_drd_enabled) {
+			ret = get_iddig_pinctrl(ssusb);
+			if (ret)
+				return ret;
+		}
+	}
+
+	dev_info(dev, "dr_mode: %d, is_u3_dr: %d\n",
+		ssusb->dr_mode, otg_sx->is_u3_drd);
+
+	return 0;
+}
+
+static int mtu3_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct ssusb_mtk *ssusb;
+	int ret = -ENOMEM;
+
+	/* all elements are set to ZERO as default value */
+	ssusb = devm_kzalloc(dev, sizeof(*ssusb), GFP_KERNEL);
+	if (!ssusb)
+		return -ENOMEM;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dev, "No suitable DMA config available\n");
+		return -ENOTSUPP;
+	}
+
+	platform_set_drvdata(pdev, ssusb);
+	ssusb->dev = dev;
+
+	ret = get_ssusb_rscs(pdev, ssusb);
+	if (ret)
+		return ret;
+
+	/* enable power domain */
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+	device_enable_async_suspend(dev);
+
+	ret = ssusb_common_init(ssusb);
+	if (ret)
+		goto comm_init_err;
+
+	ssusb_ip_sw_reset(ssusb);
+
+	if (IS_ENABLED(CONFIG_USB_MTU3_HOST))
+		ssusb->dr_mode = USB_DR_MODE_HOST;
+	else if (IS_ENABLED(CONFIG_USB_MTU3_GADGET))
+		ssusb->dr_mode = USB_DR_MODE_PERIPHERAL;
+
+	/* default as host */
+	ssusb->is_host = !(ssusb->dr_mode == USB_DR_MODE_PERIPHERAL);
+
+	switch (ssusb->dr_mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		ret = ssusb_gadget_init(ssusb);
+		if (ret) {
+			dev_err(dev, "failed to initialize gadget\n");
+			goto comm_exit;
+		}
+		break;
+	case USB_DR_MODE_HOST:
+		ret = ssusb_host_init(ssusb, node);
+		if (ret) {
+			dev_err(dev, "failed to initialize host\n");
+			goto comm_exit;
+		}
+		break;
+	case USB_DR_MODE_OTG:
+		ret = ssusb_gadget_init(ssusb);
+		if (ret) {
+			dev_err(dev, "failed to initialize gadget\n");
+			goto comm_exit;
+		}
+
+		ret = ssusb_host_init(ssusb, node);
+		if (ret) {
+			dev_err(dev, "failed to initialize host\n");
+			goto gadget_exit;
+		}
+
+		ssusb_otg_switch_init(ssusb);
+		break;
+	default:
+		dev_err(dev, "unsupported mode: %d\n", ssusb->dr_mode);
+		ret = -EINVAL;
+		goto comm_exit;
+	}
+
+	return 0;
+
+gadget_exit:
+	ssusb_gadget_exit(ssusb);
+
+comm_exit:
+	ssusb_common_exit(ssusb);
+
+comm_init_err:
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int mtu3_remove(struct platform_device *pdev)
+{
+	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
+
+	switch (ssusb->dr_mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		ssusb_gadget_exit(ssusb);
+		break;
+	case USB_DR_MODE_HOST:
+		ssusb_host_exit(ssusb);
+		break;
+	case USB_DR_MODE_OTG:
+		ssusb_otg_switch_exit(ssusb);
+		ssusb_gadget_exit(ssusb);
+		ssusb_host_exit(ssusb);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ssusb_common_exit(ssusb);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+/*
+ * when support dual-role mode, we reject suspend when
+ * it works as device mode;
+ */
+static int __maybe_unused mtu3_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	/* REVISIT: disconnect it for only device mode? */
+	if (!ssusb->is_host)
+		return 0;
+
+	ssusb_host_disable(ssusb, true);
+	ssusb_phy_power_off(ssusb);
+	clk_disable_unprepare(ssusb->sys_clk);
+	ssusb_wakeup_enable(ssusb);
+
+	return 0;
+}
+
+static int __maybe_unused mtu3_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
+
+	dev_dbg(dev, "%s\n", __func__);
+
+	if (!ssusb->is_host)
+		return 0;
+
+	ssusb_wakeup_disable(ssusb);
+	clk_prepare_enable(ssusb->sys_clk);
+	ssusb_phy_power_on(ssusb);
+	ssusb_host_enable(ssusb);
+
+	return 0;
+}
+
+static const struct dev_pm_ops mtu3_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtu3_suspend, mtu3_resume)
+};
+
+#define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
+
+#ifdef CONFIG_OF
+
+static const struct of_device_id mtu3_of_match[] = {
+	{.compatible = "mediatek,mt8173-mtu3",},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtu3_of_match);
+
+#endif
+
+static struct platform_driver mtu3_driver = {
+	.probe = mtu3_probe,
+	.remove = mtu3_remove,
+	.driver = {
+		.name = MTU3_DRIVER_NAME,
+		.pm = DEV_PM_OPS,
+		.of_match_table = of_match_ptr(mtu3_of_match),
+	},
+};
+module_platform_driver(mtu3_driver);
+
+MODULE_AUTHOR("Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek USB3 DRD Controller Driver");
+
diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
new file mode 100644
index 0000000..3fd687e
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -0,0 +1,599 @@
+/*
+ * mtu3_qmu.c - Queue Management Unit driver for device controller
+ *
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+/*
+ * Queue Management Unit (QMU) is designed to unload SW effort
+ * to serve DMA interrupts.
+ * By preparing General Purpose Descriptor (GPD) and Buffer Descriptor (BD),
+ * SW links data buffers and triggers QMU to send / receive data to
+ * host / from device at a time.
+ * And now only GPD is supported.
+ *
+ * For more detailed information, please refer to QMU Programming Guide
+ */
+
+#include <linux/dmapool.h>
+#include <linux/iopoll.h>
+
+#include "mtu3.h"
+
+#define QMU_CHECKSUM_LEN	16
+
+#define GPD_FLAGS_HWO	BIT(0)
+#define GPD_FLAGS_BDP	BIT(1)
+#define GPD_FLAGS_BPS	BIT(2)
+#define GPD_FLAGS_IOC	BIT(7)
+
+#define GPD_EXT_FLAG_ZLP	BIT(5)
+
+
+static struct qmu_gpd *gpd_dma_to_virt(struct mtu3_gpd_ring *ring,
+		dma_addr_t dma_addr)
+{
+	dma_addr_t dma_base = ring->dma;
+	struct qmu_gpd *gpd_head = ring->start;
+	u32 offset = (dma_addr - dma_base) / sizeof(*gpd_head);
+
+	if (offset >= MAX_GPD_NUM)
+		return NULL;
+
+	return gpd_head + offset;
+}
+
+static dma_addr_t gpd_virt_to_dma(struct mtu3_gpd_ring *ring,
+		struct qmu_gpd *gpd)
+{
+	dma_addr_t dma_base = ring->dma;
+	struct qmu_gpd *gpd_head = ring->start;
+	u32 offset;
+
+	offset = gpd - gpd_head;
+	if (offset >= MAX_GPD_NUM)
+		return 0;
+
+	return dma_base + (offset * sizeof(*gpd));
+}
+
+static void gpd_ring_init(struct mtu3_gpd_ring *ring, struct qmu_gpd *gpd)
+{
+	ring->start = gpd;
+	ring->enqueue = gpd;
+	ring->dequeue = gpd;
+	ring->end = gpd + MAX_GPD_NUM - 1;
+}
+
+static void reset_gpd_list(struct mtu3_ep *mep)
+{
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+	struct qmu_gpd *gpd = ring->start;
+
+	if (gpd) {
+		gpd->flag &= ~GPD_FLAGS_HWO;
+		gpd_ring_init(ring, gpd);
+	}
+}
+
+int mtu3_gpd_ring_alloc(struct mtu3_ep *mep)
+{
+	struct qmu_gpd *gpd;
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+
+	/* software own all gpds as default */
+	gpd = dma_pool_zalloc(mep->mtu->qmu_gpd_pool, GFP_ATOMIC, &ring->dma);
+	if (gpd == NULL)
+		return -ENOMEM;
+
+	gpd_ring_init(ring, gpd);
+
+	return 0;
+}
+
+void mtu3_gpd_ring_free(struct mtu3_ep *mep)
+{
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+
+	dma_pool_free(mep->mtu->qmu_gpd_pool,
+			ring->start, ring->dma);
+	memset(ring, 0, sizeof(*ring));
+}
+
+/*
+ * calculate check sum of a gpd or bd
+ * add "noinline" and "mb" to prevent wrong calculation
+ */
+static noinline u8 qmu_calc_checksum(u8 *data)
+{
+	u8 chksum = 0;
+	int i;
+
+	data[1] = 0x0;  /* set checksum to 0 */
+
+	mb();	/* ensure the gpd/bd is really up-to-date */
+	for (i = 0; i < QMU_CHECKSUM_LEN; i++)
+		chksum += data[i];
+
+	/* Default: HWO=1, @flag[bit0] */
+	chksum += 1;
+
+	return 0xFF - chksum;
+}
+
+void mtu3_qmu_resume(struct mtu3_ep *mep)
+{
+	struct mtu3 *mtu = mep->mtu;
+	void __iomem *mbase = mtu->mac_base;
+	int epnum = mep->epnum;
+	u32 offset;
+
+	offset = mep->is_in ? USB_QMU_TQCSR(epnum) : USB_QMU_RQCSR(epnum);
+
+	mtu3_writel(mbase, offset, QMU_Q_RESUME);
+	if (!(mtu3_readl(mbase, offset) & QMU_Q_ACTIVE))
+		mtu3_writel(mbase, offset, QMU_Q_RESUME);
+}
+
+static struct qmu_gpd *advance_enq_gpd(struct mtu3_gpd_ring *ring)
+{
+	if (ring->enqueue < ring->end)
+		ring->enqueue++;
+	else
+		ring->enqueue = ring->start;
+
+	return ring->enqueue;
+}
+
+static struct qmu_gpd *advance_deq_gpd(struct mtu3_gpd_ring *ring)
+{
+	if (ring->dequeue < ring->end)
+		ring->dequeue++;
+	else
+		ring->dequeue = ring->start;
+
+	return ring->dequeue;
+}
+
+/* check if a ring is emtpy */
+int gpd_ring_empty(struct mtu3_gpd_ring *ring)
+{
+	struct qmu_gpd *enq = ring->enqueue;
+	struct qmu_gpd *next;
+
+	if (ring->enqueue < ring->end)
+		next = enq + 1;
+	else
+		next = ring->start;
+
+	/* one gpd is reserved to simplify gpd preparation */
+	return next == ring->dequeue;
+}
+
+int mtu3_prepare_transfer(struct mtu3_ep *mep)
+{
+	return gpd_ring_empty(&mep->gpd_ring);
+}
+
+static int mtu3_prepare_tx_gpd(struct mtu3_ep *mep, struct mtu3_request *mreq)
+{
+	struct qmu_gpd *enq;
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+	struct qmu_gpd *gpd = ring->enqueue;
+	struct usb_request *req = &mreq->request;
+
+	/* set all fields to zero as default value */
+	memset(gpd, 0, sizeof(*gpd));
+
+	gpd->buffer = (u32)req->dma;
+	gpd->buf_len = req->length;
+	gpd->flag |= GPD_FLAGS_IOC;
+
+	/* get the next GPD */
+	enq = advance_enq_gpd(ring);
+	dev_dbg(mep->mtu->dev, "TX-EP%d queue gpd=%p, enq=%p\n",
+		mep->epnum, gpd, enq);
+
+	enq->flag &= ~GPD_FLAGS_HWO;
+	gpd->next_gpd = (u32)gpd_virt_to_dma(ring, enq);
+
+	if (req->zero)
+		gpd->ext_flag |= GPD_EXT_FLAG_ZLP;
+
+	gpd->chksum = qmu_calc_checksum((u8 *)gpd);
+	gpd->flag |= GPD_FLAGS_HWO;
+
+	mreq->gpd = gpd;
+
+	return 0;
+}
+
+static int mtu3_prepare_rx_gpd(struct mtu3_ep *mep, struct mtu3_request *mreq)
+{
+	struct qmu_gpd *enq;
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+	struct qmu_gpd *gpd = ring->enqueue;
+	struct usb_request *req = &mreq->request;
+
+	/* set all fields to zero as default value */
+	memset(gpd, 0, sizeof(*gpd));
+
+	gpd->buffer = (u32)req->dma;
+	gpd->data_buf_len = req->length;
+	gpd->flag |= GPD_FLAGS_IOC;
+
+	/* get the next GPD */
+	enq = advance_enq_gpd(ring);
+	dev_dbg(mep->mtu->dev, "RX-EP%d queue gpd=%p, enq=%p\n",
+		mep->epnum, gpd, enq);
+
+	enq->flag &= ~GPD_FLAGS_HWO;
+	gpd->next_gpd = (u32)gpd_virt_to_dma(ring, enq);
+	gpd->chksum = qmu_calc_checksum((u8 *)gpd);
+	gpd->flag |= GPD_FLAGS_HWO;
+
+	mreq->gpd = gpd;
+
+	return 0;
+}
+
+void mtu3_insert_gpd(struct mtu3_ep *mep, struct mtu3_request *mreq)
+{
+
+	if (mep->is_in)
+		mtu3_prepare_tx_gpd(mep, mreq);
+	else
+		mtu3_prepare_rx_gpd(mep, mreq);
+}
+
+int mtu3_qmu_start(struct mtu3_ep *mep)
+{
+	struct mtu3 *mtu = mep->mtu;
+	void __iomem *mbase = mtu->mac_base;
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+	u8 epnum = mep->epnum;
+
+	if (mep->is_in) {
+		/* set QMU start address */
+		mtu3_writel(mbase, USB_QMU_TQSAR(mep->epnum), ring->dma);
+		mtu3_setbits(mbase, MU3D_EP_TXCR0(mep->epnum), TX_DMAREQEN);
+		mtu3_setbits(mbase, U3D_QCR0, QMU_TX_CS_EN(epnum));
+
+		/* send zero length packet according to ZLP flag in GPD */
+		mtu3_setbits(mbase, U3D_QCR1, QMU_TX_ZLP(epnum));
+
+		mtu3_writel(mbase, U3D_TQERRIESR0,
+				QMU_TX_LEN_ERR(epnum) | QMU_TX_CS_ERR(epnum));
+
+		if (mtu3_readl(mbase, USB_QMU_TQCSR(epnum)) & QMU_Q_ACTIVE) {
+			dev_warn(mtu->dev, "Tx %d Active Now!\n", epnum);
+			return 0;
+		}
+
+		mtu3_writel(mbase, USB_QMU_TQCSR(epnum), QMU_Q_START);
+
+	} else {
+
+		mtu3_writel(mbase, USB_QMU_RQSAR(mep->epnum), ring->dma);
+		mtu3_setbits(mbase, MU3D_EP_RXCR0(mep->epnum), RX_DMAREQEN);
+		mtu3_setbits(mbase, U3D_QCR0, QMU_RX_CS_EN(epnum));
+
+		/* don't expect ZLP */
+		mtu3_clrbits(mbase, U3D_QCR3, QMU_RX_ZLP(epnum));
+		/* move to next GPD when receive ZLP */
+		mtu3_setbits(mbase, U3D_QCR3, QMU_RX_COZ(epnum));
+
+		mtu3_writel(mbase, U3D_RQERRIESR0,
+				QMU_RX_LEN_ERR(epnum) | QMU_RX_CS_ERR(epnum));
+		mtu3_writel(mbase, U3D_RQERRIESR1, QMU_RX_ZLP_ERR(epnum));
+
+		if (mtu3_readl(mbase, USB_QMU_RQCSR(epnum)) & QMU_Q_ACTIVE) {
+			dev_warn(mtu->dev, "Rx %d Active Now!\n", epnum);
+			return 0;
+		}
+
+		mtu3_writel(mbase, USB_QMU_RQCSR(epnum), QMU_Q_START);
+	}
+
+	return 0;
+}
+
+/* may called in atomic context */
+void mtu3_qmu_stop(struct mtu3_ep *mep)
+{
+	struct mtu3 *mtu = mep->mtu;
+	void __iomem *mbase = mtu->mac_base;
+	int epnum = mep->epnum;
+	u32 csr = 0;
+	u32 reg_csr;
+	int ret;
+
+	reg_csr = mep->is_in ? USB_QMU_TQCSR(epnum) : USB_QMU_RQCSR(epnum);
+
+	if (!(mtu3_readl(mbase, reg_csr) & QMU_Q_ACTIVE)) {
+		dev_dbg(mtu->dev, "%s's qmu is inactive now!\n", mep->name);
+		return;
+	}
+	mtu3_writel(mbase, reg_csr, QMU_Q_STOP);
+
+	ret = readl_poll_timeout_atomic(mbase + reg_csr, csr,
+			!(csr & QMU_Q_ACTIVE), 1, 1000);
+	if (ret) {
+		dev_err(mtu->dev, "stop %s's qmu failed\n", mep->name);
+		return;
+	}
+
+	dev_dbg(mtu->dev, "%s's qmu stop now!\n", mep->name);
+}
+
+void mtu3_qmu_flush(struct mtu3_ep *mep)
+{
+
+	dev_dbg(mep->mtu->dev, "%s flush QMU %s\n", __func__,
+		((mep->is_in) ? "TX" : "RX"));
+
+	/*Stop QMU */
+	mtu3_qmu_stop(mep);
+	reset_gpd_list(mep);
+}
+
+/*
+ * QMU can't transfer zero length packet directly (a hardware issue
+ * on old SoCs), so when needs to send ZLP, we intentionally trigger
+ * a length error interrupt, and in the ISR sends a ZLP by BMU.
+ */
+static void qmu_tx_zlp_error_handler(struct mtu3 *mtu, u8 epnum)
+{
+	struct mtu3_ep *mep = mtu->in_eps + epnum;
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+	void __iomem *mbase = mtu->mac_base;
+	struct qmu_gpd *gpd_current = NULL;
+	dma_addr_t gpd_dma = mtu3_readl(mbase, USB_QMU_TQCPR(epnum));
+	struct usb_request *req = NULL;
+	struct mtu3_request *mreq;
+	u32 txcsr = 0;
+	int ret;
+
+	mreq = next_request(mep);
+	if (mreq && mreq->request.length == 0)
+		req = &mreq->request;
+	else
+		return;
+
+	gpd_current = gpd_dma_to_virt(ring, gpd_dma);
+
+	if (gpd_current->buf_len != 0) {
+		dev_err(mtu->dev, "TX EP%d buffer length error(!=0)\n", epnum);
+		return;
+	}
+
+	dev_dbg(mtu->dev, "%s send ZLP for req=%p\n", __func__, mreq);
+
+	mtu3_clrbits(mbase, MU3D_EP_TXCR0(mep->epnum), TX_DMAREQEN);
+
+	ret = readl_poll_timeout_atomic(mbase + MU3D_EP_TXCR0(mep->epnum),
+			txcsr, !(txcsr & TX_FIFOFULL), 1, 1000);
+	if (ret) {
+		dev_err(mtu->dev, "%s wait for fifo empty fail\n", __func__);
+		return;
+	}
+	mtu3_setbits(mbase, MU3D_EP_TXCR0(mep->epnum), TX_TXPKTRDY);
+
+	/* by pass the current GDP */
+	gpd_current->flag |= GPD_FLAGS_BPS;
+	gpd_current->chksum = qmu_calc_checksum((u8 *)gpd_current);
+	gpd_current->flag |= GPD_FLAGS_HWO;
+
+	/*enable DMAREQEN, switch back to QMU mode */
+	mtu3_setbits(mbase, MU3D_EP_TXCR0(mep->epnum), TX_DMAREQEN);
+	mtu3_qmu_resume(mep);
+}
+
+/*
+ * NOTE: request list maybe is already empty as following case:
+ * queue_tx --> qmu_interrupt(clear interrupt pending, schedule tasklet)-->
+ * queue_tx --> process_tasklet(meanwhile, the second one is transferred,
+ * tasklet process both of them)-->qmu_interrupt for second one.
+ * To avoid upper case, put qmu_done_tx in ISR directly to process it.
+ */
+static void qmu_done_tx(struct mtu3 *mtu, u8 epnum)
+{
+	struct mtu3_ep *mep = mtu->in_eps + epnum;
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+	void __iomem *mbase = mtu->mac_base;
+	struct qmu_gpd *gpd = ring->dequeue;
+	struct qmu_gpd *gpd_current = NULL;
+	dma_addr_t gpd_dma = mtu3_readl(mbase, USB_QMU_TQCPR(epnum));
+	struct usb_request *request = NULL;
+	struct mtu3_request *mreq;
+
+	/*transfer phy address got from QMU register to virtual address */
+	gpd_current = gpd_dma_to_virt(ring, gpd_dma);
+
+	dev_dbg(mtu->dev, "%s EP%d, last=%p, current=%p, enq=%p\n",
+		__func__, epnum, gpd, gpd_current, ring->enqueue);
+
+	while (gpd != gpd_current && !(gpd->flag & GPD_FLAGS_HWO)) {
+
+		mreq = next_request(mep);
+
+		if (mreq == NULL || mreq->gpd != gpd) {
+			dev_err(mtu->dev, "no correct TX req is found\n");
+			break;
+		}
+
+		request = &mreq->request;
+		request->actual = gpd->buf_len;
+		mtu3_req_complete(mep, request, 0);
+
+		gpd = advance_deq_gpd(ring);
+	}
+
+	dev_dbg(mtu->dev, "%s EP%d, deq=%p, enq=%p, complete\n",
+		__func__, epnum, ring->dequeue, ring->enqueue);
+
+}
+
+static void qmu_done_rx(struct mtu3 *mtu, u8 epnum)
+{
+	struct mtu3_ep *mep = mtu->out_eps + epnum;
+	struct mtu3_gpd_ring *ring = &mep->gpd_ring;
+	void __iomem *mbase = mtu->mac_base;
+	struct qmu_gpd *gpd = ring->dequeue;
+	struct qmu_gpd *gpd_current = NULL;
+	dma_addr_t gpd_dma = mtu3_readl(mbase, USB_QMU_RQCPR(epnum));
+	struct usb_request *req = NULL;
+	struct mtu3_request *mreq;
+
+	gpd_current = gpd_dma_to_virt(ring, gpd_dma);
+
+	dev_dbg(mtu->dev, "%s EP%d, last=%p, current=%p, enq=%p\n",
+		__func__, epnum, gpd, gpd_current, ring->enqueue);
+
+	while (gpd != gpd_current && !(gpd->flag & GPD_FLAGS_HWO)) {
+
+		mreq = next_request(mep);
+
+		if (mreq == NULL || mreq->gpd != gpd) {
+			dev_err(mtu->dev, "no correct RX req is found\n");
+			break;
+		}
+		req = &mreq->request;
+
+		req->actual = gpd->buf_len;
+		mtu3_req_complete(mep, req, 0);
+
+		gpd = advance_deq_gpd(ring);
+	}
+
+	dev_dbg(mtu->dev, "%s EP%d, deq=%p, enq=%p, complete\n",
+		__func__, epnum, ring->dequeue, ring->enqueue);
+}
+
+static void qmu_done_tasklet(unsigned long data)
+{
+	struct mtu3 *mtu = (struct mtu3 *)data;
+	unsigned long flags;
+	u32 qmu_val;
+	int i;
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	qmu_val = mtu->qmu_done_intr;
+
+	mtu->qmu_done_intr = 0;
+
+	for (i = 1; i < mtu->num_eps; i++) {
+		if (qmu_val & QMU_RX_DONE_INT(i))
+			qmu_done_rx(mtu, i);
+		if (qmu_val & QMU_TX_DONE_INT(i))
+			qmu_done_tx(mtu, i);
+	}
+	spin_unlock_irqrestore(&mtu->lock, flags);
+}
+
+static void qmu_exception_isr(struct mtu3 *mtu, u32 qmu_status)
+{
+	void __iomem *mbase = mtu->mac_base;
+	u32 errval;
+	int i;
+
+	if ((qmu_status & RXQ_CSERR_INT) || (qmu_status & RXQ_LENERR_INT)) {
+		errval = mtu3_readl(mbase, U3D_RQERRIR0);
+		for (i = 1; i < mtu->num_eps; i++) {
+			if (errval & QMU_RX_CS_ERR(i))
+				dev_err(mtu->dev, "Rx %d CS error!\n", i);
+
+			if (errval & QMU_RX_LEN_ERR(i))
+				dev_err(mtu->dev, "RX %d Length error\n", i);
+		}
+		mtu3_writel(mbase, U3D_RQERRIR0, errval);
+	}
+
+	if (qmu_status & RXQ_ZLPERR_INT) {
+		errval = mtu3_readl(mbase, U3D_RQERRIR1);
+		for (i = 1; i < mtu->num_eps; i++) {
+			if (errval & QMU_RX_ZLP_ERR(i))
+				dev_dbg(mtu->dev, "RX EP%d Recv ZLP\n", i);
+		}
+		mtu3_writel(mbase, U3D_RQERRIR1, errval);
+	}
+
+	if ((qmu_status & TXQ_CSERR_INT) || (qmu_status & TXQ_LENERR_INT)) {
+		errval = mtu3_readl(mbase, U3D_TQERRIR0);
+		for (i = 1; i < mtu->num_eps; i++) {
+			if (errval & QMU_TX_CS_ERR(i))
+				dev_err(mtu->dev, "Tx %d checksum error!\n", i);
+
+			if (errval & QMU_TX_LEN_ERR(i))
+				qmu_tx_zlp_error_handler(mtu, i);
+		}
+		mtu3_writel(mbase, U3D_TQERRIR0, errval);
+	}
+}
+
+irqreturn_t mtu3_qmu_isr(struct mtu3 *mtu)
+{
+	void __iomem *mbase = mtu->mac_base;
+	u32 qmu_status;
+	u32 qmu_done_status;
+
+	/* U3D_QISAR1 is read update */
+	qmu_status = mtu3_readl(mbase, U3D_QISAR1);
+	qmu_status &= mtu3_readl(mbase, U3D_QIER1);
+
+	qmu_done_status = mtu3_readl(mbase, U3D_QISAR0);
+	qmu_done_status &= mtu3_readl(mbase, U3D_QIER0);
+	mtu3_writel(mbase, U3D_QISAR0, qmu_done_status); /* W1C */
+	dev_dbg(mtu->dev, "=== QMUdone[tx=%x, rx=%x] QMUexp[%x] ===\n",
+		(qmu_done_status & 0xFFFF), qmu_done_status >> 16,
+		qmu_status);
+
+	if (qmu_done_status) {
+		/* qmu maybe not handled yet */
+		mtu->qmu_done_intr |= qmu_done_status;
+		tasklet_schedule(&mtu->qmu_done);
+	}
+
+	if (qmu_status)
+		qmu_exception_isr(mtu, qmu_status);
+
+	return IRQ_HANDLED;
+}
+
+int mtu3_qmu_init(struct mtu3 *mtu)
+{
+
+	compiletime_assert(QMU_GPD_SIZE == 16, "QMU_GPD size SHOULD be 16B");
+
+	mtu->qmu_gpd_pool = dma_pool_create("QMU_GPD", mtu->dev,
+			QMU_GPD_RING_SIZE, QMU_GPD_SIZE, 0);
+
+	if (!mtu->qmu_gpd_pool)
+		return -ENOMEM;
+
+	tasklet_init(&mtu->qmu_done, qmu_done_tasklet, (unsigned long)mtu);
+
+	return 0;
+}
+
+int mtu3_qmu_exit(struct mtu3 *mtu)
+{
+	tasklet_kill(&mtu->qmu_done);
+	dma_pool_destroy(mtu->qmu_gpd_pool);
+
+	return 0;
+}
+
diff --git a/drivers/usb/mtu3/mtu3_qmu.h b/drivers/usb/mtu3/mtu3_qmu.h
new file mode 100644
index 0000000..2e07f5b
--- /dev/null
+++ b/drivers/usb/mtu3/mtu3_qmu.h
@@ -0,0 +1,43 @@
+/*
+ * mtu3_qmu.h - Queue Management Unit driver header
+ *
+ * Copyright (C) 2016 MediaTek Inc.
+ *
+ * Author: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef __MTK_QMU_H__
+#define __MTK_QMU_H__
+
+#define MAX_GPD_NUM		64
+#define QMU_GPD_SIZE		(sizeof(struct qmu_gpd))
+#define QMU_GPD_RING_SIZE	(MAX_GPD_NUM * QMU_GPD_SIZE)
+
+#define GPD_BUF_SIZE		65532
+
+void mtu3_qmu_stop(struct mtu3_ep *mep);
+int mtu3_qmu_start(struct mtu3_ep *mep);
+void mtu3_qmu_resume(struct mtu3_ep *mep);
+void mtu3_qmu_flush(struct mtu3_ep *mep);
+
+void mtu3_insert_gpd(struct mtu3_ep *mep, struct mtu3_request *mreq);
+int mtu3_prepare_transfer(struct mtu3_ep *mep);
+
+int mtu3_gpd_ring_alloc(struct mtu3_ep *mep);
+void mtu3_gpd_ring_free(struct mtu3_ep *mep);
+
+irqreturn_t mtu3_qmu_isr(struct mtu3 *mtu);
+int mtu3_qmu_init(struct mtu3 *mtu);
+int mtu3_qmu_exit(struct mtu3 *mtu);
+
+#endif
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
