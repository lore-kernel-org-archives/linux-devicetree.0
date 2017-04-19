From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] mtd: nand: denali: show how to use generic helpers (do
 not apply)
Date: Wed, 19 Apr 2017 16:06:58 +0900
Message-ID: <1492585618-13655-3-git-send-email-yamada.masahiro@socionext.com>
References: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

This patch shows how the previous commit is used in a driver.
Please do not apply this.

(This is applicable on linux next-20170418)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .../devicetree/bindings/mtd/denali-nand.txt        |   17 +
 drivers/mtd/nand/denali.c                          | 1693 +++++++++-----------
 drivers/mtd/nand/denali.h                          |  297 ++--
 drivers/mtd/nand/denali_dt.c                       |   29 +-
 drivers/mtd/nand/denali_pci.c                      |   11 +-
 5 files changed, 969 insertions(+), 1078 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index e593bbe..0b08ea5 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -3,10 +3,27 @@
 Required properties:
   - compatible : should be one of the following:
       "altr,socfpga-denali-nand"            - for Altera SOCFPGA
+      "socionext,uniphier-denali-nand-v5a"  - for Socionext UniPhier (v5a)
+      "socionext,uniphier-denali-nand-v5b"  - for Socionext UniPhier (v5b)
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
 
+Optional properties:
+  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
+      512   for "altr,socfpga-denali-nand"
+      1024  for "socionext,uniphier-denali-nand-v5a"
+      1024  for "socionext,uniphier-denali-nand-v5b"
+    see nand.txt for details.
+  - nand-ecc-strength: see nand.txt for details.  Available values are:
+      8, 15      for "altr,socfpga-denali-nand"
+      8, 16, 24  for "socionext,uniphier-denali-nand-v5a"
+      8, 16      for "socionext,uniphier-denali-nand-v5b"
+  - nand-ecc-maximize: see nand.txt for details
+
+Note:
+Either nand-ecc-strength or nand-ecc-maximize should be specified.
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
 
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 16634df..15fefd9 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -23,52 +23,21 @@
 #include <linux/mutex.h>
 #include <linux/mtd/mtd.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
 MODULE_LICENSE("GPL");
 
-/*
- * We define a module parameter that allows the user to override
- * the hardware and decide what timing mode should be used.
- */
-#define NAND_DEFAULT_TIMINGS	-1
-
-static int onfi_timing_mode = NAND_DEFAULT_TIMINGS;
-module_param(onfi_timing_mode, int, S_IRUGO);
-MODULE_PARM_DESC(onfi_timing_mode,
-	   "Overrides default ONFI setting. -1 indicates use default timings");
-
 #define DENALI_NAND_NAME    "denali-nand"
 
 /*
- * We define a macro here that combines all interrupts this driver uses into
- * a single constant value, for convenience.
- */
-#define DENALI_IRQ_ALL	(INTR__DMA_CMD_COMP | \
-			INTR__ECC_TRANSACTION_DONE | \
-			INTR__ECC_ERR | \
-			INTR__PROGRAM_FAIL | \
-			INTR__LOAD_COMP | \
-			INTR__PROGRAM_COMP | \
-			INTR__TIME_OUT | \
-			INTR__ERASE_FAIL | \
-			INTR__RST_COMP | \
-			INTR__ERASE_COMP)
-
-/*
  * indicates whether or not the internal value for the flash bank is
  * valid or not
  */
 #define CHIP_SELECT_INVALID	-1
 
 /*
- * This macro divides two integers and rounds fractional values up
- * to the nearest integer value.
- */
-#define CEIL_DIV(X, Y) (((X)%(Y)) ? ((X)/(Y)+1) : ((X)/(Y)))
-
-/*
  * this macro allows us to convert from an MTD structure to our own
  * device context (denali) structure.
  */
@@ -85,8 +54,7 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
 #define MAIN_ACCESS		0x42
 #define MAIN_SPARE_ACCESS	0x43
 
-#define DENALI_READ	0
-#define DENALI_WRITE	0x100
+#define DENALI_NR_BANKS		4
 
 /*
  * this is a helper macro that allows us to
@@ -94,13 +62,13 @@ static inline struct denali_nand_info *mtd_to_denali(struct mtd_info *mtd)
  */
 #define BANK(x) ((x) << 24)
 
-/* forward declarations */
-static void clear_interrupts(struct denali_nand_info *denali);
-static uint32_t wait_for_irq(struct denali_nand_info *denali,
-							uint32_t irq_mask);
-static void denali_irq_enable(struct denali_nand_info *denali,
-							uint32_t int_mask);
-static uint32_t read_interrupt_status(struct denali_nand_info *denali);
+/*
+ * The bus interface clock, clk_x, is phase aligned with the core clock.  The
+ * clk_x is an integral multiple N of the core clk.  The value N is configured
+ * at IP delivery time, and its available value is 4, 5, or 6.  We need to align
+ * to the largest value to make it work with any possible configuration.
+ */
+#define DENALI_CLK_X_MULT	6
 
 /*
  * Certain operations for the denali NAND controller use an indexed mode to
@@ -115,595 +83,244 @@ static void index_addr(struct denali_nand_info *denali,
 	iowrite32(data, denali->flash_mem + 0x10);
 }
 
-/* Perform an indexed read of the device */
-static void index_addr_read_data(struct denali_nand_info *denali,
-				 uint32_t address, uint32_t *pdata)
-{
-	iowrite32(address, denali->flash_mem);
-	*pdata = ioread32(denali->flash_mem + 0x10);
-}
-
 /*
- * We need to buffer some data for some of the NAND core routines.
- * The operations manage buffering that data.
+ * Use the configuration feature register to determine the maximum number of
+ * banks that the hardware supports.
  */
-static void reset_buf(struct denali_nand_info *denali)
-{
-	denali->buf.head = denali->buf.tail = 0;
-}
-
-static void write_byte_to_buf(struct denali_nand_info *denali, uint8_t byte)
-{
-	denali->buf.buf[denali->buf.tail++] = byte;
-}
-
-/* reads the status of the device */
-static void read_status(struct denali_nand_info *denali)
+static void detect_max_banks(struct denali_nand_info *denali)
 {
-	uint32_t cmd;
+	uint32_t features = ioread32(denali->flash_reg + FEATURES);
 
-	/* initialize the data buffer to store status */
-	reset_buf(denali);
+	denali->max_banks = 1 << (features & FEATURES__N_BANKS);
 
-	cmd = ioread32(denali->flash_reg + WRITE_PROTECT);
-	if (cmd)
-		write_byte_to_buf(denali, NAND_STATUS_WP);
-	else
-		write_byte_to_buf(denali, 0);
+	/* the encoding changed from rev 5.0 to 5.1 */
+	if (denali->revision < 0x0501)
+		denali->max_banks <<= 1;
 }
 
-/* resets a specific device connected to the core */
-static void reset_bank(struct denali_nand_info *denali)
+static void denali_enable_irq(struct denali_nand_info *denali)
 {
-	uint32_t irq_status;
-	uint32_t irq_mask = INTR__RST_COMP | INTR__TIME_OUT;
-
-	clear_interrupts(denali);
-
-	iowrite32(1 << denali->flash_bank, denali->flash_reg + DEVICE_RESET);
-
-	irq_status = wait_for_irq(denali, irq_mask);
+	int i;
 
-	if (irq_status & INTR__TIME_OUT)
-		dev_err(denali->dev, "reset bank failed.\n");
+	for (i = 0; i < DENALI_NR_BANKS; i++)
+		iowrite32(U32_MAX, denali->flash_reg + INTR_EN(i));
+	iowrite32(GLOBAL_INT_EN_FLAG, denali->flash_reg + GLOBAL_INT_ENABLE);
 }
 
-/* Reset the flash controller */
-static uint16_t denali_nand_reset(struct denali_nand_info *denali)
+static void denali_disable_irq(struct denali_nand_info *denali)
 {
 	int i;
 
-	for (i = 0; i < denali->max_banks; i++)
-		iowrite32(INTR__RST_COMP | INTR__TIME_OUT,
-		denali->flash_reg + INTR_STATUS(i));
-
-	for (i = 0; i < denali->max_banks; i++) {
-		iowrite32(1 << i, denali->flash_reg + DEVICE_RESET);
-		while (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
-			(INTR__RST_COMP | INTR__TIME_OUT)))
-			cpu_relax();
-		if (ioread32(denali->flash_reg + INTR_STATUS(i)) &
-			INTR__TIME_OUT)
-			dev_dbg(denali->dev,
-			"NAND Reset operation timed out on bank %d\n", i);
-	}
-
-	for (i = 0; i < denali->max_banks; i++)
-		iowrite32(INTR__RST_COMP | INTR__TIME_OUT,
-			  denali->flash_reg + INTR_STATUS(i));
-
-	return PASS;
+	for (i = 0; i < DENALI_NR_BANKS; i++)
+		iowrite32(0, denali->flash_reg + INTR_EN(i));
+	iowrite32(0, denali->flash_reg + GLOBAL_INT_ENABLE);
 }
 
-/*
- * this routine calculates the ONFI timing values for a given mode and
- * programs the clocking register accordingly. The mode is determined by
- * the get_onfi_nand_para routine.
- */
-static void nand_onfi_timing_set(struct denali_nand_info *denali,
-								uint16_t mode)
+static void denali_clear_irq(struct denali_nand_info *denali,
+			     int bank, uint32_t irq_status)
 {
-	uint16_t Trea[6] = {40, 30, 25, 20, 20, 16};
-	uint16_t Trp[6] = {50, 25, 17, 15, 12, 10};
-	uint16_t Treh[6] = {30, 15, 15, 10, 10, 7};
-	uint16_t Trc[6] = {100, 50, 35, 30, 25, 20};
-	uint16_t Trhoh[6] = {0, 15, 15, 15, 15, 15};
-	uint16_t Trloh[6] = {0, 0, 0, 0, 5, 5};
-	uint16_t Tcea[6] = {100, 45, 30, 25, 25, 25};
-	uint16_t Tadl[6] = {200, 100, 100, 100, 70, 70};
-	uint16_t Trhw[6] = {200, 100, 100, 100, 100, 100};
-	uint16_t Trhz[6] = {200, 100, 100, 100, 100, 100};
-	uint16_t Twhr[6] = {120, 80, 80, 60, 60, 60};
-	uint16_t Tcs[6] = {70, 35, 25, 25, 20, 15};
-
-	uint16_t data_invalid_rhoh, data_invalid_rloh, data_invalid;
-	uint16_t dv_window = 0;
-	uint16_t en_lo, en_hi;
-	uint16_t acc_clks;
-	uint16_t addr_2_data, re_2_we, re_2_re, we_2_re, cs_cnt;
-
-	en_lo = CEIL_DIV(Trp[mode], CLK_X);
-	en_hi = CEIL_DIV(Treh[mode], CLK_X);
-#if ONFI_BLOOM_TIME
-	if ((en_hi * CLK_X) < (Treh[mode] + 2))
-		en_hi++;
-#endif
-
-	if ((en_lo + en_hi) * CLK_X < Trc[mode])
-		en_lo += CEIL_DIV((Trc[mode] - (en_lo + en_hi) * CLK_X), CLK_X);
-
-	if ((en_lo + en_hi) < CLK_MULTI)
-		en_lo += CLK_MULTI - en_lo - en_hi;
-
-	while (dv_window < 8) {
-		data_invalid_rhoh = en_lo * CLK_X + Trhoh[mode];
-
-		data_invalid_rloh = (en_lo + en_hi) * CLK_X + Trloh[mode];
-
-		data_invalid = data_invalid_rhoh < data_invalid_rloh ?
-					data_invalid_rhoh : data_invalid_rloh;
-
-		dv_window = data_invalid - Trea[mode];
-
-		if (dv_window < 8)
-			en_lo++;
-	}
-
-	acc_clks = CEIL_DIV(Trea[mode], CLK_X);
-
-	while (acc_clks * CLK_X - Trea[mode] < 3)
-		acc_clks++;
-
-	if (data_invalid - acc_clks * CLK_X < 2)
-		dev_warn(denali->dev, "%s, Line %d: Warning!\n",
-			 __FILE__, __LINE__);
-
-	addr_2_data = CEIL_DIV(Tadl[mode], CLK_X);
-	re_2_we = CEIL_DIV(Trhw[mode], CLK_X);
-	re_2_re = CEIL_DIV(Trhz[mode], CLK_X);
-	we_2_re = CEIL_DIV(Twhr[mode], CLK_X);
-	cs_cnt = CEIL_DIV((Tcs[mode] - Trp[mode]), CLK_X);
-	if (cs_cnt == 0)
-		cs_cnt = 1;
-
-	if (Tcea[mode]) {
-		while (cs_cnt * CLK_X + Trea[mode] < Tcea[mode])
-			cs_cnt++;
-	}
-
-#if MODE5_WORKAROUND
-	if (mode == 5)
-		acc_clks = 5;
-#endif
-
-	/* Sighting 3462430: Temporary hack for MT29F128G08CJABAWP:B */
-	if (ioread32(denali->flash_reg + MANUFACTURER_ID) == 0 &&
-		ioread32(denali->flash_reg + DEVICE_ID) == 0x88)
-		acc_clks = 6;
-
-	iowrite32(acc_clks, denali->flash_reg + ACC_CLKS);
-	iowrite32(re_2_we, denali->flash_reg + RE_2_WE);
-	iowrite32(re_2_re, denali->flash_reg + RE_2_RE);
-	iowrite32(we_2_re, denali->flash_reg + WE_2_RE);
-	iowrite32(addr_2_data, denali->flash_reg + ADDR_2_DATA);
-	iowrite32(en_lo, denali->flash_reg + RDWR_EN_LO_CNT);
-	iowrite32(en_hi, denali->flash_reg + RDWR_EN_HI_CNT);
-	iowrite32(cs_cnt, denali->flash_reg + CS_SETUP_CNT);
+	/* write one to clear bits */
+	iowrite32(irq_status, denali->flash_reg + INTR_STATUS(bank));
 }
 
