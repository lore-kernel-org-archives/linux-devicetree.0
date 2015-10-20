From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 28/30] nfc: st-nci: Make sure irq is not already active when powering the device
Date: Tue, 20 Oct 2015 23:48:19 +0200
Message-ID: <1445377701-8353-29-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Upon some conditions (timing, CLF errors, platform errors...), the irq might
be already active when powering the device.

Add irq_active variable as a guard to avoid kernel warning message

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/i2c.c | 8 +++++++-
 drivers/nfc/st-nci/spi.c | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 8b53cdf..13f5054 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -50,6 +50,8 @@ struct st_nci_i2c_phy {
 	struct i2c_client *i2c_dev;
 	struct llt_ndlc *ndlc;
 
+	bool irq_active;
+
 	unsigned int gpio_reset;
 	unsigned int irq_polarity;
 
@@ -72,8 +74,10 @@ static int st_nci_i2c_enable(void *phy_id)
 	gpio_set_value(phy->gpio_reset, 1);
 	usleep_range(80000, 85000);
 
-	if (phy->ndlc->powered == 0)
+	if (phy->ndlc->powered == 0 && phy->irq_active == 0) {
 		enable_irq(phy->i2c_dev->irq);
+		phy->irq_active = true;
+	}
 
 	return 0;
 }
@@ -83,6 +87,7 @@ static void st_nci_i2c_disable(void *phy_id)
 	struct st_nci_i2c_phy *phy = phy_id;
 
 	disable_irq_nosync(phy->i2c_dev->irq);
+	phy->irq_active = false;
 }
 
 /*
@@ -342,6 +347,7 @@ static int st_nci_i2c_probe(struct i2c_client *client,
 		return r;
 	}
 
+	phy->irq_active = true;
 	r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 				st_nci_irq_thread_fn,
 				phy->irq_polarity | IRQF_ONESHOT,
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index c37ecd4..10404c9 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -51,6 +51,8 @@ struct st_nci_spi_phy {
 	struct spi_device *spi_dev;
 	struct llt_ndlc *ndlc;
 
+	bool irq_active;
+
 	unsigned int gpio_reset;
 	unsigned int irq_polarity;
 
@@ -73,8 +75,10 @@ static int st_nci_spi_enable(void *phy_id)
 	gpio_set_value(phy->gpio_reset, 1);
 	usleep_range(80000, 85000);
 
-	if (phy->ndlc->powered == 0)
+	if (phy->ndlc->powered == 0 && phy->irq_active == 0) {
 		enable_irq(phy->spi_dev->irq);
+		phy->irq_active = true;
+	}
 
 	return 0;
 }
@@ -84,6 +88,7 @@ static void st_nci_spi_disable(void *phy_id)
 	struct st_nci_spi_phy *phy = phy_id;
 
 	disable_irq_nosync(phy->spi_dev->irq);
+	phy->irq_active = false;
 }
 
 /*
@@ -358,6 +363,7 @@ static int st_nci_spi_probe(struct spi_device *dev)
 		return r;
 	}
 
+	phy->irq_active = true;
 	r = devm_request_threaded_irq(&dev->dev, dev->irq, NULL,
 				st_nci_irq_thread_fn,
 				phy->irq_polarity | IRQF_ONESHOT,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
