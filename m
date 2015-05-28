From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv5 2/2] ARM: socfpga: dts: add sdram controller dt binding doc
Date: Thu, 28 May 2015 16:19:37 -0500
Message-ID: <1432847977-18880-3-git-send-email-atull@opensource.altera.com>
References: <1432847977-18880-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432847977-18880-1-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Delicious Quinoq <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding doc for Altera SOCFPGA SDRAM controller.

Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
v4: Add bindings doc
v5: No change for v5
---
 .../arm/altera/socfpga-sdram-controller.txt        |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
new file mode 100644
index 0000000..77ca635
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
@@ -0,0 +1,12 @@
+Altera SOCFPGA SDRAM Controller
+
+Required properties:
+- compatible : Should contain "altr,sdr-ctl" and "syscon".
+  syscon is required by the Altera SOCFPGA SDRAM EDAC.
+- reg : Should contain 1 register range (address and length)
+
+Example:
+	sdr: sdr@ffc25000 {
+		compatible = "altr,sdr-ctl", "syscon";
+		reg = <0xffc25000 0x1000>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