-/* queries the NAND device to see what ONFI modes it supports. */
-static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
+static void denali_clear_irq_all(struct denali_nand_info *denali)
 {
 	int i;
 
-	/*
-	 * we needn't to do a reset here because driver has already
-	 * reset all the banks before
-	 */
-	if (!(ioread32(denali->flash_reg + ONFI_TIMING_MODE) &
-		ONFI_TIMING_MODE__VALUE))
-		return FAIL;
-
-	for (i = 5; i > 0; i--) {
-		if (ioread32(denali->flash_reg + ONFI_TIMING_MODE) &
-			(0x01 << i))
-			break;
-	}
-
-	nand_onfi_timing_set(denali, i);
-
-	/*
-	 * By now, all the ONFI devices we know support the page cache
-	 * rw feature. So here we enable the pipeline_rw_ahead feature
-	 */
-	/* iowrite32(1, denali->flash_reg + CACHE_WRITE_ENABLE); */
-	/* iowrite32(1, denali->flash_reg + CACHE_READ_ENABLE);  */
-
-	return PASS;
+	for (i = 0; i < DENALI_NR_BANKS; i++)
+		denali_clear_irq(denali, i, U32_MAX);
 }
 
-static void get_samsung_nand_para(struct denali_nand_info *denali,
-							uint8_t device_id)
+static irqreturn_t denali_isr(int irq, void *dev_id)
 {
-	if (device_id == 0xd3) { /* Samsung K9WAG08U1A */
-		/* Set timing register values according to datasheet */
-		iowrite32(5, denali->flash_reg + ACC_CLKS);
-		iowrite32(20, denali->flash_reg + RE_2_WE);
-		iowrite32(12, denali->flash_reg + WE_2_RE);
-		iowrite32(14, denali->flash_reg + ADDR_2_DATA);
-		iowrite32(3, denali->flash_reg + RDWR_EN_LO_CNT);
-		iowrite32(2, denali->flash_reg + RDWR_EN_HI_CNT);
-		iowrite32(2, denali->flash_reg + CS_SETUP_CNT);
-	}
-}
+	struct denali_nand_info *denali = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	uint32_t irq_status;
+	int i;
 
-static void get_toshiba_nand_para(struct denali_nand_info *denali)
-{
-	/*
-	 * Workaround to fix a controller bug which reports a wrong
-	 * spare area size for some kind of Toshiba NAND device
-	 */
-	if ((ioread32(denali->flash_reg + DEVICE_MAIN_AREA_SIZE) == 4096) &&
-		(ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE) == 64))
-		iowrite32(216, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-}
+	spin_lock(&denali->irq_lock);
 
-static void get_hynix_nand_para(struct denali_nand_info *denali,
-							uint8_t device_id)
-{
-	switch (device_id) {
-	case 0xD5: /* Hynix H27UAG8T2A, H27UBG8U5A or H27UCG8VFA */
-	case 0xD7: /* Hynix H27UDG8VEM, H27UCG8UDM or H27UCG8V5A */
-		iowrite32(128, denali->flash_reg + PAGES_PER_BLOCK);
-		iowrite32(4096, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
-		iowrite32(224, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-		iowrite32(0, denali->flash_reg + DEVICE_WIDTH);
-		break;
-	default:
-		dev_warn(denali->dev,
-			 "Unknown Hynix NAND (Device ID: 0x%x).\n"
-			 "Will use default parameter values instead.\n",
-			 device_id);
-	}
-}
+	for (i = 0; i < DENALI_NR_BANKS; i++) {
+		irq_status = ioread32(denali->flash_reg + INTR_STATUS(i));
+		if (irq_status)
+			ret = IRQ_HANDLED;
 
-/*
- * determines how many NAND chips are connected to the controller. Note for
- * Intel CE4100 devices we don't support more than one device.
- */
-static void find_valid_banks(struct denali_nand_info *denali)
-{
-	uint32_t id[denali->max_banks];
-	int i;
+		denali_clear_irq(denali, i, irq_status);
 
-	denali->total_used_banks = 1;
-	for (i = 0; i < denali->max_banks; i++) {
-		index_addr(denali, MODE_11 | (i << 24) | 0, 0x90);
-		index_addr(denali, MODE_11 | (i << 24) | 1, 0);
-		index_addr_read_data(denali, MODE_11 | (i << 24) | 2, &id[i]);
+		if (i != denali->flash_bank)
+			continue;
 
-		dev_dbg(denali->dev,
-			"Return 1st ID for bank[%d]: %x\n", i, id[i]);
+		denali->irq_status |= irq_status;
 
-		if (i == 0) {
-			if (!(id[i] & 0x0ff))
-				break; /* WTF? */
-		} else {
-			if ((id[i] & 0x0ff) == (id[0] & 0x0ff))
-				denali->total_used_banks++;
-			else
-				break;
-		}
-	}
-
-	if (denali->platform == INTEL_CE4100) {
-		/*
-		 * Platform limitations of the CE4100 device limit
-		 * users to a single chip solution for NAND.
-		 * Multichip support is not enabled.
-		 */
-		if (denali->total_used_banks != 1) {
-			dev_err(denali->dev,
-				"Sorry, Intel CE4100 only supports a single NAND device.\n");
-			BUG();
-		}
+		if (denali->irq_status & denali->irq_mask)
+			complete(&denali->complete);
 	}
-	dev_dbg(denali->dev,
-		"denali->total_used_banks: %d\n", denali->total_used_banks);
-}
-
-/*
- * Use the configuration feature register to determine the maximum number of
- * banks that the hardware supports.
- */
-static void detect_max_banks(struct denali_nand_info *denali)
-{
-	uint32_t features = ioread32(denali->flash_reg + FEATURES);
 
-	denali->max_banks = 1 << (features & FEATURES__N_BANKS);
+	spin_unlock(&denali->irq_lock);
 
-	/* the encoding changed from rev 5.0 to 5.1 */
-	if (denali->revision < 0x0501)
-		denali->max_banks <<= 1;
+	return ret;
 }
 
-static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
+static void denali_reset_irq(struct denali_nand_info *denali)
 {
-	uint16_t status = PASS;
-	uint32_t id_bytes[8], addr;
-	uint8_t maf_id, device_id;
-	int i;
-
-	/*
-	 * Use read id method to get device ID and other params.
-	 * For some NAND chips, controller can't report the correct
-	 * device ID by reading from DEVICE_ID register
-	 */
-	addr = MODE_11 | BANK(denali->flash_bank);
-	index_addr(denali, addr | 0, 0x90);
-	index_addr(denali, addr | 1, 0);
-	for (i = 0; i < 8; i++)
-		index_addr_read_data(denali, addr | 2, &id_bytes[i]);
-	maf_id = id_bytes[0];
-	device_id = id_bytes[1];
-
-	if (ioread32(denali->flash_reg + ONFI_DEVICE_NO_OF_LUNS) &
-		ONFI_DEVICE_NO_OF_LUNS__ONFI_DEVICE) { /* ONFI 1.0 NAND */
-		if (FAIL == get_onfi_nand_para(denali))
-			return FAIL;
-	} else if (maf_id == 0xEC) { /* Samsung NAND */
-		get_samsung_nand_para(denali, device_id);
-	} else if (maf_id == 0x98) { /* Toshiba NAND */
-		get_toshiba_nand_para(denali);
-	} else if (maf_id == 0xAD) { /* Hynix NAND */
-		get_hynix_nand_para(denali, device_id);
-	}
-
-	dev_info(denali->dev,
-			"Dump timing register values:\n"
-			"acc_clks: %d, re_2_we: %d, re_2_re: %d\n"
-			"we_2_re: %d, addr_2_data: %d, rdwr_en_lo_cnt: %d\n"
-			"rdwr_en_hi_cnt: %d, cs_setup_cnt: %d\n",
-			ioread32(denali->flash_reg + ACC_CLKS),
-			ioread32(denali->flash_reg + RE_2_WE),
-			ioread32(denali->flash_reg + RE_2_RE),
-			ioread32(denali->flash_reg + WE_2_RE),
-			ioread32(denali->flash_reg + ADDR_2_DATA),
-			ioread32(denali->flash_reg + RDWR_EN_LO_CNT),
-			ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
-			ioread32(denali->flash_reg + CS_SETUP_CNT));
-
-	find_valid_banks(denali);
-
-	/*
-	 * If the user specified to override the default timings
-	 * with a specific ONFI mode, we apply those changes here.
-	 */
-	if (onfi_timing_mode != NAND_DEFAULT_TIMINGS)
-		nand_onfi_timing_set(denali, onfi_timing_mode);
+	unsigned long flags;
 
-	return status;
+	spin_lock_irqsave(&denali->irq_lock, flags);
+	denali->irq_status = 0;
+	denali->irq_mask = 0;
+	spin_unlock_irqrestore(&denali->irq_lock, flags);
 }
 
-static void denali_set_intr_modes(struct denali_nand_info *denali,
-					uint16_t INT_ENABLE)
+static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
+				    uint32_t irq_mask)
 {
-	if (INT_ENABLE)
-		iowrite32(1, denali->flash_reg + GLOBAL_INT_ENABLE);
-	else
-		iowrite32(0, denali->flash_reg + GLOBAL_INT_ENABLE);
-}
+	unsigned long time_left, flags;
+	uint32_t irq_status;
 
-/*
- * validation function to verify that the controlling software is making
- * a valid request
- */
-static inline bool is_flash_bank_valid(int flash_bank)
-{
-	return flash_bank >= 0 && flash_bank < 4;
-}
+	spin_lock_irqsave(&denali->irq_lock, flags);
 
-static void denali_irq_init(struct denali_nand_info *denali)
-{
-	uint32_t int_mask;
-	int i;
+	irq_status = denali->irq_status;
 
-	/* Disable global interrupts */
-	denali_set_intr_modes(denali, false);
+	if (irq_mask & irq_status) {
+		spin_unlock_irqrestore(&denali->irq_lock, flags);
+		return irq_status;
+	}
 
-	int_mask = DENALI_IRQ_ALL;
+	denali->irq_mask = irq_mask;
+	reinit_completion(&denali->complete);
+	spin_unlock_irqrestore(&denali->irq_lock, flags);
 
-	/* Clear all status bits */
-	for (i = 0; i < denali->max_banks; ++i)
-		iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS(i));
+	time_left = wait_for_completion_timeout(&denali->complete,
+						msecs_to_jiffies(1000));
+	if (!time_left) {
+		dev_err(denali->dev, "timeout while waiting for irq 0x%x\n",
+			denali->irq_mask);
+		return 0;
+	}
 
-	denali_irq_enable(denali, int_mask);
+	return denali->irq_status;
 }
 
-static void denali_irq_cleanup(int irqnum, struct denali_nand_info *denali)
+static uint32_t denali_check_irq(struct denali_nand_info *denali)
 {
-	denali_set_intr_modes(denali, false);
-}
+	unsigned long flags;
+	uint32_t irq_status;
 
-static void denali_irq_enable(struct denali_nand_info *denali,
-							uint32_t int_mask)
-{
-	int i;
+	spin_lock_irqsave(&denali->irq_lock, flags);
+	irq_status = denali->irq_status;
+	spin_unlock_irqrestore(&denali->irq_lock, flags);
 
-	for (i = 0; i < denali->max_banks; ++i)
-		iowrite32(int_mask, denali->flash_reg + INTR_EN(i));
+	return irq_status;
 }
 
 /*
- * This function only returns when an interrupt that this driver cares about
- * occurs. This is to reduce the overhead of servicing interrupts
+ * This helper function setups the registers for ECC and whether or not
+ * the spare area will be transferred.
  */
-static inline uint32_t denali_irq_detected(struct denali_nand_info *denali)
+static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en,
+				bool transfer_spare)
 {
-	return read_interrupt_status(denali) & DENALI_IRQ_ALL;
+	int ecc_en_flag, transfer_spare_flag;
+
+	/* set ECC, transfer spare bits if needed */
+	ecc_en_flag = ecc_en ? ECC_ENABLE__FLAG : 0;
+	transfer_spare_flag = transfer_spare ? TRANSFER_SPARE_REG__FLAG : 0;
+
+	/* Enable spare area/ECC per user's request. */
+	iowrite32(ecc_en_flag, denali->flash_reg + ECC_ENABLE);
+	iowrite32(transfer_spare_flag, denali->flash_reg + TRANSFER_SPARE_REG);
 }
 
-/* Interrupts are cleared by writing a 1 to the appropriate status bit */
-static inline void clear_interrupt(struct denali_nand_info *denali,
-							uint32_t irq_mask)
+static uint8_t denali_read_byte(struct mtd_info *mtd)
 {
-	uint32_t intr_status_reg;
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	intr_status_reg = INTR_STATUS(denali->flash_bank);
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
 
-	iowrite32(irq_mask, denali->flash_reg + intr_status_reg);
+	return ioread32(denali->flash_mem + 0x10);
 }
 
-static void clear_interrupts(struct denali_nand_info *denali)
+static void denali_write_byte(struct mtd_info *mtd, uint8_t byte)
 {
-	uint32_t status;
-
-	spin_lock_irq(&denali->irq_lock);
-
-	status = read_interrupt_status(denali);
-	clear_interrupt(denali, status);
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	denali->irq_status = 0x0;
-	spin_unlock_irq(&denali->irq_lock);
+	index_addr(denali, MODE_11 | BANK(denali->flash_bank) | 2, byte);
 }
 
-static uint32_t read_interrupt_status(struct denali_nand_info *denali)
+static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	uint32_t intr_status_reg;
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	int i;
 
-	intr_status_reg = INTR_STATUS(denali->flash_bank);
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
 
