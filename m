From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 7/9] NFC: NCI: allow spi driver to choose transfer clock
Date: Mon, 26 Oct 2015 10:27:43 +0100
Message-ID: <1445851665-2497-8-git-send-email-cuissard@marvell.com>
References: <1445851665-2497-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445851665-2497-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In some cases low level drivers might want to update the SPI transfer clock
(e.g. during firmware download).

This patch adds this support. Without any modification the driver will use the
default SPI clock (from pdata or device tree).

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 include/net/nfc/nci_core.h | 4 ++++
 net/nfc/nci/spi.c          | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index f0bb5e7..0f91e09 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -381,6 +381,10 @@ struct nci_spi {
 
 	unsigned int		xfer_udelay;	/* microseconds delay between
 						  transactions */
+
+	unsigned int		xfer_speed_hz; /* SPI clock frequency
+						 0 => default clock */
+
 	u8			acknowledge_mode;
 
 	struct completion	req_completion;
diff --git a/net/nfc/nci/spi.c b/net/nfc/nci/spi.c
index 25153d0..d904cd2 100644
--- a/net/nfc/nci/spi.c
+++ b/net/nfc/nci/spi.c
@@ -58,6 +58,7 @@ static int __nci_spi_send(struct nci_spi *nspi, struct sk_buff *skb,
 	}
 	t.cs_change = cs_change;
 	t.delay_usecs = nspi->xfer_udelay;
+	t.speed_hz = nspi->xfer_speed_hz;
 
 	spi_message_init(&m);
 	spi_message_add_tail(&t, &m);
@@ -144,7 +145,8 @@ struct nci_spi *nci_spi_allocate_spi(struct spi_device *spi,
 
 	nspi->acknowledge_mode = acknowledge_mode;
 	nspi->xfer_udelay = delay;
-
+	/* Use controller max SPI speed by default */
+	nspi->xfer_speed_hz = 0;
 	nspi->spi = spi;
 	nspi->ndev = ndev;
 	init_completion(&nspi->req_completion);
@@ -197,12 +199,14 @@ static struct sk_buff *__nci_spi_read(struct nci_spi *nspi)
 	tx.tx_buf = req;
 	tx.len = 2;
 	tx.cs_change = 0;
+	tx.speed_hz = nspi->xfer_speed_hz;
 	spi_message_add_tail(&tx, &m);
 
 	memset(&rx, 0, sizeof(struct spi_transfer));
 	rx.rx_buf = resp_hdr;
 	rx.len = 2;
 	rx.cs_change = 1;
+	rx.speed_hz = nspi->xfer_speed_hz;
 	spi_message_add_tail(&rx, &m);
 
 	ret = spi_sync(nspi->spi, &m);
@@ -226,6 +230,7 @@ static struct sk_buff *__nci_spi_read(struct nci_spi *nspi)
 	rx.len = rx_len;
 	rx.cs_change = 0;
 	rx.delay_usecs = nspi->xfer_udelay;
+	rx.speed_hz = nspi->xfer_speed_hz;
 	spi_message_add_tail(&rx, &m);
 
 	ret = spi_sync(nspi->spi, &m);
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
