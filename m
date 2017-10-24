From: Yu Chen <chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [RFC 2/3] USB: dwc3: Modify dwc3 code for support usb of Hikey960
Date: Tue, 24 Oct 2017 14:06:09 +0800
Message-ID: <20171024060610.10712-3-chenyu56@huawei.com>
References: <20171024060610.10712-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171024060610.10712-1-chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

The usb controller of Kirin960 is DesignWare Cores SuperSpeed USB 3.0 Controller.
The patch modifies dwc3 for support Kirin960 and adds codes for a USB Hub on board Hikey960.

Signed-off-by: Yu Chen <chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Ning Fan <fanning4-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Di Yang <yangdi10-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Rui Li <lirui39-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

---
 arch/arm64/configs/defconfig             |    5 +
 drivers/usb/dwc3/Kconfig                 |   26 +
 drivers/usb/dwc3/Makefile                |    5 +
 drivers/usb/dwc3/core.c                  |   78 +-
 drivers/usb/dwc3/core.h                  |   19 +-
 drivers/usb/dwc3/dwc3-hi3660.c           |  310 +++++
 drivers/usb/dwc3/dwc3-hisi.c             | 1972 ++++++++++++++++++++++++++++++
 drivers/usb/dwc3/dwc3-hisi.h             |  293 +++++
 drivers/usb/dwc3/dwc3-otg.c              |  360 ++++++
 drivers/usb/dwc3/dwc3-otg.h              |  133 ++
 drivers/usb/dwc3/ep0.c                   |   55 +-
 drivers/usb/dwc3/gadget.c                |   20 +-
 drivers/usb/dwc3/hisi_hikey_gpio.c       |  300 +++++
 drivers/usb/dwc3/host.c                  |   13 +
 drivers/usb/dwc3/io.h                    |   14 +
 include/linux/hisi/log/hisi_log.h        |  143 +++
 include/linux/hisi/usb/hisi_hikey_gpio.h |   24 +
 include/linux/hisi/usb/hisi_usb.h        |   57 +
 18 files changed, 3819 insertions(+), 8 deletions(-)
 create mode 100644 drivers/usb/dwc3/dwc3-hi3660.c
 create mode 100644 drivers/usb/dwc3/dwc3-hisi.c
 create mode 100644 drivers/usb/dwc3/dwc3-hisi.h
 create mode 100644 drivers/usb/dwc3/dwc3-otg.c
 create mode 100644 drivers/usb/dwc3/dwc3-otg.h
 create mode 100644 drivers/usb/dwc3/hisi_hikey_gpio.c
 create mode 100644 include/linux/hisi/log/hisi_log.h
 create mode 100644 include/linux/hisi/usb/hisi_hikey_gpio.h
 create mode 100644 include/linux/hisi/usb/hisi_usb.h

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 34480e9af2e7..8e61b7d96bba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -405,6 +405,7 @@ CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SIMPLE_CARD=y
+CONFIG_HISI_HIKEY_GPIO=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
@@ -419,6 +420,9 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC3=y
+CONFIG_USB_DWC3_DUAL_ROLE=y
+CONFIG_USB_DWC3_HISI=y
+CONFIG_USB_DWC3_OTG=y
 CONFIG_USB_DWC2=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
@@ -428,6 +432,7 @@ CONFIG_USB_HSIC_USB3503=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_MSM_OTG=y
 CONFIG_USB_QCOM_8X16_PHY=y
+CONFIG_EXTCON=y
 CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index ab8c0e0d3b60..5f7d9f19f503 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -106,4 +106,30 @@ config USB_DWC3_ST
 	  inside (i.e. STiH407).
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_HISI
+	tristate "Hisilicon Platforms"
+	select USB_DWC3_OTG
+	depends on USB_DWC3
+	default n
+	help
+	  Support of USB2/3 functionality in hisilicon platforms,
+	  Say 'Y' or 'M' here if you have one such device.
+	  Use for hisilicon device and it will select USB_DWC3_OTG
+	  if Say 'Y' or 'M' here.
+
+config USB_DWC3_OTG
+	bool "Enable DWC3 OTG"
+	default n
+	help
+	  Support of USB2/3 functionality in hisilicon platforms,
+	  Say 'Y' or 'M' here if you have one such device.
+	  Use for hisilicon device
+	  if Say 'Y' or 'M' here.
+
+config HISI_HIKEY_GPIO
+    tristate "HISI_HIKEY_GPIO"
+    depends on GPIOLIB
+    default n
+    help
+       If you say yes here you get support for hisi hikey gpio.
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index f15fabbd1e59..c2c32a5effc7 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -1,6 +1,7 @@
 # define_trace.h needs to know how to find our header
 CFLAGS_trace.o				:= -I$(src)
 
+ccflags-$(CONFIG_USB_DWC3_OTG)		+= -DDWC3_OTG_FORCE_MODE
 obj-$(CONFIG_USB_DWC3)			+= dwc3.o
 
 dwc3-y					:= core.o
@@ -29,6 +30,8 @@ ifneq ($(CONFIG_DEBUG_FS),)
 	dwc3-y				+= debugfs.o
 endif
 
+dwc3-$(CONFIG_USB_DWC3_OTG)		+= dwc3-otg.o
+
 ##
 # Platform-specific glue layers go here
 #
@@ -47,3 +50,5 @@ obj-$(CONFIG_USB_DWC3_PCI)		+= dwc3-pci.o
 obj-$(CONFIG_USB_DWC3_KEYSTONE)		+= dwc3-keystone.o
 obj-$(CONFIG_USB_DWC3_OF_SIMPLE)	+= dwc3-of-simple.o
 obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
+obj-$(CONFIG_USB_DWC3_HISI)		+= dwc3-hisi.o  dwc3-hi3660.o
+obj-$(CONFIG_HISI_HIKEY_GPIO)		+= hisi_hikey_gpio.o
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 03474d3575ab..d0105a26867d 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -44,7 +44,7 @@
 #include "core.h"
 #include "gadget.h"
 #include "io.h"
-
+#include "dwc3-otg.h"
 #include "debug.h"
 
 #define DWC3_DEFAULT_AUTOSUSPEND_DELAY	5000 /* ms */
@@ -87,6 +87,8 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 			mode = USB_DR_MODE_HOST;
 		else if (IS_ENABLED(CONFIG_USB_DWC3_GADGET))
 			mode = USB_DR_MODE_PERIPHERAL;
+		else if (IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE))
+			mode = USB_DR_MODE_OTG;
 	}
 
 	if (mode != dwc->dr_mode) {
@@ -103,7 +105,7 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 static void dwc3_event_buffers_cleanup(struct dwc3 *dwc);
 static int dwc3_event_buffers_setup(struct dwc3 *dwc);
 
-static void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
+void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
 {
 	u32 reg;
 
@@ -113,6 +115,7 @@ static void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
 	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
 }
 
+#ifndef CONFIG_USB_DWC3_HISI
 static void __dwc3_set_mode(struct work_struct *work)
 {
 	struct dwc3 *dwc = work_to_dwc(work);
@@ -177,6 +180,7 @@ static void __dwc3_set_mode(struct work_struct *work)
 		break;
 	}
 }
+#endif
 
 void dwc3_set_mode(struct dwc3 *dwc, u32 mode)
 {
@@ -362,6 +366,12 @@ static int dwc3_event_buffers_setup(struct dwc3 *dwc)
 
 	evt = dwc->ev_buf;
 	evt->lpos = 0;
+	#ifdef CONFIG_USB_DWC3_HISI
+	evt->count = 0;
+	evt->flags = 0;
+	memset(evt->buf, 0, evt->length);
+	#endif
+
 	dwc3_writel(dwc->regs, DWC3_GEVNTADRLO(0),
 			lower_32_bits(evt->dma));
 	dwc3_writel(dwc->regs, DWC3_GEVNTADRHI(0),
@@ -730,7 +740,13 @@ static void dwc3_core_setup_global_control(struct dwc3 *dwc)
 	 */
 	if (dwc->revision < DWC3_REVISION_190A)
 		reg |= DWC3_GCTL_U2RSTECN;
-
+	#ifdef DWC3_OTG_FORCE_MODE
+	/*
+	 * if ID status is detected by third module, default device mode.
+	 */
+	reg &= ~(DWC3_GCTL_PRTCAPDIR(DWC3_GCTL_PRTCAP_OTG));
+	reg |= DWC3_GCTL_PRTCAPDIR(DWC3_GCTL_PRTCAP_DEVICE);
+	#endif
 	dwc3_writel(dwc->regs, DWC3_GCTL, reg);
 }
 
@@ -957,6 +973,7 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 		}
 		break;
 	case USB_DR_MODE_OTG:
+		#ifndef CONFIG_USB_DWC3_HISI
 		INIT_WORK(&dwc->drd_work, __dwc3_set_mode);
 		ret = dwc3_drd_init(dwc);
 		if (ret) {
@@ -964,6 +981,30 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 				dev_err(dev, "failed to initialize dual-role\n");
 			return ret;
 		}
+		#else
+		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_OTG);
+
+		ret = dwc3_otg_init(dwc);
+		if (ret) {
+			dev_err(dev, "failed to initialize otg\n");
+			return ret;
+		}
+
+		ret = dwc3_host_init(dwc);
+		if (ret) {
+			dev_err(dev, "failed to initialize host\n");
+			dwc3_otg_exit(dwc);
+			return ret;
+		}
+
+		ret = dwc3_gadget_init(dwc);
+		if (ret) {
+			dev_err(dev, "failed to initialize gadget\n");
+			dwc3_host_exit(dwc);
+			dwc3_otg_exit(dwc);
+			return ret;
+		}
+		#endif
 		break;
 	default:
 		dev_err(dev, "Unsupported mode of operation %d\n", dwc->dr_mode);
@@ -984,6 +1025,7 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
 		break;
 	case USB_DR_MODE_OTG:
 		dwc3_drd_exit(dwc);
+		dwc3_otg_exit(dwc);
 		break;
 	default:
 		/* do nothing */
@@ -1341,8 +1383,10 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
 	switch (dwc->dr_mode) {
 	case USB_DR_MODE_PERIPHERAL:
 	case USB_DR_MODE_OTG:
+#ifndef CONFIG_USB_DWC3_HISI
 		if (dwc->connected)
 			return -EBUSY;
+#endif
 		break;
 	case USB_DR_MODE_HOST:
 	default:
@@ -1367,6 +1411,7 @@ static int dwc3_runtime_suspend(struct device *dev)
 
 	device_init_wakeup(dev, true);
 
+	pm_runtime_put(dev);
 	return 0;
 }
 
@@ -1393,7 +1438,7 @@ static int dwc3_runtime_resume(struct device *dev)
 	}
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put(dev);
+	pm_runtime_get(dev);
 
 	return 0;
 }
@@ -1461,6 +1506,31 @@ static const struct dev_pm_ops dwc3_dev_pm_ops = {
 			dwc3_runtime_idle)
 };
 
+int dwc3_resume_device(struct dwc3 *dwc)
+{
+	int status;
+
+	pr_info("[%s] +\n", __func__);
+	status = dwc3_runtime_resume(dwc->dev);
+	if (status < 0)
+		pr_err("dwc3_runtime_resume err, status:%d\n", status);
+
+	pr_info("[%s] -\n", __func__);
+	return status;
+}
+
+void dwc3_suspend_device(struct dwc3 *dwc)
+{
+	int status;
+
+	pr_info("[%s] +\n", __func__);
+	status = dwc3_runtime_suspend(dwc->dev);
+	if (status < 0)
+		pr_err("dwc3_runtime_suspend err, status:%d\n", status);
+
+	pr_info("[%s] -\n", __func__);
+}
+
 #ifdef CONFIG_OF
 static const struct of_device_id of_dwc3_match[] = {
 	{
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ea910acb4bb0..3b6dd99daf9a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -750,6 +750,7 @@ struct dwc3_request {
 	unsigned		mapped:1;
 	unsigned		started:1;
 	unsigned		zero:1;
+	unsigned		send_zlp:1;
 };
 
 /*
@@ -980,10 +981,17 @@ struct dwc3 {
 	u8			lpm_nyet_threshold;
 	u8			hird_threshold;
 
+	struct dwc3_otg *dwc_otg;
 	const char		*hsphy_interface;
 
 	unsigned		connected:1;
 	unsigned		delayed_status:1;
+
+	/* the delayed status may come before notready interrupt,
+	 * in this case, don't wait for delayed status
+	 */
+	unsigned		status_queued:1;
+
 	unsigned		ep0_bounced:1;
 	unsigned		ep0_expect_in:1;
 	unsigned		has_hibernation:1;
@@ -1175,7 +1183,7 @@ struct dwc3_gadget_ep_cmd_params {
 /* prototypes */
 void dwc3_set_mode(struct dwc3 *dwc, u32 mode);
 u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type);
-
+void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode);
 /* check whether we are on the DWC_usb3 core */
 static inline bool dwc3_is_usb3(struct dwc3 *dwc)
 {
@@ -1209,6 +1217,8 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state);
 int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 		struct dwc3_gadget_ep_cmd_params *params);
 int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned cmd, u32 param);
+int dwc3_conndone_notifier_register(struct notifier_block *nb);
+int dwc3_conndone_notifier_unregister(struct notifier_block *nb);
 #else
 static inline int dwc3_gadget_init(struct dwc3 *dwc)
 { return 0; }
@@ -1228,6 +1238,10 @@ static inline int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 static inline int dwc3_send_gadget_generic_command(struct dwc3 *dwc,
 		int cmd, u32 param)
 { return 0; }
+static inline int dwc3_conndone_notifier_register(struct notifier_block *nb)
+{ return 0; }
+static inline int dwc3_conndone_notifier_unregister(struct notifier_block *nb)
+{ return 0; }
 #endif
 
 #if IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
@@ -1261,6 +1275,9 @@ static inline void dwc3_gadget_process_pending_events(struct dwc3 *dwc)
 }
 #endif /* !IS_ENABLED(CONFIG_USB_DWC3_HOST) */
 
+int dwc3_resume_device(struct dwc3 *dwc);
+void dwc3_suspend_device(struct dwc3 *dwc);
+
 #if IS_ENABLED(CONFIG_USB_DWC3_ULPI)
 int dwc3_ulpi_init(struct dwc3 *dwc);
 void dwc3_ulpi_exit(struct dwc3 *dwc);
