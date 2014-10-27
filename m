From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH RESEND 2/7] Documentation: arm64: add SCU dts binding documentation to linux kernel
Date: Mon, 27 Oct 2014 12:28:23 -0700
Message-ID: <1414438108-8384-3-git-send-email-fkan@apm.com>
References: <1414438108-8384-1-git-send-email-fkan@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414438108-8384-1-git-send-email-fkan-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
Cc: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This add documentation for the SCU system clock unit device tree binding
to the kernel.

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/apm/scu.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/apm/scu.txt

diff --git a/Documentation/devicetree/bindings/arm/apm/scu.txt b/Documentation/devicetree/bindings/arm/apm/scu.txt
new file mode 100644
index 0000000..b45be06
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/apm/scu.txt
@@ -0,0 +1,17 @@
+APM X-GENE SoC series SCU Registers
+
+This system clock unit contain various register that control block resets,
+clock enable/disables, clock divisors and other deepsleep registers.
+
+Properties:
+ - compatible : should contain two values. First value must be:
+		   - "apm,xgene-scu"
+		second value must be always "syscon".
+
+ - reg : offset and length of the register set.
+
+Example :
+	scu: system-clk-controller@17000000 {
+		compatible = "apm,xgene-scu","syscon";
+		reg = <0x0 0x17000000 0x0 0x400>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