-	return ioread32(denali->flash_reg + intr_status_reg);
+	for (i = 0; i < len; i++)
+		buf[i] = ioread32(denali->flash_mem + 0x10);
 }
 
-/*
- * This is the interrupt service routine. It handles all interrupts
- * sent to this device. Note that on CE4100, this is a shared interrupt.
- */
-static irqreturn_t denali_isr(int irq, void *dev_id)
+static void denali_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
-	struct denali_nand_info *denali = dev_id;
-	uint32_t irq_status;
-	irqreturn_t result = IRQ_NONE;
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	int i;
 
-	spin_lock(&denali->irq_lock);
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
 
-	/* check to see if a valid NAND chip has been selected. */
-	if (is_flash_bank_valid(denali->flash_bank)) {
-		/*
-		 * check to see if controller generated the interrupt,
-		 * since this is a shared interrupt
-		 */
-		irq_status = denali_irq_detected(denali);
-		if (irq_status != 0) {
-			/* handle interrupt */
-			/* first acknowledge it */
-			clear_interrupt(denali, irq_status);
-			/*
-			 * store the status in the device context for someone
-			 * to read
-			 */
-			denali->irq_status |= irq_status;
-			/* notify anyone who cares that it happened */
-			complete(&denali->complete);
-			/* tell the OS that we've handled this */
-			result = IRQ_HANDLED;
-		}
-	}
-	spin_unlock(&denali->irq_lock);
-	return result;
+	for (i = 0; i < len; i++)
+		iowrite32(buf[i], denali->flash_mem + 0x10);
 }
 
-static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
+static void denali_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	unsigned long comp_res;
-	uint32_t intr_status;
-	unsigned long timeout = msecs_to_jiffies(1000);
-
-	do {
-		comp_res =
-			wait_for_completion_timeout(&denali->complete, timeout);
-		spin_lock_irq(&denali->irq_lock);
-		intr_status = denali->irq_status;
-
-		if (intr_status & irq_mask) {
-			denali->irq_status &= ~irq_mask;
-			spin_unlock_irq(&denali->irq_lock);
-			/* our interrupt was detected */
-			break;
-		}
-
-		/*
-		 * these are not the interrupts you are looking for -
-		 * need to wait again
-		 */
-		spin_unlock_irq(&denali->irq_lock);
-	} while (comp_res != 0);
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	uint16_t *buf16 = (uint16_t *)buf;
+	int i;
 
-	if (comp_res == 0) {
-		/* timeout */
-		pr_err("timeout occurred, status = 0x%x, mask = 0x%x\n",
-				intr_status, irq_mask);
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
 
-		intr_status = 0;
-	}
-	return intr_status;
+	for (i = 0; i < len / 2; i++)
+		buf16[i] = ioread32(denali->flash_mem + 0x10);
 }
 
-/*
- * This helper function setups the registers for ECC and whether or not
- * the spare area will be transferred.
- */
-static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en,
-				bool transfer_spare)
+static void denali_write_buf16(struct mtd_info *mtd, const uint8_t *buf,
+			       int len)
 {
-	int ecc_en_flag, transfer_spare_flag;
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	const uint16_t *buf16 = (const uint16_t *)buf;
+	int i;
 
-	/* set ECC, transfer spare bits if needed */
-	ecc_en_flag = ecc_en ? ECC_ENABLE__FLAG : 0;
-	transfer_spare_flag = transfer_spare ? TRANSFER_SPARE_REG__FLAG : 0;
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
 
-	/* Enable spare area/ECC per user's request. */
-	iowrite32(ecc_en_flag, denali->flash_reg + ECC_ENABLE);
-	iowrite32(transfer_spare_flag, denali->flash_reg + TRANSFER_SPARE_REG);
+	for (i = 0; i < len / 2; i++)
+		iowrite32(buf16[i], denali->flash_mem + 0x10);
 }
 
-/*
- * sends a pipeline command operation to the controller. See the Denali NAND
- * controller's user guide for more information (section 4.2.3.6).
- */
-static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
-				    bool ecc_en, bool transfer_spare,
-				    int access_type, int op)
+static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 {
-	int status = PASS;
-	uint32_t addr, cmd;
-
-	setup_ecc_for_xfer(denali, ecc_en, transfer_spare);
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	uint32_t type;
 
-	clear_interrupts(denali);
+	if (ctrl & NAND_CLE)
+		type = 0;
+	else if (ctrl & NAND_ALE)
+		type = 1;
+	else
+		return;
 
-	addr = BANK(denali->flash_bank) | denali->page;
+	/*
+	 * Some commands are followed by chip->dev_ready or chip->waitfunc.
+	 * irq_status must be cleared here to catch the R/B# interrupt later.
+	 */
+	if (ctrl & NAND_CTRL_CHANGE)
+		denali_reset_irq(denali);
 
-	if (op == DENALI_WRITE && access_type != SPARE_ACCESS) {
-		cmd = MODE_01 | addr;
-		iowrite32(cmd, denali->flash_mem);
-	} else if (op == DENALI_WRITE && access_type == SPARE_ACCESS) {
-		/* read spare area */
-		cmd = MODE_10 | addr;
-		index_addr(denali, cmd, access_type);
+	index_addr(denali, MODE_11 | BANK(denali->flash_bank) | type, dat);
+}
 
-		cmd = MODE_01 | addr;
-		iowrite32(cmd, denali->flash_mem);
-	} else if (op == DENALI_READ) {
-		/* setup page read request for access type */
-		cmd = MODE_10 | addr;
-		index_addr(denali, cmd, access_type);
+static int denali_dev_ready(struct mtd_info *mtd)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-		cmd = MODE_01 | addr;
-		iowrite32(cmd, denali->flash_mem);
-	}
-	return status;
+	return !!(denali_check_irq(denali) & INTR__INT_ACT);
 }
 
 /* helper function that simply writes a buffer to the flash */
@@ -748,71 +365,6 @@ static int read_data_from_flash_mem(struct denali_nand_info *denali,
 	return i * 4; /* intent is to return the number of bytes read */
 }
 
-/* writes OOB data to the device */
-static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
-{
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t irq_status;
-	uint32_t irq_mask = INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL;
-	int status = 0;
-
-	denali->page = page;
-
-	if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
-							DENALI_WRITE) == PASS) {
-		write_data_to_flash_mem(denali, buf, mtd->oobsize);
-
-		/* wait for operation to complete */
-		irq_status = wait_for_irq(denali, irq_mask);
-
-		if (irq_status == 0) {
-			dev_err(denali->dev, "OOB write failed\n");
-			status = -EIO;
-		}
-	} else {
-		dev_err(denali->dev, "unable to send pipeline command\n");
-		status = -EIO;
-	}
-	return status;
-}
-
-/* reads OOB data from the device */
-static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
-{
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t irq_mask = INTR__LOAD_COMP;
-	uint32_t irq_status, addr, cmd;
-
-	denali->page = page;
-
-	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
-							DENALI_READ) == PASS) {
-		read_data_from_flash_mem(denali, buf, mtd->oobsize);
-
-		/*
-		 * wait for command to be accepted
-		 * can always use status0 bit as the
-		 * mask is identical for each bank.
-		 */
-		irq_status = wait_for_irq(denali, irq_mask);
-
-		if (irq_status == 0)
-			dev_err(denali->dev, "page on OOB timeout %d\n",
-					denali->page);
-
-		/*
-		 * We set the device back to MAIN_ACCESS here as I observed
-		 * instability with the controller if you do a block erase
-		 * and the last transaction was a SPARE_ACCESS. Block erase
-		 * is reliable (according to the MTD test infrastructure)
-		 * if you are in MAIN_ACCESS.
-		 */
-		addr = BANK(denali->flash_bank) | denali->page;
-		cmd = MODE_10 | addr;
-		index_addr(denali, cmd, MAIN_ACCESS);
-	}
-}
-
 static int denali_check_erased_page(struct mtd_info *mtd,
 				    struct nand_chip *chip, uint8_t *buf,
 				    unsigned long uncor_ecc_flags,
@@ -886,8 +438,6 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
 	return max_bitflips;
 }
 
-#define ECC_SECTOR_SIZE 512
-
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
 #define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
 #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
@@ -899,15 +449,16 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			       struct denali_nand_info *denali,
 			       unsigned long *uncor_ecc_flags, uint8_t *buf)
 {
+	unsigned int ecc_size = denali->nand.ecc.size;
 	unsigned int bitflips = 0;
 	unsigned int max_bitflips = 0;
 	uint32_t err_addr, err_cor_info;
 	unsigned int err_byte, err_sector, err_device;
 	uint8_t err_cor_value;
 	unsigned int prev_sector = 0;
+	uint32_t irq_status;
 
-	/* read the ECC errors. we'll ignore them for now */
-	denali_set_intr_modes(denali, false);
+	denali_reset_irq(denali);
 
 	do {
 		err_addr = ioread32(denali->flash_reg + ECC_ERROR_ADDRESS);
@@ -928,9 +479,9 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			 * an erased sector.
 			 */
 			*uncor_ecc_flags |= BIT(err_sector);
-		} else if (err_byte < ECC_SECTOR_SIZE) {
+		} else if (err_byte < ecc_size) {
 			/*
-			 * If err_byte is larger than ECC_SECTOR_SIZE, means error
+			 * If err_byte is larger than ecc_size, means error
 			 * happened in OOB, so we ignore it. It's no need for
 			 * us to correct it err_device is represented the NAND
 			 * error bits are happened in if there are more than
@@ -939,7 +490,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 			int offset;
 			unsigned int flips_in_byte;
 
-			offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
+			offset = (err_sector * ecc_size + err_byte) *
 						denali->devnum + err_device;
 
 			/* correct the ECC error */
@@ -959,10 +510,9 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
 	 * ECC_TRANSACTION_DONE interrupt, so here just wait for
 	 * a while for this interrupt
 	 */
-	while (!(read_interrupt_status(denali) & INTR__ECC_TRANSACTION_DONE))
-		cpu_relax();
-	clear_interrupts(denali);
-	denali_set_intr_modes(denali, true);
+	irq_status = denali_wait_for_irq(denali, INTR__ECC_TRANSACTION_DONE);
+	if (!(irq_status & INTR__ECC_TRANSACTION_DONE))
+		return -EIO;
 
 	return max_bitflips;
 }
@@ -974,13 +524,13 @@ static void denali_enable_dma(struct denali_nand_info *denali, bool en)
 	ioread32(denali->flash_reg + DMA_ENABLE);
 }
 
-static void denali_setup_dma64(struct denali_nand_info *denali, int op)
+static void denali_setup_dma64(struct denali_nand_info *denali,
+			       dma_addr_t dma_addr, int page, int write)
 {
 	uint32_t mode;
 	const int page_count = 1;
-	uint64_t addr = denali->buf.dma_buf;
 
-	mode = MODE_10 | BANK(denali->flash_bank) | denali->page;
+	mode = MODE_10 | BANK(denali->flash_bank) | page;
 
 	/* DMA is a three step process */
 
@@ -988,191 +538,352 @@ static void denali_setup_dma64(struct denali_nand_info *denali, int op)
 	 * 1. setup transfer type, interrupt when complete,
 	 *    burst len = 64 bytes, the number of pages
 	 */
-	index_addr(denali, mode, 0x01002000 | (64 << 16) | op | page_count);
+	index_addr(denali, mode,
+		   0x01002000 | (64 << 16) | (write << 8) | page_count);
 
 	/* 2. set memory low address */
-	index_addr(denali, mode, addr);
+	index_addr(denali, mode, dma_addr);
 
 	/* 3. set memory high address */
-	index_addr(denali, mode, addr >> 32);
+	index_addr(denali, mode, (uint64_t)dma_addr >> 32);
 }
 
-static void denali_setup_dma32(struct denali_nand_info *denali, int op)
+static void denali_setup_dma32(struct denali_nand_info *denali,
+			       dma_addr_t dma_addr, int page, int write)
 {
 	uint32_t mode;
 	const int page_count = 1;
-	uint32_t addr = denali->buf.dma_buf;
 
 	mode = MODE_10 | BANK(denali->flash_bank);
 
 	/* DMA is a four step process */
 
 	/* 1. setup transfer type and # of pages */
-	index_addr(denali, mode | denali->page, 0x2000 | op | page_count);
+	index_addr(denali, mode | page, 0x2000 | (write << 8) | page_count);
 
 	/* 2. set memory high address bits 23:8 */
-	index_addr(denali, mode | ((addr >> 16) << 8), 0x2200);
+	index_addr(denali, mode | ((dma_addr >> 16) << 8), 0x2200);
 
 	/* 3. set memory low address bits 23:8 */
-	index_addr(denali, mode | ((addr & 0xffff) << 8), 0x2300);
+	index_addr(denali, mode | ((dma_addr & 0xffff) << 8), 0x2300);
 
 	/* 4. interrupt when complete, burst len = 64 bytes */
 	index_addr(denali, mode | 0x14000, 0x2400);
 }
 
-static void denali_setup_dma(struct denali_nand_info *denali, int op)
+static void denali_setup_dma(struct denali_nand_info *denali,
+			     dma_addr_t dma_addr, int page, int write)
 {
 	if (denali->caps & DENALI_CAP_DMA_64BIT)
-		denali_setup_dma64(denali, op);
+		denali_setup_dma64(denali, dma_addr, page, write);
 	else
-		denali_setup_dma32(denali, op);
+		denali_setup_dma32(denali, dma_addr, page, write);
 }
 
