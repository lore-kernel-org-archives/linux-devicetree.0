From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/3] Minor exynos7 device tree/config patches
Date: Sun,  1 Mar 2015 21:53:43 +0530
Message-ID: <1425227026-5336-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Patch 1 specifies the fifo sizes for UART channels on exnyos7. Without
this the 4210 compatible defaults will be picked up which are different
from that on exynos7.
Patch 2 is based on a patch from Liviu Dudau fixing a similar issue
for arm boards.
Patch 3 is needed to enable support for arm64 based exynos7 platform.

Abhilash Kesavan (2):
  arm64: dts: add fifo size property for uart channels on exynos7
  arm64: dts: Fix interrupt active level for the generic timer on
    exynos7

Alim Akhtar (1):
  arm64: Enable Exynos7 SOC in the defconfig

 arch/arm64/boot/dts/exynos/exynos7.dtsi | 13 +++++++++----
 arch/arm64/configs/defconfig            |  4 ++++
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
