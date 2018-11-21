From: Hao Zhang <hao5781286@gmail.com>
Subject: [PATCH v1 2/2] Documentation: ARM: sunxi: Add Allwinner SoC T3.
Date: Wed, 21 Nov 2018 23:44:47 +0800
Message-ID: <20181121154447.GA4384@arx-s1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, maxime.ripard@free-electrons.com, wens@csie.org, icenowy@aosc.io
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com, hao5781286@gmail.com
List-Id: devicetree@vger.kernel.org

Add Allwinner SoC T3 document and fix format.

Signed-off-by: Hao Zhang <hao5781286@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
index e4beec3..94b9c12 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.txt
+++ b/Documentation/devicetree/bindings/arm/sunxi.txt
@@ -14,7 +14,8 @@ using one of the following compatible strings:
   allwinner,sun8i-a83t
   allwinner,sun8i-h2-plus
   allwinner,sun8i-h3
-  allwinner-sun8i-r40
+  allwinner,sun8i-r40
+  allwinner,sun8i-t3
   allwinner,sun8i-v3s
   allwinner,sun9i-a80
   allwinner,sun50i-a64
-- 
2.7.4