-/*
- * writes a page. user specifies type, and this function handles the
- * configuration details.
- */
-static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			const uint8_t *buf, bool raw_xfer)
+static int denali_pio_read(struct denali_nand_info *denali, void *buf,
+			   size_t size, int page, int raw)
 {
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dma_addr_t addr = denali->buf.dma_buf;
-	size_t size = mtd->writesize + mtd->oobsize;
+	uint32_t addr = BANK(denali->flash_bank) | page;
+	uint32_t irq_status, ecc_err_mask;
+
+	/* setup page read request for access type */
+	index_addr(denali, MODE_10 | addr,
+		   raw ? MAIN_SPARE_ACCESS : MAIN_ACCESS);
+
+	iowrite32(MODE_01 | addr, denali->flash_mem);
+
+	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
+		ecc_err_mask = INTR__ECC_UNCOR_ERR;
+	else
+		ecc_err_mask = INTR__ECC_ERR;
+
+	denali_reset_irq(denali);
+
+	read_data_from_flash_mem(denali, buf, size);
+
+	irq_status = denali_wait_for_irq(denali, INTR__PAGE_XFER_INC);
+	if (!(irq_status & INTR__PAGE_XFER_INC))
+		return -EIO;
+
+	if (irq_status & INTR__ERASED_PAGE)
+		memset(buf, 0xff, size);
+
+	return irq_status & ecc_err_mask ? -EBADMSG : 0;
+}
+
+static int denali_pio_write(struct denali_nand_info *denali,
+			    const void *buf, size_t size, int page, int raw)
+{
+	uint32_t addr = BANK(denali->flash_bank) | page;
 	uint32_t irq_status;
-	uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
 
-	/*
-	 * if it is a raw xfer, we want to disable ecc and send the spare area.
-	 * !raw_xfer - enable ecc
-	 * raw_xfer - transfer spare
-	 */
-	setup_ecc_for_xfer(denali, !raw_xfer, raw_xfer);
+	/* setup page read request for access type */
+	index_addr(denali, MODE_10 | addr,
+		   raw ? MAIN_SPARE_ACCESS : MAIN_ACCESS);
+
+	iowrite32(MODE_01 | addr, denali->flash_mem);
+
+	denali_reset_irq(denali);
+
+	write_data_to_flash_mem(denali, buf, size);
+
+	irq_status = denali_wait_for_irq(denali,
+				INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL);
+	if (!(irq_status & INTR__PROGRAM_COMP))
+		return -EIO;
+
+	return 0;
+}
 
-	/* copy buffer into DMA buffer */
-	memcpy(denali->buf.buf, buf, mtd->writesize);
+static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
+			   size_t size, int page, int raw, int write)
+{
+	if (write)
+		return denali_pio_write(denali, buf, size, page, raw);
+	else
+		return denali_pio_read(denali, buf, size, page, raw);
+}
 
-	if (raw_xfer) {
-		/* transfer the data to the spare area */
-		memcpy(denali->buf.buf + mtd->writesize,
-			chip->oob_poi,
-			mtd->oobsize);
+static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
+			   size_t size, int page, int raw, int write)
+{
+	dma_addr_t dma_addr;
+	uint32_t irq_mask, irq_status, ecc_err_mask;
+	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	int ret = 0;
+
+	dma_addr = dma_map_single(denali->dev, buf, size, dir);
+	if (dma_mapping_error(denali->dev, dma_addr)) {
+		dev_dbg(denali->dev, "Failed to DMA-map buffer. Trying PIO.\n");
+		return denali_pio_xfer(denali, buf, size, page, raw, write);
 	}
 
-	dma_sync_single_for_device(denali->dev, addr, size, DMA_TO_DEVICE);
+	if (write) {
+		irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
+		ecc_err_mask = 0;
+	} else if (denali->caps & DENALI_CAP_HW_ECC_FIXUP) {
+		irq_mask = INTR__DMA_CMD_COMP;
+		ecc_err_mask = INTR__ECC_UNCOR_ERR;
+	} else {
+		irq_mask = INTR__DMA_CMD_COMP;
+		ecc_err_mask = INTR__ECC_ERR;
+	}
 
-	clear_interrupts(denali);
 	denali_enable_dma(denali, true);
 
-	denali_setup_dma(denali, DENALI_WRITE);
+	denali_reset_irq(denali);
+	denali_setup_dma(denali, dma_addr, page, write);
 
 	/* wait for operation to complete */
-	irq_status = wait_for_irq(denali, irq_mask);
-
-	if (irq_status == 0) {
-		dev_err(denali->dev, "timeout on write_page (type = %d)\n",
-			raw_xfer);
-		denali->status = NAND_STATUS_FAIL;
-	}
+	irq_status = denali_wait_for_irq(denali, irq_mask);
+	if (!(irq_status & INTR__DMA_CMD_COMP))
+		ret = -EIO;
+	else if (irq_status & ecc_err_mask)
+		ret = -EBADMSG;
 
 	denali_enable_dma(denali, false);
-	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_TO_DEVICE);
+	dma_unmap_single(denali->dev, dma_addr, size, dir);
 
-	return 0;
-}
+	if (irq_status & INTR__ERASED_PAGE)
+		memset(buf, 0xff, size);
 
-/* NAND core entry points */
+	return ret;
+}
 
-/*
- * this is the callback that the NAND core calls to write a page. Since
- * writing a page with ECC or without is similar, all the work is done
- * by write_page above.
- */
-static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-				const uint8_t *buf, int oob_required, int page)
+static int denali_data_xfer(struct denali_nand_info *denali, void *buf,
+			    size_t size, int page, int raw, int write)
 {
-	/*
-	 * for regular page writes, we let HW handle all the ECC
-	 * data written to the device.
-	 */
-	return write_page(mtd, chip, buf, false);
+	setup_ecc_for_xfer(denali, !raw, raw);
+
+	if (denali->dma_avail)
+		return denali_dma_xfer(denali, buf, size, page, raw, write);
+	else
+		return denali_pio_xfer(denali, buf, size, page, raw, write);
 }
 
-/*
- * This is the callback that the NAND core calls to write a page without ECC.
- * raw access is similar to ECC page writes, so all the work is done in the
- * write_page() function above.
- */
-static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				 const uint8_t *buf, int oob_required,
-				 int page)
+static void denali_oob_xfer(struct mtd_info *mtd, struct nand_chip *chip,
+			    int page, int write)
 {
-	/*
-	 * for raw page writes, we want to disable ECC and simply write
-	 * whatever data is in the buffer.
-	 */
-	return write_page(mtd, chip, buf, true);
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	unsigned int start_cmd = write ? NAND_CMD_SEQIN : NAND_CMD_READ0;
+	unsigned int rnd_cmd = write ? NAND_CMD_RNDIN : NAND_CMD_RNDOUT;
+	int writesize = mtd->writesize;
+	int oobsize = mtd->oobsize;
+	uint8_t *bufpoi = chip->oob_poi;
+	int ecc_steps = chip->ecc.steps;
+	int ecc_size = chip->ecc.size;
+	int ecc_bytes = chip->ecc.bytes;
+	int bbm_skip = denali->bbtskipbytes;
+	size_t size = writesize + oobsize;
+	int i, pos, len;
+
+	/* BBM at the beginning of the OOB area */
+	chip->cmdfunc(mtd, start_cmd, writesize, page);
+	if (write)
+		chip->write_buf(mtd, bufpoi, bbm_skip);
+	else
+		chip->read_buf(mtd, bufpoi, bbm_skip);
+	bufpoi += bbm_skip;
+
+	/* OOB ECC */
+	for (i = 0; i < ecc_steps; i++) {
+		pos = ecc_size + i * (ecc_size + ecc_bytes);
+		len = ecc_bytes;
+
+		if (pos >= writesize)
+			pos += bbm_skip;
+		else if (pos + len > writesize)
+			len = writesize - pos;
+
+		chip->cmdfunc(mtd, rnd_cmd, pos, -1);
+		if (write)
+			chip->write_buf(mtd, bufpoi, len);
+		else
+			chip->read_buf(mtd, bufpoi, len);
+		bufpoi += len;
+		if (len < ecc_bytes) {
+			len = ecc_bytes - len;
+			chip->cmdfunc(mtd, rnd_cmd, writesize + bbm_skip, -1);
+			if (write)
+				chip->write_buf(mtd, bufpoi, len);
+			else
+				chip->read_buf(mtd, bufpoi, len);
+			bufpoi += len;
+		}
+	}
+
+	/* OOB free */
+	len = oobsize - (bufpoi - chip->oob_poi);
+	chip->cmdfunc(mtd, rnd_cmd, size - len, -1);
+	if (write)
+		chip->write_buf(mtd, bufpoi, len);
+	else
+		chip->read_buf(mtd, bufpoi, len);
 }
 
-static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
-			    int page)
+static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+				uint8_t *buf, int oob_required, int page)
 {
-	return write_oob_data(mtd, chip->oob_poi, page);
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	int writesize = mtd->writesize;
+	int oobsize = mtd->oobsize;
+	int ecc_steps = chip->ecc.steps;
+	int ecc_size = chip->ecc.size;
+	int ecc_bytes = chip->ecc.bytes;
+	void *dma_buf = denali->buf;
+	int bbm_skip = denali->bbtskipbytes;
+	size_t size = writesize + oobsize;
+	int ret, i, pos, len;
+
+	ret = denali_data_xfer(denali, dma_buf, size, page, 1, 0);
+	if (ret)
+		return ret;
+
+	/* Arrange the buffer for syndrome payload/ecc layout */
+	if (buf) {
+		for (i = 0; i < ecc_steps; i++) {
+			pos = i * (ecc_size + ecc_bytes);
+			len = ecc_size;
+
+			if (pos >= writesize)
+				pos += bbm_skip;
+			else if (pos + len > writesize)
+				len = writesize - pos;
+
+			memcpy(buf, dma_buf + pos, len);
+			buf += len;
+			if (len < ecc_size) {
+				len = ecc_size - len;
+				memcpy(buf, dma_buf + writesize + bbm_skip,
+				       len);
+				buf += len;
+			}
+		}
+	}
+
+	if (oob_required) {
+		uint8_t *oob = chip->oob_poi;
+
+		/* BBM at the beginning of the OOB area */
+		memcpy(oob, dma_buf + writesize, bbm_skip);
+		oob += bbm_skip;
+
+		/* OOB ECC */
+		for (i = 0; i < ecc_steps; i++) {
+			pos = ecc_size + i * (ecc_size + ecc_bytes);
+			len = ecc_bytes;
+
+			if (pos >= writesize)
+				pos += bbm_skip;
+			else if (pos + len > writesize)
+				len = writesize - pos;
+
+			memcpy(oob, dma_buf + pos, len);
+			oob += len;
+			if (len < ecc_bytes) {
+				len = ecc_bytes - len;
+				memcpy(oob, dma_buf + writesize + bbm_skip,
+				       len);
+				oob += len;
+			}
+		}
+
+		/* OOB free */
+		len = oobsize - (oob - chip->oob_poi);
+		memcpy(oob, dma_buf + size - len, len);
+	}
+
+	return 0;
 }
 
 static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page)
 {
-	read_oob_data(mtd, chip->oob_poi, page);
+	denali_oob_xfer(mtd, chip, page, 0);
 
 	return 0;
 }
 
-static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-			    uint8_t *buf, int oob_required, int page)
+static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
+			    int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dma_addr_t addr = denali->buf.dma_buf;
-	size_t size = mtd->writesize + mtd->oobsize;
-	uint32_t irq_status;
-	uint32_t irq_mask = denali->caps & DENALI_CAP_HW_ECC_FIXUP ?
-				INTR__DMA_CMD_COMP | INTR__ECC_UNCOR_ERR :
-				INTR__ECC_TRANSACTION_DONE | INTR__ECC_ERR;
-	unsigned long uncor_ecc_flags = 0;
-	int stat = 0;
-
-	if (page != denali->page) {
-		dev_err(denali->dev,
-			"IN %s: page %d is not equal to denali->page %d",
-			__func__, page, denali->page);
-		BUG();
-	}
+	int status;
 
-	setup_ecc_for_xfer(denali, true, false);
+	denali_reset_irq(denali);
 
-	denali_enable_dma(denali, true);
-	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
+	denali_oob_xfer(mtd, chip, page, 1);
 
-	clear_interrupts(denali);
-	denali_setup_dma(denali, DENALI_READ);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	status = chip->waitfunc(mtd, chip);
 
-	/* wait for operation to complete */
-	irq_status = wait_for_irq(denali, irq_mask);
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
+}
 
-	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
+static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
+			    uint8_t *buf, int oob_required, int page)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	unsigned long uncor_ecc_flags = 0;
+	int stat = 0;
+	int ret;
 
-	memcpy(buf, denali->buf.buf, mtd->writesize);
+	ret = denali_data_xfer(denali, buf, mtd->writesize, page, 0, 0);
+	if (ret && ret != -EBADMSG)
+		return ret;
 
 	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
 		stat = denali_hw_ecc_fixup(mtd, denali, &uncor_ecc_flags);
-	else if (irq_status & INTR__ECC_ERR)
+	else if (ret == -EBADMSG)
 		stat = denali_sw_ecc_fixup(mtd, denali, &uncor_ecc_flags, buf);
-	denali_enable_dma(denali, false);
 
 	if (stat < 0)
 		return stat;
 
 	if (uncor_ecc_flags) {
-		read_oob_data(mtd, chip->oob_poi, denali->page);
+		ret = denali_read_oob(mtd, chip, page);
+		if (ret)
+			return ret;
 
 		stat = denali_check_erased_page(mtd, chip, buf,
 						uncor_ecc_flags, stat);
@@ -1181,137 +892,268 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return stat;
 }
 
