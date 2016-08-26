From: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Subject: [PATCH 1/8] arm: orion5x: Add documentation for SoC and board bindings
Date: Fri, 26 Aug 2016 10:20:57 +0100
Message-ID: <1472203264-21089-2-git-send-email-jm@lentin.co.uk>
References: <1468679348-10522-1-git-send-email-jm@lentin.co.uk>
 <1472203264-21089-1-git-send-email-jm@lentin.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472203264-21089-1-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Copy the format for kirkwood/dove to orion5x

Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/arm/marvell/marvell,orion5x.txt       | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt b/Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt
new file mode 100644
index 0000000..a888011
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt
@@ -0,0 +1,23 @@
+Marvell Orion SoC Family Device Tree Bindings
+---------------------------------------------
+
+Boards with a SoC of the Marvell Orion family, eg 88f5181
+
+* Required root node properties:
+compatible: must contain "marvell,orion5x"
+
+In addition, the above compatible shall be extended with the specific
+SoC. Currently known SoC compatibles are:
+
+"marvell,orion5x-88f5182"
+
+And in addition, the compatible shall be extended with the specific
+board. Currently known boards are:
+
+"buffalo,lsgl"
+"buffalo,lswsgl"
+"buffalo,lswtgl"
+"lacie,ethernet-disk-mini-v2"
+"lacie,d2-network"
+"marvell,rd-88f5182-nas"
+"maxtor,shared-storage-2"
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
