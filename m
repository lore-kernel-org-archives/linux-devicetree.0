From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v2, 6/9] ptp_qoriq: fix register memory map
Date: Sat,  2 Feb 2019 10:57:04 +0800
Message-ID: <20190202025707.10794-7-yangbo.lu@nxp.com>
References: <20190202025707.10794-1-yangbo.lu@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190202025707.10794-1-yangbo.lu@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

The 1588 timer on eTSEC Ethernet controller uses different
register memory map with DPAA Ethernet controller.
Now the new ENETC Ethernet controller uses same reigster
memory map with DPAA. To support ENETC, let's use register
memory map of DPAA/ENETC in default.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- None.
---
 drivers/ptp/ptp_qoriq.c       |   11 ++++++-----
 include/linux/fsl/ptp_qoriq.h |   16 ++++++++--------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/ptp/ptp_qoriq.c b/drivers/ptp/ptp_qoriq.c
index 4308e25..af7a70e 100644
--- a/drivers/ptp/ptp_qoriq.c
+++ b/drivers/ptp/ptp_qoriq.c
@@ -504,11 +504,12 @@ int ptp_qoriq_init(struct ptp_qoriq *ptp_qoriq, void __iomem *base,
 		ptp_qoriq->write = qoriq_write_be;
 	}
 
-	if (of_device_is_compatible(node, "fsl,fman-ptp-timer")) {
-		ptp_qoriq->regs.ctrl_regs = base + FMAN_CTRL_REGS_OFFSET;
-		ptp_qoriq->regs.alarm_regs = base + FMAN_ALARM_REGS_OFFSET;
-		ptp_qoriq->regs.fiper_regs = base + FMAN_FIPER_REGS_OFFSET;
-		ptp_qoriq->regs.etts_regs = base + FMAN_ETTS_REGS_OFFSET;
+	/* The eTSEC uses differnt memory map with DPAA/ENETC */
+	if (of_device_is_compatible(node, "fsl,etsec-ptp")) {
+		ptp_qoriq->regs.ctrl_regs = base + ETSEC_CTRL_REGS_OFFSET;
+		ptp_qoriq->regs.alarm_regs = base + ETSEC_ALARM_REGS_OFFSET;
+		ptp_qoriq->regs.fiper_regs = base + ETSEC_FIPER_REGS_OFFSET;
+		ptp_qoriq->regs.etts_regs = base + ETSEC_ETTS_REGS_OFFSET;
 	} else {
 		ptp_qoriq->regs.ctrl_regs = base + CTRL_REGS_OFFSET;
 		ptp_qoriq->regs.alarm_regs = base + ALARM_REGS_OFFSET;
diff --git a/include/linux/fsl/ptp_qoriq.h b/include/linux/fsl/ptp_qoriq.h
index b44b466..902d3b1 100644
--- a/include/linux/fsl/ptp_qoriq.h
+++ b/include/linux/fsl/ptp_qoriq.h
@@ -58,15 +58,15 @@ struct ptp_qoriq_registers {
 };
 
 /* Offset definitions for the four register groups */
-#define CTRL_REGS_OFFSET	0x0
-#define ALARM_REGS_OFFSET	0x40
-#define FIPER_REGS_OFFSET	0x80
-#define ETTS_REGS_OFFSET	0xa0
-
-#define FMAN_CTRL_REGS_OFFSET	0x80
-#define FMAN_ALARM_REGS_OFFSET	0xb8
-#define FMAN_FIPER_REGS_OFFSET	0xd0
-#define FMAN_ETTS_REGS_OFFSET	0xe0
+#define ETSEC_CTRL_REGS_OFFSET	0x0
+#define ETSEC_ALARM_REGS_OFFSET	0x40
+#define ETSEC_FIPER_REGS_OFFSET	0x80
+#define ETSEC_ETTS_REGS_OFFSET	0xa0
+
+#define CTRL_REGS_OFFSET	0x80
+#define ALARM_REGS_OFFSET	0xb8
+#define FIPER_REGS_OFFSET	0xd0
+#define ETTS_REGS_OFFSET	0xe0
 
 
 /* Bit definitions for the TMR_CTRL register */
-- 
1.7.1
