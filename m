From: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH V6 03/12] phy: st-miphy40lp: Add binding information
Date: Tue, 11 Feb 2014 14:59:59 +0530
Message-ID: <af50da74226a244dfc05aed3dc9d28b896d166a4.1392109054.git.mohit.kumar@st.com>
References: <cover.1392109054.git.mohit.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1392109054.git.mohit.kumar-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>

ST miphy40lp can be used with PCIe, SATA and Super Speed USB
controllers. SPEAr13XX SoCs use this phy for PCIe and SATA.

Signed-off-by: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/phy/st-miphy40lp.txt       |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/st-miphy40lp.txt

diff --git a/Documentation/devicetree/bindings/phy/st-miphy40lp.txt b/Documentation/devicetree/bindings/phy/st-miphy40lp.txt
new file mode 100644
index 0000000..1c8d04c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/st-miphy40lp.txt
@@ -0,0 +1,18 @@
+ST miphy40lp DT detail
+===================================
+
+miphy40lp is a phy controller from ST Microelectronics which supports PCIe,
+SATA and Super Speed USB host and devices. It has been used in SPEAr13xx SOCs.
+
+Required properties:
+- compatible : should be "st,miphy40lp-phy"
+	Other supported soc specific compatible:
+		"st,spear1310-miphy"
+		"st,spear1340-miphy"
+- reg : offset and length of the PHY register set.
+- misc: phandle for the syscon node to access misc registers
+- phy-id: Instance id of the phy.
+- #phy-cells : from the generic PHY bindings, must be 1.
+	- 1st cell: phandle to the phy node.
+	- 2nd cell: 0 if phy (in 1st cell) is to be used for SATA, 1 for PCIe
+	  and 2 for Super Speed USB.
-- 
1.7.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
