From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH 01/30] nfc: st-nci: Fix incorrect spi buffer size
Date: Tue, 20 Oct 2015 23:47:52 +0200
Message-ID: <1445377701-8353-2-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, christophe.ricard@gmail.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When sending data over SPI, the maximum expected length is the maximum
nci packet payload + data header size + the frame head room (1 for the
ndlc header) + the frame trail room (0).

Cc: stable@vger.kernel.org
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/nfc/st-nci/spi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 598a58c..887d308 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -25,6 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/nfc.h>
+#include <net/nfc/nci.h>
 #include <linux/platform_data/st-nci.h>
 
 #include "ndlc.h"
@@ -94,7 +95,8 @@ static int st_nci_spi_write(void *phy_id, struct sk_buff *skb)
 	struct st_nci_spi_phy *phy = phy_id;
 	struct spi_device *dev = phy->spi_dev;
 	struct sk_buff *skb_rx;
-	u8 buf[ST_NCI_SPI_MAX_SIZE];
+	u8 buf[ST_NCI_SPI_MAX_SIZE + NCI_DATA_HDR_SIZE +
+	       ST_NCI_FRAME_HEADROOM + ST_NCI_FRAME_TAILROOM];
 	struct spi_transfer spi_xfer = {
 		.tx_buf = skb->data,
 		.rx_buf = buf,
-- 
2.1.4
