From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] ARM: dts: sun5i: Add A13 and A10s SRAM and
 SRAM controller
Date: Fri, 20 Mar 2015 19:52:47 +0100
Message-ID: <1426877569-11493-4-git-send-email-hdegoede@redhat.com>
References: <1426877569-11493-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBFWZWGUAKGQEP4QAZ6Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1426877569-11493-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The A13 / A10s has a few SRAM that can be mapped either to a device or to
the CPU, with the mapping being controlled by a SRAM controller.

Since most of the time these SRAM won't be accessible by the CPU,
we can't use the mmio-sram driver and compatible.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index de48692..eb5bce5 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -298,12 +298,46 @@
 		};
 	};
 
+	/*
+	 * Note we use the address were mmio registers start, not where the
+	 * SRAM blocks start, this cannot be changed because that would be
+	 * a devicetree ABI change.
+	 */
 	soc@01c00000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 
+		sram@00000000 {
+			compatible = "allwinner,sun4i-a10-sram";
+			reg = <0x00000000 0x4000>;
+			allwinner,sram-name = "A1";
+		};
+
+		sram@00004000 {
+			compatible = "allwinner,sun4i-a10-sram";
+			reg = <0x00004000 0x4000>;
+			allwinner,sram-name = "A2";
+		};
+
+		sram@00008000 {
+			compatible = "allwinner,sun4i-a10-sram";
+			reg = <0x00008000 0x4000>;
+			allwinner,sram-name = "A3-A4";
+		};
+
+		sram@00010000 {
+			compatible = "allwinner,sun4i-a10-sram";
+			reg = <0x00010000 0x1000>;
+			allwinner,sram-name = "D";
+		};
+
+		sram-controller@01c00000 {
+			compatible = "allwinner,sun4i-a10-sram-controller";
+			reg = <0x01c00000 0x30>;
+		};
+
 		dma: dma-controller@01c02000 {
 			compatible = "allwinner,sun4i-a10-dma";
 			reg = <0x01c02000 0x1000>;
-- 
2.3.3
