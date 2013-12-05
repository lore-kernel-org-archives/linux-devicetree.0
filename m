From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [PATCH] DT: ATA: Add missing documentation of clocks to marvell binding.
Date: Thu,  5 Dec 2013 12:51:11 +0100
Message-ID: <1386244271-16127-1-git-send-email-andrew@lunn.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The marvell SATA driver can optionally make use of clocks specified in
the DT node. This has been available in the driver since Febuary 2012,
but the documentation is missing from the binding. Add it.

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
---
FYI: This will cause merge conflicts with the SATA PHY driver comming soon.
---
 Documentation/devicetree/bindings/ata/marvell.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/marvell.txt b/Documentation/devicetree/bindings/ata/marvell.txt
index b5cdd20cde9c..f6c68d157749 100644
--- a/Documentation/devicetree/bindings/ata/marvell.txt
+++ b/Documentation/devicetree/bindings/ata/marvell.txt
@@ -6,11 +6,17 @@ Required Properties:
 - interrupts    : Interrupt controller is using
 - nr-ports      : Number of SATA ports in use.
 
+Optional Properties:
+- clocks        : List of pHandles to clocks
+- clock-names   : Must be "0", "1", mapping port number to clock.
+
 Example:
 
 	sata@80000 {
 		compatible = "marvell,orion-sata";
 		reg = <0x80000 0x5000>;
 		interrupts = <21>;
+		clocks = <&gate_clk 14>, <&gate_clk 15>;
+		clock-names = "0", "1";
 		nr-ports = <2>;
 	}
-- 
1.8.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
