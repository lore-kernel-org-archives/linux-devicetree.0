From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH v3 7/8] phy: miphy28lp: Tune tx impedance across Soc cuts
Date: Fri, 26 Sep 2014 10:54:16 +0200
Message-ID: <1411721657-9924-8-git-send-email-gabriel.fernandez@linaro.org>
References: <1411721657-9924-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411721657-9924-1-git-send-email-gabriel.fernandez@linaro.org>
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
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Giuseppe Condorelli <giuseppe.condorelli@st.com>
List-Id: devicetree@vger.kernel.org

This patch to compensate tx impedance (Sata, PCIe)
depending on Soc cuts the kernel is built for.

Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 Documentation/devicetree/bindings/phy/phy-miphy28lp.txt |  1 +
 drivers/phy/phy-miphy28lp.c                             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt b/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
index daa8310..17f7eec 100644
--- a/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
+++ b/Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
@@ -40,6 +40,7 @@ Optional properties (port (child) node):
 - st,px_rx_pol_inv	: to invert polarity of RXn/RXp (respectively negative line and positive
 			  line).
 - st,scc-on		: enable ssc to reduce effects of EMI (only for sata or PCIe).
+- st,tx-impedance-comp	: to compensate tx impedance avoiding out of range values.
 
 example:
 
diff --git a/drivers/phy/phy-miphy28lp.c b/drivers/phy/phy-miphy28lp.c
index b6574e8..ac3fdf9 100644
--- a/drivers/phy/phy-miphy28lp.c
+++ b/drivers/phy/phy-miphy28lp.c
@@ -201,6 +201,7 @@ struct miphy28lp_phy {
 	bool osc_rdy;
 	bool px_rx_pol_inv;
 	bool ssc;
+	bool tx_impedance;
 
 	struct reset_control *miphy_rst;
 
@@ -608,6 +609,12 @@ static void miphy_pcie_tune_ssc(struct miphy28lp_phy *miphy_phy)
 	}
 }
 
+static inline void miphy_tune_tx_impedance(struct miphy28lp_phy *miphy_phy)
+{
+	/* Compensate Tx impedance to avoid out of range values */
+	writeb_relaxed(0x02, miphy_phy->base + MIPHY_COMP_POSTP);
+}
+
 static inline int miphy28lp_configure_sata(struct miphy28lp_phy *miphy_phy)
 {
 	void __iomem *base = miphy_phy->base;
@@ -646,6 +653,9 @@ static inline int miphy28lp_configure_sata(struct miphy28lp_phy *miphy_phy)
 	if (miphy_phy->ssc)
 		miphy_sata_tune_ssc(miphy_phy);
 
+	if (miphy_phy->tx_impedance)
+		miphy_tune_tx_impedance(miphy_phy);
+
 	return 0;
 }
 
@@ -679,6 +689,9 @@ static inline int miphy28lp_configure_pcie(struct miphy28lp_phy *miphy_phy)
 	if (miphy_phy->ssc)
 		miphy_pcie_tune_ssc(miphy_phy);
 
+	if (miphy_phy->tx_impedance)
+		miphy_tune_tx_impedance(miphy_phy);
+
 	return 0;
 }
 
@@ -1117,6 +1130,9 @@ static int miphy28lp_of_probe(struct device_node *np,
 
 	miphy_phy->ssc = of_property_read_bool(np, "st,ssc-on");
 
+	miphy_phy->tx_impedance =
+		of_property_read_bool(np, "st,tx-impedance-comp");
+
 	of_property_read_u32(np, "st,sata-gen", &miphy_phy->sata_gen);
 	if (!miphy_phy->sata_gen)
 		miphy_phy->sata_gen = SATA_GEN1;
-- 
1.9.1
