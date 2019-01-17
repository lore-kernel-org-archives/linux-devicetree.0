From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 4/4] usb: musb: Kconfig: Drop dependency on CONFIG_USB for jz4740
Date: Thu, 17 Jan 2019 19:33:30 -0300
Message-ID: <20190117223330.16631-4-paul@crapouillou.net>
References: <20190117223330.16631-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117223330.16631-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The Kconfig entry previously depended on USB_OTG_BLACKLIST_HUB
unconditionally, which is an option that is only available when
CONFIG_USB is enabled. However, the USB IP in the JZ4740 SoC does not
support host mode, only gadget mode, so it makes sense to allow it to
build when CONFIG_USB is not set.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

v2: Instead of removing the dependency on USB_OTG_BLACKLIST_HUB, we now
    depend on (USB=n || USB_OTG_BLACKLIST_HUB)

v3: No change

 drivers/usb/musb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 6f5b0ed6a507..fda7691bf173 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -113,7 +113,7 @@ config USB_MUSB_JZ4740
 	depends on NOP_USB_XCEIV
 	depends on MIPS || COMPILE_TEST
 	depends on USB_MUSB_GADGET
-	depends on USB_OTG_BLACKLIST_HUB
+	depends on USB=n || USB_OTG_BLACKLIST_HUB
 
 config USB_MUSB_AM335X_CHILD
 	tristate
-- 
2.11.0
