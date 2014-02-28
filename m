From: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH V7 03/10] phy: SPEAr1310/40-miphy: Add binding information
Date: Fri, 28 Feb 2014 17:24:56 +0530
Message-ID: <0cb0df4f6e4ff6a10d69fce0f880f2b1eac1311d.1393568715.git.mohit.kumar@st.com>
References: <cover.1393568715.git.mohit.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1393568715.git.mohit.kumar-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>

SPEAr1310/40 uses miphy for PCIe, SATA. This patch adds documentation
for the binding on the top of generic phy bindings.

Signed-off-by: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/phy/st-spear1310-miphy.txt |   12 ++++++++++++
 .../devicetree/bindings/phy/st-spear1340-miphy.txt |   11 +++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/st-spear1310-miphy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/st-spear1340-miphy.txt

diff --git a/Documentation/devicetree/bindings/phy/st-spear1310-miphy.txt b/Documentation/devicetree/bindings/phy/st-spear1310-miphy.txt
new file mode 100644
index 0000000..b9b281a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/st-spear1310-miphy.txt
@@ -0,0 +1,12 @@
+ST SPEAr1310-miphy DT detail
+===================================
+
+SPEAr1310-miphy is a phy controller supporting PCIe and SATA.
+
+Required properties:
+- compatible : should be "st,spear1310-miphy"
+- reg : offset and length of the PHY register set.
+- misc: phandle for the syscon node to access misc registers
+- phy-id: Instance id of the phy.
+- #phy-cells : from the generic PHY bindings, must be 1.
+	- cell[1]: 0 if phy used for SATA, 1 for PCIe.
diff --git a/Documentation/devicetree/bindings/phy/st-spear1340-miphy.txt b/Documentation/devicetree/bindings/phy/st-spear1340-miphy.txt
new file mode 100644
index 0000000..7eb5335
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/st-spear1340-miphy.txt
@@ -0,0 +1,11 @@
+ST SPEAr1340-miphy DT detail
+===================================
+
+SPEAr1340-miphy is a phy controller supporting PCIe and SATA.
+
+Required properties:
+- compatible : should be "st,spear1340-miphy"
+- reg : offset and length of the PHY register set.
+- misc: phandle for the syscon node to access misc registers
+- #phy-cells : from the generic PHY bindings, must be 1.
+	- cell[1]: 0 if phy used for SATA, 1 for PCIe.
-- 
1.7.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
