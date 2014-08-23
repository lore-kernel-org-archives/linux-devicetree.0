From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 3/6] ARM: dts: hummingboard/cubox-i: change SPDIF output to be
 more descriptive
Date: Sat, 23 Aug 2014 10:11:31 +0100
Message-ID: <E1XL7MB-0002yL-R3@rmk-PC.arm.linux.org.uk>
References: <20140823091058.GO30401@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140823091058.GO30401-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-hummingboard.dts | 2 +-
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-hummingboard.dts b/arch/arm/boot/dts/imx6dl-hummingboard.dts
index d1c892e28296..71598546087f 100644
--- a/arch/arm/boot/dts/imx6dl-hummingboard.dts
+++ b/arch/arm/boot/dts/imx6dl-hummingboard.dts
@@ -58,7 +58,7 @@
 
 	sound-spdif {
 		compatible = "fsl,imx-audio-spdif";
-		model = "imx-spdif";
+		model = "On-board SPDIF";
 		/* IMX6 doesn't implement this yet */
 		spdif-controller = <&spdif>;
 		spdif-out;
diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index 298d0fdf8ebe..6a524ca011e7 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -61,7 +61,7 @@
 
 	sound-spdif {
 		compatible = "fsl,imx-audio-spdif";
-		model = "imx-spdif";
+		model = "Integrated SPDIF";
 		/* IMX6 doesn't implement this yet */
 		spdif-controller = <&spdif>;
 		spdif-out;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
