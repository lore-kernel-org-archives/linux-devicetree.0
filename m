From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH 3/3] dt/bindings: fsl-fec: add "per" to clock properties
Date: Mon, 24 Feb 2014 11:25:57 +0100
Message-ID: <1393237557-31406-3-git-send-email-gsi@denx.de>
References: <1393237557-31406-1-git-send-email-gsi@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393237557-31406-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

a recent FEC binding document update that was motivated by i.MX
development revealed that ARM and PowerPC implementations in Linux
did not agree on the clock names to use for the FEC nodes

update the FEC (fast ethernet controller) binding to document the
"per" clock name as an obsolete alias for "ipg"

Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---

this patch depends on "dt/bindings: fsl-fec: add clock properties"
by Shawn Guo which introduces the context of this patch

the patch only is necessary if the MPC5121 .dtsi update (switch
FEC nodes from "per" to "ipg") won't make it for v3.14

---
 Documentation/devicetree/bindings/net/fsl-fec.txt |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
index 468736d4323d..f59b58e29da6 100644
--- a/Documentation/devicetree/bindings/net/fsl-fec.txt
+++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
@@ -24,6 +24,8 @@ Optional properties:
      or external oscillator via pad depending on board design.
    - "enet_out": the phy reference clock provided by SoC via pad, which
      is available on SoC like i.MX28.
+   - "per": obsolete alias for "ipg" for compatibility with early
+     MPC5121 implementations, not recommended for new .dts files
 - clock-names: Must contain the clock names described just above
 
 Example:
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
