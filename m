From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 1/2] mtd: spi-nor: add an alternative method to support memory >16MiB
Date: Wed, 23 Mar 2016 13:49:10 +0100
Message-ID: <3dcf42f1afa88b05fd7fa6b2a46782767926f62f.1458736784.git.cyrille.pitchen@atmel.com>
References: <cover.1458736784.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1458736784.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, marex@denx.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

This patch provides an alternative mean to support memory above 16MiB
(128Mib) by replacing 3byte address op codes by their associated 4byte
address versions.

Using the dedicated 4byte address op codes doesn't change the internal
state of the SPI NOR memory as opposed to using other means such as
updating a Base Address Register (BAR) and sending command to enter/leave
the 4byte mode.

Hence when a CPU reset occurs, early bootloaders don't need to be aware
of BAR value or 4byte mode being enabled: they can still access the first
16MiB of the SPI NOR memory using the regular 3byte address op codes.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/devices/serial_flash_cmds.h |  7 ---
 drivers/mtd/devices/st_spi_fsm.c        | 28 +++++-----
 drivers/mtd/spi-nor/spi-nor.c           | 99 ++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h             | 21 +++++--
 4 files changed, 107 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/devices/serial_flash_cmds.h b/drivers/mtd/devices/serial_flash_cmds.h
index f59a125295d0..8b81e15105dd 100644
--- a/drivers/mtd/devices/serial_flash_cmds.h
+++ b/drivers/mtd/devices/serial_flash_cmds.h
@@ -18,19 +18,12 @@
 #define SPINOR_OP_RDVCR		0x85
 
 /* JEDEC Standard - Serial Flash Discoverable Parmeters (SFDP) Commands */
-#define SPINOR_OP_READ_1_2_2	0xbb	/* DUAL I/O READ */
-#define SPINOR_OP_READ_1_4_4	0xeb	/* QUAD I/O READ */
-
 #define SPINOR_OP_WRITE		0x02	/* PAGE PROGRAM */
 #define SPINOR_OP_WRITE_1_1_2	0xa2	/* DUAL INPUT PROGRAM */
 #define SPINOR_OP_WRITE_1_2_2	0xd2	/* DUAL INPUT EXT PROGRAM */
 #define SPINOR_OP_WRITE_1_1_4	0x32	/* QUAD INPUT PROGRAM */
 #define SPINOR_OP_WRITE_1_4_4	0x12	/* QUAD INPUT EXT PROGRAM */
 
-/* READ commands with 32-bit addressing */
-#define SPINOR_OP_READ4_1_2_2	0xbc
-#define SPINOR_OP_READ4_1_4_4	0xec
-
 /* Configuration flags */
 #define FLASH_FLAG_SINGLE	0x000000ff
 #define FLASH_FLAG_READ_WRITE	0x00000001
diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 5454b4113589..804313a33f2b 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -507,13 +507,13 @@ static struct seq_rw_config n25q_read3_configs[] = {
  *	- 'FAST' variants configured for 8 dummy cycles (see note above.)
  */
 static struct seq_rw_config n25q_read4_configs[] = {
-	{FLASH_FLAG_READ_1_4_4, SPINOR_OP_READ4_1_4_4,	0, 4, 4, 0x00, 0, 8},
-	{FLASH_FLAG_READ_1_1_4, SPINOR_OP_READ4_1_1_4,	0, 1, 4, 0x00, 0, 8},
-	{FLASH_FLAG_READ_1_2_2, SPINOR_OP_READ4_1_2_2,	0, 2, 2, 0x00, 0, 8},
-	{FLASH_FLAG_READ_1_1_2, SPINOR_OP_READ4_1_1_2,	0, 1, 2, 0x00, 0, 8},
-	{FLASH_FLAG_READ_FAST,	SPINOR_OP_READ4_FAST,	0, 1, 1, 0x00, 0, 8},
-	{FLASH_FLAG_READ_WRITE, SPINOR_OP_READ4,	0, 1, 1, 0x00, 0, 0},
-	{0x00,			0,			0, 0, 0, 0x00, 0, 0},
+	{FLASH_FLAG_READ_1_4_4, SPINOR_OP_READ_1_4_4_4B, 0, 4, 4, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_1_4, SPINOR_OP_READ_1_1_4_4B, 0, 1, 4, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_2_2, SPINOR_OP_READ_1_2_2_4B, 0, 2, 2, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_1_2, SPINOR_OP_READ_1_1_2_4B, 0, 1, 2, 0x00, 0, 8},
+	{FLASH_FLAG_READ_FAST,	SPINOR_OP_READ_FAST_4B,  0, 1, 1, 0x00, 0, 8},
+	{FLASH_FLAG_READ_WRITE, SPINOR_OP_READ_4B,       0, 1, 1, 0x00, 0, 0},
+	{0x00,			0,                       0, 0, 0, 0x00, 0, 0},
 };
 
 /*
@@ -553,13 +553,13 @@ static int stfsm_mx25_en_32bit_addr_seq(struct stfsm_seq *seq)
  * entering a state that is incompatible with the SPIBoot Controller.
  */
 static struct seq_rw_config stfsm_s25fl_read4_configs[] = {
-	{FLASH_FLAG_READ_1_4_4,  SPINOR_OP_READ4_1_4_4,  0, 4, 4, 0x00, 2, 4},
-	{FLASH_FLAG_READ_1_1_4,  SPINOR_OP_READ4_1_1_4,  0, 1, 4, 0x00, 0, 8},
-	{FLASH_FLAG_READ_1_2_2,  SPINOR_OP_READ4_1_2_2,  0, 2, 2, 0x00, 4, 0},
-	{FLASH_FLAG_READ_1_1_2,  SPINOR_OP_READ4_1_1_2,  0, 1, 2, 0x00, 0, 8},
-	{FLASH_FLAG_READ_FAST,   SPINOR_OP_READ4_FAST,   0, 1, 1, 0x00, 0, 8},
-	{FLASH_FLAG_READ_WRITE,  SPINOR_OP_READ4,        0, 1, 1, 0x00, 0, 0},
-	{0x00,                   0,                      0, 0, 0, 0x00, 0, 0},
+	{FLASH_FLAG_READ_1_4_4,  SPINOR_OP_READ_1_4_4_4B,  0, 4, 4, 0x00, 2, 4},
+	{FLASH_FLAG_READ_1_1_4,  SPINOR_OP_READ_1_1_4_4B,  0, 1, 4, 0x00, 0, 8},
+	{FLASH_FLAG_READ_1_2_2,  SPINOR_OP_READ_1_2_2_4B,  0, 2, 2, 0x00, 4, 0},
+	{FLASH_FLAG_READ_1_1_2,  SPINOR_OP_READ_1_1_2_4B,  0, 1, 2, 0x00, 0, 8},
+	{FLASH_FLAG_READ_FAST,   SPINOR_OP_READ_FAST_4B,   0, 1, 1, 0x00, 0, 8},
+	{FLASH_FLAG_READ_WRITE,  SPINOR_OP_READ_4B,        0, 1, 1, 0x00, 0, 0},
+	{0x00,                   0,                        0, 0, 0, 0x00, 0, 0},
 };
 
 static struct seq_rw_config stfsm_s25fl_write4_configs[] = {
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 157841dc3e99..0f8013dda7ed 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -188,6 +188,80 @@ static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 	return mtd->priv;
 }
 
+
+struct spi_nor_address_entry {
+	u8	src_opcode;
+	u8	dst_opcode;
+};
+
+static u8 spi_nor_convert_opcode(u8 opcode,
+				 const struct spi_nor_address_entry *entries,
+				 size_t num_entries)
+{
+	int min, max;
+
+	min = 0;
+	max = num_entries - 1;
+	while (min <= max) {
+		int mid = (min + max) >> 1;
+		const struct spi_nor_address_entry *entry = &entries[mid];
+
+		if (opcode == entry->src_opcode)
+			return entry->dst_opcode;
+
+		if (opcode < entry->src_opcode)
+			max = mid - 1;
+		else
+			min = mid + 1;
+	}
+
+	/* No conversion found */
+	return opcode;
+}
+
+static u8 spi_nor_3to4_opcode(u8 opcode)
+{
+	/* MUST be sorted by 3byte opcode */
+#define ENTRY_3TO4(_opcode)	{ _opcode, _opcode##_4B }
+	static const struct spi_nor_address_entry spi_nor_3to4_table[] = {
+		ENTRY_3TO4(SPINOR_OP_PP),		/* 0x02 */
+		ENTRY_3TO4(SPINOR_OP_READ),		/* 0x03 */
+		ENTRY_3TO4(SPINOR_OP_READ_FAST),	/* 0x0b */
+		ENTRY_3TO4(SPINOR_OP_BE_4K),		/* 0x20 */
+		ENTRY_3TO4(SPINOR_OP_PP_1_1_4),		/* 0x32 */
+		ENTRY_3TO4(SPINOR_OP_PP_1_4_4),		/* 0x38 */
+		ENTRY_3TO4(SPINOR_OP_READ_1_1_2),	/* 0x3b */
+		ENTRY_3TO4(SPINOR_OP_READ_1_1_4),	/* 0x6b */
+		ENTRY_3TO4(SPINOR_OP_READ_1_2_2),	/* 0xbb */
+		ENTRY_3TO4(SPINOR_OP_SE),		/* 0xd8 */
+		ENTRY_3TO4(SPINOR_OP_READ_1_4_4),	/* 0xeb */
+	};
+#undef ENTRY_3TO4
+
+	return spi_nor_convert_opcode(opcode, spi_nor_3to4_table,
+				      ARRAY_SIZE(spi_nor_3to4_table));
+}
+
+static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
+				      const struct flash_info *info)
+{
+	/* Do some manufacturer fixups first */
+	switch (JEDEC_MFR(info)) {
+	case SNOR_MFR_SPANSION:
+		/* No small sector erase for 4-byte command set */
+		nor->erase_opcode = SPINOR_OP_SE;
+		nor->mtd.erasesize = info->sector_size;
+		break;
+
+	default:
+		break;
+	}
+
+	nor->read_opcode	= spi_nor_3to4_opcode(nor->read_opcode);
+	nor->program_opcode	= spi_nor_3to4_opcode(nor->program_opcode);
+	nor->erase_opcode	= spi_nor_3to4_opcode(nor->erase_opcode);
+}
+
 /* Enable/disable 4-byte addressing mode. */
 static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 			    int enable)
