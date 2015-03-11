From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] of/platform: Fix sparc:allmodconfig build
Date: Tue, 10 Mar 2015 20:31:04 -0700
Message-ID: <1426044664-8174-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

sparc:allmodconfig fails to build with:

drivers/built-in.o: In function `platform_bus_init':
(.init.text+0x3684): undefined reference to `of_platform_register_reconfig_notifier'

of_platform_register_reconfig_notifier is only declared if both OF_ADDRESS
and OF_DYNAMIC are configured. Yet, the include file only declares a dummy
function if OF_DYNAMIC is not configured. The sparc architecture does not
configure OF_ADDRESS, but does configure OF_DYNAMIC, causing above error.

Fixes: 801d728c10db ("of/reconfig: Add OF_DYNAMIC notifier for platform_bus_type")
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 include/linux/of_platform.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 8a860f0..611a691 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -84,7 +84,7 @@ static inline int of_platform_populate(struct device_node *root,
 static inline void of_platform_depopulate(struct device *parent) { }
 #endif
 
-#ifdef CONFIG_OF_DYNAMIC
+#if defined(CONFIG_OF_DYNAMIC) && defined(CONFIG_OF_ADDRESS)
 extern void of_platform_register_reconfig_notifier(void);
 #else
 static inline void of_platform_register_reconfig_notifier(void) { }
-- 
2.1.0
