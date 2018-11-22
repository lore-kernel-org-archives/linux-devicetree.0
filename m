From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 3/9] ARM: aurora-l2: add defines for parity and ECC registers
Date: Thu, 22 Nov 2018 13:11:36 +1300
Message-ID: <20181122001142.19187-4-chris.packham@alliedtelesis.co.nz>
References: <20181122001142.19187-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122001142.19187-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, bp@alien8.de, arnd@arndb.de, jlu@pengutronix.de, gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

From: Jan Luebbe <jlu@pengutronix.de>

These defines will be used by subsequent patches to add support for the
parity check and error correction functionality in the Aurora L2 cache
controller.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
=20.../include/asm/hardware/cache-aurora-l2.h    | 48 +++++++++++++++++++=

=201 file changed, 48 insertions(+)

diff --git a/arch/arm/include/asm/hardware/cache-aurora-l2.h b/arch/arm/i=
nclude/asm/hardware/cache-aurora-l2.h
index dc5c479ec4c3..39769ffa0051 100644
--- a/arch/arm/include/asm/hardware/cache-aurora-l2.h
+++ b/arch/arm/include/asm/hardware/cache-aurora-l2.h
@@ -31,6 +31,9 @@
=20#define AURORA_ACR_REPLACEMENT_TYPE_SEMIPLRU \
=20	(3 << AURORA_ACR_REPLACEMENT_OFFSET)
=20
+#define AURORA_ACR_PARITY_EN	(1 << 21)
+#define AURORA_ACR_ECC_EN	(1 << 20)
+
=20#define AURORA_ACR_FORCE_WRITE_POLICY_OFFSET	0
=20#define AURORA_ACR_FORCE_WRITE_POLICY_MASK	\
=20	(0x3 << AURORA_ACR_FORCE_WRITE_POLICY_OFFSET)
@@ -41,6 +44,51 @@
=20#define AURORA_ACR_FORCE_WRITE_THRO_POLICY	\
=20	(2 << AURORA_ACR_FORCE_WRITE_POLICY_OFFSET)
=20
+#define AURORA_ERR_CNT_REG          0x600
+#define AURORA_ERR_ATTR_CAP_REG     0x608
+#define AURORA_ERR_ADDR_CAP_REG     0x60c
+#define AURORA_ERR_WAY_CAP_REG      0x610
+#define AURORA_ERR_INJECT_CTL_REG   0x614
+#define AURORA_ERR_INJECT_MASK_REG  0x618
+
+#define AURORA_ERR_CNT_CLR_OFFSET         31
+#define AURORA_ERR_CNT_CLR		   \
+	(0x1 << AURORA_ERR_CNT_CLR_OFFSET)
+#define AURORA_ERR_CNT_UE_OFFSET          16
+#define AURORA_ERR_CNT_UE_MASK             \
+	(0x7fff << AURORA_ERR_CNT_UE_OFFSET)
+#define AURORA_ERR_CNT_CE_OFFSET           0
+#define AURORA_ERR_CNT_CE_MASK             \
+	(0xffff << AURORA_ERR_CNT_CE_OFFSET)
+
+#define AURORA_ERR_ATTR_SRC_OFF           16
+#define AURORA_ERR_ATTR_SRC_MSK            \
+	(0x7 << AURORA_ERR_ATTR_SRC_OFF)
+#define AURORA_ERR_ATTR_TXN_OFF           12
+#define AURORA_ERR_ATTR_TXN_MSK            \
+	(0xf << AURORA_ERR_ATTR_TXN_OFF)
+#define AURORA_ERR_ATTR_ERR_OFF            8
+#define AURORA_ERR_ATTR_ERR_MSK            \
+	(0x3 << AURORA_ERR_ATTR_ERR_OFF)
+#define AURORA_ERR_ATTR_CAP_VALID_OFF      0
+#define AURORA_ERR_ATTR_CAP_VALID          \
+	(0x1 << AURORA_ERR_ATTR_CAP_VALID_OFF)
+
+#define AURORA_ERR_ADDR_CAP_ADDR_MASK 0xffffffe0
+
+#define AURORA_ERR_WAY_IDX_OFF             8
+#define AURORA_ERR_WAY_IDX_MSK             \
+	(0xfff << AURORA_ERR_WAY_IDX_OFF)
+#define AURORA_ERR_WAY_CAP_WAY_OFFSET      1
+#define AURORA_ERR_WAY_CAP_WAY_MASK        \
+	(0xf << AURORA_ERR_WAY_CAP_WAY_OFFSET)
+
+#define AURORA_ERR_INJECT_CTL_ADDR_MASK 0xfffffff0
+#define AURORA_ERR_ATTR_TXN_OFF   12
+#define AURORA_ERR_INJECT_CTL_EN_MASK          0x3
+#define AURORA_ERR_INJECT_CTL_EN_PARITY        0x2
+#define AURORA_ERR_INJECT_CTL_EN_ECC           0x1
+
=20#define AURORA_MAX_RANGE_SIZE	1024
=20
=20#define AURORA_WAY_SIZE_SHIFT	2
--=20
2.19.1
