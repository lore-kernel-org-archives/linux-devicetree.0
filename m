From: Bean Huo <beanhuo@outlook.com>
Subject: [PATCH v1 3/3] drivers: mtd: chips: add support for the dual die
 stacked PNOR
Date: Wed, 21 Feb 2018 19:32:37 +0000
Message-ID: <DM2PR12MB00143807EEF9602098FF0D4BA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "boris.brezillon@free-elections.com" <boris.brezillon@free-elections.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>, "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: beanhuo <beanhuo@micron.com>
List-Id: devicetree@vger.kernel.org

From: beanhuo <beanhuo@micron.com>

For the dual die stacked parallel NOR flash (PNOR), it comprises
two dies in the stack. These two dies can receive the commands in
parallel, but there is only one die can be selected or accept
commands according to the maximum address line A[max].
For example,Micron parallel NOR MT28FW02GBBA1HPC and Cypress
S70GL02GS, both are dual-die stacked PNOR with 2Gbit density,
and maximum address line A[26], when A[26] == 0, the lower 1Gb die
is selected, when A[26] == 1, the upper 1Gb is selected.

This patch is to check the accessing offset in the chip and rebase
the unlock cycle command base addresses.

Signed-off-by: beanhuo <beanhuo@micron.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 144 ++++++++++++++++++++++++++++--------
 1 file changed, 113 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 56aa6b7..8fa2193 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1104,6 +1104,27 @@ do {  \
 
 #endif
 
+/*
+ * The dual die stacked device comprises two identical dies which connected
+ * in parallel.But there is only one die being selected each time according
+ * to maximum address line A[max]. When A[max] == 0, the lower die is selected,
+ * when A[max] == 1, the upper die is selected. This function will reture the
+ * CFI unlock-command base address accrording to accessing address.
+ */
+static loff_t get_cmd_base_address(struct map_info *map, struct flchip *chip,
+		loff_t offset)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long cmd_base_addr = chip->start;
+
+	if (cfi->device_stack == CFI_DEVICESTACK_2DIE) {
+		if (offset >= (1 << (cfi->cfiq->DevSize - 1)))
+			cmd_base_addr += (1 << (cfi->cfiq->DevSize - 1));
+	}
+
+	return cmd_base_addr;
+}
+
 static inline int do_read_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
 {
 	unsigned long cmd_addr;
@@ -1180,12 +1201,18 @@ static inline void otp_enter(struct map_info *map, struct flchip *chip,
 			     loff_t adr, size_t len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long  cmd_base_addr;
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+	/* For the dual die device, rebase the command base address according
+	 * to accessing address.
+	 */
+	cmd_base_addr = get_cmd_base_address(map, chip, adr);
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi,
+	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
 
 	INVALIDATE_CACHED_RANGE(map, chip->start + adr, len);
@@ -1195,14 +1222,20 @@ static inline void otp_exit(struct map_info *map, struct flchip *chip,
 			    loff_t adr, size_t len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long cmd_base_addr;
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+	/* For the dual die device, rebase the command base address according
+	 * to accessing address.
+	 */
+	cmd_base_addr = get_cmd_base_address(map, chip, adr);
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi,
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi,
+	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
 
 	INVALIDATE_CACHED_RANGE(map, chip->start + adr, len);
@@ -1566,6 +1599,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	int ret = 0;
 	map_word oldd;
 	int retry_cnt = 0;
+	unsigned long cmd_base_addr;
 
 	adr += chip->start;
 
@@ -1599,10 +1633,18 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
+	/* For the dual die device, rebase the command base address according
+	 * to accessing address.
+	 */
+	cmd_base_addr = get_cmd_base_address(map, chip, adr - chip->start);
+
  retry:
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
 	map_write(map, datum, adr);
 	chip->state = mode;
 
@@ -1807,6 +1849,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	unsigned long cmd_adr;
 	int z, words;
 	map_word datum;
+	unsigned long cmd_base_addr;
 
 	adr += chip->start;
 	cmd_adr = adr;
@@ -1827,8 +1870,15 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, cmd_adr);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
+	/* For the dual die device, rebase the command base address according
+	 * to accessing address.
+	 */
+	cmd_base_addr = get_cmd_base_address(map, chip, adr - chip->start);
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
 
 	/* Write Buffer Load */
 	map_write(map, CMD(0x25), cmd_adr);
@@ -1896,11 +1946,17 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	 * See e.g.
 	 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
 	 */
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+
+	/* For the dual die device, rebase the command base address according
+	 * to accessing address.
+	 */
+	cmd_base_addr = get_cmd_base_address(map, chip, adr - chip->start);
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
+	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
 	xip_enable(map, chip, adr);
 	/* FIXME - should have reset delay before continuing */
@@ -2063,6 +2119,7 @@ static int do_panic_write_oneword(struct map_info *map, struct flchip *chip,
 	map_word oldd;
 	int ret = 0;
 	int i;
+	unsigned long cmd_base_addr;
 
 	adr += chip->start;
 
@@ -2087,10 +2144,18 @@ static int do_panic_write_oneword(struct map_info *map, struct flchip *chip,
 
 	ENABLE_VPP(map);
 
+	/* For the dual die device, rebase the command base address according
+	 * to accessing address.
+	 */
+	cmd_base_addr = get_cmd_base_address(map, chip, adr - chip->start);
+
 retry:
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
 	map_write(map, datum, adr);
 
 	for (i = 0; i < jiffies_to_usecs(uWriteTimeout); i++) {
@@ -2329,6 +2394,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	unsigned long timeo = jiffies + HZ;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
+	unsigned long cmd_base_addr;
 
 	adr += chip->start;
 
@@ -2346,11 +2412,21 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
+	/* For the dual die device, rebase the command base address according
+	 * to accessing address.
+	 */
+	cmd_base_addr = get_cmd_base_address(map, chip, adr - chip->start);
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, cmd_base_addr, map, cfi,
+			cfi->device_type, NULL);
 	map_write(map, cfi->sector_erase_cmd, adr);
 
 	chip->state = FL_ERASING;
@@ -2399,7 +2475,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	/* Did we succeed? */
 	if (!chip_good(map, adr, map_word_ff(map))) {
 		/* reset on all failures. */
-		map_write( map, CMD(0xF0), chip->start );
+		map_write(map, CMD(0xF0), cmd_base_addr);
 		/* FIXME - should have reset delay before continuing */
 
 		ret = -EIO;
@@ -2549,6 +2625,7 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo;
 	int ret;
+	unsigned long cmd_base_addr;
 
 	mutex_lock(&chip->mutex);
 	ret = get_chip(map, chip, adr + chip->start, FL_LOCKING);
@@ -2559,12 +2636,17 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
 
 	pr_debug("MTD %s(): XXLOCK 0x%08lx len %d\n", __func__, adr, len);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+	/* For the dual die device, rebase the command base address according
+	 * to accessing address.
+	 */
+	cmd_base_addr = get_cmd_base_address(map, chip, adr);
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
 	/* PPB entry command */
-	cfi_send_gen_cmd(0xC0, cfi->addr_unlock1, chip->start, map, cfi,
+	cfi_send_gen_cmd(0xC0, cfi->addr_unlock1, cmd_base_addr, map, cfi,
 			 cfi->device_type, NULL);
 
 	if (thunk == DO_XXLOCK_ONEBLOCK_LOCK) {
@@ -2577,8 +2659,8 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
 		 * have to unlock all sectors of this device instead
 		 */
 		chip->state = FL_UNLOCKING;
-		map_write(map, CMD(0x80), chip->start);
-		map_write(map, CMD(0x30), chip->start);
+		map_write(map, CMD(0x80), cmd_base_addr);
+		map_write(map, CMD(0x30), cmd_base_addr);
 	} else if (thunk == DO_XXLOCK_ONEBLOCK_GETLOCK) {
 		chip->state = FL_JEDEC_QUERY;
 		/* Return locked status: 0->locked, 1->unlocked */
@@ -2604,8 +2686,8 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
 	}
 
 	/* Exit BC commands */
-	map_write(map, CMD(0x90), chip->start);
-	map_write(map, CMD(0x00), chip->start);
+	map_write(map, CMD(0x90), cmd_base_addr);
+	map_write(map, CMD(0x00), cmd_base_addr);
 
 	chip->state = FL_READY;
 	put_chip(map, chip, adr + chip->start);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
