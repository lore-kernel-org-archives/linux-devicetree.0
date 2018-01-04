From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 6/8] dt-bindings: ARM: sunxi: Document A80
 SoC secure SRAM usage by SMP hotplug
Date: Thu,  4 Jan 2018 22:37:52 +0800
Message-ID: <20180104143754.2425-7-wens@csie.org>
References: <20180104143754.2425-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBV7YXDJAKGQEFHY243Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180104143754.2425-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mylene JOSSERAND <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On the Allwinner A80 SoC the BROM supports hotplugging the primary core
(cpu0) by checking two 32bit values at a specific location within the
secure SRAM block. This region needs to be reserved and accessible to
the SMP code.

Document its usage.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 .../devicetree/bindings/arm/sunxi/smp-sram.txt     | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/sunxi/smp-sram.txt

diff --git a/Documentation/devicetree/bindings/arm/sunxi/smp-sram.txt b/Documentation/devicetree/bindings/arm/sunxi/smp-sram.txt
new file mode 100644
index 000000000000..082e6a9382d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sunxi/smp-sram.txt
@@ -0,0 +1,44 @@
+Allwinner SRAM for smp bringup:
+------------------------------------------------
+
+Allwinner's A80 SoC uses part of the secure sram for hotplugging of the
+primary core (cpu0). Once the core gets powered up it checks if a magic
+value is set at a specific location. If it is then the BROM will jump
+to the software entry address, instead of executing a standard boot.
+
+Therefore a reserved section sub-node has to be added to the mmio-sram
+declaration.
+
+Note that this is separate from the Allwinner SRAM controller found in
+../../sram/sunxi-sram.txt. This SRAM is secure only and not mappable to
+any device.
+
+Also there are no "secure-only" properties. The implementation should
+check if this SRAM is usable first.
+
+Required sub-node properties:
+- compatible : depending on the SoC this should be one of:
+		"allwinner,sun9i-a80-smp-sram"
+
+The rest of the properties should follow the generic mmio-sram discription
+found in ../../misc/sram.txt
+
+Example:
+
+	sram_b: sram@20000 {
+		/* 256 KiB secure SRAM at 0x20000 */
+		compatible = "mmio-sram";
+		reg = <0x00020000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x00020000 0x40000>;
+
+		smp-sram@1000 {
+			/*
+			 * This is checked by BROM to determine if
+			 * cpu0 should jump to SMP entry vector
+			 */
+			compatible = "allwinner,sun9i-a80-smp-sram";
+			reg = <0x1000 0x8>;
+		};
+	};
-- 
2.15.1
