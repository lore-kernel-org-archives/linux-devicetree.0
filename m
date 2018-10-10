From: laurentiu.tudor@nxp.com
Subject: [PATCH v3 01/22] soc/fsl/qman: fixup liodns only on ppc targets
Date: Wed, 10 Oct 2018 15:07:19 +0300
Message-ID: <20181010120737.30300-2-laurentiu.tudor@nxp.com>
References: <20181010120737.30300-1-laurentiu.tudor@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010120737.30300-1-laurentiu.tudor@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org
Cc: roy.pledge@nxp.com, madalin.bucur@nxp.com, davem@davemloft.net, shawnguo@kernel.org, leoyang.li@nxp.com, robin.murphy@arm.com, bharat.bhushan@nxp.com, arnd@arndb.de, Laurentiu Tudor <laurentiu.tudor@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

ARM SoCs use SMMU so the liodn fixup done in the qman driver is no
longer making sense and it also breaks the ICID settings inherited
from u-boot. Do the fixups only for PPC targets.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/soc/fsl/qbman/qman_ccsr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman_ccsr.c
index 79cba58387a5..619e22030460 100644
--- a/drivers/soc/fsl/qbman/qman_ccsr.c
+++ b/drivers/soc/fsl/qbman/qman_ccsr.c
@@ -597,6 +597,7 @@ static int qman_init_ccsr(struct device *dev)
 #define LIO_CFG_LIODN_MASK 0x0fff0000
 void qman_liodn_fixup(u16 channel)
 {
+#ifdef CONFIG_PPC
 	static int done;
 	static u32 liodn_offset;
 	u32 before, after;
@@ -616,6 +617,7 @@ void qman_liodn_fixup(u16 channel)
 		qm_ccsr_out(REG_REV3_QCSP_LIO_CFG(idx), after);
 	else
 		qm_ccsr_out(REG_QCSP_LIO_CFG(idx), after);
+#endif
 }
 
 #define IO_CFG_SDEST_MASK 0x00ff0000
-- 
2.17.1
