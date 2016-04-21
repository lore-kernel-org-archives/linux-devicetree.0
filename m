From: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 1/7] Documentation: arm64: pmu: Add Broadcom Vulcan PMU binding
Date: Thu, 21 Apr 2016 05:58:39 -0700
Message-ID: <1461243525-13603-2-git-send-email-ashoks@broadcom.com>
References: <1461243525-13603-1-git-send-email-ashoks@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461243525-13603-1-git-send-email-ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
Cc: jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the compatible string for Broadcom Vulcan PMU.
Also arranged the list in alphabetical order.

Signed-off-by: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/pmu.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
index 6eb73be..74d5417 100644
--- a/Documentation/devicetree/bindings/arm/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/pmu.txt
@@ -22,10 +22,11 @@ Required properties:
 	"arm,arm11mpcore-pmu"
 	"arm,arm1176-pmu"
 	"arm,arm1136-pmu"
+	"brcm,vulcan-pmu"
+	"cavium,thunder-pmu"
 	"qcom,scorpion-pmu"
 	"qcom,scorpion-mp-pmu"
 	"qcom,krait-pmu"
-	"cavium,thunder-pmu"
 - interrupts : 1 combined interrupt or 1 per core. If the interrupt is a per-cpu
                interrupt (PPI) then 1 interrupt should be specified.
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
