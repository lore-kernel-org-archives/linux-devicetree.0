From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH v2 2/8] phy: miphy28lp: Add MiPHY28lp header file for DT x Driver defines
Date: Wed,  3 Sep 2014 17:37:11 +0200
Message-ID: <1409758637-28654-3-git-send-email-gabriel.fernandez@linaro.org>
References: <1409758637-28654-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409758637-28654-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, Gabriel Fernandez <gabriel.fernandez@linaro.org>, alexandre torgue <alexandre.torgue@st.com>
List-Id: devicetree@vger.kernel.org

This provides the shared header file which will be reference from both
the MiPHY28lp driver and its associated Device Tree node(s).

Signed-off-by: alexandre torgue <alexandre.torgue@st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 include/dt-bindings/phy/phy-miphy.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 include/dt-bindings/phy/phy-miphy.h

diff --git a/include/dt-bindings/phy/phy-miphy.h b/include/dt-bindings/phy/phy-miphy.h
new file mode 100644
index 0000000..9bc49b9
--- /dev/null
+++ b/include/dt-bindings/phy/phy-miphy.h
@@ -0,0 +1,12 @@
+/*
+ * This header provides constants for the phy framework
+ * based on the STMicroelectronics miphxxxx.
+ */
+#ifndef _DT_BINDINGS_PHY_MIPHY
+#define _DT_BINDINGS_PHY_MIPHY
+
+#define MIPHY_TYPE_SATA		1
+#define MIPHY_TYPE_PCIE		2
+#define MIPHY_TYPE_USB		3
+
+#endif /* _DT_BINDINGS_PHY_MIPHY */
-- 
1.9.1
