From: Claudiu Manoil <claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/3] doc: dt: net: Add fsl,wake-on-filer for eTSEC
Date: Thu, 1 Oct 2015 13:10:01 +0300
Message-ID: <1443694201-29485-1-git-send-email-claudiu.manoil@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Zhao Chenhui <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the "fsl,wake-on-filer" property for eTSEC nodes to
indicate that the system has the power management
infrastructure needed to be able to wake up the system
via FGPI (filer, aka. h/w rx parser) interrupt.

Cc: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Zhao Chenhui <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Signed-off-by: Claudiu Manoil <claudiu.manoil-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/net/fsl-tsec-phy.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
index 1e97532..db74f0d 100644
--- a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
+++ b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
@@ -57,6 +57,10 @@ Properties:
     "rgmii-id", as all other connection types are detected by hardware.
   - fsl,magic-packet : If present, indicates that the hardware supports
     waking up via magic packet.
+  - fsl,wake-on-filer : If present, indicates that the hardware supports
+    waking up by Filer General Purpose Interrupt (FGPI) asserted on the
+    Rx int line.  This is an advanced power management capability allowing
+    certain packet types (user) defined by filer rules to wake up the system.
   - bd-stash : If present, indicates that the hardware supports stashing
     buffer descriptors in the L2.
   - rx-stash-len : Denotes the number of bytes of a received buffer to stash
-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
