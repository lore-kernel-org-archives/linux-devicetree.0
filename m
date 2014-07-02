From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/4] reset: sti: Document sti-picophyreset controllers bindings.
Date: Wed,  2 Jul 2014 15:08:47 +0100
Message-ID: <1404310129-14667-3-git-send-email-peter.griffin@linaro.org>
References: <1404310129-14667-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404310129-14667-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DT bindings documentation for sti-picophyreset controller.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/reset/st,sti-picophyreset.txt         | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/st,sti-picophyreset.txt

diff --git a/Documentation/devicetree/bindings/reset/st,sti-picophyreset.txt b/Documentation/devicetree/bindings/reset/st,sti-picophyreset.txt
new file mode 100644
index 0000000..54ae9f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/st,sti-picophyreset.txt
@@ -0,0 +1,42 @@
+STMicroelectronics STi family Sysconfig Picophy SoftReset Controller
+=============================================================================
+
+This binding describes a reset controller device that is used to enable and
+disable on-chip PicoPHY USB2 phy(s) using "softreset" control bits found in
+the STi family SoC system configuration registers.
+
+The actual action taken when softreset is asserted is hardware dependent.
+However, when asserted it may not be possible to access the hardware's
+registers and after an assert/deassert sequence the hardware's previous state
+may no longer be valid.
+
+Please refer to Documentation/devicetree/bindings/reset/reset.txt
+for common reset controller binding usage.
+
+Required properties:
+- compatible: Should be "st,stih407-picophyreset"
+- #reset-cells: 1, see below
+
+Example:
+
+	picophyreset: picophyreset-controller {
+		compatible = "st,stih407-picophyreset";
+		#reset-cells = <1>;
+	};
+
+Specifying picophyreset control of devices
+=======================================
+
+Device nodes should specify the reset channel required in their "resets"
+property, containing a phandle to the picophyreset device node and an
+index specifying which channel to use, as described in
+Documentation/devicetree/bindings/reset/reset.txt.
+
+Example:
+
+	usb2_picophy0: usbpicophy@0 {
+		resets = <&picophyreset STIH407_PICOPHY0_RESET>;
+	};
+
+Macro definitions for the supported reset channels can be found in:
+include/dt-bindings/reset-controller/stih407-resets.h
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
