From: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 2/2] arm64: dts: Add expansion bus to Juno
Date: Thu, 14 Apr 2016 16:39:19 +0100
Message-ID: <1460648359-7310-2-git-send-email-brian.starkey@arm.com>
References: <1460648359-7310-1-git-send-email-brian.starkey@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460648359-7310-1-git-send-email-brian.starkey-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Juno development platform has an external expansion bus which can
be used for additional hardware (e.g. LogicTile Express daughterboards).
Add this bus to the Juno base device-tree.

Signed-off-by: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 68ccc39..dee2386 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -272,3 +272,13 @@
 
 		/include/ "juno-motherboard.dtsi"
 	};
+
+	site2: tlx@60000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0x60000000 0x10000000>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0>;
+		interrupt-map = <0 0 &gic 0 0 0 168 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
