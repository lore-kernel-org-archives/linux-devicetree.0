From: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH V7 06/10] SPEAr13XX: Add binding information for PCIe controller
Date: Fri, 28 Feb 2014 17:24:59 +0530
Message-ID: <5b20b323b280cf3a7aeb9c551ebe598019f87224.1393568715.git.mohit.kumar@st.com>
References: <cover.1393568715.git.mohit.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1393568715.git.mohit.kumar-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>

SPEAr13XX uses designware PCIe controller. This patch adds information
for the PCIe binding properties which are specific to SPEAr13XX SoC
series.

Signed-off-by: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/pci/spear13xx-pcie.txt     |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/spear13xx-pcie.txt

diff --git a/Documentation/devicetree/bindings/pci/spear13xx-pcie.txt b/Documentation/devicetree/bindings/pci/spear13xx-pcie.txt
new file mode 100644
index 0000000..49ea76d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/spear13xx-pcie.txt
@@ -0,0 +1,14 @@
+SPEAr13XX PCIe DT detail:
+================================
+
+SPEAr13XX uses synopsis designware PCIe controller and ST MiPHY as phy
+controller.
+
+Required properties:
+- compatible : should be "st,spear1340-pcie", "snps,dw-pcie".
+- phys		    : phandle to phy node associated with pcie controller
+- phy-names	    : must be "pcie-phy"
+- All other definitions as per generic PCI bindings
+
+ Optional properties:
+- st,pcie-is-gen1 indicates that forced gen1 initialization is needed.
-- 
1.7.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
