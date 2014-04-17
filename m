From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v6 6/8] ARM: sun6i: Sort the NMI node by
 physical address
Date: Thu, 17 Apr 2014 10:46:17 +0200
Message-ID: <1397724379-15398-7-git-send-email-maxime.ripard@free-electrons.com>
References: <1397724379-15398-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBRNLX2NAKGQEBGHJAOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1397724379-15398-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DT are supposed to be ordered by physical address. Move the NMI node where
it belongs.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index bc46814d2ff0..5ebf963464b9 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -237,14 +237,6 @@
 		#size-cells = <1>;
 		ranges;
 
-		nmi_intc: interrupt-controller@01f00c0c {
-			compatible = "allwinner,sun6i-a31-sc-nmi";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			reg = <0x01f00c0c 0x38>;
-			interrupts = <0 32 4>;
-		};
-
 		pio: pinctrl@01c20800 {
 			compatible = "allwinner,sun6i-a31-pinctrl";
 			reg = <0x01c20800 0x400>;
@@ -479,6 +471,14 @@
 			interrupts = <1 9 0xf04>;
 		};
 
+		nmi_intc: interrupt-controller@01f00c0c {
+			compatible = "allwinner,sun6i-a31-sc-nmi";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			reg = <0x01f00c0c 0x38>;
+			interrupts = <0 32 4>;
+		};
+
 		prcm@01f01400 {
 			compatible = "allwinner,sun6i-a31-prcm";
 			reg = <0x01f01400 0x200>;
-- 
1.9.1
