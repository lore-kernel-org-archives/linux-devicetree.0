From: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Subject: [PATCH V3 01/12] MAINTAINERS: Adding Maintainers for AMD Seattle Device Tree
Date: Wed, 10 Feb 2016 21:51:00 -0600
Message-ID: <1455162671-16044-2-git-send-email-Suravee.Suthikulpanit@amd.com>
References: <1455162671-16044-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455162671-16044-1-git-send-email-Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, thomas.lendacky-5C7GfCeVMHo@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>

Adding maintainers for AMD Seattle device tree.

Signed-off-by: Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Signed-off-by: Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f1fa4f..e349a32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -673,6 +673,13 @@ F:	drivers/gpu/drm/radeon/radeon_kfd.c
 F:	drivers/gpu/drm/radeon/radeon_kfd.h
 F:	include/uapi/linux/kfd_ioctl.h
 
+AMD SEATTLE DEVICE TREE SUPPORT
+M:	Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>
+M:	Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
+M:	Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>
+S:	Supported
+F:	arch/arm64/boot/dts/amd/
+
 AMD XGBE DRIVER
 M:	Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>
 L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
