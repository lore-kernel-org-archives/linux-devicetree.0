From: "Christian Daudt" <csd@broadcom.com>
Subject: [PATCH V5 1/2] mmc: sdhci: add card_event callback to sdhci
Date: Thu, 20 Jun 2013 14:26:36 -0700
Message-ID: <1371763597-12440-1-git-send-email-csd@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Chris Ball <cjb@laptop.org>, Stephen Warren <swarren@nvidia.com>, Olof Johansson <olof@lixom.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wei WANG <wei_wang@realsil.com.cn>, Anton Vorontsov <avorontsov@ru.mvista.com>, Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawn.guo@linaro.org>, Bill Pemberton <wfp5p@virginia.edu>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Viresh Kumar <viresh.kumar@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jerry Huang <Chang-Ming.Huang@freescale.com>, Kevin Liu <kliu5@marvell.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ludovic Desroches <ludovic.desroches@atmel.com>, Arnd Bergmann <arnd@arndb.de>, matt.porter@linaro.org
Cc: csd_b@daudt.org, Christian Daudt <csd@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add a card_event callback to sdhci so that clients
can provide their own card_event to be called when
card_detect is triggered.

Signed-off-by: Christian Daudt <csd@broadcom.com>

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 2ea429c..c0d24ef 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -2046,6 +2046,10 @@ static void sdhci_card_event(struct mmc_host *mmc)
 	struct sdhci_host *host = mmc_priv(mmc);
 	unsigned long flags;
 
+	/* First check if client has provided their own card event */
+	if (host->ops->card_event)
+		host->ops->card_event(host);
+
 	spin_lock_irqsave(&host->lock, flags);
 
 	/* Check host->mrq first in case we are runtime suspended */
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 379e09d..b037f18 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -294,6 +294,7 @@ struct sdhci_ops {
 	void	(*platform_resume)(struct sdhci_host *host);
 	void    (*adma_workaround)(struct sdhci_host *host, u32 intmask);
 	void	(*platform_init)(struct sdhci_host *host);
+	void    (*card_event)(struct sdhci_host *host);
 };
 
 #ifdef CONFIG_MMC_SDHCI_IO_ACCESSORS
-- 
1.7.10.4
