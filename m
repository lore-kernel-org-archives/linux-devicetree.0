From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 34/35] nfc: st-nci: remove duplicated skb dump
Date: Sun, 25 Oct 2015 22:54:49 +0100
Message-ID: <1445810090-18403-35-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove SPI_DUMP_SKB and I2C_DUMP_SKB as skb is already dumped in ndlc
layer.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/i2c.c | 11 -----------
 drivers/nfc/st-nci/spi.c | 11 -----------
 2 files changed, 22 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 25e5042..15e3ce2 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -58,13 +58,6 @@ struct st_nci_i2c_phy {
 	struct st_nci_se_status se_status;
 };
 
-#define I2C_DUMP_SKB(info, skb)					\
-do {								\
-	pr_debug("%s:\n", info);				\
-	print_hex_dump(KERN_DEBUG, "i2c: ", DUMP_PREFIX_OFFSET,	\
-		       16, 1, (skb)->data, (skb)->len, 0);	\
-} while (0)
-
 static int st_nci_i2c_enable(void *phy_id)
 {
 	struct st_nci_i2c_phy *phy = phy_id;
@@ -101,8 +94,6 @@ static int st_nci_i2c_write(void *phy_id, struct sk_buff *skb)
 	struct st_nci_i2c_phy *phy = phy_id;
 	struct i2c_client *client = phy->i2c_dev;
 
-	I2C_DUMP_SKB("st_nci_i2c_write", skb);
-
 	if (phy->ndlc->hard_fault != 0)
 		return phy->ndlc->hard_fault;
 
@@ -173,8 +164,6 @@ static int st_nci_i2c_read(struct st_nci_i2c_phy *phy,
 	skb_put(*skb, len);
 	memcpy((*skb)->data + ST_NCI_I2C_MIN_SIZE, buf, len);
 
-	I2C_DUMP_SKB("i2c frame read", *skb);
-
 	return 0;
 }
 
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index bf6643c..cf7ad81 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -59,13 +59,6 @@ struct st_nci_spi_phy {
 	struct st_nci_se_status se_status;
 };
 
-#define SPI_DUMP_SKB(info, skb)					\
-do {								\
-	pr_debug("%s:\n", info);				\
-	print_hex_dump(KERN_DEBUG, "spi: ", DUMP_PREFIX_OFFSET,	\
-		       16, 1, (skb)->data, (skb)->len, 0);	\
-} while (0)
-
 static int st_nci_spi_enable(void *phy_id)
 {
 	struct st_nci_spi_phy *phy = phy_id;
@@ -110,8 +103,6 @@ static int st_nci_spi_write(void *phy_id, struct sk_buff *skb)
 		.len = skb->len,
 	};
 
-	SPI_DUMP_SKB("st_nci_spi_write", skb);
-
 	if (phy->ndlc->hard_fault != 0)
 		return phy->ndlc->hard_fault;
 
@@ -188,8 +179,6 @@ static int st_nci_spi_read(struct st_nci_spi_phy *phy,
 	skb_put(*skb, len);
 	memcpy((*skb)->data + ST_NCI_SPI_MIN_SIZE, buf, len);
 
-	SPI_DUMP_SKB("spi frame read", *skb);
-
 	return 0;
 }
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
