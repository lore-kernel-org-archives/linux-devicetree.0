From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 3/4] ARM: imx: config: enable psci default
Date: Tue, 5 Jan 2016 11:17:16 -0600
Message-ID: <1452014237-12848-3-git-send-email-Frank.Li@nxp.com>
References: <1452014237-12848-1-git-send-email-Frank.Li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452014237-12848-1-git-send-email-Frank.Li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lznuaa@gmail.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, Frank Li <Frank.Li@freescale.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Frank Li <Frank.Li@freescale.com>

i.MX7D uboot support psci firmware.
Enabled psci default.

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
Change from v1 to v2:
 arm to "ARM"

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 2d5253d..1e792ef 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -47,6 +47,7 @@ CONFIG_PCI=y
 CONFIG_PCI_MSI=y
 CONFIG_PCI_IMX6=y
 CONFIG_SMP=y
+CONFIG_ARM_PSCI=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
-- 
2.5.2
