From: Lars Persson <lars.persson-VrBV9hrLPhE@public.gmane.org>
Subject: [PATCH 7/8] arm: multi_v7_defconfig: add MACH_ARTPEC6
Date: Wed, 10 Feb 2016 13:41:56 +0100
Message-ID: <36d8a6a0236e08bc7286085018e2fa7a67691b39.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1455107681.git.larper-VrBV9hrLPhE@public.gmane.org>
In-Reply-To: <cover.1455107681.git.larper-VrBV9hrLPhE@public.gmane.org>
References: <cover.1455107681.git.larper-VrBV9hrLPhE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 8e8b2ac..bf3840e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -16,6 +16,8 @@ CONFIG_ARCH_MULTI_V7=y
 # CONFIG_ARCH_MULTI_V4 is not set
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_ALPINE=y
+CONFIG_ARCH_ARTPEC=y
+CONFIG_MACH_ARTPEC6=y
 CONFIG_ARCH_MVEBU=y
 CONFIG_MACH_ARMADA_370=y
 CONFIG_MACH_ARMADA_375=y
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
