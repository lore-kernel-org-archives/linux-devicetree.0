From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH 4/8] net: ethernet: stmmac: add management of clk_csr property
Date: Thu, 14 Feb 2019 07:45:59 +0100
Message-ID: <1550126763-22669-5-git-send-email-christophe.roullier@st.com>
References: <1550126763-22669-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550126763-22669-1-git-send-email-christophe.roullier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, christophe.roullier@st.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In Documentation stmmac.txt there is possibility to
fixed CSR Clock range selection with property clk_csr.
This patch add the management of this property
For example to use it, add in your ethernet node DT:
	clk_csr = <3>;

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 2b800ce..3031f2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -408,6 +408,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 	/* Default to phy auto-detection */
 	plat->phy_addr = -1;
 
+	/* Get clk_csr from device tree */
+	of_property_read_u32(np, "clk_csr", &plat->clk_csr);
+
 	/* "snps,phy-addr" is not a standard property. Mark it as deprecated
 	 * and warn of its use. Remove this when phy node support is added.
 	 */
-- 
2.7.4
