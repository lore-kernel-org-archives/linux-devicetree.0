From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3] ARM: dts: da850-evm: drop VPIF endpoints
Date: Thu, 15 Jun 2017 14:57:30 -0700
Message-ID: <20170615215730.28585-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Drop the unused endpoints.  They should only be used when there is
an actual remote-endpoint connected.

Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
Since v2: actually CC DT maintainers
Since v1: attempt to Cc DT maintainers :(

 arch/arm/boot/dts/da850-evm.dts | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index a423e8ebfb37..67e72bc72e80 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -301,25 +301,4 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&vpif_capture_pins>, <&vpif_display_pins>;
 	status = "okay";
-
-	/* VPIF capture port */
-	port@0 {
-		vpif_input_ch0: endpoint@0 {
-			reg = <0>;
-			bus-width = <8>;
-		};
-
-		vpif_input_ch1: endpoint@1 {
-			reg = <1>;
-			bus-width = <8>;
-			data-shift = <8>;
-		};
-	};
-
-	/* VPIF display port */
-	port@1 {
-		vpif_output_ch0: endpoint {
-			bus-width = <8>;
-		};
-	};
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
