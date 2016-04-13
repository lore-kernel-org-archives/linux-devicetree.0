From: Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 1/6] of/irq: Export of_msi_get_domain
Date: Wed, 13 Apr 2016 12:30:51 +0200
Message-ID: <1460543456-11345-2-git-send-email-mbrugger@suse.com>
References: <1460543456-11345-1-git-send-email-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1460543456-11345-1-git-send-email-mbrugger@suse.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, frowand.list@gmail.com, grant.likely@linaro.org, German.Rivera@freescale.com, jiang.liu@linux.intel.com, marc.zyngier@arm.com, tglx@linutronix.de
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, bp@suse.de, mbrugger@suse.com, bhaktipriya96@gmail.com, stuart.yoder@nxp.com, agraf@suse.de, jroedel@suse.de, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, treding@nvidia.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Matthias Brugger <matthias.bgg@gmail.com>

Export of_mis_get_domain to enable it for users from outside.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e7bfc17..9f8cd6a 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -750,6 +750,7 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(of_msi_get_domain);
 
 /**
  * of_msi_configure - Set the msi_domain field of a device
-- 
2.6.6
