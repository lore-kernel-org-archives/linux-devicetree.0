From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 4/5] ARM64: dts: meson-gxm: add GXM specific USB configuration
Date: Sat, 26 Nov 2016 15:56:34 +0100
Message-ID: <20161126145635.24488-5-martin.blumenstingl@googlemail.com>
References: <20161126145635.24488-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161126145635.24488-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The USB configuration on GXM is slightly different than on GXL. On GXM
the dwc2 controller is limited (via GHWCFG2_OP_MODE_MASK) to "device
mode".
The dwc3 controller's internal hub has 3 ports (instead of 2 on GXL)
enabled. It's hardware configuration limits it (via DWC3_GHWPARAMS0)
to host mode only.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
index 2b1d276e..0a6b224 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm.dtsi
@@ -121,3 +121,13 @@
 	clock-indices = <0 1>;
 	clock-output-names = "vbig", "vlittle";
 };
+
+&usb3_phy0 {
+	/* dwc3 on GXM enables 3 USB ports on the internal hub */
+	phys = <&usb2_phys 0>, <&usb2_phys 1>, <&usb2_phys 2>;
+};
+
+&usb1 {
+	/* the dwc2 hardware configuration on GXM only allows device mode */
+	dr_mode = "device";
+};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
