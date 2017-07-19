From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V2 8/9] usb: bdc: Enable in Kconfig for ARCH_BRCMSTB systems
Date: Wed, 19 Jul 2017 15:11:47 -0400
Message-ID: <1500491508-9783-9-git-send-email-alcooperx@gmail.com>
References: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Many ARM based Broadcom STB SoC's have a USB BDC controller so
enable this driver for these systems.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/gadget/udc/bdc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/bdc/Kconfig b/drivers/usb/gadget/udc/bdc/Kconfig
index eb8b553..c74ac25 100644
--- a/drivers/usb/gadget/udc/bdc/Kconfig
+++ b/drivers/usb/gadget/udc/bdc/Kconfig
@@ -1,6 +1,7 @@
 config USB_BDC_UDC
 	tristate "Broadcom USB3.0 device controller IP driver(BDC)"
 	depends on USB_GADGET && HAS_DMA
+	default ARCH_BRCMSTB
 
 	help
 	BDC is Broadcom's USB3.0 device controller IP. If your SOC has a BDC IP
-- 
1.9.0.138.g2de3478