diff --git a/drivers/usb/dwc3/dwc3-hi3660.c b/drivers/usb/dwc3/dwc3-hi3660.c
new file mode 100644
index 000000000000..d8cdc0f7280b
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-hi3660.c
@@ -0,0 +1,310 @@
+/*
+ * dwc3-hi3660.c
+ *
+ * Copyright: (C) 2008-2018 hisilicon.
+ * Contact: wangbinghui<wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
+ *
+ * USB vbus for Hisilicon device
+ *
+ * This software is available to you under a choice of one of two
+ * licenses. You may choose this file to be licensed under the terms
+ * of the GNU General Public License (GPL) Version 2 or the 2-clause
+ * BSD license listed below:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ */
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+
+#include "dwc3-hisi.h"
+
+/*lint -e750 -esym(750,*)*/
+/* clk module will round to 228M */
+#define USB3OTG_ACLK_FREQ		229000000
+#ifndef BIT
+#define BIT(x)	(1 << (x))
+#endif
+#define SCTRL_SCDEEPSLEEPED				0x08
+#define USB_REFCLK_ISO_EN               BIT(25)
+#define PCTRL_PERI_CTRL3                0x10
+#define USB_TCXO_EN						BIT(1)
+#define PERI_CTRL3_MSK_START            (16)
+#define SC_CLK_USB3PHY_3MUX1_SEL        BIT(25)
+
+#define SC_SEL_ABB_BACKUP               BIT(8)
+#define CLKDIV_MASK_START               (16)
+
+#define PERI_CRG_CLKDIV21               0xFC
+
+#define GT_CLK_ABB_BACKUP               BIT(22)
+#define PERI_CRG_CLK_DIS5               0x54
+
+#define PMC_PPLL3CTRL0                  0x048
+#define PPLL3_FBDIV_START               (8)
+#define PPLL3_EN                        BIT(0)
+#define PPLL3_BP                        BIT(1)
+#define PPLL3_LOCK                      BIT(26)
+
+#define PMC_PPLL3CTRL1                  0x04C
+#define PPLL3_INT_MOD                   BIT(24)
+#define GT_CLK_PPLL3                    BIT(26)
+
+#define PERI_CRG_CLK_EN5                0x50
+
+#define SC_USB3PHY_ABB_GT_EN            BIT(15)
+#define REF_SSP_EN                      BIT(16)
+/*lint -e750 +esym(750,*)*/
+
+static int usb3_regu_init(struct hisi_dwc3_device *hisi_dwc3)
+{
+	if (hisi_dwc3->is_regu_on != 0) {
+		usb_dbg("ldo already opened!\n");
+		return 0;
+	}
+
+	hisi_dwc3->is_regu_on = 1;
+
+	return 0;
+}
+
+static int usb3_regu_shutdown(struct hisi_dwc3_device *hisi_dwc3)
+{
+	if (hisi_dwc3->is_regu_on == 0) {
+		usb_dbg("regu already closed!\n");
+		return 0;
+	}
+
+	hisi_dwc3->is_regu_on = 0;
+
+	return 0;
+}
+
+static int usb3_clk_init(struct hisi_dwc3_device *hisi_dwc3)
+{
+	int ret;
+	u32 temp;
+	void __iomem *pctrl_base = hisi_dwc3->pctrl_reg_base;
+	void __iomem *pericfg_base = hisi_dwc3->pericfg_reg_base;
+
+	/* set usb aclk 240MHz to improve performance */
+	ret = clk_set_rate(hisi_dwc3->gt_aclk_usb3otg, USB3OTG_ACLK_FREQ);
+	if (ret)
+		usb_err("usb aclk set rate failed\n");
+
+	ret = clk_prepare_enable(hisi_dwc3->gt_aclk_usb3otg);
+	if (ret) {
+		usb_err("clk_prepare_enable gt_aclk_usb3otg failed\n");
+		return ret;
+	}
+
+	/* usb refclk iso enable */
+	writel(USB_REFCLK_ISO_EN, pericfg_base + PERI_CRG_ISODIS);
+
+	/* enable usb_tcxo_en */
+	writel(USB_TCXO_EN | (USB_TCXO_EN << PERI_CTRL3_MSK_START),
+	       pctrl_base + PCTRL_PERI_CTRL3);
+
+	/* select usbphy clk from abb */
+	temp = readl(pctrl_base + PCTRL_PERI_CTRL24);
+	temp &= ~SC_CLK_USB3PHY_3MUX1_SEL;
+	writel(temp, pctrl_base + PCTRL_PERI_CTRL24);
+
+	/* open clk gate */
+	writel(GT_CLK_USB3OTG_REF | GT_ACLK_USB3OTG,
+	       pericfg_base + PERI_CRG_CLK_EN4);
+
+	ret = clk_prepare_enable(hisi_dwc3->clk);
+	if (ret) {
+		usb_err("clk_prepare_enable clk failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void usb3_clk_shutdown(struct hisi_dwc3_device *hisi_dwc3)
+{
+	u32 temp;
+	void __iomem *pctrl_base = hisi_dwc3->pctrl_reg_base;
+	void __iomem *pericfg_base = hisi_dwc3->pericfg_reg_base;
+
+	writel(GT_CLK_USB3OTG_REF | GT_ACLK_USB3OTG,
+	       pericfg_base + PERI_CRG_CLK_DIS4);
+
+	temp = readl(pctrl_base + PCTRL_PERI_CTRL24);
+	temp &= ~SC_CLK_USB3PHY_3MUX1_SEL;
+	writel(temp, pctrl_base + PCTRL_PERI_CTRL24);
+
+	/* disable usb_tcxo_en */
+	writel(0 | (USB_TCXO_EN << PERI_CTRL3_MSK_START),
+	       pctrl_base + PCTRL_PERI_CTRL3);
+
+	clk_disable_unprepare(hisi_dwc3->clk);
+	clk_disable_unprepare(hisi_dwc3->gt_aclk_usb3otg);
+
+	msleep(20);
+}
+
+static void dwc3_release(struct hisi_dwc3_device *hisi_dwc3)
+{
+	u32 temp;
+	void __iomem *pericfg_base = hisi_dwc3->pericfg_reg_base;
+	void __iomem *otg_bc_base = hisi_dwc3->otg_bc_reg_base;
+
+	/* dis-reset the module */
+	writel(IP_RST_USB3OTG_MUX | IP_RST_USB3OTG_AHBIF | IP_RST_USB3OTG_32K,
+	       pericfg_base + PERI_CRG_RSTDIS4);
+
+	/* reset phy */
+	writel(IP_RST_USB3OTGPHY_POR | IP_RST_USB3OTG,
+	       pericfg_base + PERI_CRG_RSTEN4);
+
+	/* enable phy ref clk */
+	temp = readl(otg_bc_base + USBOTG3_CTRL0);
+	temp |= SC_USB3PHY_ABB_GT_EN;
+	writel(temp, otg_bc_base + USBOTG3_CTRL0);
+
+	temp = readl(otg_bc_base + USBOTG3_CTRL7);
+	temp |= REF_SSP_EN;
+	writel(temp, otg_bc_base + USBOTG3_CTRL7);
+
+	/* exit from IDDQ mode */
+	temp = readl(otg_bc_base + USBOTG3_CTRL2);
+	temp &= ~(USBOTG3CTRL2_POWERDOWN_HSP | USBOTG3CTRL2_POWERDOWN_SSP);
+	writel(temp, otg_bc_base + USBOTG3_CTRL2);
+
+	usleep_range(100, 120);
+
+	/* dis-reset phy */
+	writel(IP_RST_USB3OTGPHY_POR, pericfg_base + PERI_CRG_RSTDIS4);
+
+	/* dis-reset controller */
+	writel(IP_RST_USB3OTG, pericfg_base + PERI_CRG_RSTDIS4);
+
+	msleep(20);
+
+	/* fake vbus valid signal */
+	temp = readl(otg_bc_base + USBOTG3_CTRL3);
+	temp |= (USBOTG3_CTRL3_VBUSVLDEXT | USBOTG3_CTRL3_VBUSVLDEXTSEL);
+	writel(temp, otg_bc_base + USBOTG3_CTRL3);
+
+	usleep_range(100, 120);
+}
+
+static void dwc3_reset(struct hisi_dwc3_device *hisi_dwc3)
+{
+	void __iomem *pericfg_base = hisi_dwc3->pericfg_reg_base;
+
+	writel(IP_RST_USB3OTG, pericfg_base + PERI_CRG_RSTEN4);
+	writel(IP_RST_USB3OTGPHY_POR, pericfg_base + PERI_CRG_RSTEN4);
+	writel(IP_RST_USB3OTG_MUX | IP_RST_USB3OTG_AHBIF | IP_RST_USB3OTG_32K,
+	       pericfg_base + PERI_CRG_RSTEN4);
+}
+
+static int hi3660_usb3phy_init(struct hisi_dwc3_device *hisi_dwc3)
+{
+	int ret;
+
+	usb_dbg("+\n");
+
+	ret = usb3_regu_init(hisi_dwc3);
+	if (ret)
+		return ret;
+
+	ret = usb3_clk_init(hisi_dwc3);
+	if (ret)
+		return ret;
+
+	dwc3_release(hisi_dwc3);
+	config_femtophy_param(hisi_dwc3);
+
+	set_hisi_dwc3_power_flag(1);
+
+	usb_dbg("-\n");
+
+	return 0;
+}
+
+static int hi3660_usb3phy_shutdown(struct hisi_dwc3_device *hisi_dwc3)
+{
+	int ret;
+
+	usb_dbg("+\n");
+
+	set_hisi_dwc3_power_flag(0);
+
+	dwc3_reset(hisi_dwc3);
+	usb3_clk_shutdown(hisi_dwc3);
+
+	ret = usb3_regu_shutdown(hisi_dwc3);
+	if (ret)
+		return ret;
+
+	usb_dbg("-\n");
+
+	return 0;
+}
+
+static struct usb3_phy_ops hi3660_phy_ops = {
+	.init		= hi3660_usb3phy_init,
+	.shutdown	= hi3660_usb3phy_shutdown,
+};
+
+static int dwc3_hi3660_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+
+	ret = hisi_dwc3_probe(pdev, &hi3660_phy_ops);
+	if (ret)
+		usb_err("probe failed, ret=[%d]\n", ret);
+
+	return ret;
+}
+
+static int dwc3_hi3660_remove(struct platform_device *pdev)
+{
+	int ret = 0;
+
+	ret = hisi_dwc3_remove(pdev);
+	if (ret)
+		usb_err("hisi_dwc3_remove failed, ret=[%d]\n", ret);
+
+	return ret;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id dwc3_hi3660_match[] = {
+	{ .compatible = "hisilicon,hi3660-dwc3" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dwc3_hi3660_match);
+#else
+#define dwc3_hi3660_match NULL
+#endif
+
+static struct platform_driver dwc3_hi3660_driver = {
+	.probe		= dwc3_hi3660_probe,
+	.remove		= dwc3_hi3660_remove,
+	.driver		= {
+		.name	= "usb3-hi3660",
+		.of_match_table = of_match_ptr(dwc3_hi3660_match),
+		.pm	= HISI_DWC3_PM_OPS,
+	},
+};
+
+module_platform_driver(dwc3_hi3660_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("DesignWare USB3 HI3660 Glue Layer");
+MODULE_AUTHOR("wangbinghui<wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>");
diff --git a/drivers/usb/dwc3/dwc3-hisi.c b/drivers/usb/dwc3/dwc3-hisi.c
new file mode 100644
index 000000000000..f62921ca41d3
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-hisi.c
@@ -0,0 +1,1972 @@
+/*
+ * hisi_usb_vbus.c
+ *
+ * Copyright: (C) 2008-2018 hisilicon.
+ * Contact: wangbinghui<wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
+ *
+ * USB vbus for Hisilicon device
+ *
+ * This software is available to you under a choice of one of two
+ * licenses. You may choose this file to be licensed under the terms
+ * of the GNU General Public License (GPL) Version 2 or the 2-clause
+ * BSD license listed below:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/pm_runtime.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/io.h>
+#include <linux/of_gpio.h>
+#include <linux/usb/ch9.h>
+
+#include "dwc3-hisi.h"
+#include "core.h"
+#include "dwc3-otg.h"
+
+#define ENABLE_USB_TEST_PORT
+
+#define BC_AGAIN_DELAY_TIME 8000 /* ms */
+
+struct hisi_dwc3_device *hisi_dwc3_dev;
+atomic_t hisi_dwc3_power_on = ATOMIC_INIT(0);
+
+void set_hisi_dwc3_power_flag(int val)
+{
+	unsigned long flags;
+	struct dwc3 *dwc = NULL;
+
+	if (dwc_otg_handler && dwc_otg_handler->dwc) {
+		dwc = dwc_otg_handler->dwc;
+		spin_lock_irqsave(&dwc->lock, flags);
+		usb_dbg("get dwc3 lock\n");
+	}
+
+	atomic_set(&hisi_dwc3_power_on, val);
+	usb_dbg("set hisi_dwc3_power_flag %d\n", val);
+
+	if (dwc) {
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		usb_dbg("put dwc3 lock\n");
+	}
+}
+
+#ifdef ENABLE_USB_TEST_PORT
+
+static ssize_t plugusb_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct hisi_dwc3_device *hisi_dwc3 = platform_get_drvdata(pdev);
+	char *s;
+
+	if (!hisi_dwc3) {
+		usb_err("hisi_dwc3 NULL\n");
+		return scnprintf(buf, PAGE_SIZE, "hisi_dwc3 NULL\n");
+	}
+
+	switch (hisi_dwc3->state) {
+	case USB_STATE_UNKNOWN:
+		s = "USB_STATE_UNKNOWN";
+		break;
+	case USB_STATE_OFF:
+		s = "USB_STATE_OFF";
+		break;
+	case USB_STATE_DEVICE:
+		s = "USB_STATE_DEVICE";
+		break;
+	case USB_STATE_HOST:
+		s = "USB_STATE_HOST";
+		break;
+	default:
+		s = "unknown";
+		break;
+	}
+	return scnprintf(buf, PAGE_SIZE, "current state: %s\n usage: %s\n", s,
+			 "echo hoston/hostoff/deviceon/deviceoff > plugusb\n");
+}
+
+static ssize_t plugusb_store(struct device *dev,
+			     struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	if (!strncmp(buf, "hoston", strlen("hoston")))
+		hisi_usb_otg_event(ID_FALL_EVENT);
+	else if (!strncmp(buf, "hostoff", strlen("hostoff")))
+		hisi_usb_otg_event(ID_RISE_EVENT);
+	else if (!strncmp(buf, "deviceon", strlen("deviceon")))
+		hisi_usb_otg_event(CHARGER_CONNECT_EVENT);
+	else if (!strncmp(buf, "deviceoff", strlen("deviceoff")))
+		hisi_usb_otg_event(CHARGER_DISCONNECT_EVENT);
+	else
+		usb_err("input state is ilegal!\n");
+
+	/* added for show message of plugusb status to com port */
+	pr_err("[USB.plugusb] %s\n", buf);
+
+	return size;
+}
+
+/*lint -save -e750 */
+DEVICE_ATTR(plugusb, (0644), plugusb_show, plugusb_store);
+/*lint -restore */
+
+static const char * const charger_type_array[] = {
+	[CHARGER_TYPE_SDP]     = "sdp",       /* Standard Downstreame Port */
+	[CHARGER_TYPE_CDP]     = "cdp",       /* Charging Downstreame Port */
+	[CHARGER_TYPE_DCP]     = "dcp",       /* Dedicate Charging Port */
+	[CHARGER_TYPE_UNKNOWN] = "unknown",   /* non-standard */
+	[CHARGER_TYPE_NONE]    = "none",      /* not connected */
+	[PLEASE_PROVIDE_POWER] = "provide"   /* host mode, provide power */
+};
+
+static enum hisi_charger_type get_charger_type_from_str(const char *buf,
+							size_t size)
+{
+	int i = 0;
+	enum hisi_charger_type ret = CHARGER_TYPE_NONE;
+
+	for (i = 0; i < sizeof(charger_type_array) /
+	     sizeof(charger_type_array[0]); i++) {
+		if (!strncmp(buf, charger_type_array[i], size - 1)) {
+			ret = (enum hisi_charger_type)i;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+ssize_t hiusb_do_charger_show(void *dev_data, char *buf, size_t size)
+{
+	struct hisi_dwc3_device *hisi_dwc = (struct hisi_dwc3_device *)dev_data;
+	enum hisi_charger_type charger_type = CHARGER_TYPE_NONE;
+
+	if (!hisi_dwc) {
+		pr_err("platform_get_drvdata return null\n");
+		return scnprintf(buf, size,
+				 "platform_get_drvdata return null\n");
+	}
+
+	mutex_lock(&hisi_dwc->lock);
+	charger_type = hisi_dwc->charger_type;
+	mutex_unlock(&hisi_dwc->lock);
+
+	return scnprintf(buf, size, "[(%d):Charger type = %s]\n"
+			 "----------------------------------------------------------------\n"
+			 "usage: echo {str} > chargertest\n"
+			 "       sdp:        Standard Downstreame Port\n"
+			 "       cdp:        Charging Downstreame Port\n"
+			 "       dcp:        Dedicate Charging Port\n"
+			 "       unknown:    non-standard\n"
+			 "       none:       not connected\n"
+			 "       provide:    host mode, provide power\n"
+			 , charger_type, charger_type_array[charger_type]);
+}
+
+int hiusb_get_eyepattern_param(void *dev_data, char *buf, size_t len)
+{
+	struct hisi_dwc3_device *hisi_dwc = (struct hisi_dwc3_device *)dev_data;
+	int ret = 0;
+
+	if (hisi_dwc) {
+		ret = scnprintf(buf, len, "device:0x%x\nhost:0x%x\n",
+				hisi_dwc->eye_diagram_param,
+				hisi_dwc->eye_diagram_host_param);
+	} else {
+		usb_err("hisi_dwc NULL\n");
+		ret = scnprintf(buf, len, "hisi_dwc NULL\n");
+	}
+
+	return ret;
+}
+
+int hiusb_set_eyepattern_param(void *dev_data, const char *buf, size_t size)
+{
+	struct hisi_dwc3_device *hisi_dwc = (struct hisi_dwc3_device *)dev_data;
+	int eye_diagram_param;
+
+	if (!hisi_dwc) {
+		pr_err("seteye: hisi_dwc is null\n");
+		return size;
+	}
+
+	if (sscanf(buf, "%32x", &eye_diagram_param) != 1)
+		return size;
+
+	hisi_dwc->eye_diagram_param = eye_diagram_param;
+	hisi_dwc->eye_diagram_host_param = eye_diagram_param;
+
+	return size;
+}
+
+static void notify_charger_type(struct hisi_dwc3_device *hisi_dwc3);
+ssize_t hiusb_do_charger_store(void *dev_data, const char *buf, size_t size)
+{
+	struct hisi_dwc3_device *hisi_dwc = (struct hisi_dwc3_device *)dev_data;
+	enum hisi_charger_type charger_type =
+		get_charger_type_from_str(buf, size);
+
+	if (!hisi_dwc) {
+		pr_err("platform_get_drvdata return null\n");
+		return size;
+	}
+
+	mutex_lock(&hisi_dwc->lock);
+	hisi_dwc->charger_type = charger_type;
+	notify_charger_type(hisi_dwc);
+	mutex_unlock(&hisi_dwc->lock);
+
+	return size;
+}
+
+#ifdef CONFIG_HISI_DEBUG_FS
+static ssize_t fakecharger_show(void *dev_data, char *buf, size_t size)
+{
+	struct hisi_dwc3_device *hisi_dwc = (struct hisi_dwc3_device *)dev_data;
+
+	if (!hisi_dwc) {
+		pr_err("platform_get_drvdata return null\n");
+		return scnprintf(buf, size,
+				 "platform_get_drvdata return null\n");
+	}
+
+	return scnprintf(buf, size, "[fake charger type: %s]\n",
+			 hisi_dwc->fake_charger_type == CHARGER_TYPE_NONE ?
+			 "not fake" :
+			 charger_type_array[hisi_dwc->fake_charger_type]);
+}
+
+static ssize_t fakecharger_store(void *dev_data, const char *buf, size_t size)
+{
+	struct hisi_dwc3_device *hisi_dwc = (struct hisi_dwc3_device *)dev_data;
+	enum hisi_charger_type charger_type =
+		get_charger_type_from_str(buf, size);
+
+	if (!hisi_dwc) {
+		pr_err("platform_get_drvdata return null\n");
+		return size;
+	}
+
+	mutex_lock(&hisi_dwc->lock);
+	hisi_dwc->fake_charger_type = charger_type;
+	mutex_unlock(&hisi_dwc->lock);
+
+	return size;
+}
+#endif
+ssize_t hiusb_do_eventmask_show(void *dev_data, char *buf, size_t size)
+{
+	struct hisi_dwc3_device *hisi_dwc = (struct hisi_dwc3_device *)dev_data;
+
+	if (!hisi_dwc) {
+		pr_err("platform_get_drvdata return null\n");
+		return scnprintf(buf, size,
+				 "platform_get_drvdata return null\n");
+	}
+
+	return scnprintf(buf, size, "%d\n", hisi_dwc->eventmask);
+}
+
+ssize_t hiusb_do_eventmask_store(void *dev_data, const char *buf, size_t size)
+{
+	int eventmask;
+	struct hisi_dwc3_device *hisi_dwc = (struct hisi_dwc3_device *)dev_data;
+
+	if (!hisi_dwc) {
+		pr_err("platform_get_drvdata return null\n");
+		return size;
+	}
+
+	if (sscanf(buf, "%1d", &eventmask) != 1)
+		return size;
+
+	hisi_dwc->eventmask = eventmask;
+
+	return size;
+}
+
+static struct device_attribute *hisi_dwc3_attributes[] = {
+	&dev_attr_plugusb,
+	NULL
+};
+
+static int create_attr_file(struct device *dev)
+{
+	struct device_attribute **attrs = hisi_dwc3_attributes;
+	struct device_attribute *attr;
+	struct class *hisi_usb_class;
+	struct device *hisi_usb_dev;
+	int i;
+	int ret = 0;
+
+	usb_dbg("+\n");
+	for (i = 0; attrs[i]; i++) {
+		attr = attrs[i];
+		ret = device_create_file(dev, attr);
+		if (ret) {
+			dev_err(dev, "create attr file error!\n");
+			goto err;
+		}
+	}
+
+	hisi_usb_class = class_create(THIS_MODULE, "hisi_usb_class");
+	if (IS_ERR(hisi_usb_class)) {
+		usb_dbg("create hisi_usb_class error!\n");
+	} else {
+		hisi_usb_dev = device_create(hisi_usb_class, NULL, 0,
+					     NULL, "hisi_usb_dev");
+		if (IS_ERR(hisi_usb_dev))
+			usb_dbg("create hisi_usb_dev error!\n");
+		else
+			ret |= sysfs_create_link(&hisi_usb_dev->kobj,
+						 &dev->kobj, "interface");
+	}
+	if (ret)
+		usb_dbg("create attr file error!\n");
+
+#ifdef CONFIG_HISI_DEBUG_FS
+	hiusb_debug_quick_register(
+			platform_get_drvdata(to_platform_device(dev)),
+			(hiusb_debug_show_ops)fakecharger_show,
+			(hiusb_debug_store_ops)fakecharger_store);
+	hiusb_debug_init(platform_get_drvdata(to_platform_device(dev)));
+#endif
+
+	usb_dbg("-\n");
+	return 0;
+
+err:
+	for (i-- ; i >= 0; i--) {
+		attr = attrs[i];
+		device_remove_file(dev, attr);
+	}
+
+	return ret;
+}
+
+static void remove_attr_file(struct device *dev)
+{
+	struct device_attribute **attrs = hisi_dwc3_attributes;
+	struct device_attribute *attr;
+
+	while ((attr = *attrs++))
+		device_remove_file(dev, attr);
+}
+#else
+static inline int create_attr_file(struct device *dev)
+{
+	return 0;
+}
+
+static inline void remove_attr_file(struct device *dev) {}
+#endif
+
+static void phy_cr_wait_ack(void __iomem *otg_bc_base)
+{
+	int i = 1000;
+
+	while (1) {
+		if ((readl(otg_bc_base + USB3PHY_CR_STS) &
+		    USB3OTG_PHY_CR_ACK) == 1)
+			break;
+		usleep_range(50, 60);
+		if (i-- < 0) {
+			usb_err("wait phy_cr_ack timeout!\n");
+			break;
+		}
+	}
+}
+
+static void phy_cr_set_addr(void __iomem *otg_bc_base, u32 addr)
+{
+	u32 reg;
+
+	/* set addr */
+	reg = USB3OTG_PHY_CR_DATA_IN(addr);
+	writel(reg, otg_bc_base + USB3PHY_CR_CTRL);
+
+	usleep_range(100, 120);
+
+	/* cap addr */
+	reg = readl(otg_bc_base + USB3PHY_CR_CTRL);
+	reg |= USB3OTG_PHY_CR_CAP_ADDR;
+	writel(reg, otg_bc_base + USB3PHY_CR_CTRL);
+
+	phy_cr_wait_ack(otg_bc_base);
+
+	/* clear ctrl reg */
+	writel(0, otg_bc_base + USB3PHY_CR_CTRL);
+}
+
+static u16 phy_cr_read(void __iomem *otg_bc_base, u32 addr)
+{
+	u32 reg;
+	int i = 1000;
+
+	phy_cr_set_addr(otg_bc_base, addr);
+
+	/* read cap */
+	writel(USB3OTG_PHY_CR_READ, otg_bc_base + USB3PHY_CR_CTRL);
+
+	usleep_range(100, 120);
+
+	while (1) {
+		reg = readl(otg_bc_base + USB3PHY_CR_STS);
+		if ((reg & USB3OTG_PHY_CR_ACK) == 1)
+			break;
+		usleep_range(50, 60);
+		if (i-- < 0) {
+			usb_err("wait phy_cr_ack timeout!\n");
+			break;
+		}
+	}
+
+	/* clear ctrl reg */
+	writel(0, otg_bc_base + USB3PHY_CR_CTRL);
+
+	return (u16)USB3OTG_PHY_CR_DATA_OUT(reg);
+}
+
+static void phy_cr_write(void __iomem *otg_bc_base, u32 addr, u32 value)
+{
+	u32 reg;
+
+	phy_cr_set_addr(otg_bc_base, addr);
+
+	reg = USB3OTG_PHY_CR_DATA_IN(value);
+	writel(reg, otg_bc_base + USB3PHY_CR_CTRL);
+
+	/* cap data */
+	reg = readl(otg_bc_base + USB3PHY_CR_CTRL);
+	reg |= USB3OTG_PHY_CR_CAP_DATA;
+	writel(reg, otg_bc_base + USB3PHY_CR_CTRL);
+
+	/* wait ack */
+	phy_cr_wait_ack(otg_bc_base);
+
+	/* clear ctrl reg */
+	writel(0, otg_bc_base + USB3PHY_CR_CTRL);
+
+	reg = USB3OTG_PHY_CR_WRITE;
+	writel(reg, otg_bc_base + USB3PHY_CR_CTRL);
+
+	/* wait ack */
+	phy_cr_wait_ack(otg_bc_base);
+}
+
+void set_usb3_phy_cr_param(u32 addr, u32 value)
+{
+	if (!hisi_dwc3_dev) {
+		pr_err("hisi dwc3 device not ready!\n");
+		return;
+	}
+
+	phy_cr_write(hisi_dwc3_dev->otg_bc_reg_base, addr, value);
+}
+EXPORT_SYMBOL_GPL(set_usb3_phy_cr_param);
+
+void read_usb3_phy_cr_param(u32 addr)
+{
+	if (!hisi_dwc3_dev) {
+		pr_err("hisi dwc3 device not ready!\n");
+		return;
+	}
+
+	usb_dbg("read usb3 phy cr param 0x%x\n",
+		phy_cr_read(hisi_dwc3_dev->otg_bc_reg_base, addr));
+}
+EXPORT_SYMBOL_GPL(read_usb3_phy_cr_param);
+
+void config_femtophy_param(struct hisi_dwc3_device *hisi_dwc)
+{
+	u32 reg;
+	void __iomem *otg_bc_base = hisi_dwc->otg_bc_reg_base;
+
+	if (hisi_dwc->fpga_flag != 0)
+		return;
+
+	/* set high speed phy parameter */
+	if (hisi_dwc->host_flag) {
+		writel(hisi_dwc->eye_diagram_host_param,
+		       otg_bc_base + USBOTG3_CTRL4);
+		usb_dbg("set hs phy param 0x%x for host\n",
+			readl(otg_bc_base + USBOTG3_CTRL4));
+	} else {
+		writel(hisi_dwc->eye_diagram_param,
+		       otg_bc_base + USBOTG3_CTRL4);
+		usb_dbg("set hs phy param 0x%x for device\n",
+			readl(otg_bc_base + USBOTG3_CTRL4));
+	}
+
+	/* set usb3 phy cr config for usb3.0 */
+
+	if (hisi_dwc->host_flag) {
+		phy_cr_write(otg_bc_base, DWC3_PHY_RX_OVRD_IN_HI,
+			     hisi_dwc->usb3_phy_host_cr_param);
+	} else {
+		phy_cr_write(otg_bc_base, DWC3_PHY_RX_OVRD_IN_HI,
+			     hisi_dwc->usb3_phy_cr_param);
+	}
+
+	usb_dbg("set ss phy rx equalization 0x%x\n",
+		phy_cr_read(otg_bc_base, DWC3_PHY_RX_OVRD_IN_HI));
+
+	/* enable RX_SCOPE_LFPS_EN for usb3.0 */
+	reg = phy_cr_read(otg_bc_base, DWC3_PHY_RX_SCOPE_VDCC);
+	reg |= RX_SCOPE_LFPS_EN;
+	phy_cr_write(otg_bc_base, DWC3_PHY_RX_SCOPE_VDCC, reg);
+
+	usb_dbg("set ss RX_SCOPE_VDCC 0x%x\n",
+		phy_cr_read(otg_bc_base, DWC3_PHY_RX_SCOPE_VDCC));
+
+	reg = readl(otg_bc_base + USBOTG3_CTRL6);
+	reg &= ~TX_VBOOST_LVL_MASK;
+	reg |= TX_VBOOST_LVL(hisi_dwc->usb3_phy_tx_vboost_lvl);
+	writel(reg, otg_bc_base + USBOTG3_CTRL6);
+	usb_dbg("set ss phy tx vboost lvl 0x%x\n",
+		readl(otg_bc_base + USBOTG3_CTRL6));
+}
+
+int hisi_charger_type_notifier_register(struct notifier_block *nb)
+{
+	if (!hisi_dwc3_dev) {
+		pr_err("hisi dwc3 device not ready!\n");
+		return -EBUSY;
+	}
+	if (!nb)
+		return -EINVAL;
+	return atomic_notifier_chain_register(
+			&hisi_dwc3_dev->charger_type_notifier, nb);
+}
+EXPORT_SYMBOL_GPL(hisi_charger_type_notifier_register);
+
+int hisi_charger_type_notifier_unregister(struct notifier_block *nb)
+{
+	if (!hisi_dwc3_dev) {
+		pr_err("hisi dwc3 device not ready!\n");
+		return -EBUSY;
+	}
+	if (!nb)
+		return -EINVAL;
+	return atomic_notifier_chain_unregister(
+			&hisi_dwc3_dev->charger_type_notifier,
+			nb);
+}
+EXPORT_SYMBOL_GPL(hisi_charger_type_notifier_unregister);
+
+/* BC1.2 Spec:
+ * If a PD detects that D+ is greater than VDAT_REF, it knows that it is
+ * attached to a DCP. It is then required to enable VDP_SRC or pull D+
+ * to VDP_UP through RDP_UP
+ */
+static void disable_vdp_src(struct hisi_dwc3_device *hisi_dwc3)
+{
+	void __iomem *base = hisi_dwc3->otg_bc_reg_base;
+	u32 reg;
+
+	usb_dbg("diaable VDP_SRC\n");
+
+	reg = readl(base + BC_CTRL2);
+	reg &= ~(BC_CTRL2_BC_PHY_VDATARCENB | BC_CTRL2_BC_PHY_VDATDETENB);
+	writel(reg, base + BC_CTRL2);
+
+	reg = readl(base + BC_CTRL0);
+	reg |= BC_CTRL0_BC_SUSPEND_N;
+	writel(reg, base + BC_CTRL0);
+
+	writel((readl(base + BC_CTRL1) & ~BC_CTRL1_BC_MODE), base + BC_CTRL1);
+}
+
+static void enable_vdp_src(struct hisi_dwc3_device *hisi_dwc3)
+{
+	void __iomem *base = hisi_dwc3->otg_bc_reg_base;
+	u32 reg;
+
+	reg = readl(base + BC_CTRL2);
+	reg &= ~BC_CTRL2_BC_PHY_CHRGSEL;
+	reg |= (BC_CTRL2_BC_PHY_VDATARCENB | BC_CTRL2_BC_PHY_VDATDETENB);
+	writel(reg, base + BC_CTRL2);
+}
+
+static enum hisi_charger_type detect_charger_type(struct hisi_dwc3_device
+				*hisi_dwc3)
+{
+	enum hisi_charger_type type = CHARGER_TYPE_NONE;
+	void __iomem *base = hisi_dwc3->otg_bc_reg_base;
+	u32 reg;
+	unsigned long jiffies_expire;
+	int i = 0;
+
+	if (hisi_dwc3->fpga_flag) {
+		usb_dbg("this is fpga platform, charger is SDP\n");
+		return CHARGER_TYPE_SDP;
+	}
+
+	if (hisi_dwc3->fake_charger_type != CHARGER_TYPE_NONE) {
+		usb_dbg("fake type: %d\n", hisi_dwc3->fake_charger_type);
+		return hisi_dwc3->fake_charger_type;
+	}
+
+	writel(BC_CTRL1_BC_MODE, base + BC_CTRL1);
+
+	/* phy suspend */
+	reg = readl(base + BC_CTRL0);
+	reg &= ~BC_CTRL0_BC_SUSPEND_N;
+	writel(reg, base + BC_CTRL0);
+
+	/* enable DCD */
+	reg = readl(base + BC_CTRL2);
+	reg |= BC_CTRL2_BC_PHY_DCDENB;
+	writel(reg, base + BC_CTRL2);
+
+	reg = readl(base + BC_CTRL0);
+	reg |= BC_CTRL0_BC_DMPULLDOWN;
+	writel(reg, base + BC_CTRL0);
+
+	jiffies_expire = jiffies + msecs_to_jiffies(900);
+	msleep(50);
+	while (1) {
+		reg = readl(base + BC_STS0);
+		if ((reg & BC_STS0_BC_PHY_FSVPLUS) == 0) {
+			i++;
+			if (i >= 10)
+				break;
+		} else {
+			i = 0;
+		}
+
+		msleep(20);
+
+		if (time_after(jiffies, jiffies_expire)) {
+			usb_dbg("DCD timeout!\n");
+			type = CHARGER_TYPE_UNKNOWN;
+			break;
+		}
+	}
+
+	reg = readl(base + BC_CTRL0);
+	reg &= ~BC_CTRL0_BC_DMPULLDOWN;
+	writel(reg, base + BC_CTRL0);
+
+	/* disable DCD */
+	reg = readl(base + BC_CTRL2);
+	reg &= ~BC_CTRL2_BC_PHY_DCDENB;
+	writel(reg, base + BC_CTRL2);
+
+	usb_dbg("DCD done\n");
+
+	if (type == CHARGER_TYPE_NONE) {
+		/* enable vdect */
+		reg = readl(base + BC_CTRL2);
+		reg &= ~BC_CTRL2_BC_PHY_CHRGSEL;
+		reg |= (BC_CTRL2_BC_PHY_VDATARCENB |
+			BC_CTRL2_BC_PHY_VDATDETENB);
+		writel(reg, base + BC_CTRL2);
+
+		msleep(20);
+
+		/* we can detect sdp or cdp dcp */
+		reg = readl(base + BC_STS0);
+		if ((reg & BC_STS0_BC_PHY_CHGDET) == 0)
+			type = CHARGER_TYPE_SDP;
+
+		/* disable vdect */
+		reg = readl(base + BC_CTRL2);
+		reg &= ~(BC_CTRL2_BC_PHY_VDATARCENB |
+			 BC_CTRL2_BC_PHY_VDATDETENB);
+		writel(reg, base + BC_CTRL2);
+	}
+
+	usb_dbg("Primary Detection done\n");
+
+	if (type == CHARGER_TYPE_NONE) {
+		/* enable vdect */
+		reg = readl(base + BC_CTRL2);
+		reg |= (BC_CTRL2_BC_PHY_VDATARCENB | BC_CTRL2_BC_PHY_VDATDETENB
+				| BC_CTRL2_BC_PHY_CHRGSEL);
+		writel(reg, base + BC_CTRL2);
+
+		msleep(20);
+
+		/* we can detect sdp or cdp dcp */
+		reg = readl(base + BC_STS0);
+		if ((reg & BC_STS0_BC_PHY_CHGDET) == 0)
+			type = CHARGER_TYPE_CDP;
+		else
+			type = CHARGER_TYPE_DCP;
+
+		/* disable vdect */
+		reg = readl(base + BC_CTRL2);
+		reg &= ~(BC_CTRL2_BC_PHY_VDATARCENB | BC_CTRL2_BC_PHY_VDATDETENB
+				| BC_CTRL2_BC_PHY_CHRGSEL);
+		writel(reg, base + BC_CTRL2);
+	}
+
+	usb_dbg("Secondary Detection done\n");
+
+	/* If a PD detects that D+ is greater than VDAT_REF, it knows that it is
+	 * attached to a DCP. It is then required to enable VDP_SRC or pull D+
+	 * to VDP_UP through RDP_UP
+	 */
+	if (type == CHARGER_TYPE_DCP) {
+		usb_dbg("charger is DCP, enable VDP_SRC\n");
+		enable_vdp_src(hisi_dwc3);
+	} else {
+		/* bc_suspend = 1, nomal mode */
+		reg = readl(base + BC_CTRL0);
+		reg |= BC_CTRL0_BC_SUSPEND_N;
+		writel(reg, base + BC_CTRL0);
+
+		msleep(20);
+
+		/* disable BC */
+		writel((readl(base + BC_CTRL1) & ~BC_CTRL1_BC_MODE),
+		       base + BC_CTRL1);
+	}
+
+	usb_dbg("type: %d\n", type);
+
+	return type;
+}
+
+enum hisi_charger_type hisi_get_charger_type(void)
+{
+	if (!hisi_dwc3_dev) {
+		pr_err("[%s]hisi_dwc3 not yet probed!\n", __func__);
+		return CHARGER_TYPE_NONE;
+	}
+
+	pr_info("[%s]type: %d\n", __func__, hisi_dwc3_dev->charger_type);
+	return hisi_dwc3_dev->charger_type;
+}
+EXPORT_SYMBOL_GPL(hisi_get_charger_type);
+
+static void notify_charger_type(struct hisi_dwc3_device *hisi_dwc3)
+{
+	atomic_notifier_call_chain(&hisi_dwc3->charger_type_notifier,
+				   hisi_dwc3->charger_type, hisi_dwc3);
+}
+
+static void set_vbus_power(struct hisi_dwc3_device *hisi_dwc3,
+			   unsigned int is_on)
+{
+	enum hisi_charger_type new;
+
+	if (is_on == 0)
+		new = CHARGER_TYPE_NONE;
+	else
+		new = PLEASE_PROVIDE_POWER;
+	if (hisi_dwc3->charger_type != new) {
+		usb_dbg("set port power %d\n", is_on);
+		hisi_dwc3->charger_type = new;
+		notify_charger_type(hisi_dwc3);
+	}
+}
+
+static void hisi_dwc3_wake_lock(struct hisi_dwc3_device *hisi_dwc3)
+{
+	if (!(hisi_dwc3->ws.active)) {
+		usb_dbg("usb otg wake lock\n");
+		__pm_stay_awake(&hisi_dwc3->ws);
+	}
+}
+
+static void hisi_dwc3_wake_unlock(struct hisi_dwc3_device *hisi_dwc3)
+{
+	if (hisi_dwc3->ws.active) {
+		usb_dbg("usb otg wake unlock\n");
+		__pm_relax(&hisi_dwc3->ws);
+	}
+}
+
+static inline bool enumerate_allowed(struct hisi_dwc3_device *hisi_dwc)
+{
+	/* do not start peripheral if real charger connected */
+	return ((hisi_dwc->charger_type == CHARGER_TYPE_SDP) ||
+		(hisi_dwc->charger_type == CHARGER_TYPE_CDP) ||
+		(hisi_dwc->charger_type == CHARGER_TYPE_UNKNOWN));
+}
+
+static inline bool sleep_allowed(struct hisi_dwc3_device *hisi_dwc)
+{
+	return ((hisi_dwc->charger_type == CHARGER_TYPE_DCP) ||
+		(hisi_dwc->charger_type == CHARGER_TYPE_UNKNOWN));
+}
+
+/*
+ * create event queue
+ * event_queue: event queue handle
+ * count: set the queue max node
+ */
+int event_queue_creat(struct hiusb_event_queue *event_queue, unsigned int count)
+{
+	if (!event_queue) {
+		pr_err(" %s bad argument (0x%p)\n",
+		       __func__, event_queue);
+		return -EINVAL;
+	}
+
+	count = (count >= MAX_EVENT_COUNT ? MAX_EVENT_COUNT : count);
+	event_queue->max_event = count;
+	event_queue->num_event = (count >= EVENT_QUEUE_UNIT ?
+				  EVENT_QUEUE_UNIT : count);
+
+	event_queue->event = kzalloc(
+			(event_queue->num_event *
+			sizeof(enum otg_dev_event_type)), GFP_KERNEL);
+	if (!event_queue->event) {
+		pr_err(" %s :Can't alloc space:%d!\n",
+		       __func__, event_queue->num_event);
+		return -ENOMEM;
+	}
+
+	event_queue->enpos = 0;
+	event_queue->depos = 0;
+	event_queue->overlay = 0;
+	event_queue->overlay_index = 0;
+
+	return 0;
+}
+
+void event_queue_destroy(struct hiusb_event_queue *event_queue)
+{
+	if (!event_queue)
+		return;
+
+	kfree(event_queue->event);
+	event_queue->event = NULL;
+	event_queue->enpos = 0;
+	event_queue->depos = 0;
+	event_queue->num_event = 0;
+	event_queue->max_event = 0;
+	event_queue->overlay = 0;
+	event_queue->overlay_index = 0;
+}
+
+/*
+ * check if the queue is full
+ * return true means full, false is not.
+ */
+int event_queue_isfull(struct hiusb_event_queue *event_queue)
+{
+	if (!event_queue)
+		return -EINVAL;
+
+	return (((event_queue->enpos + 1) % event_queue->num_event) ==
+		(event_queue->depos));
+}
+
+/*
+ * check if the queue is full
+ * return true means empty, false or not.
+ */
+int event_queue_isempty(struct hiusb_event_queue *event_queue)
+{
+	if (!event_queue)
+		return -EINVAL;
+
+	return (event_queue->enpos == event_queue->depos);
+}
+
+static inline void event_queue_set_overlay(
+		struct hiusb_event_queue *event_queue)
+{
+	if (event_queue->overlay)
+		return;
+	event_queue->overlay = 1;
+	event_queue->overlay_index = event_queue->enpos;
+}
+
+static inline void event_queue_clear_overlay(
+		struct hiusb_event_queue *event_queue)
+{
+	event_queue->overlay = 0;
+	event_queue->overlay_index = 0;
+}
+
+/*
+ * put the new event en queue
+ * if the event_queue is full, return -ENOSPC
+ */
+int event_enqueue(struct hiusb_event_queue *event_queue,
+		  enum otg_dev_event_type event)
+{
+	/* no need verify argument, isfull will check it */
+	if (event_queue_isfull(event_queue)) {
+		pr_err("event queue full!\n");
+		return -ENOSPC;
+	}
+
+	if (event_queue->overlay) {
+		if (event_queue->overlay_index == event_queue->enpos) {
+			event_queue->enpos = ((event_queue->enpos + 1) %
+					      event_queue->num_event);
+		}
+
+		if (event_queue_isempty(event_queue)) {
+			pr_err("overlay and queue isempty? just enqueue!\n");
+			event_queue->overlay_index = (
+					(event_queue->overlay_index + 1) %
+					event_queue->num_event);
+			event_queue->enpos = ((event_queue->enpos + 1) %
+					      event_queue->num_event);
+			event_queue->overlay = 0;
+		}
+
+		event_queue->event[event_queue->overlay_index] = event;
+	} else {
+		event_queue->event[event_queue->enpos] = event;
+		event_queue->enpos = ((event_queue->enpos + 1) %
+				      event_queue->num_event);
+	}
+
+	return 0;
+}
+
+/*
+ * get event from event_queue
+ * this function never return fail
+ * if the event_queue is empty, return NONE_EVENT
+ */
+enum otg_dev_event_type event_dequeue(struct hiusb_event_queue *event_queue)
+{
+	enum otg_dev_event_type event;
+
+	/* no need verify argument, isempty will check it */
+	if (event_queue_isempty(event_queue))
+		return NONE_EVENT;
+
+	event = event_queue->event[event_queue->depos];
+	event_queue->depos = ((event_queue->depos + 1) %
+			      event_queue->num_event);
+
+	return event;
+}
+
+static void handle_event(struct hisi_dwc3_device *hisi_dwc,
+			 enum otg_dev_event_type event)
+{
+	int ret = 0;
+
+	usb_err("[%s] type: %d\n", __func__, event);
+	switch (event) {
+	case CHARGER_CONNECT_EVENT:
+		if (hisi_dwc->state == USB_STATE_DEVICE) {
+			usb_dbg("Already in device mode, do nothing\n");
+		} else if (hisi_dwc->state == USB_STATE_OFF) {
+			hisi_dwc->host_flag = 0;
+
+			/* due to detect charger type, must resume hisi_dwc */
+			ret = pm_runtime_get_sync(&hisi_dwc->pdev->dev);
+			if (ret < 0) {
+				usb_err("resume hisi_dwc failed (ret %d)\n",
+					ret);
+				return;
+			}
+
+			/* detect charger type */
+			hisi_dwc->charger_type = detect_charger_type(hisi_dwc);
+			notify_charger_type(hisi_dwc);
+
+			/* In some cases, DCP is detected as SDP wrongly.
+			 * To avoid this, start bc_again delay work to
+			 * detect charger type once more.
+			 * If later the enum process is executed,
+			 * then it's a real SDP, so
+			 * the work will be canceled.
+			 */
+			if (hisi_dwc->bc_again_flag &&
+			    (hisi_dwc->charger_type == CHARGER_TYPE_SDP)) {
+				ret = queue_delayed_work(
+					system_power_efficient_wq,
+					&hisi_dwc->bc_again_work,
+					msecs_to_jiffies(BC_AGAIN_DELAY_TIME));
+				usb_dbg("schedule ret:%d, run bc_again_work %dms later\n",
+					ret, BC_AGAIN_DELAY_TIME);
+			}
+
+			/* do not start peripheral if real charger connected */
+			if (enumerate_allowed(hisi_dwc)) {
+				if (hisi_dwc->fpga_usb_mode_gpio > 0) {
+					gpio_direction_output(
+						hisi_dwc->fpga_usb_mode_gpio,
+						0);
+					usb_dbg("switch to device mode\n");
+				}
+
+				/* start peripheral */
+				ret = dwc3_otg_work(dwc_otg_handler,
+						    DWC3_OTG_EVT_VBUS_SET);
+				if (ret) {
+					pm_runtime_put(&hisi_dwc->pdev->dev);
+					hisi_dwc3_wake_unlock(hisi_dwc);
+					usb_err("start peripheral error\n");
+					return;
+				}
+			} else {
+				usb_dbg("a real charger connected\n");
+			}
+
+			hisi_dwc->state = USB_STATE_DEVICE;
+
+			if (sleep_allowed(hisi_dwc))
+				hisi_dwc3_wake_unlock(hisi_dwc);
+			else
+				hisi_dwc3_wake_lock(hisi_dwc);
+
+			usb_dbg("hisi usb status: OFF -> DEVICE\n");
+		} else if (hisi_dwc->state == USB_STATE_HOST) {
+			usb_dbg("Charger connect interrupt in HOST mode\n");
+		}
+
+		break;
+
+	case CHARGER_DISCONNECT_EVENT:
+		hisi_dwc->need_disable_vdp = 0;
+
+		if (hisi_dwc->state == USB_STATE_OFF) {
+			usb_dbg("Already in off mode, do nothing\n");
+		} else if (hisi_dwc->state == USB_STATE_DEVICE) {
+			if (hisi_dwc->bc_again_flag) {
+				ret = cancel_delayed_work_sync(
+						&hisi_dwc->bc_again_work);
+				usb_dbg("cancel bc_again_work sync:%d\n", ret);
+			}
+
+			/* peripheral not started, if real charger connected */
+			if (enumerate_allowed(hisi_dwc)) {
+				/* stop peripheral */
+				ret = dwc3_otg_work(dwc_otg_handler,
+						    DWC3_OTG_EVT_VBUS_CLEAR);
+				if (ret) {
+					usb_err("stop peripheral error\n");
+					return;
+				}
+			} else {
+				usb_dbg("connected is a real charger\n");
+				disable_vdp_src(hisi_dwc);
+			}
+
+			/* usb cable disconnect, notify no charger */
+			hisi_dwc->charger_type = CHARGER_TYPE_NONE;
+			notify_charger_type(hisi_dwc);
+
+			hisi_dwc->state = USB_STATE_OFF;
+			hisi_dwc3_wake_unlock(hisi_dwc);
+			pm_runtime_put(&hisi_dwc->pdev->dev);
+
+			usb_dbg("hisi usb status: DEVICE -> OFF\n");
+		} else if (hisi_dwc->state == USB_STATE_HOST) {
+			usb_dbg("Charger disconnect interrupt in HOST mode\n");
+		}
+
+		break;
+
+	case ID_FALL_EVENT:
+		if (hisi_dwc->state == USB_STATE_OFF) {
+			set_vbus_power(hisi_dwc, 1);
+
+			hisi_dwc->host_flag = 1;
+
+			if (hisi_dwc->fpga_usb_mode_gpio > 0) {
+				gpio_direction_output(
+						hisi_dwc->fpga_usb_mode_gpio,
+						1);
+				usb_dbg("switch to host mode\n");
+			}
+
+			/* start host */
+			ret = dwc3_otg_work(dwc_otg_handler,
+					    DWC3_OTG_EVT_ID_CLEAR);
+			if (ret) {
+				usb_err("start host error\n");
+				set_vbus_power(hisi_dwc, 0);
+				return;
+			}
+
+			hisi_dwc->state = USB_STATE_HOST;
+			hisi_dwc3_wake_lock(hisi_dwc);
+
+			usb_dbg("hisi usb_status: OFF -> HOST\n");
+		} else if (hisi_dwc->state == USB_STATE_DEVICE) {
+			usb_dbg("id fall interrupt in DEVICE mode\n");
+		} else if (hisi_dwc->state == USB_STATE_HOST) {
+			usb_dbg("Already in host mode, do nothing\n");
+		}
+		break;
+	case ID_RISE_EVENT:
+		if (hisi_dwc->state == USB_STATE_HOST) {
+			set_vbus_power(hisi_dwc, 0);
+
+			/* stop host */
+			ret = dwc3_otg_work(dwc_otg_handler,
+					    DWC3_OTG_EVT_ID_SET);
+			if (ret) {
+				usb_err("stop host error\n");
+				return;
+			}
+
+			hisi_dwc->state = USB_STATE_OFF;
+			hisi_dwc3_wake_unlock(hisi_dwc);
+
+			usb_dbg("hiusb_status: HOST -> OFF\n");
+		} else if (hisi_dwc->state == USB_STATE_DEVICE) {
+			usb_dbg("id rise interrupt in DEVICE mode\n");
+		} else if (hisi_dwc->state == USB_STATE_OFF) {
+			usb_dbg("Already in host mode, do nothing\n");
+		}
+
+		break;
+	default:
+		usb_dbg("illegal event type!\n");
+		break;
+	}
+}
+
+static void event_work(struct work_struct *work)
+{
+	unsigned long flags;
+	enum otg_dev_event_type event;
+	struct hisi_dwc3_device *hisi_dwc = container_of(work,
+				    struct hisi_dwc3_device, event_work);
+
+	mutex_lock(&hisi_dwc->lock);
+
+	usb_dbg("+\n");
+
+	while (!event_queue_isempty(&hisi_dwc->event_queue)) {
+		spin_lock_irqsave(&hisi_dwc->event_lock, flags);
+		event = event_dequeue(&hisi_dwc->event_queue);
+		spin_unlock_irqrestore(&hisi_dwc->event_lock, flags);
+
+		handle_event(hisi_dwc, event);
+	}
+
+	event_queue_clear_overlay(&hisi_dwc->event_queue);
+
+	usb_dbg("-\n");
+	mutex_unlock(&hisi_dwc->lock);
+}
+
+static int event_check(enum otg_dev_event_type last_event,
+		       enum otg_dev_event_type new_event)
+{
+	int ret = 0;
+
+	if (last_event == NONE_EVENT)
+		return 1;
+
+	switch (new_event) {
+	case CHARGER_CONNECT_EVENT:
+		if ((last_event == CHARGER_DISCONNECT_EVENT) ||
+		    (last_event == ID_RISE_EVENT))
+			ret = 1;
+		break;
+	case CHARGER_DISCONNECT_EVENT:
+		if (last_event == CHARGER_CONNECT_EVENT)
+			ret = 1;
+		break;
+	case ID_FALL_EVENT:
+		if ((last_event == CHARGER_DISCONNECT_EVENT) ||
+		    (last_event == ID_RISE_EVENT))
+			ret = 1;
+		break;
+	case ID_RISE_EVENT:
+		if (last_event == ID_FALL_EVENT)
+			ret = 1;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+int hisi_usb_otg_event(enum otg_dev_event_type event)
+{
+	int ret = 0;
+#ifdef CONFIG_USB_DWC3_OTG
+	unsigned long flags;
+	struct hisi_dwc3_device *hisi_dwc3 = hisi_dwc3_dev;
+#endif
+	usb_err("%s in:%d\n", __func__, event);
+#ifdef CONFIG_USB_DWC3_OTG
+	usb_err("%s in otg:%d\n", __func__, event);
+
+	if (!hisi_dwc3) {
+		usb_dbg(" %s error:%d\n", __func__, event);
+		return -EBUSY;
+	}
+
+	if (hisi_dwc3->eventmask) {
+		usb_dbg("eventmask enabled, mask all events.\n");
+		return ret;
+	}
+
+	spin_lock_irqsave(&hisi_dwc3->event_lock, flags);
+
+	if (event_check(hisi_dwc3->event, event)) {
+		usb_dbg("event: %d\n", event);
+		hisi_dwc3->event = event;
+
+		if ((event == CHARGER_CONNECT_EVENT) ||
+		    (event == CHARGER_DISCONNECT_EVENT))
+			hisi_dwc3_wake_lock(hisi_dwc3);
+
+		if (!event_enqueue(&hisi_dwc3->event_queue, event)) {
+			ret = queue_work(system_power_efficient_wq,
+					 &hisi_dwc3->event_work);
+			if (!ret)
+				usb_err("schedule event_work wait:%d]\n",
+					event);
+		} else {
+			usb_err("%s can't enqueue event:%d\n",
+				__func__, event);
+		}
+
+		if ((event == ID_RISE_EVENT) ||
+		    (event == CHARGER_DISCONNECT_EVENT))
+			event_queue_set_overlay(&hisi_dwc3->event_queue);
+	}
+	spin_unlock_irqrestore(&hisi_dwc3->event_lock, flags);
+#endif
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hisi_usb_otg_event);
+
+static void bc_again(struct hisi_dwc3_device *hisi_dwc)
+{
+	int ret;
+
+	/*
+	 * STEP 1
+	 */
+	/* stop peripheral which is started when detected as SDP before */
+	if (enumerate_allowed(hisi_dwc)) {
+		ret = dwc3_otg_work(dwc_otg_handler, DWC3_OTG_EVT_VBUS_CLEAR);
+		if (ret) {
+			usb_err("stop peripheral error\n");
+			return;
+		}
+	}
+
+	/*
+	 * STEP 2
+	 */
+	hisi_dwc->charger_type = detect_charger_type(hisi_dwc);
+	notify_charger_type(hisi_dwc);
+
+	/*
+	 * STEP 3
+	 */
+	/* must recheck enumerate_allowed, because charger_type maybe changed,
+	 * and enumerate_allowed according to charger_type
+	 */
+	if (enumerate_allowed(hisi_dwc)) {
+		/* start peripheral */
+		ret = dwc3_otg_work(dwc_otg_handler,
+				    DWC3_OTG_EVT_VBUS_SET);
+		if (ret) {
+			pm_runtime_put(&hisi_dwc->pdev->dev);
+			hisi_dwc3_wake_unlock(hisi_dwc);
+			usb_err("start peripheral error\n");
+			return;
+		}
+	} else {
+		usb_dbg("a real charger connected\n");
+	}
+}
+
+void hisi_usb_otg_bc_again(void)
+{
+	struct hisi_dwc3_device *hisi_dwc = hisi_dwc3_dev;
+
+	usb_dbg("+\n");
+
+	if (!hisi_dwc) {
+		usb_err("No usb module, can't call bc again api\n");
+		return;
+	}
+
+	mutex_lock(&hisi_dwc->lock);
+
+	/* we are here because it's detected as SDP before */
+	if (hisi_dwc->charger_type == CHARGER_TYPE_UNKNOWN) {
+		usb_dbg("charger_type is UNKNOWN, start bc_again_work\n");
+		bc_again(hisi_dwc);
+	}
+
+	mutex_unlock(&hisi_dwc->lock);
+	usb_dbg("-\n");
+}
+EXPORT_SYMBOL_GPL(hisi_usb_otg_bc_again);
+
+static void bc_again_work(struct work_struct *work)
+{
+	struct hisi_dwc3_device *hisi_dwc = container_of(work,
+		struct hisi_dwc3_device, bc_again_work.work);
+
+	usb_dbg("+\n");
+	mutex_lock(&hisi_dwc->lock);
+
+	/* we are here because it's detected as SDP before */
+	if (hisi_dwc->charger_type == CHARGER_TYPE_SDP) {
+		usb_dbg("charger_type is  SDP, start %s\n", __func__);
+		bc_again(hisi_dwc);
+	}
+
+	mutex_unlock(&hisi_dwc->lock);
+	usb_dbg("-\n");
+}
+
+static int conndone_notifier_fn(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	int ret;
+	struct hisi_dwc3_device *hisi_dwc = container_of(nb,
+			struct hisi_dwc3_device, conndone_nb);
+
+	ret = cancel_delayed_work(&hisi_dwc->bc_again_work);
+	usb_dbg("cancel bc_again_work:%d\n", ret);
+
+	return 0;
+}
+
+/**
+ * get_usb_state() - get current USB cable state.
+ * @hisi_dwc: the instance pointer of struct hisi_dwc3_device
+ *
+ * return current USB cable state according to VBUS status and ID status.
+ */
+static enum hisi_usb_state get_usb_state(struct hisi_dwc3_device *hisi_dwc)
+{
+	if (hisi_dwc->fpga_flag) {
+		usb_dbg("this is fpga platform, usb is device mode\n");
+		return USB_STATE_DEVICE;
+	}
+
+	if (dwc3_otg_id_value(dwc_otg_handler) == 0)
+		return USB_STATE_HOST;
+	else
+		return USB_STATE_OFF;
+}
+
+static void get_phy_param(struct hisi_dwc3_device *hisi_dwc3)
+{
+	struct device *dev = &hisi_dwc3->pdev->dev;
+
+	/* hs phy param for device mode */
+	if (of_property_read_u32(dev->of_node, "eye_diagram_param",
+				 &hisi_dwc3->eye_diagram_param)) {
+		usb_dbg("get eye diagram param form dt failed, use default value\n");
+		hisi_dwc3->eye_diagram_param = 0x1c466e3;
+	}
+	usb_dbg("eye diagram param: 0x%x\n", hisi_dwc3->eye_diagram_param);
+
+	/* hs phy param for host mode */
+	if (of_property_read_u32(dev->of_node, "eye_diagram_host_param",
+				 &hisi_dwc3->eye_diagram_host_param)) {
+		usb_dbg("get eye diagram host param form dt failed, use default value\n");
+		hisi_dwc3->eye_diagram_host_param = 0x1c466e3;
+	}
+	usb_dbg("eye diagram host param: 0x%x\n",
+		hisi_dwc3->eye_diagram_host_param);
+
+	/* ss phy Rx Equalization */
+	if (of_property_read_u32(dev->of_node, "usb3_phy_cr_param",
+				 &hisi_dwc3->usb3_phy_cr_param)) {
+		usb_dbg("get usb3_phy_cr_param form dt failed, use default value\n");
+		hisi_dwc3->usb3_phy_cr_param = (1 << 11) | (3 << 8) | (1 << 7);
+	}
+
+	/* ss phy Rx Equalization for host mode */
+	if (of_property_read_u32(dev->of_node, "usb3_phy_host_cr_param",
+				 &hisi_dwc3->usb3_phy_host_cr_param)) {
+		usb_dbg("get usb3_phy_host_cr_param form dt failed, use default value\n");
+		hisi_dwc3->usb3_phy_host_cr_param =
+			(1 << 11) | (1 << 8) | (1 << 7);
+	}
+
+	usb_dbg("usb3_phy_cr_param: 0x%x\n", hisi_dwc3->usb3_phy_cr_param);
+	usb_dbg("usb3_phy_host_cr_param: 0x%x\n",
+		hisi_dwc3->usb3_phy_host_cr_param);
+
+	/* tx_vboost_lvl */
+	if (of_property_read_u32(dev->of_node, "usb3_phy_tx_vboost_lvl",
+				 &hisi_dwc3->usb3_phy_tx_vboost_lvl)) {
+		usb_dbg("get usb3_phy_tx_vboost_lvl form dt failed, use default value\n");
+		hisi_dwc3->usb3_phy_tx_vboost_lvl = 5;
+	}
+	usb_dbg("usb3_phy_tx_vboost_lvl: %d\n",
+		hisi_dwc3->usb3_phy_tx_vboost_lvl);
+}
+
+/**
+ * get_resource() - prepare resources
+ * @hisi_dwc3: the instance pointer of struct hisi_dwc3_device
+ *
+ * 1. get registers base address and map registers region.
+ * 2. get regulator handler.
+ */
+static int get_resource(struct hisi_dwc3_device *hisi_dwc3)
+{
+	struct device *dev = &hisi_dwc3->pdev->dev;
+	struct resource *res;
+	struct device_node *np;
+
+	/*
+	 * map PERI CRG region
+	 */
+	np = of_find_compatible_node(NULL, NULL, "hisilicon,hi3660-crgctrl");
+	if (!np) {
+		dev_err(dev, "get peri cfg node failed!\n");
+		return -EINVAL;
+	}
+	hisi_dwc3->pericfg_reg_base = of_iomap(np, 0);
+	if (!hisi_dwc3->pericfg_reg_base) {
+		dev_err(dev, "iomap pericfg_reg_base failed!\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * map PCTRL region
+	 */
+	np = of_find_compatible_node(NULL, NULL, "hisilicon,hi3660-pctrl");
+	if (!np) {
+		dev_err(dev, "get pctrl node failed!\n");
+		return -EINVAL;
+	}
+	hisi_dwc3->pctrl_reg_base = of_iomap(np, 0);
+	if (!hisi_dwc3->pctrl_reg_base) {
+		dev_err(dev, "iomap pctrl_reg_base failed!\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * map SCTRL region
+	 */
+	np = of_find_compatible_node(NULL, NULL, "hisilicon,hi3660-sctrl");
+	if (!np) {
+		dev_err(dev, "get sysctrl node failed!\n");
+		return -EINVAL;
+	}
+	hisi_dwc3->sctrl_reg_base = of_iomap(np, 0);
+	if (!hisi_dwc3->sctrl_reg_base) {
+		dev_err(dev, "iomap sctrl_reg_base failed!\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * map PMCTRL region
+	 */
+	np = of_find_compatible_node(NULL, NULL, "hisilicon,hi3660-pmctrl");
+	if (!np) {
+		dev_err(dev, "get pmctrl node failed!\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * map OTG BC region
+	 */
+	res = platform_get_resource(hisi_dwc3->pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "missing memory base resource\n");
+		return -EINVAL;
+	}
+
+	hisi_dwc3->otg_bc_reg_base = devm_ioremap_nocache(
+			dev, res->start, resource_size(res));
+	if (IS_ERR_OR_NULL(hisi_dwc3->otg_bc_reg_base)) {
+		dev_err(dev, "ioremap res 0 failed\n");
+		return -ENOMEM;
+	}
+
+	get_phy_param(hisi_dwc3);
+
+	/* get abb clk handler */
+	hisi_dwc3->clk = devm_clk_get(&hisi_dwc3->pdev->dev, "clk_usb3phy_ref");
+	if (IS_ERR_OR_NULL(hisi_dwc3->clk)) {
+		dev_err(dev, "get usb3phy ref clk failed\n");
+		return -EINVAL;
+	}
+
+	/* get h clk handler */
+	hisi_dwc3->gt_aclk_usb3otg = devm_clk_get(
+			&hisi_dwc3->pdev->dev, "aclk_usb3otg");
+	if (IS_ERR_OR_NULL(hisi_dwc3->gt_aclk_usb3otg)) {
+		dev_err(dev, "get aclk_usb3otg failed\n");
+		return -EINVAL;
+	}
+
+	/* judge fpga platform or not, from dts */
+	if (of_property_read_u32(dev->of_node, "fpga_flag",
+				 &hisi_dwc3->fpga_flag)) {
+		hisi_dwc3->fpga_flag = 0;
+	}
+	usb_dbg("this is %s platform (fpga flag %d)\n",
+		hisi_dwc3->fpga_flag ? "fpga" : "asic", hisi_dwc3->fpga_flag);
+
+	hisi_dwc3->fpga_usb_mode_gpio = -1;
+
+	if (of_property_read_u32(dev->of_node, "bc_again_flag",
+				 &hisi_dwc3->bc_again_flag)) {
+		hisi_dwc3->bc_again_flag = 0;
+	}
+
+	return 0;
+}
+
+static int hisi_dwc3_phy_init(struct hisi_dwc3_device *hisi_dwc)
+{
+	return hisi_dwc->phy_ops->init(hisi_dwc);
+}
+
+static int hisi_dwc3_phy_shutdown(struct hisi_dwc3_device *hisi_dwc)
+{
+	return hisi_dwc->phy_ops->shutdown(hisi_dwc);
+}
+
+int hisi_dwc3_probe(struct platform_device *pdev,
+		    struct usb3_phy_ops *phy_ops)
+{
+	int ret;
+	struct hisi_dwc3_device *hisi_dwc;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	enum hisi_usb_state init_state;
+
+	usb_dbg("+\n");
+
+	if (!phy_ops) {
+		usb_err("phy_ops is NULL\n");
+		return -EINVAL;
+	}
+
+	hisi_dwc = devm_kzalloc(dev, sizeof(*hisi_dwc), GFP_KERNEL);
+	if (!hisi_dwc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, hisi_dwc);
+	hisi_dwc->pdev = pdev;
+	hisi_dwc->phy_ops = phy_ops;
+
+	hisi_dwc3_dev = hisi_dwc;
+
+	/*
+	 * set hisi dwc3 dma mask, it should be 0xffffffff, because the ahb
+	 * master of usb can only support 32bit width address.
+	 */
+	if (!dev->dma_mask)
+		dev->dma_mask = &dev->coherent_dma_mask;
+	if (!dev->coherent_dma_mask)
+		dev->coherent_dma_mask = DMA_BIT_MASK(32);
+
+	/*
+	 * get resources from dts.
+	 */
+	ret = get_resource(hisi_dwc);
+	if (ret) {
+		dev_err(&pdev->dev, "get resource failed!\n");
+		return ret;
+	}
+
+	if (hisi_dwc->fpga_usb_mode_gpio > 0) {
+		ret = gpio_request(hisi_dwc->fpga_usb_mode_gpio, NULL);
+		if (ret) {
+			/* request gpio failure! */
+			usb_err("request gpio %d failed, ret=[%d]\n",
+				hisi_dwc->fpga_usb_mode_gpio, ret);
+		}
+	}
+
+	/* create sysfs files. */
+	ret = create_attr_file(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "create_attr_file failed!\n");
+		return ret;
+	}
+
+	/* initialize */
+	hisi_dwc->charger_type = CHARGER_TYPE_SDP;
+	hisi_dwc->fake_charger_type = CHARGER_TYPE_NONE;
+	hisi_dwc->event = NONE_EVENT;
+	hisi_dwc->host_flag = 0;
+	hisi_dwc->eventmask = 0;
+	spin_lock_init(&hisi_dwc->event_lock);
+	INIT_WORK(&hisi_dwc->event_work, event_work);
+	mutex_init(&hisi_dwc->lock);
+	wakeup_source_init(&hisi_dwc->ws, "usb_wake_lock");
+	ATOMIC_INIT_NOTIFIER_HEAD(&hisi_dwc->charger_type_notifier);
+	event_queue_creat(&hisi_dwc->event_queue, MAX_EVENT_COUNT);
+	hisi_dwc->disable_vdp_src = disable_vdp_src;
+	hisi_dwc->need_disable_vdp = 0;
+
+	/* power on */
+	hisi_dwc->is_regu_on = 0;
+	ret = hisi_dwc3_phy_init(hisi_dwc);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: hisi_dwc3_phy_init failed!\n",
+			__func__);
+		remove_attr_file(dev);
+		return ret;
+	}
+
+	if (hisi_dwc->bc_again_flag) {
+		INIT_DELAYED_WORK(&hisi_dwc->bc_again_work, bc_again_work);
+		hisi_dwc->conndone_nb.notifier_call = conndone_notifier_fn;
+		ret = dwc3_conndone_notifier_register(&hisi_dwc->conndone_nb);
+		if (ret)
+			usb_err("dwc3_conndone_notifier_register failed\n");
+	}
+
+	if (hisi_dwc->charger_type == CHARGER_TYPE_CDP) {
+		usb_dbg("it needs enable VDP_SRC while detect CDP!\n");
+		hisi_dwc->need_disable_vdp = 1;
+		enable_vdp_src(hisi_dwc);
+	}
+
+	/*
+	 * enable runtime pm.
+	 */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+	pm_runtime_forbid(dev);
+
+	/*
+	 * probe child deivces
+	 */
+	ret = of_platform_populate(node, NULL, NULL, dev);
+	if (ret) {
+		pr_err("%s: register dwc3 failed!\n", __func__);
+		goto err1;
+	}
+
+#ifdef CONFIG_USB_DWC3_OTG
+	/* default device state  */
+	hisi_dwc->state = USB_STATE_DEVICE;
+
+	if (sleep_allowed(hisi_dwc))
+		hisi_dwc3_wake_unlock(hisi_dwc);
+	else
+		hisi_dwc3_wake_lock(hisi_dwc);
+
+	if (!enumerate_allowed(hisi_dwc)) {
+		/* stop peripheral */
+		ret = dwc3_otg_work(dwc_otg_handler, DWC3_OTG_EVT_VBUS_CLEAR);
+		if (ret)
+			usb_err("stop peripheral error\n");
+	}
+
+	/* balance the put operation when disconnect */
+	pm_runtime_get(dev);
+
+	hisi_dwc->event = CHARGER_CONNECT_EVENT;
+	init_state = get_usb_state(hisi_dwc);
+	if (init_state == USB_STATE_OFF) {
+		usb_dbg("init state: OFF\n");
+		hisi_usb_otg_event(CHARGER_DISCONNECT_EVENT);
+	} else if (init_state == USB_STATE_HOST) {
+		usb_dbg("init state: HOST\n");
+		hisi_usb_otg_event(CHARGER_DISCONNECT_EVENT);
+		msleep(500);
+		hisi_usb_otg_event(ID_FALL_EVENT);
+	}
+#endif
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_allow(dev);
+
+	usb_dbg("-\n");
+
+	return 0;
+
+err1:
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	remove_attr_file(dev);
+
+	return ret;
+}
+
+static int hisi_dwc3_remove_child(struct device *dev, void *unused)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	platform_device_unregister(pdev);
+	return 0;
+}
+
+int hisi_dwc3_remove(struct platform_device *pdev)
+{
+	struct hisi_dwc3_device *hisi_dwc3 = platform_get_drvdata(pdev);
+	int ret;
+
+	if (!hisi_dwc3) {
+		usb_err("hisi_dwc3 NULL\n");
+		return -EBUSY;
+	}
+
+	device_for_each_child(&pdev->dev, NULL, hisi_dwc3_remove_child);
+	pm_runtime_disable(&pdev->dev);
+
+	if (hisi_dwc3->bc_again_flag) {
+		dwc3_conndone_notifier_unregister(&hisi_dwc3->conndone_nb);
+		hisi_dwc3->conndone_nb.notifier_call = NULL;
+	}
+
+	ret = hisi_dwc3_phy_shutdown(hisi_dwc3);
+	if (ret)
+		usb_err("hisi_dwc3_phy_shutdown error\n");
+	hisi_dwc3->phy_ops = NULL;
+
+	event_queue_destroy(&hisi_dwc3->event_queue);
+
+	remove_attr_file(&pdev->dev);
+	return 0;
+}
+
+#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
+static int hisi_dwc3_prepare(struct device *dev)
+{
+	struct hisi_dwc3_device *hisi_dwc = platform_get_drvdata(
+				to_platform_device(dev));
+	int ret = 0;
+
+	if (!hisi_dwc)
+		return -ENODEV;
+
+	mutex_lock(&hisi_dwc->lock);
+
+	switch (hisi_dwc->state) {
+	case USB_STATE_OFF:
+		pr_info("%s: off state.\n", __func__);
+		break;
+	case USB_STATE_DEVICE:
+		pr_info("%s: device state.\n", __func__);
+
+		if (enumerate_allowed(hisi_dwc)) {
+			/* stop peripheral */
+			ret = dwc3_otg_work(dwc_otg_handler,
+					    DWC3_OTG_EVT_VBUS_CLEAR);
+			if (ret) {
+				usb_err("stop peripheral error\n");
+				goto error;
+			}
+		} else {
+			usb_dbg("connected is a real charger\n");
+			disable_vdp_src(hisi_dwc);
+		}
+
+		break;
+	case USB_STATE_HOST:
+		usb_err("%s: host mode, should not go to sleep!\n", __func__);
+		ret = -EFAULT;
+		goto error;
+	default:
+		pr_err("%s: ilegal state!\n", __func__);
+		ret = -EFAULT;
+		goto error;
+	}
+
+	return ret;
+error:
+	mutex_unlock(&hisi_dwc->lock);
+	return ret;
+}
+
+static void hisi_dwc3_complete(struct device *dev)
+{
+	struct hisi_dwc3_device *hisi_dwc = platform_get_drvdata(
+				to_platform_device(dev));
+	int ret = 0;
+
+	if (!hisi_dwc) {
+		usb_err("hisi_dwc NULL !\n");
+		return;
+	}
+
+	switch (hisi_dwc->state) {
+	case USB_STATE_OFF:
+		usb_dbg("%s: off state.\n", __func__);
+		break;
+	case USB_STATE_DEVICE:
+		usb_dbg("%s: device state.\n", __func__);
+
+		/* update charger type */
+		hisi_dwc->charger_type = detect_charger_type(hisi_dwc);
+		if (sleep_allowed(hisi_dwc))
+			hisi_dwc3_wake_unlock(hisi_dwc);
+		else
+			hisi_dwc3_wake_lock(hisi_dwc);
+
+		/* do not start peripheral if real charger connected */
+		if (enumerate_allowed(hisi_dwc)) {
+			/* start peripheral */
+			ret = dwc3_otg_work(dwc_otg_handler,
+					    DWC3_OTG_EVT_VBUS_SET);
+			if (ret) {
+				usb_err("start peripheral error\n");
+				hisi_dwc->state = USB_STATE_OFF;
+				pm_runtime_put(&hisi_dwc->pdev->dev);
+				goto error;
+			}
+		} else {
+			usb_dbg("a real charger connected\n");
+		}
+
+		break;
+	case USB_STATE_HOST:
+		usb_err("%s: host mode, should not go to sleep!\n", __func__);
+		break;
+	default:
+		usb_err("%s: ilegal state!\n", __func__);
+		break;
+	}
+
+error:
+	mutex_unlock(&hisi_dwc->lock);
+}
+
+static int hisi_dwc3_suspend(struct device *dev)
+{
+	struct hisi_dwc3_device *hisi_dwc3 =
+		platform_get_drvdata(to_platform_device(dev));
+	int ret = 0;
+
+	usb_dbg("+\n");
+
+	if (!hisi_dwc3) {
+		usb_err("hisi_dwc3 NULL\n");
+		return -EBUSY;
+	}
+
+	if (hisi_dwc3->runtime_suspended) {
+		usb_dbg("runtime_suspended\n");
+	} else {
+		ret = hisi_dwc3_phy_shutdown(hisi_dwc3);
+		if (ret)
+			usb_err("hisi_dwc3_phy_shutdown failed\n");
+	}
+
+	usb_dbg("-\n");
+
+	return ret;
+}
+
+static int hisi_dwc3_resume(struct device *dev)
+{
+	struct hisi_dwc3_device *hisi_dwc3 =
+		platform_get_drvdata(to_platform_device(dev));
+	int ret = 0;
+
+	usb_dbg("+\n");
+
+	if (!hisi_dwc3) {
+		usb_err("hisi_dwc3 NULL\n");
+		return -EBUSY;
+	}
+
+	if (hisi_dwc3->runtime_suspended) {
+		usb_dbg("runtime_suspended\n");
+	} else {
+		ret = hisi_dwc3_phy_init(hisi_dwc3);
+		if (ret)
+			usb_err("hisi_dwc3_phy_init failed\n");
+
+		pm_runtime_disable(dev);
+		pm_runtime_set_active(dev);
+		pm_runtime_enable(dev);
+	}
+
+	usb_dbg("-\n");
+
+	return ret;
+}
+#endif
+
+static int hisi_dwc3_runtime_suspend(struct device *dev)
+{
+	int ret;
+	struct hisi_dwc3_device *hisi_dwc3 =
+		platform_get_drvdata(to_platform_device(dev));
+
+	usb_dbg("+\n");
+
+	if (!hisi_dwc3) {
+		usb_err("hisi_dwc3 NULL\n");
+		return -EBUSY;
+	}
+
+	ret = hisi_dwc3_phy_shutdown(hisi_dwc3);
+	if (ret)
+		return ret;
+	hisi_dwc3->runtime_suspended = 1;
+	usb_dbg("-\n");
+
+	return 0;
+}
+
+static int hisi_dwc3_runtime_resume(struct device *dev)
+{
+	int ret = 0;
+	struct hisi_dwc3_device *hisi_dwc3 =
+		platform_get_drvdata(to_platform_device(dev));
+
+	usb_dbg("+\n");
+
+	if (!hisi_dwc3) {
+		usb_err("hisi_dwc3 NULL\n");
+		return -EBUSY;
+	}
+
+	ret = hisi_dwc3_phy_init(hisi_dwc3);
+	if (ret)
+		return ret;
+	hisi_dwc3->runtime_suspended = 0;
+	usb_dbg("-\n");
+
+	return ret;
+}
+
+static int hisi_dwc3_runtime_idle(struct device *dev)
+{
+	int ret;
+
+	usb_dbg("+\n");
+	ret = pm_runtime_autosuspend(dev);
+	if (ret)
+		dev_err(dev, "pm_runtime_autosuspend error\n");
+	usb_dbg("-\n");
+
+	return ret;
+}
+
+const struct dev_pm_ops hisi_dwc3_dev_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.prepare	= hisi_dwc3_prepare,
+	.complete	= hisi_dwc3_complete,
+	SET_SYSTEM_SLEEP_PM_OPS(hisi_dwc3_suspend, hisi_dwc3_resume)
+#endif
+	SET_RUNTIME_PM_OPS(hisi_dwc3_runtime_suspend, hisi_dwc3_runtime_resume,
+			   hisi_dwc3_runtime_idle)
+};
+#endif
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("wangbinghui<wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>");
diff --git a/drivers/usb/dwc3/dwc3-hisi.h b/drivers/usb/dwc3/dwc3-hisi.h
new file mode 100644
index 000000000000..f497baff563a
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-hisi.h
@@ -0,0 +1,293 @@
+/*
+ * hisi_usb_vbus.h
+ *
+ * Copyright: (C) 2008-2018 hisilicon.
+ * Contact: wangbinghui<wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
+ *
+ * USB vbus for Hisilicon device
+ *
+ * This software is available to you under a choice of one of two
+ * licenses. You may choose this file to be licensed under the terms
+ * of the GNU General Public License (GPL) Version 2 or the 2-clause
+ * BSD license listed below:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ */
+#ifndef _DWC3_HISI_H_
+#define _DWC3_HISI_H_
+
+#include <linux/pm_wakeup.h>
+#include <linux/clk.h>
+#include <linux/hisi/usb/hisi_usb.h>
+#include <linux/regulator/consumer.h>
+
+#define REG_BASE_PERI_CRG				(0xFFF35000)
+#define PERI_CRG_CLK_EN4				(0x40)
+#define PERI_CRG_CLK_DIS4				(0x44)
+#define PERI_CRG_RSTDIS4				(0x94)
+#define PERI_CRG_RSTEN4				(0x90)
+#define PERI_CRG_ISODIS				(0x148)
+#define PERI_CRG_ISOSTAT				(0x14C)
+#define STCL_ADDR					(0xFFF0A214)
+#ifndef BIT
+#define BIT(x)	(1 << (x))
+#endif
+#define PERI_CRG_ISOSTAT_MODEMSUBSYSISOEN		 BIT(4)
+#define PERI_CRG_ISODIS_MODEMSUBSYSISOEN		 BIT(4)
+
+#define PCTRL_PERI_CTRL24				(0x64)
+#define PCTRL_PERI_CTRL48				(0xC54)
+
+#define IP_RST_USB3OTG_MUX				 BIT(8)
+#define IP_RST_USB3OTG_AHBIF				 BIT(7)
+#define IP_RST_USB3OTG_32K				 BIT(6)
+#define IP_RST_USB3OTG					 BIT(5)
+#define IP_RST_USB3OTGPHY_POR				 BIT(3)
+
+#define GT_CLK_USB3OTG_REF				 BIT(0)
+#define GT_ACLK_USB3OTG					 BIT(1)
+#define GT_CLK_USB3PHY_REF				 BIT(2)
+
+/*
+ * hisi dwc3 phy registers
+ */
+#define DWC3_PHY_RX_OVRD_IN_HI	0x1006
+#define DWC3_PHY_RX_SCOPE_VDCC	0x1026
+
+/* DWC3_PHY_RX_SCOPE_VDCC */
+#define RX_SCOPE_LFPS_EN	BIT(0)
+
+/*
+ * hisi dwc3 otg bc registers
+ */
+#define USBOTG3_CTRL0		0x00
+#define USBOTG3_CTRL1		0x04
+#define USBOTG3_CTRL2		0x08
+#define USBOTG3_CTRL3		0x0C
+#define USBOTG3_CTRL4		0x10
+#define USBOTG3_CTRL5		0x14
+#define USBOTG3_CTRL6		0x18
+#define USBOTG3_CTRL7		0x1C
+#define USBOTG3_STS0		0x20
+#define USBOTG3_STS1		0x24
+#define USBOTG3_STS2		0x28
+#define USBOTG3_STS3		0x2C
+#define BC_CTRL0		0x30
+#define BC_CTRL1		0x34
+#define BC_CTRL2		0x38
+#define BC_STS0			0x3C
+#define RAM_CTRL		0x40
+#define USBOTG3_STS4		0x44
+#define USB3PHY_CTRL		0x48
+#define USB3PHY_STS		0x4C
+#define USB3PHY_CR_STS		0x50
+#define USB3PHY_CR_CTRL		0x54
+#define USB3_RES		0x58
+
+/* USTOTG3_CTRL0 */
+# define USBOTG3CTRL0_SESSVLD_SEL              BIT(14)
+# define USBOTG3CTRL0_SC_SESSVLD               BIT(13)
+# define USBOTG3CTRL0_POWERPRESENT_SEL         BIT(12)
+# define USBOTG3CTRL0_SC_POWERPRESENT          BIT(11)
+# define USBOTG3CTRL0_BVALID_SEL               BIT(10)
+# define USBOTG3CTRL0_SC_BVALID                BIT(9)
+# define USBOTG3CTRL0_AVALID_SEL               BIT(8)
+# define USBOTG3CTRL0_SC_AVALID                BIT(7)
+# define USBOTG3CTRL0_VBUSVALID_SEL            BIT(6)
+# define USBOTG3CTRL0_DRVVBUS                  BIT(5)
+# define USBOTG3CTRL0_DRVVBUS_SEL              BIT(4)
+# define USBOTG3CTRL0_IDDIG                    BIT(3)
+# define USBOTG3CTRL0_IDDIG_SEL                BIT(2)
+# define USBOTG3CTRL0_IDPULLUP                 BIT(1)
+# define USBOTG3CTRL0_IDPULLUP_SEL             BIT(0)
+
+/* USTOTG3_CTRL2 */
+# define USBOTG3CTRL2_POWERDOWN_HSP             BIT(0)
+# define USBOTG3CTRL2_POWERDOWN_SSP             BIT(1)
+
+/* USBOTG3_CTRL3 */
+# define USBOTG3_CTRL3_VBUSVLDEXT	BIT(6)
+# define USBOTG3_CTRL3_VBUSVLDEXTSEL	BIT(5)
+# define USBOTG3_CTRL3_TXBITSTUFFEHN	BIT(4)
+# define USBOTG3_CTRL3_TXBITSTUFFEN	BIT(3)
+# define USBOTG3_CTRL3_RETENABLEN	BIT(2)
+# define USBOTG3_CTRL3_OTGDISABLE	BIT(1)
+# define USBOTG3_CTRL3_COMMONONN	BIT(0)
+
+/* USBOTG3_CTRL4 */
+# define USBOTG3_CTRL4_TXVREFTUNE(x)            (((x) << 22) & (0xf << 22))
+# define USBOTG3_CTRL4_TXRISETUNE(x)            (((x) << 20) & (3 << 20))
+# define USBOTG3_CTRL4_TXRESTUNE(x)             (((x) << 18) & (3 << 18))
+# define USBOTG3_CTRL4_TXPREEMPPULSETUNE        BIT(17)
+# define USBOTG3_CTRL4_TXPREEMPAMPTUNE(x)       (((x) << 15) & (3 << 15))
+# define USBOTG3_CTRL4_TXHSXVTUNE(x)            (((x) << 13) & (3 << 13))
+# define USBOTG3_CTRL4_TXFSLSTUNE(x)            (((x) << 9) & (0xf << 9))
+# define USBOTG3_CTRL4_SQRXTUNE(x)              (((x) << 6) & (7 << 6))
+# define USBOTG3_CTRL4_OTGTUNE_MASK             (7 << 3)
+# define USBOTG3_CTRL4_OTGTUNE(x)               \
+(((x) << 3) & USBOTG3_CTRL4_OTGTUNE_MASK)
+# define USBOTG3_CTRL4_COMPDISTUNE_MASK         7
+# define USBOTG3_CTRL4_COMPDISTUNE(x)           \
+((x) & USBOTG3_CTRL4_COMPDISTUNE_MASK)
+
+# define USBOTG3_CTRL7_REF_SSP_EN				BIT(16)
+
+/* USBOTG3_CTRL6 */
+#define TX_VBOOST_LVL_MASK			7
+#define TX_VBOOST_LVL(x)			((x) & TX_VBOOST_LVL_MASK)
+
+/* BC_CTRL0 */
+# define BC_CTRL0_BC_IDPULLUP		BIT(10)
+# define BC_CTRL0_BC_SUSPEND_N		BIT(9)
+# define BC_CTRL0_BC_DMPULLDOWN		BIT(8)
+# define BC_CTRL0_BC_DPPULLDOWN		BIT(7)
+# define BC_CTRL0_BC_TXVALIDH		BIT(6)
+# define BC_CTRL0_BC_TXVALID		BIT(5)
+# define BC_CTRL0_BC_TERMSELECT		BIT(4)
+# define BC_CTRL0_BC_XCVRSELECT(x)	(((x) << 2) & (3 << 2))
+# define BC_CTRL0_BC_OPMODE(x)		((x) & 3)
+
+/* BC_CTRL1 */
+# define BC_CTRL1_BC_MODE	1
+
+/* BC_CTRL2 */
+# define BC_CTRL2_BC_PHY_VDATDETENB	BIT(4)
+# define BC_CTRL2_BC_PHY_VDATARCENB	BIT(3)
+# define BC_CTRL2_BC_PHY_CHRGSEL		BIT(2)
+# define BC_CTRL2_BC_PHY_DCDENB		BIT(1)
+# define BC_CTRL2_BC_PHY_ACAENB		BIT(0)
+
+/* BC_STS0 */
+# define BC_STS0_BC_LINESTATE(x)	(((x) << 9) & (3 << 9))
+# define BC_STS0_BC_PHY_CHGDET		BIT(8)
+# define BC_STS0_BC_PHY_FSVMINUS	BIT(7)
+# define BC_STS0_BC_PHY_FSVPLUS		BIT(6)
+# define BC_STS0_BC_RID_GND		BIT(5)
+# define BC_STS0_BC_RID_FLOAT		BIT(4)
+# define BC_STS0_BC_RID_C		BIT(3)
+# define BC_STS0_BC_RID_B		BIT(2)
+# define BC_STS0_BC_RID_A		BIT(1)
+# define BC_STS0_BC_SESSVLD		BIT(0)
+
+/* USB3PHY_CR_STS */
+#define USB3OTG_PHY_CR_DATA_OUT(x)	(((x) >> 1) & 0xffff)
+#define USB3OTG_PHY_CR_ACK		BIT(0)
+
+/* USB3PHY_CR_CTRL */
+#define USB3OTG_PHY_CR_DATA_IN(x)	(((x) << 4) & (0xffff << 4))
+#define USB3OTG_PHY_CR_WRITE		BIT(3)
+#define USB3OTG_PHY_CR_READ		BIT(2)
+#define USB3OTG_PHY_CR_CAP_DATA		BIT(1)
+#define USB3OTG_PHY_CR_CAP_ADDR		BIT(0)
+
+#define usb_dbg(format, arg...)    \
+		pr_err("[USB3][%s]"format, __func__, ##arg)
+
+#define usb_err(format, arg...)    \
+		pr_err("[USB3][%s]"format, __func__, ##arg)
+
+enum hisi_usb_state {
+	USB_STATE_UNKNOWN = 0,
+	USB_STATE_OFF,
+	USB_STATE_DEVICE,
+	USB_STATE_HOST,
+};
+
+struct hiusb_event_queue {
+	enum otg_dev_event_type *event;
+	unsigned int num_event;
+	unsigned int max_event;
+	unsigned int enpos, depos;
+	unsigned int overlay, overlay_index;
+};
+
+#define MAX_EVENT_COUNT 16
+#define EVENT_QUEUE_UNIT MAX_EVENT_COUNT
+
+struct hisi_dwc3_device {
+	struct platform_device *pdev;
+
+	void __iomem *otg_bc_reg_base;
+	void __iomem *pericfg_reg_base;
+	void __iomem *pctrl_reg_base;
+	void __iomem *sctrl_reg_base;
+
+	struct regulator *usb_regu;
+	unsigned int is_regu_on;
+	unsigned int runtime_suspended;
+
+	enum hisi_usb_state state;
+	enum hisi_charger_type charger_type;
+	enum hisi_charger_type fake_charger_type;
+
+	enum otg_dev_event_type event;
+	spinlock_t event_lock;
+
+	struct mutex lock;
+	struct wakeup_source ws;
+	struct atomic_notifier_head charger_type_notifier;
+	struct work_struct event_work;
+
+	u32 eye_diagram_param;	/* this param will be set to USBOTG3_CTRL4 */
+	u32 eye_diagram_host_param;
+	u32 usb3_phy_cr_param;
+	u32 usb3_phy_host_cr_param;
+	u32 usb3_phy_tx_vboost_lvl;
+	unsigned int host_flag;
+
+	u32 fpga_flag;
+	int fpga_usb_mode_gpio;
+
+	struct clk *clk;
+	struct clk *gt_aclk_usb3otg;
+
+	int eventmask;
+
+	/* for bc again */
+	u32 bc_again_flag;
+	struct delayed_work bc_again_work;
+	struct notifier_block conndone_nb;
+
+	/* event queue for handle event */
+	struct hiusb_event_queue event_queue;
+
+	struct usb3_phy_ops *phy_ops;
+
+	unsigned int need_disable_vdp;
+	void (*disable_vdp_src)(struct hisi_dwc3_device *hisi_dwc3);
+};
+
+#ifdef CONFIG_PM
+extern const struct dev_pm_ops hisi_dwc3_dev_pm_ops;
+#define HISI_DWC3_PM_OPS (&hisi_dwc3_dev_pm_ops)
+#else
+#define HISI_DWC3_PM_OPS NULL
+#endif
+
+struct usb3_phy_ops {
+	struct regulator *subsys_regu;
+
+	int (*init)(struct hisi_dwc3_device *hisi_dwc3);
+	int (*shutdown)(struct hisi_dwc3_device *hisi_dwc3);
+};
+
+typedef ssize_t (*hiusb_debug_show_ops)(void *, char *, ssize_t);
+typedef ssize_t (*hiusb_debug_store_ops)(void *, const char *, ssize_t);
+void hiusb_debug_init(void *data);
+void hiusb_debug_quick_register(void *dev_data,
+				hiusb_debug_show_ops show,
+				hiusb_debug_store_ops store);
+
+void set_hisi_dwc3_power_flag(int val);
+void config_femtophy_param(struct hisi_dwc3_device *hisi_dwc);
+int hisi_dwc3_probe(struct platform_device *pdev, struct usb3_phy_ops *phy_ops);
+int hisi_dwc3_remove(struct platform_device *pdev);
+#endif /* _DWC3_HISI_H_ */
diff --git a/drivers/usb/dwc3/dwc3-otg.c b/drivers/usb/dwc3/dwc3-otg.c
new file mode 100644
index 000000000000..fd3ef7d154ed
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-otg.c
@@ -0,0 +1,360 @@
+/*
+ * dwc3-otg.c
+ *
+ * Copyright: (C) 2008-2018 hisilicon.
+ * Contact: wangbinghui<wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
+ *
+ * USB vbus for Hisilicon device
+ *
+ * This software is available to you under a choice of one of two
+ * licenses. You may choose this file to be licensed under the terms
+ * of the GNU General Public License (GPL) Version 2 or the 2-clause
+ * BSD license listed below:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ */
+#include <linux/kernel.h>
+#include <linux/pm_runtime.h>
+#include <linux/platform_device.h>
+
+#include "core.h"
+#include "io.h"
+#include "dwc3-otg.h"
+
+#define DBG(format, arg...) pr_info("[%s]" format, __func__, ##arg)
+
+struct dwc3_otg *dwc_otg_handler;
+
+static void dump_otg_regs(struct dwc3 *dwc)
+{
+#define DUMP_REG(__reg) pr_info("%s:\t0x%x\n",	\
+		#__reg, dwc3_readl(dwc->regs, __reg))
+	DUMP_REG(DWC3_OCFG);
+	DUMP_REG(DWC3_OCTL);
+	DUMP_REG(DWC3_OEVT);
+	DUMP_REG(DWC3_OEVTEN);
+	DUMP_REG(DWC3_OSTS);
+
+	DUMP_REG(DWC3_BCFG);
+	DUMP_REG(DWC3_BCEVT);
+	DUMP_REG(DWC3_BCEVTEN);
+}
+
+#ifndef DWC3_OTG_FORCE_MODE
+static void dwc3_disable_otg_event(struct dwc3 *dwc)
+{
+	dwc3_writel(dwc->regs, DWC3_OEVT, 0x0ffffff0);
+	dwc3_writel(dwc->regs, DWC3_OEVTEN, 0);
+}
+
+static void dwc3_enable_otg_event(struct dwc3 *dwc)
+{
+	dwc3_writel(dwc, DWC3_OEVTEN, 0);
+	dwc3_writel(dwc->regs, DWC3_OEVT, 0x0ffffff0);
+	dwc3_writel(dwc->regs, DWC3_OEVTEN, DWC3_OEVT_OTGBDEVVBUSCHNGEVNT |
+				DWC3_OEVT_OTGCONIDSTSCHNGEVNT);
+}
+#endif
+
+int dwc3_otg_resume(struct dwc3 *dwc)
+{
+	DBG("+\n");
+#ifndef DWC3_OTG_FORCE_MODE
+	u32 reg;
+
+	reg = dwc3_readl(dwc->regs, DWC3_OSTS);
+	if (reg & DWC3_OSTS_CONIDSTS) {
+		DBG("%s: ID is 1, set peripheral mode\n", __func__);
+		reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+		reg |= DWC3_OCTL_PERIMODE;
+		dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	} else {
+		DBG("%s: ID is 0, clear peripheral mode\n", __func__);
+		reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+		reg &= ~DWC3_OCTL_PERIMODE;
+		dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	}
+#endif
+
+	DBG("-\n");
+
+	return 0;
+}
+
+int dwc3_otg_suspend(struct dwc3 *dwc)
+{
+	DBG("+\n");
+	DBG("-\n");
+	return 0;
+}
+
+static int dwc3_otg_start_host(struct dwc3_otg *dwc_otg)
+{
+	struct dwc3 *dwc = dwc_otg->dwc;
+	unsigned long flags;
+	int ret;
+	u32 reg;
+
+	DBG("+\n");
+
+	spin_lock_irqsave(&dwc->lock, flags);
+
+#ifdef DWC3_OTG_FORCE_MODE
+	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	pr_debug("%s: GCTL value 0x%x\n", __func__, reg);
+	dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
+#else
+	/* check ID ststus */
+	DBG("+before read DWC3_OSTS\n");
+	reg = dwc3_readl(dwc->regs, DWC3_OSTS);
+	if (reg & DWC3_OSTS_CONIDSTS) {
+		pr_warn("%s: CONIDSTS wrong!\n");
+		dump_otg_regs(dwc);
+	}
+	DBG("+before read DWC3_OCFG\n");
+	reg = dwc3_readl(dwc->regs, DWC3_OCFG);
+	reg |= DWC3_OCFG_OTGSFTRSTMSK;
+	reg |= DWC3_OCFG_DISPRTPWRCUTOFF;
+	reg &= ~(DWC3_OCFG_HNPCAP | DWC3_OCFG_SRPCAP);
+	dwc3_writel(dwc->regs, DWC3_OCFG, reg);
+
+	DBG("set OCFG 0x%x\n", dwc3_readl(dwc->regs, DWC3_OCFG));
+
+	reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+	reg &= ~DWC3_OCTL_PERIMODE;
+	reg |= DWC3_OCTL_PRTPWRCTL;
+	dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+
+	DBG("set OCTL 0x%x\n", dwc3_readl(dwc->regs, DWC3_OCTL));
+#endif
+
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	ret = platform_device_add(dwc->xhci);
+	if (ret) {
+		pr_err("%s: failed to register xHCI device\n", __func__);
+		return ret;
+	}
+
+#ifdef CONFIG_HISI_USB_DWC3_MASK_IRQ_WORKAROUND
+	if (dwc->irq_state == 0) {
+		enable_irq(dwc->irq);
+		dwc->irq_state = 1;
+		pr_info("[%s]enable irq\n", __func__);
+	}
+#endif
+
+	DBG("-\n");
+
+	return ret;
+}
+
+static void dwc3_otg_stop_host(struct dwc3_otg *dwc_otg)
+{
+	DBG("+\n");
+	platform_device_del(dwc_otg->dwc->xhci);
+	DBG("-\n");
+}
+
+static int dwc3_otg_start_peripheral(struct dwc3_otg *dwc_otg)
+{
+	int ret;
+	unsigned long flags;
+	struct dwc3 *dwc = dwc_otg->dwc;
+	u32 reg;
+
+	DBG("+\n");
+
+	spin_lock_irqsave(&dwc->lock, flags);
+
+#ifdef DWC3_OTG_FORCE_MODE
+	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	pr_debug("%s: GCTL value 0x%x\n", __func__, reg);
+	dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
+#else
+	reg = dwc3_readl(dwc->regs, DWC3_OSTS);
+	if (!(reg & DWC3_OSTS_CONIDSTS) || !(reg & DWC3_OSTS_BSESVLD)) {
+		pr_warn("%s: CONIDSTS or BSESVLD wrong!\n");
+		dump_otg_regs(dwc);
+	}
+
+	/* set mode as peripheral */
+	reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+	reg |= DWC3_OCTL_PERIMODE;
+	dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+#endif
+
+	ret = dwc3_gadget_resume(dwc);
+	if (ret)
+		pr_err("[%s] gadget resume error!", __func__);
+
+	spin_unlock_irqrestore(&dwc->lock, flags);
+	DBG("-\n");
+
+	return ret;
+}
+
+static int dwc3_otg_stop_peripheral(struct dwc3_otg *dwc_otg)
+{
+	int ret;
+	unsigned long flags;
+	struct dwc3 *dwc = dwc_otg->dwc;
+
+	DBG("+\n");
+	spin_lock_irqsave(&dwc->lock, flags);
+
+	ret = dwc3_gadget_suspend(dwc);
+	if (ret)
+		pr_err("[%s] gadget suspend error!", __func__);
+
+	spin_unlock_irqrestore(&dwc->lock, flags);
+	DBG("-\n");
+
+	return ret;
+}
+
+int dwc3_otg_id_value(struct dwc3_otg *dwc_otg)
+{
+	if (dwc_otg)
+		return !!(dwc3_readl(dwc_otg->dwc->regs, DWC3_OSTS)
+				& DWC3_OSTS_CONIDSTS);
+	else
+		return 1;
+}
+
+int dwc3_otg_work(struct dwc3_otg *dwc_otg, int evt)
+{
+	int ret = 0;
+
+	DBG("+\n evt = %d", evt);
+
+	/* if otg is not enabled, do nothing */
+	if (!dwc_otg) {
+		pr_info("%s: dwc3 is not otg mode!\n", __func__);
+		return 0;
+	}
+
+	switch (evt) {
+	case DWC3_OTG_EVT_ID_SET:
+		dwc3_otg_stop_host(dwc_otg);
+		dwc3_suspend_device(dwc_otg->dwc);
+		break;
+	case DWC3_OTG_EVT_ID_CLEAR:
+		ret = dwc3_resume_device(dwc_otg->dwc);
+		if (ret) {
+			pr_err("%s: resume device failed!\n", __func__);
+			return ret;
+		}
+		ret = dwc3_otg_start_host(dwc_otg);
+		if (ret) {
+			pr_err("%s: start host failed!\n", __func__);
+			dwc3_suspend_device(dwc_otg->dwc);
+			return ret;
+		}
+		break;
+	case DWC3_OTG_EVT_VBUS_SET:
+		ret = dwc3_resume_device(dwc_otg->dwc);
+		if (ret) {
+			pr_err("%s: resume device failed!\n", __func__);
+			return ret;
+		}
+		ret = dwc3_otg_start_peripheral(dwc_otg);
+		if (ret) {
+			pr_err("%s: start peripheral failed!\n", __func__);
+			dwc3_suspend_device(dwc_otg->dwc);
+			return ret;
+		}
+		break;
+	case DWC3_OTG_EVT_VBUS_CLEAR:
+		ret = dwc3_otg_stop_peripheral(dwc_otg);
+		dwc3_suspend_device(dwc_otg->dwc);
+		break;
+	default:
+		break;
+	}
+	DBG("-\n");
+
+	return ret;
+}
+
+static void dwc3_otg_work_fun(struct work_struct *w)
+{
+	struct dwc3_otg *dwc_otg = container_of(
+			w, struct dwc3_otg, otg_work.work);
+
+	mutex_lock(&dwc_otg->lock);
+	if (dwc3_otg_work(dwc_otg, atomic_read(&dwc_otg->otg_evt_flag)))
+		pr_err("%s: dwc3_otg_work failed\n", __func__);
+	mutex_unlock(&dwc_otg->lock);
+}
+
+int dwc3_otg_init(struct dwc3 *dwc)
+{
+	struct dwc3_otg *dwc_otg;
+	u32 reg;
+
+	DBG("+\n");
+
+	dwc_otg = devm_kzalloc(dwc->dev, sizeof(struct dwc3_otg), GFP_KERNEL);
+	if (!dwc_otg)
+		return -ENOMEM;
+
+	dwc_otg->dwc = dwc;
+	dwc->dwc_otg = dwc_otg;
+
+	mutex_init(&dwc_otg->lock);
+	INIT_DELAYED_WORK(&dwc_otg->otg_work, dwc3_otg_work_fun);
+
+	dwc_otg_handler = dwc_otg;
+
+#ifdef DWC3_OTG_FORCE_MODE
+	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
+	pr_debug("%s: GCTL value 0x%x\n", __func__, reg);
+
+	/* default device mode */
+	dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
+#else
+	/* disable hnp and srp */
+	reg = dwc3_readl(dwc->regs, DWC3_OCFG);
+	reg &= ~(DWC3_OCFG_HNPCAP | DWC3_OCFG_SRPCAP);
+	dwc3_writel(dwc->regs, DWC3_OCFG, reg);
+
+	reg = dwc3_readl(dwc->regs, DWC3_OSTS);
+	if (reg & DWC3_OSTS_CONIDSTS) {
+		DBG("%s: ID is 1, set peripheral mode\n", __func__);
+		reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+		reg |= DWC3_OCTL_PERIMODE;
+		reg &= ~(DWC3_OCTL_HNPREQ | DWC3_OCTL_DEVSETHNPEN |
+				DWC3_OCTL_HSTSETHNPEN);
+		dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	} else {
+		DBG("%s: ID is 0, clear peripheral mode\n", __func__);
+		reg = dwc3_readl(dwc->regs, DWC3_OCTL);
+		reg &= ~DWC3_OCTL_PERIMODE;
+		dwc3_writel(dwc->regs, DWC3_OCTL, reg);
+	}
+#endif
+
+	dump_otg_regs(dwc);
+
+	DBG("-\n");
+
+	return 0;
+}
+
+void dwc3_otg_exit(struct dwc3 *dwc)
+{
+	DBG("+\n");
+	dwc_otg_handler = NULL;
+	dwc->dwc_otg->dwc = NULL;
+	dwc->dwc_otg = NULL;
+	DBG("-\n");
+}
diff --git a/drivers/usb/dwc3/dwc3-otg.h b/drivers/usb/dwc3/dwc3-otg.h
new file mode 100644
index 000000000000..b9114b16f050
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-otg.h
@@ -0,0 +1,133 @@
+/*
+ * dwc3-otg.h
+ *
+ * Copyright: (C) 2008-2018 hisilicon.
+ * Contact: wangbinghui<wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
+ *
+ * USB vbus for Hisilicon device
+ *
+ * This software is available to you under a choice of one of two
+ * licenses. You may choose this file to be licensed under the terms
+ * of the GNU General Public License (GPL) Version 2 or the 2-clause
+ * BSD license listed below:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ */
+#ifndef __DRIVERS_USB_DWC3_OTG_H
+#define __DRIVERS_USB_DWC3_OTG_H
+
+/* BC Registers */
+#define DWC3_BCFG	0xcc30
+#define DWC3_BCEVT	0xcc38
+#define DWC3_BCEVTEN	0xcc3c
+#ifndef BIT
+#define BIT(x)	(1 << (x))
+#endif
+/*  OTG Configuration Register */
+#define DWC3_OCFG_DISPRTPWRCUTOFF	BIT(5)
+#define DWC3_OCFG_OTGHIBDISMASK		BIT(4)
+#define DWC3_OCFG_OTGSFTRSTMSK		BIT(3)
+#define DWC3_OCFG_HNPCAP		BIT(1)
+#define DWC3_OCFG_SRPCAP		1
+
+/*  OTG Control Register */
+#define	DWC3_OCTL_OTG3_GOERR		BIT(7)
+#define	DWC3_OCTL_PERIMODE		BIT(6)
+#define	DWC3_OCTL_PRTPWRCTL		BIT(5)
+#define	DWC3_OCTL_HNPREQ		BIT(4)
+#define	DWC3_OCTL_SESREQ		BIT(3)
+#define	DWC3_OCTL_TERMSELDLPULSE	BIT(2)
+#define	DWC3_OCTL_DEVSETHNPEN		BIT(1)
+#define	DWC3_OCTL_HSTSETHNPEN		BIT(0)
+
+/*  OTG Events Register */
+#define DWC3_OEVT_DEVICEMOD			BIT(31)
+#define DWC3_OEVT_OTGXHCIRUNSTPSETEVNT		BIT(27)
+#define DWC3_OEVT_OTGDEVRUNSTPSETEVNT		BIT(26)
+#define DWC3_OEVT_OTGHIBENTRYEVNT		BIT(25)
+#define DWC3_OEVT_OTGCONIDSTSCHNGEVNT		BIT(24)
+#define DWC3_OEVT_HRRCONFNOTIFEVNT		BIT(23)
+#define DWC3_OEVT_HRRINITNOTIFEVNT		BIT(22)
+#define DWC3_OEVT_OTGADEVIDLEEVNT		BIT(21)
+#define DWC3_OEVT_OTGADEVBHOSTENDEVNT		BIT(20)
+#define DWC3_OEVT_OTGADEVHOSTEVNT		BIT(19)
+#define DWC3_OEVT_OTGADEVHNPCHNGEVNT		BIT(18)
+#define DWC3_OEVT_OTGADEVSRPDETEVNT		BIT(17)
+#define DWC3_OEVT_OTGADEVSESSENDDETEVNT		BIT(16)
+#define DWC3_OEVT_OTGBDEVBHOSTENDEVNT		BIT(11)
+#define DWC3_OEVT_OTGBDEVHNPCHNGEVNT		BIT(10)
+#define DWC3_OEVT_OTGBDEVSESSVLDDETEVNT		BIT(9)
+#define DWC3_OEVT_OTGBDEVVBUSCHNGEVNT		BIT(8)
+
+/*  OTG Status Register */
+#define DWC3_OSTS_OTGSTATE_MSK          (0xf << 8)
+#define DWC3_OSTS_PERIPHERALSTATE       BIT(4)
+#define DWC3_OSTS_XHCIPRTPOWER          BIT(3)
+#define DWC3_OSTS_BSESVLD               BIT(2)
+#define DWC3_OSTS_ASESVLD               BIT(1)
+#define DWC3_OSTS_CONIDSTS              BIT(0)
+
+struct dwc3_otg {
+	struct usb_otg otg;
+	struct dwc3 *dwc;
+	int otg_irq;
+	struct delayed_work otg_work;
+
+	atomic_t otg_evt_flag;
+#define DWC3_OTG_EVT_ID_SET 1
+#define DWC3_OTG_EVT_ID_CLEAR 2
+#define DWC3_OTG_EVT_VBUS_SET 3
+#define DWC3_OTG_EVT_VBUS_CLEAR 4
+
+	struct mutex lock;
+};
+
+#ifdef CONFIG_USB_DWC3_OTG
+extern struct dwc3_otg *dwc_otg_handler;
+int dwc3_otg_init(struct dwc3 *dwc);
+void dwc3_otg_exit(struct dwc3 *dwc);
+int dwc3_otg_work(struct dwc3_otg *dwc_otg, int evt);
+int dwc3_otg_resume(struct dwc3 *dwc);
+int dwc3_otg_suspend(struct dwc3 *dwc);
+int dwc3_otg_id_value(struct dwc3_otg *dwc_otg);
+#else
+#define dwc_otg_handler ((struct dwc3_otg *)NULL)
+static inline int dwc3_otg_init(struct dwc3 *dwc)
+{
+	return 0;
+}
+
+static inline void dwc3_otg_exit(struct dwc3 *dwc)
+{
+}
+
+static inline int dwc3_otg_work(struct dwc3_otg *dwc_otg, int evt)
+{
+	return 0;
+}
+
+static inline int dwc3_otg_resume(struct dwc3 *dwc)
+{
+	return 0;
+}
+
+static inline int dwc3_otg_suspend(struct dwc3 *dwc)
+{
+	return 0;
+}
+
+static inline int dwc3_otg_id_value(struct dwc3_otg *dwc_otg)
+{
+	return 0;
+};
+#endif
+
+#endif /* __DRIVERS_USB_DWC3_OTG_H */
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 75e6cb044eb2..e2c8d2ebfb64 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -98,11 +98,19 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
 	struct dwc3		*dwc = dep->dwc;
+	int ret;
 
 	req->request.actual	= 0;
 	req->request.status	= -EINPROGRESS;
 	req->epnum		= dep->number;
 
+	/* we share one TRB for ep0/1 */
+	if (!list_empty(&dep->pending_list)) {
+		dev_WARN(dwc->dev, "ep0 busy!\n");
+		ret = -EBUSY;
+		return ret;
+	}
+
 	list_add_tail(&req->list, &dep->pending_list);
 
 	/*
@@ -190,8 +198,18 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 		__dwc3_ep0_do_control_data(dwc, dwc->eps[direction], req);
 
 		dep->flags &= ~DWC3_EP0_DIR_IN;
+
+		return 0;
 	}
 
+	/* mark the status phase already queued */
+	if (dwc->ep0_next_event == DWC3_EP0_NRDY_STATUS)
+		dwc->status_queued = true;
+
+	if (req->request.length != 0)
+		dev_WARN(dwc->dev, "status phase len %d\n",
+			 req->request.length);
+
 	return 0;
 }
 
@@ -241,6 +259,7 @@ static void dwc3_ep0_stall_and_restart(struct dwc3 *dwc)
 	__dwc3_gadget_ep_set_halt(dep, 1, false);
 	dep->flags = DWC3_EP_ENABLED;
 	dwc->delayed_status = false;
+	dwc->status_queued = false;
 
 	if (!list_empty(&dep->pending_list)) {
 		struct dwc3_request	*req;
@@ -329,6 +348,12 @@ static int dwc3_ep0_handle_status(struct dwc3 *dwc,
 	if (value != 0)
 		return -EINVAL;
 
+	if (!(ctrl->bRequestType & USB_DIR_IN))
+		return -EINVAL;
+
+	if (!le16_to_cpu(ctrl->wLength))
+		return -EINVAL;
+
 	recip = ctrl->bRequestType & USB_RECIP_MASK;
 	switch (recip) {
 	case USB_RECIP_DEVICE:
@@ -714,6 +739,12 @@ static int dwc3_ep0_set_sel(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 	u16		wLength;
 	u16		wValue;
 
+	if (unlikely(ctrl->bRequestType & USB_DIR_IN))
+		return -EINVAL;
+
+	if (unlikely(!le16_to_cpu(ctrl->wLength)))
+		return -EINVAL;
+
 	if (state == USB_STATE_DEFAULT)
 		return -EINVAL;
 
@@ -830,9 +861,25 @@ static void dwc3_ep0_inspect_setup(struct dwc3 *dwc,
 	if (ret == USB_GADGET_DELAYED_STATUS)
 		dwc->delayed_status = true;
 
+	if (dwc->status_queued) {
+		dwc->status_queued = false;
+		if (dwc->delayed_status) {
+			pr_info("delayed status already come, will not wait for it.\n");
+			dwc->delayed_status = false;
+			usb_gadget_set_state(&dwc->gadget,
+					     USB_STATE_CONFIGURED);
+		}
+	}
+
 out:
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dwc->dev, "ep0 setup error, ret %d!\n", ret);
+		dev_err(dwc->dev, "ctrl: %02x %02x %04x %04x %04x\n",
+			ctrl->bRequestType, ctrl->bRequest,
+			ctrl->wValue, ctrl->wIndex, ctrl->wLength);
 		dwc3_ep0_stall_and_restart(dwc);
+	}
+
 }
 
 static void dwc3_ep0_complete_data(struct dwc3 *dwc,
@@ -858,8 +905,10 @@ static void dwc3_ep0_complete_data(struct dwc3 *dwc,
 	trace_dwc3_complete_trb(ep0, trb);
 
 	r = next_request(&ep0->pending_list);
-	if (!r)
+	if (!r) {
+		dev_err(dwc->dev, "ep0 request list empty while complete data\n");
 		return;
+	}
 
 	status = DWC3_TRB_SIZE_TRBSTS(trb->size);
 	if (status == DWC3_TRBSTS_SETUP_PENDING) {
@@ -1135,6 +1184,8 @@ static void dwc3_ep0_xfernotready(struct dwc3 *dwc,
 			return;
 		}
 
+		dwc->status_queued = false;
+
 		dwc3_ep0_do_control_status(dwc, event);
 	}
 }
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index f064f1549333..069c6eb1cc5c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -34,6 +34,7 @@
 #include "core.h"
 #include "gadget.h"
 #include "io.h"
+#include "dwc3-hisi.h"
 
 /**
  * dwc3_gadget_set_test_mode - enables usb2 test modes
@@ -267,7 +268,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 {
 	const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
 	struct dwc3		*dwc = dep->dwc;
-	u32			timeout = 500;
+	u32			timeout = 3000;
 	u32			reg;
 
 	int			cmd_status = 0;
@@ -1476,6 +1477,9 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
 
 out1:
 	/* giveback the request */
+	if (!dep->queued_requests)
+		goto out0;
+
 	dep->queued_requests--;
 	dwc3_gadget_giveback(dep, req, -ECONNRESET);
 
@@ -2710,6 +2714,18 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
 }
 
+ATOMIC_NOTIFIER_HEAD(conndone_nh);
+
+int dwc3_conndone_notifier_register(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_register(&conndone_nh, nb);
+}
+
+int dwc3_conndone_notifier_unregister(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_unregister(&conndone_nh, nb);
+}
+
 static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 {
 	struct dwc3_ep		*dep;
@@ -3236,7 +3252,9 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	dwc->gadget.speed		= USB_SPEED_UNKNOWN;
 	dwc->gadget.sg_supported	= true;
 	dwc->gadget.name		= "dwc3-gadget";
+#ifndef CONFIG_USB_DWC3_HISI
 	dwc->gadget.is_otg		= dwc->dr_mode == USB_DR_MODE_OTG;
+#endif
 
 	/*
 	 * FIXME We might be setting max_speed to <SUPER, however versions
diff --git a/drivers/usb/dwc3/hisi_hikey_gpio.c b/drivers/usb/dwc3/hisi_hikey_gpio.c
new file mode 100644
index 000000000000..ae05bbf9dd4a
--- /dev/null
+++ b/drivers/usb/dwc3/hisi_hikey_gpio.c
@@ -0,0 +1,300 @@
+/*
+ * otgid_gpio_hub.c
+ *
+ * Copyright (c) Hisilicon Tech. Co., Ltd. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+#include <linux/i2c.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/timer.h>
+#include <linux/param.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/workqueue.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/uaccess.h>
+#include <linux/fs.h>
+#include <linux/hisi/log/hisi_log.h>
+#include <linux/hisi/usb/hisi_usb.h>
+#include <linux/tifm.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/hisi/usb/hisi_hikey_gpio.h>
+#define DEVICE_DRIVER_NAME "gpio_hub_for_usb5734"
+
+#define GPIO_HUB_OTG_HOST 1
+#define GPIO_HUB_OTG_DEVICE 0
+#define GPIO_TYPEC_VBUS_POWER 1
+#define GPIO_TYPEC_NO_POWER 0
+#define GPIO_HUB_VBUS_POWER 1
+#define GPIO_HUB_VBUS_NO_POWER 0
+#define GPIO_HUB_HUB_VBUS_POWER 1
+
+/* SOC_CRGPERIPH_PEREN1_UNION */
+#define SOC_CRGPERIPH_PEREN1_ADDR(base)               ((base) + (0x010))
+
+#define HISILOG_TAG GPIO_HUB
+HISILOG_REGIST();
+
+struct gpio_hub_info {
+	struct platform_device *pdev;
+	int otg_switch_gpio;
+	int typec_vbus_gpio;
+	int typec_vbus_enable_val;
+	int hub_vbus_gpio;
+};
+
+static struct gpio_hub_info gpio_hub_driver_info = {
+	.otg_switch_gpio = -1,
+	.typec_vbus_gpio = -1,
+	.typec_vbus_enable_val = -1,
+	.hub_vbus_gpio = -1,
+};
+
+void gpio_hub_power_off(void)
+{
+	if (gpio_is_valid(gpio_hub_driver_info.hub_vbus_gpio)) {
+		gpio_set_value(gpio_hub_driver_info.hub_vbus_gpio,
+			       GPIO_HUB_VBUS_NO_POWER);
+		hisilog_info("%s: gpio hub hub vbus no power set success",
+			     __func__);
+	} else {
+		hisilog_err("%s: gpio hub hub vbus no power set err",
+			    __func__);
+	}
+}
+
+void gpio_hub_power_on(void)
+{
+	if (gpio_is_valid(gpio_hub_driver_info.hub_vbus_gpio))
+		gpio_set_value(gpio_hub_driver_info.hub_vbus_gpio,
+			       GPIO_HUB_VBUS_POWER);
+	else
+		hisilog_err("%s: gpio hub hub vbus set err", __func__);
+}
+
+void gpio_hub_switch_to_hub(void)
+{
+	int gpio = gpio_hub_driver_info.otg_switch_gpio;
+
+	if (!gpio_is_valid(gpio)) {
+		hisilog_err("%s: otg_switch_gpio is err\n", __func__);
+		return;
+	}
+
+	if (gpio_get_value(gpio)) {
+		hisilog_info("%s: already switch to hub\n", __func__);
+		return;
+	}
+
+	gpio_direction_output(gpio, 1);
+	hisilog_err("%s: switch to hub\n", __func__);
+}
+EXPORT_SYMBOL_GPL(gpio_hub_switch_to_hub);
+
+void gpio_hub_switch_to_typec(void)
+{
+	int gpio = gpio_hub_driver_info.otg_switch_gpio;
+
+	if (!gpio_is_valid(gpio)) {
+		hisilog_err("%s: otg_switch_gpio is err\n", __func__);
+		return;
+	}
+
+	if (!gpio_get_value(gpio)) {
+		hisilog_info("%s: already switch to typec\n", __func__);
+		return;
+	}
+
+	gpio_direction_output(gpio, 0);
+	hisilog_err("%s: switch to typec\n", __func__);
+}
+EXPORT_SYMBOL_GPL(gpio_hub_switch_to_typec);
+
+static void gpio_hub_change_typec_power(int gpio, int on)
+{
+	if (!gpio_is_valid(gpio)) {
+		hisilog_err("%s: typec power gpio is err\n", __func__);
+		return;
+	}
+
+	if (gpio_get_value(gpio) == on) {
+		hisilog_info("%s: typec power no change\n", __func__);
+		return;
+	}
+
+	gpio_direction_output(gpio, on);
+	hisilog_info("%s: set typec vbus gpio to %d\n", __func__, on);
+}
+
+void gpio_hub_typec_power_on(void)
+{
+	struct gpio_hub_info *info = &gpio_hub_driver_info;
+
+	gpio_hub_change_typec_power(info->typec_vbus_gpio,
+				    info->typec_vbus_enable_val);
+}
+EXPORT_SYMBOL_GPL(gpio_hub_typec_power_on);
+
+void gpio_hub_typec_power_off(void)
+{
+	struct gpio_hub_info *info = &gpio_hub_driver_info;
+
+	gpio_hub_change_typec_power(info->typec_vbus_gpio,
+				    !info->typec_vbus_enable_val);
+}
+EXPORT_SYMBOL_GPL(gpio_hub_typec_power_off);
+
+static int gpio_hub_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct device_node *root = pdev->dev.of_node;
+	struct gpio_hub_info *info = &gpio_hub_driver_info;
+
+	hisilog_info("%s: step in\n", __func__);
+
+	info->pdev = pdev;
+	if (!pdev)
+		return -EBUSY;
+
+	info->hub_vbus_gpio = of_get_named_gpio(root, "hub_vdd33_en_gpio", 0);
+	if (!gpio_is_valid(info->hub_vbus_gpio)) {
+		hisilog_err("%s: hub_vbus_gpio is err\n", __func__);
+		return info->hub_vbus_gpio;
+	}
+	ret = gpio_request(info->hub_vbus_gpio, "hub_vbus_int_gpio");
+	if (ret) {
+		hisilog_err("%s: request hub_vbus_gpio err\n", __func__);
+		return ret;
+	}
+
+	info->typec_vbus_gpio = of_get_named_gpio(root,
+		"typc_vbus_int_gpio,typec-gpios", 0);
+	if (!gpio_is_valid(info->hub_vbus_gpio)) {
+		hisilog_err("%s: typec_vbus_gpio is err\n", __func__);
+		ret = info->typec_vbus_gpio;
+		goto free_gpio1;
+	}
+	ret = gpio_request(info->typec_vbus_gpio, "typc_vbus_int_gpio");
+	if (ret) {
+		hisilog_err("%s: request typec_vbus_gpio err\n", __func__);
+		goto free_gpio1;
+	}
+
+	ret = of_property_read_u32(root, "typc_vbus_enable_val",
+				   &info->typec_vbus_enable_val);
+	if (ret) {
+		hisilog_err("%s: typc_vbus_enable_val can't get\n", __func__);
+		goto free_gpio2;
+	}
+	info->typec_vbus_enable_val = !!info->typec_vbus_enable_val;
+
+	/* only for v2 */
+	info->otg_switch_gpio = of_get_named_gpio(root, "otg_gpio", 0);
+	if (!gpio_is_valid(info->otg_switch_gpio)) {
+		hisilog_info("%s: otg_switch_gpio is err\n", __func__);
+		info->otg_switch_gpio = -1;
+	}
+
+	ret = gpio_direction_output(info->hub_vbus_gpio, GPIO_HUB_VBUS_POWER);
+	if (ret) {
+		hisilog_err("%s: power on hub vbus err\n", __func__);
+		goto free_gpio2;
+	}
+
+	ret = gpio_direction_output(info->typec_vbus_gpio,
+				    info->typec_vbus_enable_val);
+	if (ret) {
+		hisilog_err("%s: power on typec vbus err", __func__);
+		goto free_gpio2;
+	}
+
+	return 0;
+
+free_gpio2:
+	gpio_free(info->typec_vbus_gpio);
+	info->typec_vbus_gpio = -1;
+free_gpio1:
+	gpio_free(info->hub_vbus_gpio);
+	info->hub_vbus_gpio = -1;
+
+	return ret;
+}
+
+static int  gpio_hub_remove(struct platform_device *pdev)
+{
+	struct gpio_hub_info *info = &gpio_hub_driver_info;
+
+	if (gpio_is_valid(info->otg_switch_gpio)) {
+		gpio_free(info->otg_switch_gpio);
+		info->otg_switch_gpio = -1;
+	}
+
+	if (gpio_is_valid(info->typec_vbus_gpio)) {
+		gpio_free(info->typec_vbus_gpio);
+		info->typec_vbus_gpio = -1;
+	}
+
+	if (gpio_is_valid(info->hub_vbus_gpio)) {
+		gpio_free(info->hub_vbus_gpio);
+		info->hub_vbus_gpio = -1;
+	}
+	return 0;
+}
+
+static const struct of_device_id id_table_for_gpio_hub[] = {
+	{.compatible = "hisilicon,gpio_hubv1"},
+	{.compatible = "hisilicon,gpio_hubv2"},
+	{}
+};
+
+static struct platform_driver gpio_hub_driver = {
+	.probe = gpio_hub_probe,
+	.remove = gpio_hub_remove,
+	.driver = {
+		.name = DEVICE_DRIVER_NAME,
+		.of_match_table = of_match_ptr(id_table_for_gpio_hub),
+
+	},
+};
+
+static int __init gpio_hub_init(void)
+{
+	int ret = platform_driver_register(&gpio_hub_driver);
+
+	hisilog_info("%s:gpio hub init status:%d\n", __func__, ret);
+	return ret;
+}
+
+static void __exit gpio_hub_exit(void)
+{
+	platform_driver_unregister(&gpio_hub_driver);
+}
+
+module_init(gpio_hub_init);
+module_exit(gpio_hub_exit);
+
+MODULE_AUTHOR("wangbinghui<wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>");
+MODULE_DESCRIPTION("HUB GPIO FOR OTG ID driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 76f0b0df37c1..ccbf0c35a9b1 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -96,6 +96,15 @@ int dwc3_host_init(struct dwc3 *dwc)
 		goto err1;
 	}
 
+#ifdef CONFIG_USB_DWC3_HISI
+	/* if otg, otg will do device_add */
+	if (dwc->dwc_otg) {
+		dev_err(dwc->dev, "%s if otg, otg will do device_add.\n",
+			__func__);
+		return 0;
+	}
+#endif
+
 	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
 
 	if (dwc->usb3_lpm_capable)
@@ -145,6 +154,10 @@ int dwc3_host_init(struct dwc3 *dwc)
 
 void dwc3_host_exit(struct dwc3 *dwc)
 {
+#ifdef CONFIG_USB_DWC3_HISI
+	if (dwc->dwc_otg)
+		return;
+#endif
 	phy_remove_lookup(dwc->usb2_generic_phy, "usb2-phy",
 			  dev_name(dwc->dev));
 	phy_remove_lookup(dwc->usb3_generic_phy, "usb3-phy",
diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h
index c69b06696824..adc8648c92b2 100644
--- a/drivers/usb/dwc3/io.h
+++ b/drivers/usb/dwc3/io.h
@@ -28,6 +28,13 @@ static inline u32 dwc3_readl(void __iomem *base, u32 offset)
 {
 	u32 value;
 
+#ifdef CONFIG_USB_DWC3_HISI
+	extern atomic_t hisi_dwc3_power_on;
+
+	if (unlikely(atomic_read(&hisi_dwc3_power_on) == 0))
+		return 0;
+#endif
+
 	/*
 	 * We requested the mem region starting from the Globals address
 	 * space, see dwc3_probe in core.c.
@@ -47,6 +54,13 @@ static inline u32 dwc3_readl(void __iomem *base, u32 offset)
 
 static inline void dwc3_writel(void __iomem *base, u32 offset, u32 value)
 {
+#ifdef CONFIG_USB_DWC3_HISI
+	extern atomic_t hisi_dwc3_power_on;
+
+	if (unlikely(atomic_read(&hisi_dwc3_power_on) == 0))
+		return;
+#endif
+
 	/*
 	 * We requested the mem region starting from the Globals address
 	 * space, see dwc3_probe in core.c.
diff --git a/include/linux/hisi/log/hisi_log.h b/include/linux/hisi/log/hisi_log.h
new file mode 100644
index 000000000000..cc3eda1c4f0f
--- /dev/null
+++ b/include/linux/hisi/log/hisi_log.h
@@ -0,0 +1,143 @@
+#ifndef _LINUX_HISILOG_H
+#define _LINUX_HISILOG_H
+
+#include <linux/printk.h>
+#include <linux/types.h>
+
+enum {
+	HISILOG_ERR         = 1U << 0,
+	HISILOG_WARNING     = 1U << 1,
+	HISILOG_INFO        = 1U << 2,
+	HISILOG_DEBUG       = 1U << 3,
+	HISILOG_DEBUG1      = 1U << 4,
+	HISILOG_DEBUG2      = 1U << 5,
+	HISILOG_DEBUG3      = 1U << 6,
+	HISILOG_DEBUG4      = 1U << 7,
+};
+
+#define HISILOG_TAG_DEFOUTL_LEVEL (HISILOG_ERR \
+		| HISILOG_WARNING \
+		| HISILOG_INFO)
+
+struct hisi_log_tag {
+	const char *name;
+	u32 level;
+};
+
+#define HISILOG_REGIST()	\
+	HISILOG_REGIST_TAG_LEVEL(HISILOG_TAG, HISILOG_TAG_DEFOUTL_LEVEL)
+
+#define HISILOG_REGIST_LEVEL(level)	\
+	HISILOG_REGIST_TAG_LEVEL(HISILOG_TAG, level)
+
+#define HISILOG_REGIST_TAG_LEVEL(name, level)	\
+	_HISILOG_REGIST_TAG_LEVEL(name, level)
+
+#define _HISILOG_REGIST_TAG_LEVEL(name, level)	\
+	static struct hisi_log_tag TAG_STRUCT_NAME(name)	\
+__used								\
+__attribute__ ((unused, __section__("__hisilog_tag"))) \
+= { #name, level}
+
+#define hisilog_err(x...) \
+	_hisilog_err(HISILOG_TAG, ##x)
+
+#define _hisilog_err(TAG, x...) \
+	__hisilog_err(TAG, ##x)
+
+#define __hisilog_err(TAG, fmt, ...) \
+	do { \
+		if (TAG_STRUCT_NAME(TAG).level & HISILOG_ERR) \
+			pr_err(hw_fmt_tag(TAG, E) fmt, ##__VA_ARGS__);    \
+	} while (0)
+
+#define hisilog_warn(x...) \
+	_hisilog_warn(HISILOG_TAG, ##x)
+
+#define _hisilog_warn(TAG, x...) \
+	__hisilog_warn(TAG, ##x)
+
+#define __hisilog_warn(TAG, fmt, ...) \
+	do { \
+		if (TAG_STRUCT_NAME(TAG).level & HISILOG_WARNING) \
+			pr_err(hw_fmt_tag(TAG, W) fmt, ##__VA_ARGS__);    \
+	} while (0)
+
+#define hisilog_info(x...) \
+	_hisilog_info(HISILOG_TAG, ##x)
+
+#define _hisilog_info(TAG, x...) \
+	__hisilog_info(TAG, ##x)
+
+#define __hisilog_info(TAG, fmt, ...) \
+	do { \
+		if (TAG_STRUCT_NAME(TAG).level & HISILOG_INFO) \
+			pr_info(hw_fmt_tag(TAG, I) fmt, ##__VA_ARGS__);    \
+	} while (0)
+
+#define hisilog_debug(x...) \
+	_hisilog_debug(HISILOG_TAG, ##x)
+
+#define _hisilog_debug(TAG, x...) \
+	__hisilog_debug(TAG, ##x)
+
+#define __hisilog_debug(TAG, fmt, ...) \
+	do { \
+		if (TAG_STRUCT_NAME(TAG).level & HISILOG_DEBUG) \
+			pr_err(hw_fmt_tag(TAG, D) fmt, ##__VA_ARGS__);    \
+	} while (0)
+
+#define hisilog_debug1(x...) \
+	_hisilog_debug1(HISILOG_TAG, ##x)
+
+#define _hisilog_debug1(TAG, x...) \
+	__hisilog_debug1(TAG, ##x)
+
+#define __hisilog_debug1(TAG, fmt, ...) \
+	do { \
+		if (TAG_STRUCT_NAME(TAG).level & HISILOG_DEBUG1) \
+			pr_err(hw_fmt_tag(TAG, D1) fmt, ##__VA_ARGS__);    \
+	} while (0)
+
+#define hisilog_debug2(x...) \
+	_hisilog_debug2(HISILOG_TAG, ##x)
+
+#define _hisilog_debug2(TAG, x...) \
+	__hisilog_debug2(TAG, ##x)
+
+#define __hisilog_debug2(TAG, fmt, ...) \
+	do { \
+		if (TAG_STRUCT_NAME(TAG).level & HISILOG_DEBUG2) \
+			pr_err(hw_fmt_tag(TAG, D2) fmt, ##__VA_ARGS__);    \
+	} while (0)
+
+#define hisilog_debug3(x...) \
+	_hisilog_debug3(HISILOG_TAG, ##x)
+
+#define _hisilog_debug3(TAG, x...) \
+	__hisilog_debug3(TAG, ##x)
+
+#define __hisilog_debug3(TAG, fmt, ...) \
+	do { \
+		if (TAG_STRUCT_NAME(TAG).level & HISILOG_DEBUG3) \
+			pr_err(hw_fmt_tag(TAG, D3) fmt, ##__VA_ARGS__);    \
+	} while (0)
+
+#define hisilog_debug4(x...) \
+	_hisilog_debug4(HISILOG_TAG, ##x)
+
+#define _hisilog_debug4(TAG, x...) \
+	__hisilog_debug4(TAG, ##x)
+
+#define __hisilog_debug4(TAG, fmt, ...) \
+	do { \
+		if (TAG_STRUCT_NAME(TAG).level & HISILOG_DEBUG4) \
+			pr_err(hw_fmt_tag(TAG, D4) fmt, ##__VA_ARGS__);    \
+	} while (0)
+
+#define TAG_STRUCT_NAME(name) \
+	_hwtag_##name
+
+#define hw_fmt_tag(TAG, LEVEL) "[" #LEVEL "/" #TAG "] "
+
+#endif
diff --git a/include/linux/hisi/usb/hisi_hikey_gpio.h b/include/linux/hisi/usb/hisi_hikey_gpio.h
new file mode 100644
index 000000000000..99df5772df96
--- /dev/null
+++ b/include/linux/hisi/usb/hisi_hikey_gpio.h
@@ -0,0 +1,24 @@
+/*
+ * hub_usb5734.h
+ *
+ * Copyright (c) Hisilicon Tech. Co., Ltd. All rights reserved.
+ *
+ * Chenjun <chenjun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+void gpio_hub_power_on(void);
+void gpio_hub_power_off(void);
+void gpio_hub_switch_to_hub(void);
+void gpio_hub_switch_to_typec(void);
+void gpio_hub_typec_power_off(void);
+void gpio_hub_typec_power_on(void);
diff --git a/include/linux/hisi/usb/hisi_usb.h b/include/linux/hisi/usb/hisi_usb.h
new file mode 100644
index 000000000000..9ee216e32cd1
--- /dev/null
+++ b/include/linux/hisi/usb/hisi_usb.h
@@ -0,0 +1,57 @@
+#ifndef _HISI_USB_H_
+#define _HISI_USB_H_
+
+enum hisi_charger_type {
+	CHARGER_TYPE_SDP = 0,		/* Standard Downstreame Port */
+	CHARGER_TYPE_CDP,		/* Charging Downstreame Port */
+	CHARGER_TYPE_DCP,		/* Dedicate Charging Port */
+	CHARGER_TYPE_UNKNOWN,		/* non-standard */
+	CHARGER_TYPE_NONE,		/* not connected */
+
+	/* other messages */
+	PLEASE_PROVIDE_POWER,		/* host mode, provide power */
+};
+
+enum otg_dev_event_type {
+	CHARGER_CONNECT_EVENT = 0,
+	CHARGER_DISCONNECT_EVENT,
+	ID_FALL_EVENT,
+	ID_RISE_EVENT,
+	NONE_EVENT
+};
+
+#if defined(CONFIG_USB_SUSB_HDRC) || defined(CONFIG_USB_DWC3)
+int hisi_charger_type_notifier_register(struct notifier_block *nb);
+int hisi_charger_type_notifier_unregister(struct notifier_block *nb);
+enum hisi_charger_type hisi_get_charger_type(void);
+int hisi_usb_otg_event(enum otg_dev_event_type event_type);
+void hisi_usb_otg_bc_again(void);
+#else
+static inline int hisi_charger_type_notifier_register(
+		struct notifier_block *nb){return 0; }
+static inline int hisi_charger_type_notifier_unregister(
+		struct notifier_block *nb){return 0; }
+static inline enum hisi_charger_type hisi_get_charger_type(void)
+{
+	return CHARGER_TYPE_NONE;
+}
+
+static inline int hisi_usb_otg_event(enum otg_dev_event_type event_type)
+{
+	return 0;
+}
+
+static inline void hisi_usb_otg_bc_again(void)
+{
+}
+#endif /* CONFIG_USB_SUSB_HDRC || CONFIG_USB_DWC3 */
+
+static inline int hisi_usb_id_change(enum otg_dev_event_type event)
+{
+	if ((event == ID_FALL_EVENT) || (event == ID_RISE_EVENT))
+		return hisi_usb_otg_event(event);
+	else
+		return 0;
+}
+
+#endif /* _HISI_USB_H_*/
-- 
2.11.GIT


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
