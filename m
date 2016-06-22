From: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 1/3] Documentation: DT: Add iproc-static-adc binding
Date: Wed, 22 Jun 2016 11:41:51 +0530
Message-ID: <1466575913-5027-2-git-send-email-raveendra.padasalagi@broadcom.com>
References: <1466575913-5027-1-git-send-email-raveendra.padasalagi@broadcom.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466575913-5027-1-git-send-email-raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The patch adds devicetree binding document for broadcom's
iproc-static-adc controller driver.

Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../bindings/iio/adc/brcm,iproc-static-adc.txt     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt b/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
new file mode 100644
index 0000000..a82076e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
@@ -0,0 +1,38 @@
+* Broadcom's IPROC Static ADC controller
+
+Broadcom iProc ADC controller has 8 channels 10bit ADC.
+Allows user to convert analog input voltage values to digital.
+
+Required properties:
+
+- compatible: Must be "brcm,iproc-static-adc"
+
+- adc-syscon: Handler of syscon node defining physical base address of the
+  controller and length of memory mapped region.
+
+- #io-channel-cells = <1>; As ADC has multiple outputs
+  refer to Documentation/devicetree/bindings/iio/iio-bindings.txt for details.
+
+- clocks: Clock used for this block.
+
+- clock-names: Clock name should be given as tsc_clk.
+
+- interrupts: interrupt line number.
+
+For example:
+
+	ts_adc_syscon: ts_adc_syscon@180a6000 {
+		compatible = "brcm,iproc-ts-adc-syscon","syscon";
+		reg = <0x180a6000 0xc30>;
+	};
+
+	adc: adc@180a6000 {
+		compatible = "brcm,iproc-static-adc";
+		adc-syscon = <&ts_adc_syscon>;
+		#io-channel-cells = <1>;
+		io-channel-ranges;
+		clocks = <&asiu_clks BCM_CYGNUS_ASIU_ADC_CLK>;
+		clock-names = "tsc_clk";
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
-- 
1.9.1
