From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: dts: sunxi: Add de_be0 clk parent pll
 to simplefb node
Date: Sun, 16 Nov 2014 17:09:32 +0100
Message-ID: <1416154172-4116-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBQ4YUORQKGQEQKGWDOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Avoid the parent pll for the mod-clk for de_be0 getting disabled when non of
the other users are enabled (which can happen when none of i2c, spi and mmc
are in use).

Note for now we point directly to the parent rather then to the de_be0 mod-clk
as that is not modelled in our devicetree yet.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-Fix typos in commit message
---
 arch/arm/boot/dts/sun4i-a10.dtsi  | 3 ++-
 arch/arm/boot/dts/sun5i-a10s.dtsi | 3 ++-
 arch/arm/boot/dts/sun6i-a31.dtsi  | 1 +
 arch/arm/boot/dts/sun7i-a20.dtsi  | 3 ++-
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index cdb4708..92d8aa6 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -34,7 +34,8 @@
 
 		framebuffer0-hdmi {
 			compatible = "simple-framebuffer";
-			clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
+			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
+				 <&ahb_gates 44>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index aee7f25..c678e56 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -31,7 +31,8 @@
 
 		framebuffer0-hdmi {
 			compatible = "simple-framebuffer";
-			clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
+			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
+				 <&ahb_gates 44>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 04a5cb3..ccc03f3 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -69,6 +69,7 @@
 
 		framebuffer0-hdmi {
 			compatible = "simple-framebuffer";
+			clocks = <&pll6>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 58c1573..89766cb 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -71,7 +71,8 @@
 
 		framebuffer0-hdmi {
 			compatible = "simple-framebuffer";
-			clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
+			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
+				 <&ahb_gates 44>;
 			status = "disabled";
 		};
 	};
-- 
2.1.0
