From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V2 3/6] usb: xhci: xhci-plat: Add support for Broadcom STB SoC's
Date: Wed, 17 Oct 2018 18:29:06 -0400
Message-ID: <1539815349-24126-4-git-send-email-alcooperx@gmail.com>
References: <1539815349-24126-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539815349-24126-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@
List-Id: devicetree@vger.kernel.org

Add support for Broadcom STB SoC's to the xhci platform driver

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/host/xhci-brcm.c | 17 +++++++++++++++++
 drivers/usb/host/xhci-brcm.h | 16 ++++++++++++++++
 drivers/usb/host/xhci-plat.c |  8 ++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 drivers/usb/host/xhci-brcm.c
 create mode 100644 drivers/usb/host/xhci-brcm.h

diff --git a/drivers/usb/host/xhci-brcm.c b/drivers/usb/host/xhci-brcm.c
new file mode 100644
index 000000000000..a7220126f6af
--- /dev/null
+++ b/drivers/usb/host/xhci-brcm.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2018, Broadcom */
+
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+
+#include "xhci.h"
+
+int xhci_plat_brcm_init_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+
+	xhci->quirks |= XHCI_RESET_ON_RESUME;
+	hcd->suspend_without_phy_exit = 1;
+	return 0;
+}
+
diff --git a/drivers/usb/host/xhci-brcm.h b/drivers/usb/host/xhci-brcm.h
new file mode 100644
index 000000000000..a39d1b807a4c
--- /dev/null
+++ b/drivers/usb/host/xhci-brcm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018, Broadcom */
+
+#ifndef _XHCI_BRCM_H
+#define _XHCI_BRCM_H
+
+#if IS_ENABLED(CONFIG_USB_XHCI_BRCM)
+int xhci_plat_brcm_init_quirk(struct usb_hcd *hcd);
+#else
+static inline int xhci_brcm_init_quirk(struct usb_hcd *hcd)
+{
+	return 0;
+}
+#endif
+#endif /* _XHCI_BRCM_H */
+
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 94e939249b2b..1de22928e862 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -23,6 +23,7 @@
 #include "xhci-plat.h"
 #include "xhci-mvebu.h"
 #include "xhci-rcar.h"
+#include "xhci-brcm.h"
 
 static struct hc_driver __read_mostly xhci_plat_hc_driver;
 
@@ -111,6 +112,10 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 	.resume_quirk = xhci_rcar_resume_quirk,
 };
 
+static const struct xhci_plat_priv xhci_plat_brcm = {
+	.init_quirk = xhci_plat_brcm_init_quirk
+};
+
 static const struct of_device_id usb_xhci_of_match[] = {
 	{
 		.compatible = "generic-xhci",
@@ -143,6 +148,9 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 	}, {
 		.compatible = "renesas,rcar-gen3-xhci",
 		.data = &xhci_plat_renesas_rcar_gen3,
+	}, {
+		.compatible = "brcm,bcm7445-xhci",
+		.data = &xhci_plat_brcm,
 	},
 	{},
 };
-- 
1.9.0.138.g2de3478
