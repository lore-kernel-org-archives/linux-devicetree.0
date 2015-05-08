From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB
 NAND controller
Date: Thu, 7 May 2015 19:01:13 -0700
Message-ID: <20150508020113.GY32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <20150506210534.GK32500@ld-irv-0074>
 <554A8537.8050404@broadcom.com>
 <2668469.V5VmYNtzFN@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2668469.V5VmYNtzFN@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ray Jui <rjui@broadcom.com>, linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 07, 2015 at 11:25:29AM +0200, Arnd Bergmann wrote:
> On Wednesday 06 May 2015 14:18:47 Ray Jui wrote:
> > On 5/6/2015 2:05 PM, Brian Norris wrote:
> > > On Wed, May 06, 2015 at 09:17:36PM +0200, Arnd Bergmann wrote:
> > >> You had mentioned previously that there might be an endianess issue in this
> > >> driver.
> > > 
> > > Might. I have a patch already, but I failed to boot a BE kernel, so I
> > > kept it out for now. If you don't mind, I'd prefer patching something
> > > like this once it's testable on ARM BE. This *is*, however, extensively
> > > tested on MIPS (LE and BE) and ARM (LE).
> > 
> > Correct, extensive test and pass all MTD test cases. We should
> > eventually be able to test this on a working ARM BE platform, within the
> > next couple months.
> 
> I'm fine with not testing it on ARM, as long as the code is written in a
> way that is plausible to be correct and not obviously broken.

Would this satisfy you?

From: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 5 May 2015 17:46:42 -0700
Subject: [PATCH] mtd: brcmstb_nand: fixup endianness assumptions

All users of this controller (MIPS or ARM) have previously used native
I/O (__raw{read,write}l()) to access registers. This is normal for the
MIPS case, where BMIPS chips often have a boot-strap that configures not
only the CPU, but also all the busing, to use a given endianness.
However, newer ARM cores support switching to big endian mode at
runtime, which would leave us with different bus and CPU endianness. For
these cases, we should use the endian-switching accessors, so we
continue to access the NAND core in little endian mode.

Suggested by Arnd.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmnand.h         | 25 +++++++++++++++++++++++++
 drivers/mtd/nand/brcmstb_nand.c     |  8 ++++----
 drivers/mtd/nand/brcmstb_nand_soc.c | 20 ++++++++++----------
 3 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand.h b/drivers/mtd/nand/brcmnand.h
index 59e0bfef2331..8fa5213b591d 100644
--- a/drivers/mtd/nand/brcmnand.h
+++ b/drivers/mtd/nand/brcmnand.h
@@ -53,4 +53,29 @@ static inline void brcmnand_soc_data_bus_unprepare(struct brcmnand_soc *soc)
 		soc->prepare_data_bus(soc, false);
 }
 
+static inline u32 brcmnand_readl(void __iomem *addr)
+{
+	/*
+	 * MIPS endianness is configured by boot strap, which also reverses all
+	 * bus endianness (i.e., big-endian CPU + big endian bus ==> native
+	 * endian I/O).
+	 *
+	 * Other architectures (e.g., ARM) either do not support big endian, or
+	 * else leave I/O in little endian mode.
+	 */
+	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(__BIG_ENDIAN))
+		return __raw_readl(addr);
+	else
+		return readl_relaxed(addr);
+}
+
+static inline void brcmnand_writel(u32 val, void __iomem *addr)
+{
+	/* See brcmnand_readl() comments */
+	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(__BIG_ENDIAN))
+		__raw_writel(val, addr);
+	else
+		writel_relaxed(val, addr);
+}
+
 #endif /* __BRCMNAND_H__ */
diff --git a/drivers/mtd/nand/brcmstb_nand.c b/drivers/mtd/nand/brcmstb_nand.c
index 5abc88cfe702..cdd53edf4ed3 100644
--- a/drivers/mtd/nand/brcmstb_nand.c
+++ b/drivers/mtd/nand/brcmstb_nand.c
@@ -357,13 +357,13 @@ enum {
 
 static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)
 {
-	return __raw_readl(ctrl->nand_base + offs);
+	return brcmnand_readl(ctrl->nand_base + offs);
 }
 
 static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,
 				 u32 val)
 {
-	__raw_writel(val, ctrl->nand_base + offs);
+	brcmnand_writel(val, ctrl->nand_base + offs);
 }
 
 static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