@@ -1421,27 +1495,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	else if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
-		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION) {
-			/* Dedicated 4-byte command set */
-			switch (nor->flash_read) {
-			case SPI_NOR_QUAD:
-				nor->read_opcode = SPINOR_OP_READ4_1_1_4;
-				break;
-			case SPI_NOR_DUAL:
-				nor->read_opcode = SPINOR_OP_READ4_1_1_2;
-				break;
-			case SPI_NOR_FAST:
-				nor->read_opcode = SPINOR_OP_READ4_FAST;
-				break;
-			case SPI_NOR_NORMAL:
-				nor->read_opcode = SPINOR_OP_READ4;
-				break;
-			}
-			nor->program_opcode = SPINOR_OP_PP_4B;
-			/* No small sector erase for 4-byte command set */
-			nor->erase_opcode = SPINOR_OP_SE_4B;
-			mtd->erasesize = info->sector_size;
-		} else
+		if ((np && of_property_read_bool(np, "m25p,4byte-opcodes")) ||
+		    JEDEC_MFR(info) == SNOR_MFR_SPANSION)
+			spi_nor_set_4byte_opcodes(nor, info);
+		else
 			set_4byte(nor, info, 1);
 	} else {
 		nor->addr_width = 3;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 3c36113a88e1..a91e95756a48 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -42,9 +42,13 @@
 #define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
 #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */
 #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
-#define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual SPI) */
-#define SPINOR_OP_READ_1_1_4	0x6b	/* Read data bytes (Quad SPI) */
+#define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual Output SPI) */
+#define SPINOR_OP_READ_1_2_2	0xbb	/* Read data bytes (Dual I/O SPI) */
+#define SPINOR_OP_READ_1_1_4	0x6b	/* Read data bytes (Quad Output SPI) */
+#define SPINOR_OP_READ_1_4_4	0xeb	/* Read data bytes (Quad I/O SPI) */
 #define SPINOR_OP_PP		0x02	/* Page program (up to 256 bytes) */
+#define SPINOR_OP_PP_1_1_4	0x32	/* Quad page program */
+#define SPINOR_OP_PP_1_4_4	0x38	/* Quad page program */
 #define SPINOR_OP_BE_4K		0x20	/* Erase 4KiB block */
 #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
 #define SPINOR_OP_BE_32K	0x52	/* Erase 32KiB block */
@@ -55,11 +59,16 @@
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
-#define SPINOR_OP_READ4		0x13	/* Read data bytes (low frequency) */
-#define SPINOR_OP_READ4_FAST	0x0c	/* Read data bytes (high frequency) */
-#define SPINOR_OP_READ4_1_1_2	0x3c	/* Read data bytes (Dual SPI) */
-#define SPINOR_OP_READ4_1_1_4	0x6c	/* Read data bytes (Quad SPI) */
+#define SPINOR_OP_READ_4B	0x13	/* Read data bytes (low frequency) */
+#define SPINOR_OP_READ_FAST_4B	0x0c	/* Read data bytes (high frequency) */
+#define SPINOR_OP_READ_1_1_2_4B	0x3c	/* Read data bytes (Dual Output SPI) */
+#define SPINOR_OP_READ_1_2_2_4B	0xbc	/* Read data bytes (Dual I/O SPI) */
+#define SPINOR_OP_READ_1_1_4_4B	0x6c	/* Read data bytes (Quad Output SPI) */
+#define SPINOR_OP_READ_1_4_4_4B	0xec	/* Read data bytes (Quad I/O SPI) */
 #define SPINOR_OP_PP_4B		0x12	/* Page program (up to 256 bytes) */
+#define SPINOR_OP_PP_1_1_4_4B	0x34	/* Quad page program */
+#define SPINOR_OP_PP_1_4_4_4B	0x3e	/* Quad page program */
+#define SPINOR_OP_BE_4K_4B	0x21	/* Erase 4KiB block */
 #define SPINOR_OP_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
 
 /* Used for SST flashes only. */
-- 
1.8.2.2
