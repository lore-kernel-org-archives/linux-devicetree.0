From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: drm/bridge: adv7511: Add regulators for ADV7533
Date: Wed, 31 Aug 2016 16:22:08 +0530
Message-ID: <1472640730-24326-2-git-send-email-architt@codeaurora.org>
References: <1472640730-24326-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472640730-24326-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the regulator supply properties needed for ADV7533. The regulator
names are named after the pin names. The exact use of each supply isn't
clear from the data sheets.

The regulators are specified as optional properties since there can
be boards which have a fixed supply directly routed to the pins, and
these may not be modelled as regulator supplies.

There might be a similar set of regulators for ADV7511, but we don't
have the docs at the moment to find out what supplies it needs. The
regulator properties needed by ADV7511 can be updated as we get more
data on it.

Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
index 6532a59..669b6f2 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
@@ -56,6 +56,12 @@ Optional properties:
 - adi,disable-timing-generator: Only for ADV7533. Disables the internal timing
   generator. The chip will rely on the sync signals in the DSI data lanes,
   rather than generate its own timings for HDMI output.
+- avdd-supply: Only for ADV7533. A 1.8V supply that powers up the AVDD, DVDD
+  PVDD and A2VDD pins on the chip.
+- v1p2-supply: Only for ADV7533. A supply that powers up the V1P2 pin on the
+  chip. Can be either 1.2V or 1.8V.
+- v3p3-supply: Only for ADV7533. A 3.3V supply that powers up the V3P3 pin on
+  the chip.
 
 Required nodes:
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
