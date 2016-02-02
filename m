From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/3] ARM: keystone: Create new binding for K2G SoC
Date: Tue,  2 Feb 2016 17:25:15 -0600
Message-ID: <1454455517-7360-2-git-send-email-fcooper@ti.com>
References: <1454455517-7360-1-git-send-email-fcooper@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454455517-7360-1-git-send-email-fcooper-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nm-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>

K2G SoC family is the newest version of the Keystone family of processors.

The technical reference manual for K2G can be found here:
http://www.ti.com/lit/ug/spruhy8/spruhy8.pdf

Add new bindings for K2G and the K2G evm. Also document these new bindings.

Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Signed-off-by: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/keystone/keystone.txt | 5 +++++
 arch/arm/mach-keystone/keystone.c                           | 1 +
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/keystone/keystone.txt b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
index 3090a8a..48f6703 100644
--- a/Documentation/devicetree/bindings/arm/keystone/keystone.txt
+++ b/Documentation/devicetree/bindings/arm/keystone/keystone.txt
@@ -22,6 +22,8 @@ SoCs:
    compatible = "ti,k2l", "ti,keystone"
 - Keystone 2 Edison
    compatible = "ti,k2e", "ti,keystone"
+- K2G
+   compatible = "ti,k2g", "ti,keystone"
 
 Boards:
 -  Keystone 2 Hawking/Kepler EVM
@@ -32,3 +34,6 @@ Boards:
 
 -  Keystone 2 Edison EVM
    compatible = "ti,k2e-evm", "ti,k2e", "ti,keystone"
+
+-  K2G EVM
+   compatible = "ti,k2g-evm", "ti,k2g", "ti-keystone"
diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
index c279293..55cb199 100644
--- a/arch/arm/mach-keystone/keystone.c
+++ b/arch/arm/mach-keystone/keystone.c
@@ -100,6 +100,7 @@ static const char *const keystone_match[] __initconst = {
 	"ti,k2hk",
 	"ti,k2e",
 	"ti,k2l",
+	"ti,k2g",
 	"ti,keystone",
 	NULL,
 };
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
