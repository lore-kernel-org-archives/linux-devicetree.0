From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/3] ARM: keystone_defconfig: enable mdio and marvell eth phys
Date: Wed, 9 Jul 2014 16:14:20 +0300
Message-ID: <1404911660-10047-4-git-send-email-grygorii.strashko@ti.com>
References: <1404911660-10047-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404911660-10047-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable MDIO support for Keystone 2 SoCs and also
enable Marvell Ethernet PHYs support for Keystone 2 K2H EVM
which has two 1G Marvell 88E1111-B2 PHYs installed.

For more information see:
- http://www.advantech.com/Support/TI-EVM/EVMK2HX.aspx

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 arch/arm/configs/keystone_defconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 932ae40..e31e4d8 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -194,3 +194,5 @@ CONFIG_LEDS_TRIGGER_ONESHOT=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_BACKLIGHT=y
 CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_TI_DAVINCI_MDIO=y
+CONFIG_MARVELL_PHY=y
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
