From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [PATCH v2] DT: ATA: Add missing documentation of clocks to marvell binding.
Date: Thu,  5 Dec 2013 16:50:19 +0100
Message-ID: <1386258619-18367-1-git-send-email-andrew@lunn.ch>
References: <20131205122254.GN29200@e106331-lin.cambridge.arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131205122254.GN29200-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The marvell SATA driver can optionally make use of clocks specified in
the DT node. This has been available in the driver since Febuary 2012,
but the documentation is missing from the binding. Add it.

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
---
FYI: This will cause merge conflicts with the SATA PHY driver comming soon.

v1->v2:
s/pHandle/phandle/
Add specifier.

Not addressed yet is changing "0" to "port0", etc. Waiting for feedback
from Mark Rutland.
---
 Documentation/devicetree/bindings/ata/marvell.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/marvell.txt b/Documentation/devicetree/bindings/ata/marvell.txt
index b5cdd20cde9c..acfdb439bb6c 100644
--- a/Documentation/devicetree/bindings/ata/marvell.txt
+++ b/Documentation/devicetree/bindings/ata/marvell.txt
@@ -6,11 +6,17 @@ Required Properties:
 - interrupts    : Interrupt controller is using
 - nr-ports      : Number of SATA ports in use.
 
+Optional Properties:
+- clocks        : List of phandle and specifier to clocks
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