@@ -698,12 +698,12 @@ static inline bool flash_dma_buf_ok(const void *buf)
 static inline void flash_dma_writel(struct brcmnand_controller *ctrl, u8 offs,
 				    u32 val)
 {
-	__raw_writel(val, ctrl->flash_dma_base + offs);
+	brcmnand_writel(val, ctrl->flash_dma_base + offs);
 }
 
 static inline u32 flash_dma_readl(struct brcmnand_controller *ctrl, u8 offs)
 {
-	return __raw_readl(ctrl->flash_dma_base + offs);
+	return brcmnand_readl(ctrl->flash_dma_base + offs);
 }
 
 /* Low-level operation types: command, address, write, or read */
diff --git a/drivers/mtd/nand/brcmstb_nand_soc.c b/drivers/mtd/nand/brcmstb_nand_soc.c
index 5fb851c655f2..09a714ef57dd 100644
--- a/drivers/mtd/nand/brcmstb_nand_soc.c
+++ b/drivers/mtd/nand/brcmstb_nand_soc.c
@@ -43,10 +43,10 @@ static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
 {
 	struct bcm63138_nand_soc_priv *priv = soc->priv;
 	void __iomem *mmio = priv->base + BCM63138_NAND_INT_STATUS;
-	u32 val = __raw_readl(mmio);
+	u32 val = brcmnand_readl(mmio);
 
 	if (val & BCM63138_CTLRDY) {
-		__raw_writel(val & ~BCM63138_CTLRDY, mmio);
+		brcmnand_writel(val & ~BCM63138_CTLRDY, mmio);
 		return true;
 	}
 
@@ -57,14 +57,14 @@ static void bcm63138_nand_intc_set(struct brcmnand_soc *soc, bool en)
 {
 	struct bcm63138_nand_soc_priv *priv = soc->priv;
 	void __iomem *mmio = priv->base + BCM63138_NAND_INT_EN;
-	u32 val = __raw_readl(mmio);
+	u32 val = brcmnand_readl(mmio);
 
 	if (en)
 		val |= BCM63138_CTLRDY;
 	else
 		val &= ~BCM63138_CTLRDY;
 
-	__raw_writel(val, mmio);
+	brcmnand_writel(val, mmio);
 }
 
 static int bcm63138_nand_soc_init(struct brcmnand_soc *soc)
@@ -110,10 +110,10 @@ static bool iproc_nand_intc_ack(struct brcmnand_soc *soc)
 {
 	struct iproc_nand_soc_priv *priv = soc->priv;
 	void __iomem *mmio = priv->ext_base + IPROC_NAND_CTLR_READY_OFFSET;
-	u32 val = __raw_readl(mmio);
+	u32 val = brcmnand_readl(mmio);
 
 	if (val & IPROC_NAND_CTLR_READY) {
-		__raw_writel(IPROC_NAND_CTLR_READY, mmio);
+		brcmnand_writel(IPROC_NAND_CTLR_READY, mmio);
 		return true;
 	}
 
@@ -129,14 +129,14 @@ static void iproc_nand_intc_set(struct brcmnand_soc *soc, bool en)
 
 	spin_lock_irqsave(&priv->idm_lock, flags);
 
-	val = __raw_readl(mmio);
+	val = brcmnand_readl(mmio);
 
 	if (en)
 		val |= IPROC_NAND_INT_CTRL_READ_ENABLE;
 	else
 		val &= ~IPROC_NAND_INT_CTRL_READ_ENABLE;
 
-	__raw_writel(val, mmio);
+	brcmnand_writel(val, mmio);
 
 	spin_unlock_irqrestore(&priv->idm_lock, flags);
 }
@@ -180,14 +180,14 @@ static void iproc_nand_apb_access(struct brcmnand_soc *soc, bool prepare)
 
 	spin_lock_irqsave(&priv->idm_lock, flags);
 
-	val = __raw_readl(mmio);
+	val = brcmnand_readl(mmio);
 
 	if (prepare)
 		val |= IPROC_NAND_APB_LE_MODE;
 	else
 		val &= ~IPROC_NAND_APB_LE_MODE;
 
-	__raw_writel(val, mmio);
+	brcmnand_writel(val, mmio);
 
 	spin_unlock_irqrestore(&priv->idm_lock, flags);
 }
-- 
1.9.1
