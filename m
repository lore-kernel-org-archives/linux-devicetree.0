From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 7/6] dt-bindings: tda998x: add the calibration gpio
Date: Wed, 29 Nov 2017 10:30:20 +0000
Message-ID: <E1eJzdE-0000PJ-3V@rmk-PC.armlinux.org.uk>
References: <20171128231712.GB8356@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171128231712.GB8356-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the optional calibration gpio for integrated TDA9950 CEC support.
This GPIO corresponds with the interrupt from the TDA998x, as the
calibration requires driving the interrupt pin low.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
Sorry, this patch got forgotten, tacking it on the end of the series.

 Documentation/devicetree/bindings/display/bridge/tda998x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/tda998x.txt b/Documentation/devicetree/bindings/display/bridge/tda998x.txt
index 24cc2466185a..ad6620560d63 100644
--- a/Documentation/devicetree/bindings/display/bridge/tda998x.txt
+++ b/Documentation/devicetree/bindings/display/bridge/tda998x.txt
@@ -27,6 +27,9 @@ Required properties;
 	in question is used. The implementation allows one or two DAIs. If two
 	DAIs are defined, they must be of different type.
 
+  - calib-gpio: calibration GPIO, which must correspond with the
+	gpio used for the TDA998x interrupt pin.
+
 [1] Documentation/sound/alsa/soc/DAI.txt
 [2] include/dt-bindings/display/tda998x.h
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
