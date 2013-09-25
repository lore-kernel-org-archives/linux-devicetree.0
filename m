From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/5] ARM: mvebu: Add Core Divider clock device-tree binding
Date: Wed, 25 Sep 2013 18:28:19 -0300
Message-ID: <1380144502-24109-3-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380144502-24109-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Armada 370/XP SoCs have a Core Divider clock providing
several clocks. For now, only the NAND clock is supported.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/clock/mvebu-corediv-clock.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
new file mode 100644
index 0000000..ea60f4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
@@ -0,0 +1,19 @@
+* Core Divider Clock bindings for Marvell MVEBU SoCs
+
+The following is a list of provided IDs and clock names on Armada 370/XP:
+ 0 = nand_ecc   (NAND ECC clock)
+
+Required properties:
+- compatible : must be "marvell,armada-370-corediv-clock"
+- reg : must be the register address of Core Divider control register
+- #clock-cells : from common clock binding; shall be set to 1
+- #clocks : must be set to the parent's phandle
+
+Example:
+
+corediv_clk: corediv-clocks@18740 {
+	compatible = "marvell,armada-370-corediv-clock";
+	reg = <0x18740 0x8>;
+	#clock-cells = <1>;
+	clocks = <&pll>;
+};
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
