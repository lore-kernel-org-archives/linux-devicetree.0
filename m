From: Roy Pledge <roy.pledge@nxp.com>
Subject: [v5 05/12] soc/fsl/qbman: Drop set/clear_bits usage
Date: Mon, 18 Sep 2017 16:39:40 -0400
Message-ID: <1505767187-4596-6-git-send-email-roy.pledge@nxp.com>
References: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
Reply-To: roy.pledge@nxp.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, arnd@arndb.de, madalin.bucur@nxp.com, catalin.marinas@arm.com, Roy Pledge <roy.pledge@nxp.com>, linux@armlinux.org.uk, oss@buserror.net, Claudiu Manoil <claudiu.manoil@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Madalin Bucur <madalin.bucur@nxp.com>

Replace PPC specific set/clear_bits API with standard
bit twiddling so driver is portalable outside PPC.

Signed-off-by: Madalin Bucur <madalin.bucur@nxp.com>
Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/qbman/bman.c | 2 +-
 drivers/soc/fsl/qbman/qman.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qbman/bman.c b/drivers/soc/fsl/qbman/bman.c
index 604e45c..ff8998f 100644
--- a/drivers/soc/fsl/qbman/bman.c
+++ b/drivers/soc/fsl/qbman/bman.c
@@ -616,7 +616,7 @@ int bman_p_irqsource_add(struct bman_portal *p, u32 bits)
 	unsigned long irqflags;
 
 	local_irq_save(irqflags);
-	set_bits(bits & BM_PIRQ_VISIBLE, &p->irq_sources);
+	p->irq_sources |= bits & BM_PIRQ_VISIBLE;
 	bm_out(&p->p, BM_REG_IER, p->irq_sources);
 	local_irq_restore(irqflags);
 	return 0;
diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 1bcfc51..25419e1 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -908,12 +908,12 @@ static inline int qm_mc_result_timeout(struct qm_portal *portal,
 
 static inline void fq_set(struct qman_fq *fq, u32 mask)
 {
-	set_bits(mask, &fq->flags);
+	fq->flags |= mask;
 }
 
 static inline void fq_clear(struct qman_fq *fq, u32 mask)
 {
-	clear_bits(mask, &fq->flags);
+	fq->flags &= ~mask;
 }
 
 static inline int fq_isset(struct qman_fq *fq, u32 mask)
@@ -1574,7 +1574,7 @@ void qman_p_irqsource_add(struct qman_portal *p, u32 bits)
 	unsigned long irqflags;
 
 	local_irq_save(irqflags);
-	set_bits(bits & QM_PIRQ_VISIBLE, &p->irq_sources);
+	p->irq_sources |= bits & QM_PIRQ_VISIBLE;
 	qm_out(&p->p, QM_REG_IER, p->irq_sources);
 	local_irq_restore(irqflags);
 }
@@ -1597,7 +1597,7 @@ void qman_p_irqsource_remove(struct qman_portal *p, u32 bits)
 	 */
 	local_irq_save(irqflags);
 	bits &= QM_PIRQ_VISIBLE;
-	clear_bits(bits, &p->irq_sources);
+	p->irq_sources &= ~bits;
 	qm_out(&p->p, QM_REG_IER, p->irq_sources);
 	ier = qm_in(&p->p, QM_REG_IER);
 	/*
-- 
2.7.4
