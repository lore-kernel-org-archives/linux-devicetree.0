From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] MAINTAINERS: oxnas: Add new files definitions
Date: Fri, 21 Oct 2016 17:10:37 +0200
Message-ID: <20161021151037.20112-4-narmstrong@baylibre.com>
References: <20161021151037.20112-1-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161021151037.20112-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Fix the dts files maintained by the OXNAS platform, add a new board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cd38a7..29d8853 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1478,8 +1478,9 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-oxnas@lists.tuxfamily.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/mach-oxnas/
-F:	arch/arm/boot/dts/oxnas*
+F:	arch/arm/boot/dts/ox8*.dtsi
 F:	arch/arm/boot/dts/wd-mbwe.dts
+F:	arch/arm/boot/dts/cloudengines-pogoplug-series-3.dts
 N:	oxnas
 
 ARM/Mediatek RTC DRIVER
-- 
2.7.0
