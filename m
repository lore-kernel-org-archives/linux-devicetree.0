From: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 1/5] devicetree: bindings: document Broadcom CPU enable method
Date: Mon, 16 Jun 2014 14:39:43 -0500
Message-ID: <1402947587-13898-2-git-send-email-elder@linaro.org>
References: <1402947587-13898-1-git-send-email-elder@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402947587-13898-1-git-send-email-elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Broadcom mobile SoCs use a ROM-implemented holding pen for
controlled boot of secondary cores.  A special register is
used to communicate to the ROM that a secondary core should
start executing kernel code.  This enable method is currently
used for members of the bcm281xx and bcm21664 SoC families.

The use of an enable method also allows the SMP operation vector to
be assigned as a result of device tree content for these SoCs.

Signed-off-by: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 1fe72a0..cdca080 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -184,6 +184,7 @@ nodes to be present and contain the properties described below.
 			  can be one of:
 			    "allwinner,sun6i-a31"
 			    "arm,psci"
+			    "brcm,bcm11351-cpu-method"
 			    "marvell,armada-375-smp"
 			    "marvell,armada-380-smp"
 			    "marvell,armada-xp-smp"
@@ -215,6 +216,17 @@ nodes to be present and contain the properties described below.
 		Value type: <phandle>
 		Definition: Specifies the ACC[2] node associated with this CPU.
 
+	- secondary-boot-reg
+		Usage:
+			Required for systems that have an "enable-method"
+			property value of "brcm,bcm11351-cpu-method".
+		Value type: <u32>
+		Definition:
+			Specifies the physical address of the register used to
+			request the ROM holding pen code release a secondary
+			CPU.  The value written to the register is formed by
+			encoding the target CPU id into the low bits of the
+			physical start address it should jump to.
 
 Example 1 (dual-cluster big.LITTLE system 32-bit):
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