-static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int oob_required, int page)
+static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+				 const uint8_t *buf, int oob_required, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dma_addr_t addr = denali->buf.dma_buf;
-	size_t size = mtd->writesize + mtd->oobsize;
-	uint32_t irq_mask = INTR__DMA_CMD_COMP;
-
-	if (page != denali->page) {
-		dev_err(denali->dev,
-			"IN %s: page %d is not equal to denali->page %d",
-			__func__, page, denali->page);
-		BUG();
-	}
-
-	setup_ecc_for_xfer(denali, false, true);
-	denali_enable_dma(denali, true);
-
-	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
-
-	clear_interrupts(denali);
-	denali_setup_dma(denali, DENALI_READ);
-
-	/* wait for operation to complete */
-	wait_for_irq(denali, irq_mask);
+	int writesize = mtd->writesize;
+	int oobsize = mtd->oobsize;
+	int ecc_steps = chip->ecc.steps;
+	int ecc_size = chip->ecc.size;
+	int ecc_bytes = chip->ecc.bytes;
+	void *dma_buf = denali->buf;
+	int bbm_skip = denali->bbtskipbytes;
+	size_t size = writesize + oobsize;
+	int i, pos, len;
 
-	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
+	/*
+	 * Fill the buffer with 0xff first except the full page transfer.
+	 * This simplifies the logic.
+	 */
+	if (!buf || !oob_required)
+		memset(dma_buf, 0xff, size);
+
+	/* Arrange the buffer for syndrome payload/ecc layout */
+	if (buf) {
+		for (i = 0; i < ecc_steps; i++) {
+			pos = i * (ecc_size + ecc_bytes);
+			len = ecc_size;
+
+			if (pos >= writesize)
+				pos += bbm_skip;
+			else if (pos + len > writesize)
+				len = writesize - pos;
+
+			memcpy(dma_buf + pos, buf, len);
+			buf += len;
+			if (len < ecc_size) {
+				len = ecc_size - len;
+				memcpy(dma_buf + writesize + bbm_skip, buf,
+				       len);
+				buf += len;
+			}
+		}
+	}
 
-	denali_enable_dma(denali, false);
+	if (oob_required) {
+		const uint8_t *oob = chip->oob_poi;
+
+		/* BBM at the beginning of the OOB area */
+		memcpy(dma_buf + writesize, oob, bbm_skip);
+		oob += bbm_skip;
+
+		/* OOB ECC */
+		for (i = 0; i < ecc_steps; i++) {
+			pos = ecc_size + i * (ecc_size + ecc_bytes);
+			len = ecc_bytes;
+
+			if (pos >= writesize)
+				pos += bbm_skip;
+			else if (pos + len > writesize)
+				len = writesize - pos;
+
+			memcpy(dma_buf + pos, oob, len);
+			oob += len;
+			if (len < ecc_bytes) {
+				len = ecc_bytes - len;
+				memcpy(dma_buf + writesize + bbm_skip, oob,
+				       len);
+				oob += len;
+			}
+		}
 
-	memcpy(buf, denali->buf.buf, mtd->writesize);
-	memcpy(chip->oob_poi, denali->buf.buf + mtd->writesize, mtd->oobsize);
+		/* OOB free */
+		len = oobsize - (oob - chip->oob_poi);
+		memcpy(dma_buf + size - len, oob, len);
+	}
 
-	return 0;
+	return denali_data_xfer(denali, dma_buf, size, page, 1, 1);
 }
 
-static uint8_t denali_read_byte(struct mtd_info *mtd)
+static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+			     const uint8_t *buf, int oob_required, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint8_t result = 0xff;
 
-	if (denali->buf.head < denali->buf.tail)
-		result = denali->buf.buf[denali->buf.head++];
-
-	return result;
+	return denali_data_xfer(denali, (void *)buf, mtd->writesize,
+				page, 0, 1);
 }
 
 static void denali_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	spin_lock_irq(&denali->irq_lock);
 	denali->flash_bank = chip;
-	spin_unlock_irq(&denali->irq_lock);
 }
 
 static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	int status = denali->status;
+	uint32_t irq_status;
 
-	denali->status = 0;
+	/* R/B# pin transitioned from low to high? */
+	irq_status = denali_wait_for_irq(denali, INTR__INT_ACT);
 
-	return status;
+	return irq_status & INTR__INT_ACT ? 0 : NAND_STATUS_FAIL;
 }
 
 static int denali_erase(struct mtd_info *mtd, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-
 	uint32_t cmd, irq_status;
 
-	clear_interrupts(denali);
+	denali_reset_irq(denali);
 
 	/* setup page read request for access type */
 	cmd = MODE_10 | BANK(denali->flash_bank) | page;
 	index_addr(denali, cmd, 0x1);
 
 	/* wait for erase to complete or failure to occur */
-	irq_status = wait_for_irq(denali, INTR__ERASE_COMP | INTR__ERASE_FAIL);
+	irq_status = denali_wait_for_irq(denali,
+					 INTR__ERASE_COMP | INTR__ERASE_FAIL);
 
-	return irq_status & INTR__ERASE_FAIL ? NAND_STATUS_FAIL : PASS;
+	return irq_status & INTR__ERASE_COMP ? 0 : NAND_STATUS_FAIL;
 }
 
-static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
-			   int page)
+#define DIV_ROUND_DOWN_ULL(ll, d) \
+	({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
+
+static int denali_setup_data_interface(struct mtd_info *mtd,
+				       const struct nand_data_interface *conf,
+				       bool check_only)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t addr, id;
+	const struct nand_sdr_timings *timings;
+	unsigned long t_clk;
+	int acc_clks, re_2_we, re_2_re, we_2_re, addr_2_data;
+	int rdwr_en_lo, rdwr_en_hi, rdwr_en_lo_hi, cs_setup;
+	int addr_2_data_mask;
+	uint32_t tmp;
+
+	timings = nand_get_sdr_timings(conf);
+	if (IS_ERR(timings))
+		return PTR_ERR(timings);
+
+	/* clk_x period in picoseconds */
+	t_clk = DIV_ROUND_DOWN_ULL(1000000000000ULL, denali->clk_x_rate);
+	if (!t_clk)
+		return -EINVAL;
+
+	if (check_only)
+		return 0;
+
+	/* tREA -> ACC_CLKS */
+	acc_clks = DIV_ROUND_UP(timings->tREA_max, t_clk);
+	acc_clks = min_t(int, acc_clks, ACC_CLKS__VALUE);
+
+	tmp = ioread32(denali->flash_reg + ACC_CLKS);
+	tmp &= ~ACC_CLKS__VALUE;
+	tmp |= acc_clks;
+	iowrite32(tmp, denali->flash_reg + ACC_CLKS);
+
+	/* tRWH -> RE_2_WE */
+	re_2_we = DIV_ROUND_UP(timings->tRHW_min, t_clk);
+	re_2_we = min_t(int, re_2_we, RE_2_WE__VALUE);
+
+	tmp = ioread32(denali->flash_reg + RE_2_WE);
+	tmp &= ~RE_2_WE__VALUE;
+	tmp |= re_2_we;
+	iowrite32(tmp, denali->flash_reg + RE_2_WE);
+
+	/* tRHZ -> RE_2_RE */
+	re_2_re = DIV_ROUND_UP(timings->tRHZ_max, t_clk);
+	re_2_re = min_t(int, re_2_re, RE_2_RE__VALUE);
+
+	tmp = ioread32(denali->flash_reg + RE_2_RE);
+	tmp &= ~RE_2_RE__VALUE;
+	tmp |= re_2_re;
+	iowrite32(tmp, denali->flash_reg + RE_2_RE);
+
+	/* tWHR -> WE_2_RE */
+	we_2_re = DIV_ROUND_UP(timings->tWHR_min, t_clk);
+	we_2_re = min_t(int, we_2_re, TWHR2_AND_WE_2_RE__WE_2_RE);
+
+	tmp = ioread32(denali->flash_reg + TWHR2_AND_WE_2_RE);
+	tmp &= ~TWHR2_AND_WE_2_RE__WE_2_RE;
+	tmp |= we_2_re;
+	iowrite32(tmp, denali->flash_reg + TWHR2_AND_WE_2_RE);
+
+	/* tADL -> ADDR_2_DATA */
+
+	/* for older versions, ADDR_2_DATA is only 6 bit wide */
+	addr_2_data_mask = TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA;
+	if (denali->revision < 0x0501)
+		addr_2_data_mask >>= 1;
+
+	addr_2_data = DIV_ROUND_UP(timings->tADL_min, t_clk);
+	addr_2_data = min_t(int, addr_2_data, addr_2_data_mask);
+
+	tmp = ioread32(denali->flash_reg + TCWAW_AND_ADDR_2_DATA);
+	tmp &= ~addr_2_data_mask;
+	tmp |= addr_2_data;
+	iowrite32(tmp, denali->flash_reg + TCWAW_AND_ADDR_2_DATA);
+
+	/* tREH, tWH -> RDWR_EN_HI_CNT */
+	rdwr_en_hi = DIV_ROUND_UP(max(timings->tREH_min, timings->tWH_min),
+				  t_clk);
+	rdwr_en_hi = min_t(int, rdwr_en_hi, RDWR_EN_HI_CNT__VALUE);
+
+	tmp = ioread32(denali->flash_reg + RDWR_EN_HI_CNT);
+	tmp &= ~RDWR_EN_HI_CNT__VALUE;
+	tmp |= rdwr_en_hi;
+	iowrite32(tmp, denali->flash_reg + RDWR_EN_HI_CNT);
+
+	/* tRP, tWP -> RDWR_EN_LO_CNT */
+	rdwr_en_lo = DIV_ROUND_UP(max(timings->tRP_min, timings->tWP_min),
+				  t_clk);
+	rdwr_en_lo_hi = DIV_ROUND_UP(max(timings->tRC_min, timings->tWC_min),
+				     t_clk);
+	rdwr_en_lo_hi = max(rdwr_en_lo_hi, DENALI_CLK_X_MULT);
+	rdwr_en_lo = max(rdwr_en_lo, rdwr_en_lo_hi - rdwr_en_hi);
+	rdwr_en_lo = min_t(int, rdwr_en_lo, RDWR_EN_LO_CNT__VALUE);
+
+	tmp = ioread32(denali->flash_reg + RDWR_EN_LO_CNT);
+	tmp &= ~RDWR_EN_LO_CNT__VALUE;
+	tmp |= rdwr_en_lo;
+	iowrite32(tmp, denali->flash_reg + RDWR_EN_LO_CNT);
+
+	/* tCS, tCEA -> CS_SETUP_CNT */
+	cs_setup = max3((int)DIV_ROUND_UP(timings->tCS_min, t_clk) - rdwr_en_lo,
+			(int)DIV_ROUND_UP(timings->tCEA_max, t_clk) - acc_clks,
+			0);
+	cs_setup = min_t(int, cs_setup, CS_SETUP_CNT__VALUE);
+
+	tmp = ioread32(denali->flash_reg + CS_SETUP_CNT);
+	tmp &= ~CS_SETUP_CNT__VALUE;
+	tmp |= cs_setup;
+	iowrite32(tmp, denali->flash_reg + CS_SETUP_CNT);
+
+	return 0;
+}
+
+static void denali_reset_banks(struct denali_nand_info *denali)
+{
+	u32 irq_status;
 	int i;
 
-	switch (cmd) {
-	case NAND_CMD_PAGEPROG:
-		break;
-	case NAND_CMD_STATUS:
-		read_status(denali);
-		break;
-	case NAND_CMD_READID:
-	case NAND_CMD_PARAM:
-		reset_buf(denali);
-		/*
-		 * sometimes ManufactureId read from register is not right
-		 * e.g. some of Micron MT29F32G08QAA MLC NAND chips
-		 * So here we send READID cmd to NAND insteand
-		 */
-		addr = MODE_11 | BANK(denali->flash_bank);
-		index_addr(denali, addr | 0, 0x90);
-		index_addr(denali, addr | 1, col);
-		for (i = 0; i < 8; i++) {
-			index_addr_read_data(denali, addr | 2, &id);
-			write_byte_to_buf(denali, id);
-		}
-		break;
-	case NAND_CMD_READ0:
-	case NAND_CMD_SEQIN:
-		denali->page = page;
-		break;
-	case NAND_CMD_RESET:
-		reset_bank(denali);
-		break;
-	case NAND_CMD_READOOB:
-		/* TODO: Read OOB data */
-		break;
-	default:
-		pr_err(": unsupported command received 0x%x\n", cmd);
-		break;
+	for (i = 0; i < denali->max_banks; i++) {
+		denali->flash_bank = i;
+
+		denali_reset_irq(denali);
+
+		iowrite32(DEVICE_RESET__BANK(i),
+			  denali->flash_reg + DEVICE_RESET);
+
+		irq_status = denali_wait_for_irq(denali,
+			INTR__RST_COMP | INTR__INT_ACT | INTR__TIME_OUT);
+		if (!(irq_status & INTR__INT_ACT))
+			break;
 	}
+
+	dev_dbg(denali->dev, "%d chips connected\n", i);
+	denali->max_banks = i;
 }
-/* end NAND core entry points */
 
-/* Initialization code to bring the device up to a known good state */
 static void denali_hw_init(struct denali_nand_info *denali)
 {
 	/*
@@ -1331,7 +1173,6 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	denali->bbtskipbytes = ioread32(denali->flash_reg +
 						SPARE_AREA_SKIP_BYTES);
 	detect_max_banks(denali);
-	denali_nand_reset(denali);
 	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG,
 			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
@@ -1341,17 +1182,25 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	/* Should set value for these registers when init */
 	iowrite32(0, denali->flash_reg + TWO_ROW_ADDR_CYCLES);
 	iowrite32(1, denali->flash_reg + ECC_ENABLE);
-	denali_nand_timing_set(denali);
-	denali_irq_init(denali);
 }
 
-/*
- * Althogh controller spec said SLC ECC is forceb to be 4bit,
- * but denali controller in MRST only support 15bit and 8bit ECC
- * correction
- */
-#define ECC_8BITS	14
-#define ECC_15BITS	26
+static int denali_calc_ecc_bytes(const struct nand_ecc_setting *setting)
+{
+	int coef;
+
+	switch (setting->step) {
+	case 512:
+		coef = 13;
+		break;
+	case 1024:
+		coef = 14;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	return DIV_ROUND_UP(setting->strength * coef, 16) * 2;
+}
 
 static int denali_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
@@ -1388,29 +1237,6 @@ static const struct mtd_ooblayout_ops denali_ooblayout_ops = {
 	.free = denali_ooblayout_free,
 };
 
-static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
-static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
-
-static struct nand_bbt_descr bbt_main_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
-	.offs =	8,
-	.len = 4,
-	.veroffs = 12,
-	.maxblocks = 4,
-	.pattern = bbt_pattern,
-};
-
-static struct nand_bbt_descr bbt_mirror_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
-	.offs =	8,
-	.len = 4,
-	.veroffs = 12,
-	.maxblocks = 4,
-	.pattern = mirror_pattern,
-};
-
 /* initialize driver data structures */
 static void denali_drv_init(struct denali_nand_info *denali)
 {
@@ -1425,12 +1251,6 @@ static void denali_drv_init(struct denali_nand_info *denali)
 	 * element that might be access shared data (interrupt status)
 	 */
 	spin_lock_init(&denali->irq_lock);
-
-	/* indicate that MTD has not selected a valid bank yet */
-	denali->flash_bank = CHIP_SELECT_INVALID;
-
-	/* initialize our irq_status variable to indicate no interrupts */
-	denali->irq_status = 0;
 }
 
 static int denali_multidev_fixup(struct denali_nand_info *denali)
@@ -1488,29 +1308,15 @@ int denali_init(struct denali_nand_info *denali)
 {
 	struct nand_chip *chip = &denali->nand;
 	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_ecc_engine_caps ecc_engine_caps;
 	int ret;
 
-	if (denali->platform == INTEL_CE4100) {
-		/*
-		 * Due to a silicon limitation, we can only support
-		 * ONFI timing mode 1 and below.
-		 */
-		if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
-			pr_err("Intel CE4100 only supports ONFI timing mode 1 or below\n");
-			return -EINVAL;
-		}
-	}
-
-	/* allocate a temporary buffer for nand_scan_ident() */
-	denali->buf.buf = devm_kzalloc(denali->dev, PAGE_SIZE,
-					GFP_DMA | GFP_KERNEL);
-	if (!denali->buf.buf)
-		return -ENOMEM;
-
 	mtd->dev.parent = denali->dev;
 	denali_hw_init(denali);
 	denali_drv_init(denali);
 
+	denali_clear_irq_all(denali);
+
 	/* Request IRQ after all the hardware initialization is finished */
 	ret = devm_request_irq(denali->dev, denali->irq, denali_isr,
 			       IRQF_SHARED, DENALI_NAND_NAME, denali);
@@ -1519,8 +1325,11 @@ int denali_init(struct denali_nand_info *denali)
 		return ret;
 	}
 
