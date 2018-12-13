From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/4] usb: musb: jz4740: Drop dependency on USB_OTG_BLACKLIST_HUB
Date: Thu, 13 Dec 2018 15:45:55 +0100
Message-ID: <20181213144555.24031-4-paul@crapouillou.net>
References: <20181213144555.24031-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213144555.24031-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The USB IP in the JZ4740 SoC does not support host mode, only gadget
mode.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 6f5b0ed6a507..a884179bc3c0 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -113,7 +113,6 @@ config USB_MUSB_JZ4740
 	depends on NOP_USB_XCEIV
 	depends on MIPS || COMPILE_TEST
 	depends on USB_MUSB_GADGET
-	depends on USB_OTG_BLACKLIST_HUB
 
 config USB_MUSB_AM335X_CHILD
 	tristate
-- 
2.11.0
