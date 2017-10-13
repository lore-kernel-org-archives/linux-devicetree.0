From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 7/9] usb: host: modify description for MTK xHCI config
Date: Fri, 13 Oct 2017 16:26:39 +0800
Message-ID: <37153cd259af6e1fc34b32a2e0dd1a15b8214579.1507882470.git.chunfeng.yun@mediatek.com>
References: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1507882470.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1507882470.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Due to all MediaTek SoCs with xHCI host controller use this
driver, remove limitation for specific SoCs

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index fa5692d..bc09a2e 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -45,12 +45,12 @@ config USB_XHCI_PLATFORM
 	  If unsure, say N.
 
 config USB_XHCI_MTK
-	tristate "xHCI support for Mediatek MT65xx/MT7621"
+	tristate "xHCI support for MediaTek SoCs"
 	select MFD_SYSCON
 	depends on (MIPS && SOC_MT7621) || ARCH_MEDIATEK || COMPILE_TEST
 	---help---
 	  Say 'Y' to enable the support for the xHCI host controller
-	  found in Mediatek MT65xx SoCs.
+	  found in MediaTek SoCs.
 	  If unsure, say N.
 
 config USB_XHCI_MVEBU
-- 
1.7.9.5