-	/* now that our ISR is registered, we can enable interrupts */
-	denali_set_intr_modes(denali, true);
+	denali_enable_irq(denali);
+	denali_reset_banks(denali);
+
+	denali->flash_bank = CHIP_SELECT_INVALID;
+
 	nand_set_flash_node(chip, denali->dev->of_node);
 	/* Fallback to the default name if DT did not give "label" property */
 	if (!mtd->name)
@@ -1528,9 +1337,14 @@ int denali_init(struct denali_nand_info *denali)
 
 	/* register the driver with the NAND core subsystem */
 	chip->select_chip = denali_select_chip;
-	chip->cmdfunc = denali_cmdfunc;
 	chip->read_byte = denali_read_byte;
+	chip->write_byte = denali_write_byte;
+	chip->cmd_ctrl = denali_cmd_ctrl;
+	chip->dev_ready = denali_dev_ready;
 	chip->waitfunc = denali_waitfunc;
+	/* clk rate info is needed for setup_data_interface */
+	if (denali->clk_x_rate)
+		chip->setup_data_interface = denali_setup_data_interface;
 
 	/*
 	 * scan for NAND devices attached to the controller
@@ -1539,33 +1353,24 @@ int denali_init(struct denali_nand_info *denali)
 	 */
 	ret = nand_scan_ident(mtd, denali->max_banks, NULL);
 	if (ret)
-		goto failed_req_irq;
-
-	/* allocate the right size buffer now */
-	devm_kfree(denali->dev, denali->buf.buf);
-	denali->buf.buf = devm_kzalloc(denali->dev,
-			     mtd->writesize + mtd->oobsize,
-			     GFP_KERNEL);
-	if (!denali->buf.buf) {
-		ret = -ENOMEM;
-		goto failed_req_irq;
-	}
+		goto disable_irq;
 
