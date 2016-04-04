From: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/2] ARM: configs: keystone: Add CPU Hotplug related options
Date: Mon, 4 Apr 2016 23:59:03 +0530
Message-ID: <1459794543-4822-3-git-send-email-j-keerthy@ti.com>
References: <1459794543-4822-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459794543-4822-1-git-send-email-j-keerthy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, vitalya-l0cyMroinI0@public.gmane.org, nm-l0cyMroinI0@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, j-keerthy-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the config options needed to get CPU hotplug functional.

Signed-off-by: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
---
 arch/arm/configs/keystone_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 5bcc9cf..faba04d 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -30,6 +30,8 @@ CONFIG_PCI=y
 CONFIG_PCI_MSI=y
 CONFIG_PCI_KEYSTONE=y
 CONFIG_SMP=y
+CONFIG_HOTPLUG_CPU=y
+CONFIG_ARM_PSCI=y
 CONFIG_PREEMPT=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
