From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 3/4] usb: musb: Kconfig: Drop dependency on MACH_JZ4740 for jz4740
Date: Thu, 17 Jan 2019 19:33:29 -0300
Message-ID: <20190117223330.16631-3-paul@crapouillou.net>
References: <20190117223330.16631-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117223330.16631-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Depending on MACH_JZ4740 prevent us from creating a generic kernel that
works on more than one MIPS board. Instead, we just depend on MIPS being
set.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

v2: Remove info about adding COMPILE_TEST in commit message, as it was
    there before

v3: Change MACH_INGENIC to MACH_JZ4740 in commit message

 drivers/usb/musb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index ad08895e78f9..6f5b0ed6a507 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -111,7 +111,7 @@ config USB_MUSB_UX500
 config USB_MUSB_JZ4740
 	tristate "JZ4740"
 	depends on NOP_USB_XCEIV
-	depends on MACH_JZ4740 || COMPILE_TEST
+	depends on MIPS || COMPILE_TEST
 	depends on USB_MUSB_GADGET
 	depends on USB_OTG_BLACKLIST_HUB
 
-- 
2.11.0
