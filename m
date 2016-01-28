From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH] Doc: Micrel-ksz90x1.txt: Update the Micrel phy documentation for ksz9031
Date: Thu, 28 Jan 2016 10:49:27 -0600
Message-ID: <1453999767-26298-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Update the Micrel phy documentation for the KSZ9031 PHY to represent how
the actual values are calculated from the code.

Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 .../devicetree/bindings/net/micrel-ksz90x1.txt     | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
index f9c32ad..9535b2b 100644
--- a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
+++ b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
@@ -36,6 +36,71 @@ KSZ9031:
   value is 0, and the maximum is property-dependent. The increment
   step is 60ps.
 
+  The KSZ9031 hardware supports a range of skew values from negative to
+  positive, where the specific range is property dependent. All values
+  specified in the devicetree are offset by the minimum value so they
+  can be represented as positive integers in the devicetree since it's
+  difficult to represent a negative number in the devictree.
+
+  The following 5-bit values table apply to rxc-skew-ps and txc-skew-ps.
+
+  Pad Skew Value	Delay (ps)	Devicetree Value
+  ------------------------------------------------------
+  0_0000		-900ps		0
+  0_0001		-840ps		60
+  0_0010		-780ps		120
+  0_0011		-720ps		180
+  0_0100		-660ps		240
+  0_0101		-600ps		300
+  0_0110		-540ps		360
+  0_0111		-480ps		420
+  0_1000		-420ps		480
+  0_1001		-360ps		540
+  0_1010		-300ps		600
+  0_1011		-240ps		660
+  0_1100		-180ps		720
+  0_1101		-120ps		780
+  0_1110		-60ps		840
+  0_1111		0ps		900
+  1_0000		60ps		960
+  1_0001		120ps		1020
+  1_0010		180ps		1080
+  1_0011		240ps		1140
+  1_0100		300ps		1200
+  1_0101		360ps		1260
+  1_0110		420ps		1320
+  1_0111		480ps		1380
+  1_1000		540ps		1440
+  1_1001		600ps		1500
+  1_1010		660ps		1560
+  1_1011		720ps		1620
+  1_1100		780ps		1680
+  1_1101		840ps		1740
+  1_1110		900ps		1800
+  1_1111		960ps		1860
+
+  The following 4-bit values table apply to the txdX-skew-ps, rxdX-skew-ps
+  data pads, and the rxdv-skew-ps, txen-skew-ps control pads.
+
+  Pad Skew Value	Delay (ps)	Devicetree Value
+  ------------------------------------------------------
+  0000			-420ps		0
+  0001			-360ps		60
+  0010			-300ps		120
+  0011			-240ps		180
+  0100			-180ps		240
+  0101			-120ps		300
+  0110			-60ps		360
+  0111			0ps		420
+  1000			60ps		480
+  1001			120ps		540
+  1010			180ps		600
+  1011			240ps		660
+  1100			300ps		720
+  1101			360ps		780
+  1110			420ps		840
+  1111			480ps		900
+
   Optional properties:
 
     Maximum value of 1860:
@@ -72,3 +137,11 @@ Examples:
 		phy = <&phy0>;
 		phy-mode = "rgmii-id";
 	};
+
+References
+
+  Micrel ksz9021rl/rn Data Sheet, Revision 1.2. Dated 2/13/2014.
+  http://www.micrel.com/_PDF/Ethernet/datasheets/ksz9021rl-rn_ds.pdf
+
+  Micrel ksz9031rnx Data Sheet, Revision 2.1. Dated 11/20/2014.
+  http://www.micrel.com/_PDF/Ethernet/datasheets/KSZ9031RNX.pdf
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
