From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v2 1/5] dt-bindings: update device tree binding
 for Allwinner PRCM CCUs
Date: Thu, 16 Mar 2017 01:28:04 +0800
Message-ID: <20170315172808.64011-2-icenowy@aosc.xyz>
References: <20170315172808.64011-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBZHTUXDAKGQEWD4HL4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170315172808.64011-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Many Allwinner SoCs after A31 have a CCU in PRCM block.

Give the ones on H3 and A64 compatible strings.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
Changes in v2:
- Add iosc for R_CCU's on H3/A64. (A31, A23 and A33 seem to have different
  clock for mux 3 of ar100 clk. Investgations are needed for them.)

 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
index 68512aa398a9..4a4addff595d 100644
--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -7,9 +7,11 @@ Required properties :
 		- "allwinner,sun8i-a23-ccu"
 		- "allwinner,sun8i-a33-ccu"
 		- "allwinner,sun8i-h3-ccu"
+		- "allwinner,sun8i-h3-r-ccu"
 		- "allwinner,sun8i-v3s-ccu"
 		- "allwinner,sun9i-a80-ccu"
 		- "allwinner,sun50i-a64-ccu"
+		- "allwinner,sun50i-a64-r-ccu"
 		- "allwinner,sun50i-h5-ccu"
 
 - reg: Must contain the registers base address and length
@@ -20,7 +22,11 @@ Required properties :
 - #clock-cells : must contain 1
 - #reset-cells : must contain 1
 
-Example:
+For the PRCM CCUs on H3/A64, one more clock is needed:
+- "iosc": another frequency oscillator used for CPUS (usually at 32000Hz,
+          not the same with losc)
+
+Example for generic CCU:
 ccu: clock@01c20000 {
 	compatible = "allwinner,sun8i-h3-ccu";
 	reg = <0x01c20000 0x400>;
@@ -29,3 +35,13 @@ ccu: clock@01c20000 {
 	#clock-cells = <1>;
 	#reset-cells = <1>;
 };
+
+Example for PRCM CCU:
+r_ccu: clock@01f01400 {
+	compatible = "allwinner,sun50i-a64-r-ccu";
+	reg = <0x01f01400 0x100>;
+	clocks = <&osc24M>, <&osc32k>, <&osc32000>;
+	clock-names = "hosc", "losc", "iosc";
+	#clock-cells = <1>;
+	#reset-cells = <1>;
+};
-- 
2.12.0
