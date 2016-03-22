From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] mtd: spi-nor: add an alternative method to support memory >16MiB
Date: Tue, 22 Mar 2016 16:13:55 +0100
Message-ID: <75adc06e8766012b4cb9592ff286cc4a2b7fe9de.1458657802.git.cyrille.pitchen@atmel.com>
References: <cover.1458657802.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1458657802.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
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

Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 100 +++++++++++++++++++++++++++++++++---------
 include/linux/mtd/spi-nor.h   |  23 +++++++---
 2 files changed, 96 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 157841dc3e99..a1ad1337a2f8 100644
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
+		ENTRY_3TO4(SPINOR_OP_QUAD_PP),		/* 0x32 */
+		ENTRY_3TO4(SPINOR_OP_QUAD_PP_MX),	/* 0x38 */
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
@@ -217,6 +291,7 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
 	}
 }
+
 static inline int spi_nor_sr_ready(struct spi_nor *nor)
 {
 	int sr = read_sr(nor);
@@ -1421,27 +1496,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
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
index 3c36113a88e1..749f72d3021d 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -42,9 +42,12 @@
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
+#define SPINOR_OP_QUAD_PP	0x32	/* Quad page program */
 #define SPINOR_OP_BE_4K		0x20	/* Erase 4KiB block */
 #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
 #define SPINOR_OP_BE_32K	0x52	/* Erase 32KiB block */
@@ -55,11 +58,15 @@
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
+#define SPINOR_OP_QUAD_PP_4B	0x34	/* Quad page program */
+#define SPINOR_OP_BE_4K_4B	0x21	/* Erase 4KiB block */
 #define SPINOR_OP_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
 
 /* Used for SST flashes only. */
@@ -71,6 +78,10 @@
 #define SPINOR_OP_EN4B		0xb7	/* Enter 4-byte mode */
 #define SPINOR_OP_EX4B		0xe9	/* Exit 4-byte mode */
 
+/* Used for Macronix flashes only. */
+#define SPINOR_OP_QUAD_PP_MX	0x38	/* Quad page program */
+#define SPINOR_OP_QUAD_PP_MX_4B	0x3e	/* Quad page program */
+
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
