From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 01/14] genirq/msi: Allow creation of a tree-based irqdomain
 for platform-msi
Date: Thu,  5 Jul 2018 14:39:58 +0200
Message-ID: <20180705124011.7661-2-miquel.raynal@bootlin.com>
References: <20180705124011.7661-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180705124011.7661-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Haim Boot <hayim@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Hanna Hawa <hannah@marvell.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Marc Zyngier <marc.zyngier@arm.com>

platform_msi_create_device_domain() always creates a revmap-based
irqdomain, which has the drawback of requiring the number of MSIs
that can be allocated ahead of time. This is not always possible,
and we sometimes need to use a tree-based irqdomain instead.

Add a new platform_msi_create_device_tree_domain() helper to
that effect.

Reported-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/base/platform-msi.c | 14 ++++++++------
 include/linux/msi.h         | 17 ++++++++++++-----
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 60d6cc618f1c..f39a920496fb 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -321,11 +321,12 @@ void *platform_msi_get_host_data(struct irq_domain *domain)
  * Returns an irqdomain for @nvec interrupts
  */
 struct irq_domain *
-platform_msi_create_device_domain(struct device *dev,
-				  unsigned int nvec,
-				  irq_write_msi_msg_t write_msi_msg,
-				  const struct irq_domain_ops *ops,
-				  void *host_data)
+__platform_msi_create_device_domain(struct device *dev,
+				    unsigned int nvec,
+				    bool is_tree,
+				    irq_write_msi_msg_t write_msi_msg,
+				    const struct irq_domain_ops *ops,
+				    void *host_data)
 {
 	struct platform_msi_priv_data *data;
 	struct irq_domain *domain;
@@ -336,7 +337,8 @@ platform_msi_create_device_domain(struct device *dev,
 		return NULL;
 
 	data->host_data = host_data;
-	domain = irq_domain_create_hierarchy(dev->msi_domain, 0, nvec,
+	domain = irq_domain_create_hierarchy(dev->msi_domain, 0,
+					     is_tree ? 0 : nvec,
 					     dev->fwnode, ops, data);
 	if (!domain)
 		goto free_priv;
diff --git a/include/linux/msi.h b/include/linux/msi.h
index 5839d8062dfc..0e9c50052ff3 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -317,11 +317,18 @@ int msi_domain_prepare_irqs(struct irq_domain *domain, struct device *dev,
 int msi_domain_populate_irqs(struct irq_domain *domain, struct device *dev,
 			     int virq, int nvec, msi_alloc_info_t *args);
 struct irq_domain *
-platform_msi_create_device_domain(struct device *dev,
-				  unsigned int nvec,
-				  irq_write_msi_msg_t write_msi_msg,
-				  const struct irq_domain_ops *ops,
-				  void *host_data);
+__platform_msi_create_device_domain(struct device *dev,
+				    unsigned int nvec,
+				    bool is_tree,
+				    irq_write_msi_msg_t write_msi_msg,
+				    const struct irq_domain_ops *ops,
+				    void *host_data);
+
+#define platform_msi_create_device_domain(dev, nvec, write, ops, data)	\
+	__platform_msi_create_device_domain(dev, nvec, false, write, ops, data)
+#define platform_msi_create_device_tree_domain(dev, nvec, write, ops, data) \
+	__platform_msi_create_device_domain(dev, nvec, true, write, ops, data)
+
 int platform_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
 			      unsigned int nr_irqs);
 void platform_msi_domain_free(struct irq_domain *domain, unsigned int virq,
-- 
2.14.1
