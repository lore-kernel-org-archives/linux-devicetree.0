From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH v2 1/2] drm/panel: Add Sharp LS043T1LE01 panel binding documentation
Date: Fri, 30 Oct 2015 15:34:29 -0700
Message-ID: <1446244470-8517-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Werner Johansson <werner.johansson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Werner Johansson <werner.johansson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Signed-off-by: Werner Johansson <werner.johansson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---

Change since v1:
- Dropped -vid suffix from compatible

 .../bindings/display/panel/sharp,ls043t1le01.txt   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
new file mode 100644
index 000000000000..b3d4e073930a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
@@ -0,0 +1,22 @@
+Sharp Microelectronics 4.3" qHD TFT LCD panel
+
+Required properties:
+- compatible: should be "sharp,ls043t1le01-qhd"
+- reg: DSI virtual channel of the peripheral
+- power-supply: phandle of the regulator that provides the supply voltage
+
+Optional properties:
+- backlight: phandle of the backlight device attached to the panel
+- reset-gpios: a GPIO spec for the reset pin
+
+Example:
+
+	mdss_dsi@fd922800 {
+		panel@0 {
+			compatible = "sharp,ls043t1le01-qhd";
+			reg = <0>;
+			avdd-supply = <&pm8941_l22>;
+			backlight = <&pm8941_wled>;
+			reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
+		};
+	};
-- 
2.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
