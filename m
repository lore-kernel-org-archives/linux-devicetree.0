From: Jon Hunter <jon-hunter@ti.com>
Subject: [PATCH] ARM: dts: OMAP2420: Correct H4 board memory size
Date: Fri, 14 Dec 2012 14:34:18 -0600
Message-ID: <1355517258-30745-1-git-send-email-jon-hunter@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Benoit Cousson <b-cousson@ti.com>
Cc: linux-omap <linux-omap@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>, device-tree <devicetree-discuss@lists.ozlabs.org>, Jon Hunter <jon-hunter@ti.com>
List-Id: devicetree@vger.kernel.org

The system memory node for the OMAP2420 H4 was incorrectly defined as
start address followed by end address, instead of start address and
size. No noticable side-effects were observed but fix this for
correctness.

Signed-off-by: Jon Hunter <jon-hunter@ti.com>
---
 arch/arm/boot/dts/omap2420-h4.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap2420-h4.dts b/arch/arm/boot/dts/omap2420-h4.dts
index 77b84e1..9b0d077 100644
--- a/arch/arm/boot/dts/omap2420-h4.dts
+++ b/arch/arm/boot/dts/omap2420-h4.dts
@@ -15,6 +15,6 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0x80000000 0x84000000>; /* 64 MB */
+		reg = <0x80000000 0x4000000>; /* 64 MB */
 	};
 };
-- 
1.7.10.4

