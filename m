From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 02/11] ARM i.MX6q: export imx6q_revision
Date: Thu, 28 Mar 2013 16:23:26 +0100
Message-ID: <1364484215-13935-3-git-send-email-p.zabel@pengutronix.de>
References: <1364484215-13935-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1364484215-13935-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: linux-arm-kernel@lists.infradead.org
Cc: devel@driverdev.osuosl.org, Fabio Estevam <fabio.estevam@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, Martin Fuzzey <mfuzzey@parkeon.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sean Cross <xobs@kosagi.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

So it can be used in clk-imx6q.c for revision dependent clock tree setup.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm/mach-imx/common.h     | 1 +
 arch/arm/mach-imx/mach-imx6q.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
index 5a800bf..6c909d1 100644
--- a/arch/arm/mach-imx/common.h
+++ b/arch/arm/mach-imx/common.h
@@ -74,6 +74,7 @@ extern void mxc_set_cpu_type(unsigned int type);
 extern void mxc_restart(char, const char *);
 extern void mxc_arch_reset_init(void __iomem *);
 extern int mx53_revision(void);
+extern int imx6q_revision(void);
 extern int mx53_display_revision(void);
 extern void imx_set_aips(void __iomem *);
 extern int mxc_device_init(void);
diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.c
index 9ffd103..ca10acc 100644
--- a/arch/arm/mach-imx/mach-imx6q.c
+++ b/arch/arm/mach-imx/mach-imx6q.c
@@ -41,7 +41,7 @@
 
 #define IMX6Q_ANALOG_DIGPROG	0x260
 
-static int imx6q_revision(void)
+int imx6q_revision(void)
 {
 	struct device_node *np;
 	void __iomem *base;
-- 
1.8.2.rc2