-	ret = dma_set_mask(denali->dev,
-			   DMA_BIT_MASK(denali->caps & DENALI_CAP_DMA_64BIT ?
-					64 : 32));
-	if (ret) {
-		dev_err(denali->dev, "No usable DMA configuration\n");
-		goto failed_req_irq;
+	if (ioread32(denali->flash_reg + FEATURES) & FEATURES__DMA)
+		denali->dma_avail = 1;
+
+	if (denali->dma_avail) {
+		int dma_bit = denali->caps & DENALI_CAP_DMA_64BIT ? 64 : 32;
+
+		ret = dma_set_mask(denali->dev, DMA_BIT_MASK(dma_bit));
+		if (ret) {
+			dev_info(denali->dev, "Failed to set DMA mask. Disabling DMA.\n");
+			denali->dma_avail = 0;
+		}
 	}
 
-	denali->buf.dma_buf = dma_map_single(denali->dev, denali->buf.buf,
-			     mtd->writesize + mtd->oobsize,
-			     DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(denali->dev, denali->buf.dma_buf)) {
-		dev_err(denali->dev, "Failed to map DMA buffer\n");
-		ret = -EIO;
-		goto failed_req_irq;
+	if (denali->dma_avail) {
+		chip->options |= NAND_USE_BOUNCE_BUFFER;
+		chip->buf_align = 16;
 	}
 
 	/*
@@ -1574,46 +1379,74 @@ int denali_init(struct denali_nand_info *denali)
 	 * bad block management.
 	 */
 
-	/* Bad block management */
-	chip->bbt_td = &bbt_main_descr;
-	chip->bbt_md = &bbt_mirror_descr;
-
-	/* skip the scan for now until we have OOB read and write support */
 	chip->bbt_options |= NAND_BBT_USE_FLASH;
-	chip->options |= NAND_SKIP_BBTSCAN;
+	chip->bbt_options |= NAND_BBT_NO_OOB;
+
 	chip->ecc.mode = NAND_ECC_HW_SYNDROME;
 
 	/* no subpage writes on denali */
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
+	ecc_engine_caps.ecc_settings = denali->avail_ecc_settings;
+	ecc_engine_caps.calc_ecc_bytes = denali_calc_ecc_bytes;
+	ecc_engine_caps.avail_oobsize = mtd->oobsize - denali->bbtskipbytes;
+
+	ret = -ENOTSUPP;
+
+	/* If both .size and .strength are set (by DT), we check if supported */
+	ret = nand_check_ecc_caps(mtd, chip, &ecc_engine_caps);
+	if (ret && ret != -ENODATA)
+		dev_info(denali->dev, "try to find other ECC settings\n");
+
 	/*
-	 * Denali Controller only support 15bit and 8bit ECC in MRST,
-	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
-	 * SLC if possible.
-	 * */
-	if (!nand_is_slc(chip) &&
-			(mtd->oobsize > (denali->bbtskipbytes +
-			ECC_15BITS * (mtd->writesize /
-			ECC_SECTOR_SIZE)))) {
-		/* if MLC OOB size is large enough, use 15bit ECC*/
-		chip->ecc.strength = 15;
-		chip->ecc.bytes = ECC_15BITS;
-		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
-	} else if (mtd->oobsize < (denali->bbtskipbytes +
-			ECC_8BITS * (mtd->writesize /
-			ECC_SECTOR_SIZE))) {
-		pr_err("Your NAND chip OOB is not large enough to contain 8bit ECC correction codes");
-		goto failed_req_irq;
-	} else {
-		chip->ecc.strength = 8;
-		chip->ecc.bytes = ECC_8BITS;
-		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
+	 * We want .size and .strength closest to the chip's requirement
+	 * unless NAND_ECC_MAXIMIZE is requested.
+	 */
+	if (ret && !(chip->ecc.options & NAND_ECC_MAXIMIZE)) {
+		ret = nand_try_to_match_ecc_req(mtd, chip, &ecc_engine_caps);
+		if (ret)
+			dev_info(denali->dev, "try to maximize ECC setting\n");
 	}
 
+	/* The last thing we can do is to try the max ECC strength */
+	if (ret)
+		ret = nand_try_to_maximize_ecc(mtd, chip, &ecc_engine_caps);
+
+	if (ret) {
+		dev_err(denali->dev, "failed to choose ECC size/strength\n");
+		goto disable_irq;
+	}
+
+	dev_dbg(denali->dev,
+		"chosen ECC settings: step=%d, strength=%d, bytes=%d\n",
+		chip->ecc.size, chip->ecc.strength, chip->ecc.bytes);
+
+	iowrite32(MAKE_ECC_CORRECTION(chip->ecc.strength,
+				      chip->ecc.strength + 1),
+		  denali->flash_reg + ECC_CORRECTION);
+	iowrite32(mtd->erasesize / mtd->writesize,
+		  denali->flash_reg + PAGES_PER_BLOCK);
+	iowrite32(denali->nand.options & NAND_BUSWIDTH_16 ? 1 : 0,
+		  denali->flash_reg + DEVICE_WIDTH);
+	iowrite32(mtd->writesize, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
+	iowrite32(mtd->oobsize, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
+
+	iowrite32(chip->ecc.size, denali->flash_reg + CFG_DATA_BLOCK_SIZE);
+	iowrite32(chip->ecc.size, denali->flash_reg + CFG_LAST_DATA_BLOCK_SIZE);
+	/* chip->ecc.steps is set by nand_scan_tail(); not available here */
+	iowrite32(mtd->writesize / chip->ecc.size,
+		  denali->flash_reg + CFG_NUM_DATA_BLOCKS);
+
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
 
-	/* override the default read operations */
-	chip->ecc.size = ECC_SECTOR_SIZE;
+	if (denali->nand.options & NAND_BUSWIDTH_16) {
+		chip->read_buf = denali_read_buf16;
+		chip->write_buf = denali_write_buf16;
+	} else {
+		chip->read_buf = denali_read_buf;
+		chip->write_buf = denali_write_buf;
+	}
+	chip->ecc.options |= NAND_ECC_CUSTOM_PAGE_ACCESS;
 	chip->ecc.read_page = denali_read_page;
 	chip->ecc.read_page_raw = denali_read_page_raw;
 	chip->ecc.write_page = denali_write_page;
@@ -1624,21 +1457,34 @@ int denali_init(struct denali_nand_info *denali)
 
 	ret = denali_multidev_fixup(denali);
 	if (ret)
-		goto failed_req_irq;
+		goto disable_irq;
+
+	/*
+	 * This buffer is DMA-mapped by denali_{read,write}_page_raw.  Do not
+	 * use devm_kmalloc() because the memory allocated by devm_ does not
+	 * guarantee DMA-safe alignment.
+	 */
+	denali->buf = kmalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
+	if (!denali->buf) {
+		ret = -ENOMEM;
+		goto disable_irq;
+	}
 
 	ret = nand_scan_tail(mtd);
 	if (ret)
-		goto failed_req_irq;
+		goto free_buf;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
-		goto failed_req_irq;
+		goto free_buf;
 	}
 	return 0;
 
-failed_req_irq:
-	denali_irq_cleanup(denali->irq, denali);
+free_buf:
+	kfree(denali->buf);
+disable_irq:
+	denali_disable_irq(denali);
 
 	return ret;
 }
@@ -1656,8 +1502,9 @@ void denali_remove(struct denali_nand_info *denali)
 	int bufsize = mtd->writesize + mtd->oobsize;
 
 	nand_release(mtd);
-	denali_irq_cleanup(denali->irq, denali);
-	dma_unmap_single(denali->dev, denali->buf.dma_buf, bufsize,
+	kfree(denali->buf);
+	denali_disable_irq(denali);
+	dma_unmap_single(denali->dev, denali->dma_addr, bufsize,
 			 DMA_BIDIRECTIONAL);
 }
 EXPORT_SYMBOL(denali_remove);
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index ec00485..46406c6 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -24,325 +24,318 @@
 #include <linux/mtd/nand.h>
 
 #define DEVICE_RESET				0x0
-#define     DEVICE_RESET__BANK0				0x0001
-#define     DEVICE_RESET__BANK1				0x0002
-#define     DEVICE_RESET__BANK2				0x0004
-#define     DEVICE_RESET__BANK3				0x0008
+#define     DEVICE_RESET__BANK(bank)			BIT(bank)
 
 #define TRANSFER_SPARE_REG			0x10
-#define     TRANSFER_SPARE_REG__FLAG			0x0001
+#define     TRANSFER_SPARE_REG__FLAG			BIT(0)
 
 #define LOAD_WAIT_CNT				0x20
-#define     LOAD_WAIT_CNT__VALUE			0xffff
+#define     LOAD_WAIT_CNT__VALUE			GENMASK(15, 0)
 
 #define PROGRAM_WAIT_CNT			0x30
-#define     PROGRAM_WAIT_CNT__VALUE			0xffff
+#define     PROGRAM_WAIT_CNT__VALUE			GENMASK(15, 0)
 
 #define ERASE_WAIT_CNT				0x40
-#define     ERASE_WAIT_CNT__VALUE			0xffff
+#define     ERASE_WAIT_CNT__VALUE			GENMASK(15, 0)
 
 #define INT_MON_CYCCNT				0x50
-#define     INT_MON_CYCCNT__VALUE			0xffff
+#define     INT_MON_CYCCNT__VALUE			GENMASK(15, 0)
 
 #define RB_PIN_ENABLED				0x60
-#define     RB_PIN_ENABLED__BANK0			0x0001
-#define     RB_PIN_ENABLED__BANK1			0x0002
-#define     RB_PIN_ENABLED__BANK2			0x0004
-#define     RB_PIN_ENABLED__BANK3			0x0008
+#define     RB_PIN_ENABLED__BANK(bank)			BIT(bank)
 
 #define MULTIPLANE_OPERATION			0x70
-#define     MULTIPLANE_OPERATION__FLAG			0x0001
+#define     MULTIPLANE_OPERATION__FLAG			BIT(0)
 
 #define MULTIPLANE_READ_ENABLE			0x80
-#define     MULTIPLANE_READ_ENABLE__FLAG		0x0001
+#define     MULTIPLANE_READ_ENABLE__FLAG		BIT(0)
 
 #define COPYBACK_DISABLE			0x90
-#define     COPYBACK_DISABLE__FLAG			0x0001
+#define     COPYBACK_DISABLE__FLAG			BIT(0)
 
 #define CACHE_WRITE_ENABLE			0xa0
-#define     CACHE_WRITE_ENABLE__FLAG			0x0001
+#define     CACHE_WRITE_ENABLE__FLAG			BIT(0)
 
 #define CACHE_READ_ENABLE			0xb0
-#define     CACHE_READ_ENABLE__FLAG			0x0001
+#define     CACHE_READ_ENABLE__FLAG			BIT(0)
 
 #define PREFETCH_MODE				0xc0
-#define     PREFETCH_MODE__PREFETCH_EN			0x0001
-#define     PREFETCH_MODE__PREFETCH_BURST_LENGTH	0xfff0
+#define     PREFETCH_MODE__PREFETCH_EN			BIT(0)
+#define     PREFETCH_MODE__PREFETCH_BURST_LENGTH	GENMASK(15, 4)
 
 #define CHIP_ENABLE_DONT_CARE			0xd0
-#define     CHIP_EN_DONT_CARE__FLAG			0x01
+#define     CHIP_EN_DONT_CARE__FLAG			BIT(0)
 
 #define ECC_ENABLE				0xe0
-#define     ECC_ENABLE__FLAG				0x0001
+#define     ECC_ENABLE__FLAG				BIT(0)
 
 #define GLOBAL_INT_ENABLE			0xf0
-#define     GLOBAL_INT_EN_FLAG				0x01
+#define     GLOBAL_INT_EN_FLAG				BIT(0)
 
-#define WE_2_RE					0x100
-#define     WE_2_RE__VALUE				0x003f
+#define TWHR2_AND_WE_2_RE			0x100
+#define     TWHR2_AND_WE_2_RE__WE_2_RE			GENMASK(5, 0)
+#define     TWHR2_AND_WE_2_RE__TWHR2			GENMASK(13, 8)
 
-#define ADDR_2_DATA				0x110
-#define     ADDR_2_DATA__VALUE				0x003f
+#define TCWAW_AND_ADDR_2_DATA			0x110
+/* The width of ADDR_2_DATA is 6 bit for old IP, 7 bit for new IP */
+#define     TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA		GENMASK(6, 0)
+#define     TCWAW_AND_ADDR_2_DATA__TCWAW		GENMASK(13, 8)
 
 #define RE_2_WE					0x120
-#define     RE_2_WE__VALUE				0x003f
+#define     RE_2_WE__VALUE				GENMASK(5, 0)
 
 #define ACC_CLKS				0x130
-#define     ACC_CLKS__VALUE				0x000f
+#define     ACC_CLKS__VALUE				GENMASK(3, 0)
 
 #define NUMBER_OF_PLANES			0x140
-#define     NUMBER_OF_PLANES__VALUE			0x0007
+#define     NUMBER_OF_PLANES__VALUE			GENMASK(2, 0)
 
 #define PAGES_PER_BLOCK				0x150
-#define     PAGES_PER_BLOCK__VALUE			0xffff
+#define     PAGES_PER_BLOCK__VALUE			GENMASK(15, 0)
 
 #define DEVICE_WIDTH				0x160
-#define     DEVICE_WIDTH__VALUE				0x0003
+#define     DEVICE_WIDTH__VALUE				GENMASK(1, 0)
 
 #define DEVICE_MAIN_AREA_SIZE			0x170
-#define     DEVICE_MAIN_AREA_SIZE__VALUE		0xffff
+#define     DEVICE_MAIN_AREA_SIZE__VALUE		GENMASK(15, 0)
 
 #define DEVICE_SPARE_AREA_SIZE			0x180
-#define     DEVICE_SPARE_AREA_SIZE__VALUE		0xffff
+#define     DEVICE_SPARE_AREA_SIZE__VALUE		GENMASK(15, 0)
 
 #define TWO_ROW_ADDR_CYCLES			0x190
-#define     TWO_ROW_ADDR_CYCLES__FLAG			0x0001
+#define     TWO_ROW_ADDR_CYCLES__FLAG			BIT(0)
 
 #define MULTIPLANE_ADDR_RESTRICT		0x1a0
-#define     MULTIPLANE_ADDR_RESTRICT__FLAG		0x0001
+#define     MULTIPLANE_ADDR_RESTRICT__FLAG		BIT(0)
 
 #define ECC_CORRECTION				0x1b0
-#define     ECC_CORRECTION__VALUE			0x001f
+#define     ECC_CORRECTION__VALUE			GENMASK(4, 0)
+#define     ECC_CORRECTION__ERASE_THRESHOLD		GENMASK(31, 16)
+#define     MAKE_ECC_CORRECTION(val, thresh)		\
+			(((val) & (ECC_CORRECTION__VALUE)) | \
+			(((thresh) << 16) & (ECC_CORRECTION__ERASE_THRESHOLD)))
 
 #define READ_MODE				0x1c0
-#define     READ_MODE__VALUE				0x000f
+#define     READ_MODE__VALUE				GENMASK(3, 0)
 
 #define WRITE_MODE				0x1d0
-#define     WRITE_MODE__VALUE				0x000f
+#define     WRITE_MODE__VALUE				GENMASK(3, 0)
 
 #define COPYBACK_MODE				0x1e0
-#define     COPYBACK_MODE__VALUE			0x000f
+#define     COPYBACK_MODE__VALUE			GENMASK(3, 0)
 
 #define RDWR_EN_LO_CNT				0x1f0
-#define     RDWR_EN_LO_CNT__VALUE			0x001f
+#define     RDWR_EN_LO_CNT__VALUE			GENMASK(4, 0)
 
 #define RDWR_EN_HI_CNT				0x200
-#define     RDWR_EN_HI_CNT__VALUE			0x001f
+#define     RDWR_EN_HI_CNT__VALUE			GENMASK(4, 0)
 
 #define MAX_RD_DELAY				0x210
-#define     MAX_RD_DELAY__VALUE				0x000f
+#define     MAX_RD_DELAY__VALUE				GENMASK(3, 0)
 
 #define CS_SETUP_CNT				0x220
-#define     CS_SETUP_CNT__VALUE				0x001f
+#define     CS_SETUP_CNT__VALUE				GENMASK(4, 0)
+#define     CS_SETUP_CNT__TWB				GENMASK(17, 12)
 
 #define SPARE_AREA_SKIP_BYTES			0x230
-#define     SPARE_AREA_SKIP_BYTES__VALUE		0x003f
+#define     SPARE_AREA_SKIP_BYTES__VALUE		GENMASK(5, 0)
 
 #define SPARE_AREA_MARKER			0x240
-#define     SPARE_AREA_MARKER__VALUE			0xffff
+#define     SPARE_AREA_MARKER__VALUE			GENMASK(15, 0)
 
 #define DEVICES_CONNECTED			0x250
-#define     DEVICES_CONNECTED__VALUE			0x0007
+#define     DEVICES_CONNECTED__VALUE			GENMASK(2, 0)
 
 #define DIE_MASK				0x260
-#define     DIE_MASK__VALUE				0x00ff
+#define     DIE_MASK__VALUE				GENMASK(7, 0)
 
 #define FIRST_BLOCK_OF_NEXT_PLANE		0x270
-#define     FIRST_BLOCK_OF_NEXT_PLANE__VALUE		0xffff
+#define     FIRST_BLOCK_OF_NEXT_PLANE__VALUE		GENMASK(15, 0)
 
 #define WRITE_PROTECT				0x280
-#define     WRITE_PROTECT__FLAG				0x0001
+#define     WRITE_PROTECT__FLAG				BIT(0)
 
 #define RE_2_RE					0x290
-#define     RE_2_RE__VALUE				0x003f
+#define     RE_2_RE__VALUE				GENMASK(5, 0)
 
 #define MANUFACTURER_ID				0x300
-#define     MANUFACTURER_ID__VALUE			0x00ff
+#define     MANUFACTURER_ID__VALUE			GENMASK(7, 0)
 
 #define DEVICE_ID				0x310
-#define     DEVICE_ID__VALUE				0x00ff
+#define     DEVICE_ID__VALUE				GENMASK(7, 0)
 
 #define DEVICE_PARAM_0				0x320
-#define     DEVICE_PARAM_0__VALUE			0x00ff
+#define     DEVICE_PARAM_0__VALUE			GENMASK(7, 0)
 
 #define DEVICE_PARAM_1				0x330
-#define     DEVICE_PARAM_1__VALUE			0x00ff
+#define     DEVICE_PARAM_1__VALUE			GENMASK(7, 0)
 
 #define DEVICE_PARAM_2				0x340
-#define     DEVICE_PARAM_2__VALUE			0x00ff
+#define     DEVICE_PARAM_2__VALUE			GENMASK(7, 0)
 
 #define LOGICAL_PAGE_DATA_SIZE			0x350
-#define     LOGICAL_PAGE_DATA_SIZE__VALUE		0xffff
+#define     LOGICAL_PAGE_DATA_SIZE__VALUE		GENMASK(15, 0)
 
 #define LOGICAL_PAGE_SPARE_SIZE			0x360
-#define     LOGICAL_PAGE_SPARE_SIZE__VALUE		0xffff
+#define     LOGICAL_PAGE_SPARE_SIZE__VALUE		GENMASK(15, 0)
 
 #define REVISION				0x370
-#define     REVISION__VALUE				0xffff
+#define     REVISION__VALUE				GENMASK(15, 0)
 
 #define ONFI_DEVICE_FEATURES			0x380
-#define     ONFI_DEVICE_FEATURES__VALUE			0x003f
+#define     ONFI_DEVICE_FEATURES__VALUE			GENMASK(5, 0)
 
 #define ONFI_OPTIONAL_COMMANDS			0x390
-#define     ONFI_OPTIONAL_COMMANDS__VALUE		0x003f
+#define     ONFI_OPTIONAL_COMMANDS__VALUE		GENMASK(5, 0)
 
 #define ONFI_TIMING_MODE			0x3a0
-#define     ONFI_TIMING_MODE__VALUE			0x003f
+#define     ONFI_TIMING_MODE__VALUE			GENMASK(5, 0)
 
 #define ONFI_PGM_CACHE_TIMING_MODE		0x3b0
-#define     ONFI_PGM_CACHE_TIMING_MODE__VALUE		0x003f
+#define     ONFI_PGM_CACHE_TIMING_MODE__VALUE		GENMASK(5, 0)
 
 #define ONFI_DEVICE_NO_OF_LUNS			0x3c0
-#define     ONFI_DEVICE_NO_OF_LUNS__NO_OF_LUNS		0x00ff
-#define     ONFI_DEVICE_NO_OF_LUNS__ONFI_DEVICE		0x0100
+#define     ONFI_DEVICE_NO_OF_LUNS__NO_OF_LUNS		GENMASK(7, 0)
+#define     ONFI_DEVICE_NO_OF_LUNS__ONFI_DEVICE		BIT(8)
 
 #define ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L	0x3d0
-#define     ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L__VALUE	0xffff
+#define     ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_L__VALUE	GENMASK(15, 0)
 
 #define ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U	0x3e0
-#define     ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U__VALUE	0xffff
-
-#define FEATURES					0x3f0
-#define     FEATURES__N_BANKS				0x0003
-#define     FEATURES__ECC_MAX_ERR			0x003c
-#define     FEATURES__DMA				0x0040
-#define     FEATURES__CMD_DMA				0x0080
-#define     FEATURES__PARTITION				0x0100
-#define     FEATURES__XDMA_SIDEBAND			0x0200
-#define     FEATURES__GPREG				0x0400
-#define     FEATURES__INDEX_ADDR			0x0800
+#define     ONFI_DEVICE_NO_OF_BLOCKS_PER_LUN_U__VALUE	GENMASK(15, 0)
+
+#define FEATURES				0x3f0
+#define     FEATURES__N_BANKS				GENMASK(1, 0)
+#define     FEATURES__ECC_MAX_ERR			GENMASK(5, 2)
+#define     FEATURES__DMA				BIT(6)
+#define     FEATURES__CMD_DMA				BIT(7)
+#define     FEATURES__PARTITION				BIT(8)
+#define     FEATURES__XDMA_SIDEBAND			BIT(9)
+#define     FEATURES__GPREG				BIT(10)
+#define     FEATURES__INDEX_ADDR			BIT(11)
 
 #define TRANSFER_MODE				0x400
-#define     TRANSFER_MODE__VALUE			0x0003
+#define     TRANSFER_MODE__VALUE			GENMASK(1, 0)
 
-#define INTR_STATUS(__bank)	(0x410 + ((__bank) * 0x50))
-#define INTR_EN(__bank)		(0x420 + ((__bank) * 0x50))
+#define INTR_STATUS(bank)			(0x410 + (bank) * 0x50)
+#define INTR_EN(bank)				(0x420 + (bank) * 0x50)
 /* bit[1:0] is used differently depending on IP version */
-#define     INTR__ECC_UNCOR_ERR				0x0001	/* new IP */
-#define     INTR__ECC_TRANSACTION_DONE			0x0001	/* old IP */
-#define     INTR__ECC_ERR				0x0002	/* old IP */
-#define     INTR__DMA_CMD_COMP				0x0004
-#define     INTR__TIME_OUT				0x0008
-#define     INTR__PROGRAM_FAIL				0x0010
-#define     INTR__ERASE_FAIL				0x0020
-#define     INTR__LOAD_COMP				0x0040
-#define     INTR__PROGRAM_COMP				0x0080
-#define     INTR__ERASE_COMP				0x0100
-#define     INTR__PIPE_CPYBCK_CMD_COMP			0x0200
-#define     INTR__LOCKED_BLK				0x0400
-#define     INTR__UNSUP_CMD				0x0800
-#define     INTR__INT_ACT				0x1000
-#define     INTR__RST_COMP				0x2000
-#define     INTR__PIPE_CMD_ERR				0x4000
-#define     INTR__PAGE_XFER_INC				0x8000
-
-#define PAGE_CNT(__bank)	(0x430 + ((__bank) * 0x50))
-#define ERR_PAGE_ADDR(__bank)	(0x440 + ((__bank) * 0x50))
-#define ERR_BLOCK_ADDR(__bank)	(0x450 + ((__bank) * 0x50))
+#define     INTR__ECC_UNCOR_ERR				BIT(0)	/* new IP */
+#define     INTR__ECC_TRANSACTION_DONE			BIT(0)	/* old IP */
+#define     INTR__ECC_ERR				BIT(1)	/* old IP */
+#define     INTR__DMA_CMD_COMP				BIT(2)
+#define     INTR__TIME_OUT				BIT(3)
+#define     INTR__PROGRAM_FAIL				BIT(4)
+#define     INTR__ERASE_FAIL				BIT(5)
+#define     INTR__LOAD_COMP				BIT(6)
+#define     INTR__PROGRAM_COMP				BIT(7)
+#define     INTR__ERASE_COMP				BIT(8)
+#define     INTR__PIPE_CPYBCK_CMD_COMP			BIT(9)
+#define     INTR__LOCKED_BLK				BIT(10)
+#define     INTR__UNSUP_CMD				BIT(11)
+#define     INTR__INT_ACT				BIT(12)
+#define     INTR__RST_COMP				BIT(13)
+#define     INTR__PIPE_CMD_ERR				BIT(14)
+#define     INTR__PAGE_XFER_INC				BIT(15)
+#define     INTR__ERASED_PAGE				BIT(16)
+
+#define PAGE_CNT(bank)				(0x430 + (bank) * 0x50)
+#define ERR_PAGE_ADDR(bank)			(0x440 + (bank) * 0x50)
+#define ERR_BLOCK_ADDR(bank)			(0x450 + (bank) * 0x50)
 
 #define ECC_THRESHOLD				0x600
-#define     ECC_THRESHOLD__VALUE			0x03ff
+#define     ECC_THRESHOLD__VALUE			GENMASK(9, 0)
 
 #define ECC_ERROR_BLOCK_ADDRESS			0x610
-#define     ECC_ERROR_BLOCK_ADDRESS__VALUE		0xffff
+#define     ECC_ERROR_BLOCK_ADDRESS__VALUE		GENMASK(15, 0)
 
 #define ECC_ERROR_PAGE_ADDRESS			0x620
-#define     ECC_ERROR_PAGE_ADDRESS__VALUE		0x0fff
-#define     ECC_ERROR_PAGE_ADDRESS__BANK		0xf000
+#define     ECC_ERROR_PAGE_ADDRESS__VALUE		GENMASK(11, 0)
+#define     ECC_ERROR_PAGE_ADDRESS__BANK		GENMASK(15, 12)
 
 #define ECC_ERROR_ADDRESS			0x630
-#define     ECC_ERROR_ADDRESS__OFFSET			0x0fff
-#define     ECC_ERROR_ADDRESS__SECTOR_NR		0xf000
+#define     ECC_ERROR_ADDRESS__OFFSET			GENMASK(11, 0)
+#define     ECC_ERROR_ADDRESS__SECTOR_NR		GENMASK(15, 12)
 
 #define ERR_CORRECTION_INFO			0x640
-#define     ERR_CORRECTION_INFO__BYTEMASK		0x00ff
-#define     ERR_CORRECTION_INFO__DEVICE_NR		0x0f00
-#define     ERR_CORRECTION_INFO__ERROR_TYPE		0x4000
-#define     ERR_CORRECTION_INFO__LAST_ERR_INFO		0x8000
+#define     ERR_CORRECTION_INFO__BYTEMASK		GENMASK(7, 0)
+#define     ERR_CORRECTION_INFO__DEVICE_NR		GENMASK(11, 8)
+#define     ERR_CORRECTION_INFO__ERROR_TYPE		BIT(14)
+#define     ERR_CORRECTION_INFO__LAST_ERR_INFO		BIT(15)
 
 #define ECC_COR_INFO(bank)			(0x650 + (bank) / 2 * 0x10)
 #define     ECC_COR_INFO__SHIFT(bank)			((bank) % 2 * 8)
-#define     ECC_COR_INFO__MAX_ERRORS			0x007f
-#define     ECC_COR_INFO__UNCOR_ERR			0x0080
+#define     ECC_COR_INFO__MAX_ERRORS			GENMASK(6, 0)
+#define     ECC_COR_INFO__UNCOR_ERR			BIT(7)
+
+#define CFG_DATA_BLOCK_SIZE			0x6b0
+
+#define CFG_LAST_DATA_BLOCK_SIZE		0x6c0
+
+#define CFG_NUM_DATA_BLOCKS			0x6d0
+
+#define CFG_META_DATA_SIZE			0x6e0
 
 #define DMA_ENABLE				0x700
-#define     DMA_ENABLE__FLAG				0x0001
+#define     DMA_ENABLE__FLAG				BIT(0)
 
 #define IGNORE_ECC_DONE				0x710
-#define     IGNORE_ECC_DONE__FLAG			0x0001
+#define     IGNORE_ECC_DONE__FLAG			BIT(0)
 
 #define DMA_INTR				0x720
 #define DMA_INTR_EN				0x730
-#define     DMA_INTR__TARGET_ERROR			0x0001
-#define     DMA_INTR__DESC_COMP_CHANNEL0		0x0002
-#define     DMA_INTR__DESC_COMP_CHANNEL1		0x0004
-#define     DMA_INTR__DESC_COMP_CHANNEL2		0x0008
-#define     DMA_INTR__DESC_COMP_CHANNEL3		0x0010
-#define     DMA_INTR__MEMCOPY_DESC_COMP			0x0020
+#define     DMA_INTR__TARGET_ERROR			BIT(0)
+#define     DMA_INTR__DESC_COMP_CHANNEL0		BIT(1)
+#define     DMA_INTR__DESC_COMP_CHANNEL1		BIT(2)
+#define     DMA_INTR__DESC_COMP_CHANNEL2		BIT(3)
+#define     DMA_INTR__DESC_COMP_CHANNEL3		BIT(4)
+#define     DMA_INTR__MEMCOPY_DESC_COMP			BIT(5)
 
 #define TARGET_ERR_ADDR_LO			0x740
-#define     TARGET_ERR_ADDR_LO__VALUE			0xffff
+#define     TARGET_ERR_ADDR_LO__VALUE			GENMASK(15, 0)
 
 #define TARGET_ERR_ADDR_HI			0x750
-#define     TARGET_ERR_ADDR_HI__VALUE			0xffff
+#define     TARGET_ERR_ADDR_HI__VALUE			GENMASK(15, 0)
 
 #define CHNL_ACTIVE				0x760
-#define     CHNL_ACTIVE__CHANNEL0			0x0001
-#define     CHNL_ACTIVE__CHANNEL1			0x0002
-#define     CHNL_ACTIVE__CHANNEL2			0x0004
-#define     CHNL_ACTIVE__CHANNEL3			0x0008
+#define     CHNL_ACTIVE__CHANNEL0			BIT(0)
+#define     CHNL_ACTIVE__CHANNEL1			BIT(1)
+#define     CHNL_ACTIVE__CHANNEL2			BIT(2)
+#define     CHNL_ACTIVE__CHANNEL3			BIT(3)
 
 #define FAIL 1                  /*failed flag*/
 #define PASS 0                  /*success flag*/
 
-#define CLK_X  5
-#define CLK_MULTI 4
-
-#define ONFI_BLOOM_TIME         1
-#define MODE5_WORKAROUND        0
-
-
 #define MODE_00    0x00000000
 #define MODE_01    0x04000000
 #define MODE_10    0x08000000
 #define MODE_11    0x0C000000
 
-#define ECC_SECTOR_SIZE     512
-
-struct nand_buf {
-	int head;
-	int tail;
-	uint8_t *buf;
-	dma_addr_t dma_buf;
-};
-
-#define INTEL_CE4100	1
-#define INTEL_MRST	2
-#define DT		3
-
 struct denali_nand_info {
 	struct nand_chip nand;
+	unsigned long clk_x_rate;	/* bus interface clock rate */
 	int flash_bank; /* currently selected chip */
-	int status;
-	int platform;
-	struct nand_buf buf;
 	struct device *dev;
-	int total_used_banks;
-	int page;
 	void __iomem *flash_reg;	/* Register Interface */
 	void __iomem *flash_mem;	/* Host Data/Command Interface */
 
 	/* elements used by ISR */
 	struct completion complete;
 	spinlock_t irq_lock;
+	uint32_t irq_mask;
 	uint32_t irq_status;
 	int irq;
 
+	void *buf;
+	dma_addr_t dma_addr;
+	int dma_avail;
 	int devnum;	/* represent how many nands connected */
 	int bbtskipbytes;
 	int max_banks;
 	unsigned int revision;
+	unsigned long ecc_strength_avail;
 	unsigned int caps;
+	const struct nand_ecc_setting *avail_ecc_settings;
 };
 
 #define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index df9ef36..a6d2e58 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -29,13 +29,30 @@ struct denali_dt {
 	struct clk		*clk;
 };
 
+#define DENALI_MAX_ECC_SETTINGS		4
+
 struct denali_dt_data {
 	unsigned int revision;
 	unsigned int caps;
+	struct nand_ecc_setting avail_ecc_settings[DENALI_MAX_ECC_SETTINGS];
 };
 
 static const struct denali_dt_data denali_socfpga_data = {
 	.caps = DENALI_CAP_HW_ECC_FIXUP,
+	.avail_ecc_settings = {{512, 8}, {512, 15}},
+};
+
+static const struct denali_dt_data denali_uniphier_v5a_data = {
+	.caps = DENALI_CAP_HW_ECC_FIXUP |
+		DENALI_CAP_DMA_64BIT,
+	.avail_ecc_settings = {{1024, 8}, {1024, 16}, {1024, 24}},
+};
+
+static const struct denali_dt_data denali_uniphier_v5b_data = {
+	.revision = 0x0501,
+	.caps = DENALI_CAP_HW_ECC_FIXUP |
+		DENALI_CAP_DMA_64BIT,
+	.avail_ecc_settings = {{1024, 8}, {1024, 16}},
 };
 
 static const struct of_device_id denali_nand_dt_ids[] = {
@@ -43,6 +60,14 @@ static const struct of_device_id denali_nand_dt_ids[] = {
 		.compatible = "altr,socfpga-denali-nand",
 		.data = &denali_socfpga_data,
 	},
+	{
+		.compatible = "socionext,uniphier-denali-nand-v5a",
+		.data = &denali_uniphier_v5a_data,
+	},
+	{
+		.compatible = "socionext,uniphier-denali-nand-v5b",
+		.data = &denali_uniphier_v5b_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
@@ -64,9 +89,9 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (data) {
 		denali->revision = data->revision;
 		denali->caps = data->caps;
+		denali->avail_ecc_settings = data->avail_ecc_settings;
 	}
 
-	denali->platform = DT;
 	denali->dev = &pdev->dev;
 	denali->irq = platform_get_irq(pdev, 0);
 	if (denali->irq < 0) {
@@ -93,6 +118,8 @@ static int denali_dt_probe(struct platform_device *pdev)
 	}
 	clk_prepare_enable(dt->clk);
 
+	denali->clk_x_rate = clk_get_rate(dt->clk);
+
 	ret = denali_init(denali);
 	if (ret)
 		goto out_disable_clk;
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index ac84323..e9c77d6 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -19,6 +19,9 @@
 
 #define DENALI_NAND_NAME    "denali-nand-pci"
 
+#define INTEL_CE4100	1
+#define INTEL_MRST	2
+
 /* List of platforms this NAND controller has be integrated into */
 static const struct pci_device_id denali_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x0701), INTEL_CE4100 },
@@ -27,6 +30,10 @@ static const struct pci_device_id denali_pci_ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, denali_pci_ids);
 
+static const struct nand_ecc_setting denali_pci_avail_ecc_settings[] = {
+	{512, 8}, {512, 15}, {/* sentinel */}
+};
+
 static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int ret;
@@ -45,13 +52,11 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	if (id->driver_data == INTEL_CE4100) {
-		denali->platform = INTEL_CE4100;
 		mem_base = pci_resource_start(dev, 0);
 		mem_len = pci_resource_len(dev, 1);
 		csr_base = pci_resource_start(dev, 1);
 		csr_len = pci_resource_len(dev, 1);
 	} else {
-		denali->platform = INTEL_MRST;
 		csr_base = pci_resource_start(dev, 0);
 		csr_len = pci_resource_len(dev, 0);
 		mem_base = pci_resource_start(dev, 1);
@@ -65,6 +70,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pci_set_master(dev);
 	denali->dev = &dev->dev;
 	denali->irq = dev->irq;
+	denali->clk_x_rate = 200000000;		/* 200 MHz */
+	denali->avail_ecc_settings = denali_pci_avail_ecc_settings;
 
 	ret = pci_request_regions(dev, DENALI_NAND_NAME);
 	if (ret) {
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
