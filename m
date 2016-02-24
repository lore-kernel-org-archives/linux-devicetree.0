From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 3/6] dt-bindings: clock: add DT bindings for AP806 ring clocks
Date: Wed, 24 Feb 2016 16:14:23 +0100
Message-ID: <1456326866-30854-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1456326866-30854-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456326866-30854-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds the Device Tree binding description for the AP806
ring clocks, used on Marvell Armada 7K/8K SOCs.

Since the AP806 ring clocks register is part of the "DFX Server"
register area, the DT binding is meant to be used as a sub-node of the
DFX Server DT binding, which is described separately.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../clock/mvebu-armada-ap806-ring-clock.txt        | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mvebu-armada-ap806-ring-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/mvebu-armada-ap806-ring-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-armada-ap806-ring-clock.txt
new file mode 100644
index 0000000..8c8030a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mvebu-armada-ap806-ring-clock.txt
@@ -0,0 +1,36 @@
+* Clock bindings for Marvell MVEBU AP806 Ring clocks
+
+The Marvell MVEBU Armada 7K/8K SoCs contain a block called AP806,
+hosting the CPU and other core components of the CPU. This Device Tree
+binding allows to describe the ring clocks of the AP806, which are
+derived from the Ring Core clock, after a dividing factor.
+
+The register giving the dividing factors is part of the DFX server
+register area, covered by the DT binding described at
+Documentation/devicetree/bindings/arm/marvell/marvell,ap806-dfx-server.txt. Therefore,
+the DT node for the AP806 Ring clocks must appear as a child node of
+the DFX server Device Tree node.
+
+The following is a list of provided IDs and clock names on Armada
+AP806 RING dividers:
+
+ 0 = Ring 0
+ 1 = Ring 2
+ 2 = Ring 3
+ 3 = Ring 4
+ 4 = Ring 5
+
+Required properties:
+- compatible: must be one of the following:
+	"marvell,armada-ap806-ring-clock"
+- #clock-cells : from common clock binding; shall be set to 1
+- clock-output-names: name of the output clocks
+
+Example:
+
+	ringclk: clk@250 {
+		compatible = "marvell,armada-ap806-ring-clock";
+		#clock-cells = <1>;
+		clock-output-names = "ring-0", "ring-2", "ring-3", "ring-4", "ring-5";
+		clocks = <&coreclk 1>;
+	};
-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
