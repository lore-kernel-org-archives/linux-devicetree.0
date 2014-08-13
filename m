From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH 2/5] phy: miphy28lp: Add MiPHY28lp header file for DT x Driver
 defines
Date: Wed, 13 Aug 2014 17:34:32 +0200
Message-ID: <1407944075-8093-3-git-send-email-gabriel.fernandez@linaro.org>
References: <1407944075-8093-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1407944075-8093-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, alexandre torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Gabriel Fernandez <gabriel.fernandez@linaro.org>, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

This provides the shared header file which will be reference from both
the MiPHY28lp driver and its associated Device Tree node(s).

Signed-off-by: alexandre torgue <alexandre.torgue@st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 include/dt-bindings/phy/phy-miphy28lp.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 include/dt-bindings/phy/phy-miphy28lp.h

diff --git a/include/dt-bindings/phy/phy-miphy28lp.h b/include/dt-bindings/phy/phy-miphy28lp.h
new file mode 100644
index 0000000..7cf9bce
--- /dev/null
+++ b/include/dt-bindings/phy/phy-miphy28lp.h
@@ -0,0 +1,12 @@
+/*
+ * This header provides constants for the phy framework
+ * based on the STMicroelectronics miph28lp.
+ */
+#ifndef _DT_BINDINGS_PHY_MIPHY28LP
+#define _DT_BINDINGS_PHY_MIPHY28LP
+
+#define MIPHY_TYPE_SATA		1
+#define MIPHY_TYPE_PCIE		2
+#define MIPHY_TYPE_USB		3
+
+#endif /* _DT_BINDINGS_PHY_MIPHY28LP */
-- 
1.9.1
