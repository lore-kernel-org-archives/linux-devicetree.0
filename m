From: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm64: dts: juno: update definition for programmable replicator.
Date: Fri, 17 Feb 2017 19:13:10 +0000
Message-ID: <1487358790-2618-1-git-send-email-mike.leach@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Juno platforms have a programmable replicator splitting the trace output to
TPIU and ETR. Currently this is not being programmed as it is being treated
as a none-programmable replicator - which is the default operational mode
for these devices. The TPIU in the system is enabled by default, and this
combination is causing back-pressure in the trace system resulting in
overflows at the source.

Replaces the existing definition with one that defines the programmable
replicator, using the "qcom,coresight-replicator1x" driver that provides
the correct functionality for CoreSight programmable replicators.

Signed-off-by: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 9d799d9..6546e23 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -372,12 +372,14 @@
 		};
 	};
 
-	coresight-replicator {
-		/*
-		 * Non-configurable replicators don't show up on the
-		 * AMBA bus.  As such no need to add "arm,primecell".
-		 */
-		compatible = "arm,coresight-replicator";
+	coresight-replicator@20120000 {
+
+		compatible = "qcom,coresight-replicator1x", "arm,primecell";
+		reg = <0 0x20120000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
