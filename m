Return-Path: <SRS0=AnC+=L4=nvidia.com=pdeschrijver@kernel.org>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 01/14] memory: tegra: mc: Add Tegra210 MC emem registers
Date: Fri, 14 Sep 2018 23:02:56 +0300
Message-ID: <1536955389-30442-2-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkuruturi@nvidia.com, linux-tegra=linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, robh+dt@kernel.org
Cc: daniel@octaforge.org, a.heider@gmail.com, swtcr0@gmail.com, Peter De Schrijver <pdeschrijver@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/memory/tegra/tegra210.c | 80 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 5e144ab..aa9dcf0 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -15,6 +15,84 @@
 
 #include "mc.h"
 
+#define MC_EMEM_ADR_CFG						0x54
+#define MC_EMEM_ARB_CFG						0x90
+#define MC_EMEM_ARB_OUTSTANDING_REQ				0x94
+#define MC_EMEM_ARB_TIMING_RCD					0x98
+#define MC_EMEM_ARB_TIMING_RP					0x9c
+#define MC_EMEM_ARB_TIMING_RC					0xa0
+#define MC_EMEM_ARB_TIMING_RAS					0xa4
+#define MC_EMEM_ARB_TIMING_FAW					0xa8
+#define MC_EMEM_ARB_TIMING_RRD					0xac
+#define MC_EMEM_ARB_TIMING_RAP2PRE				0xb0
+#define MC_EMEM_ARB_TIMING_WAP2PRE				0xb4
+#define MC_EMEM_ARB_TIMING_R2R					0xb8
+#define MC_EMEM_ARB_TIMING_W2W					0xbc
+#define MC_EMEM_ARB_TIMING_R2W					0xc0
+#define MC_EMEM_ARB_TIMING_W2R					0xc4
+#define MC_EMEM_ARB_DA_TURNS					0xd0
+#define MC_EMEM_ARB_DA_COVERS					0xd4
+#define MC_EMEM_ARB_MISC0					0xd8
+#define MC_EMEM_ARB_MISC1					0xdc
+#define MC_EMEM_ARB_MISC2					0xc8
+#define MC_EMEM_ARB_RING1_THROTTLE				0xe0
+#define MC_MLL_MPCORER_PTSA_RATE				0x44c
+#define MC_FTOP_PTSA_RATE					0x50c
+#define MC_EMEM_ARB_TIMING_RFCPB				0x6c0
+#define MC_EMEM_ARB_TIMING_CCDMW				0x6c4
+#define MC_EMEM_ARB_REFPB_HP_CTRL				0x6f0
+#define MC_EMEM_ARB_REFPB_BANK_CTRL				0x6f4
+#define MC_PTSA_GRANT_DECREMENT					0x960
+#define MC_EMEM_ARB_DHYST_CTRL					0xbcc
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0			0xbd0
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1			0xbd4
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2			0xbd8
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3			0xbdc
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4			0xbe0
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5			0xbe4
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6			0xbe8
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7			0xbec
+
+static const unsigned long tegra210_mc_emem_regs[] = {
+	 MC_EMEM_ADR_CFG,
+	 MC_EMEM_ARB_CFG,
+	 MC_EMEM_ARB_OUTSTANDING_REQ,
+	 MC_EMEM_ARB_TIMING_RCD,
+	 MC_EMEM_ARB_TIMING_RP,
+	 MC_EMEM_ARB_TIMING_RC,
+	 MC_EMEM_ARB_TIMING_RAS,
+	 MC_EMEM_ARB_TIMING_FAW,
+	 MC_EMEM_ARB_TIMING_RRD,
+	 MC_EMEM_ARB_TIMING_RAP2PRE,
+	 MC_EMEM_ARB_TIMING_WAP2PRE,
+	 MC_EMEM_ARB_TIMING_R2R,
+	 MC_EMEM_ARB_TIMING_W2W,
+	 MC_EMEM_ARB_TIMING_R2W,
+	 MC_EMEM_ARB_TIMING_W2R,
+	 MC_EMEM_ARB_DA_TURNS,
+	 MC_EMEM_ARB_DA_COVERS,
+	 MC_EMEM_ARB_MISC0,
+	 MC_EMEM_ARB_MISC1,
+	 MC_EMEM_ARB_MISC2,
+	 MC_EMEM_ARB_RING1_THROTTLE,
+	 MC_MLL_MPCORER_PTSA_RATE,
+	 MC_FTOP_PTSA_RATE,
+	 MC_EMEM_ARB_TIMING_RFCPB,
+	 MC_EMEM_ARB_TIMING_CCDMW,
+	 MC_EMEM_ARB_REFPB_HP_CTRL,
+	 MC_EMEM_ARB_REFPB_BANK_CTRL,
+	 MC_PTSA_GRANT_DECREMENT,
+	 MC_EMEM_ARB_DHYST_CTRL,
+	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0,
+	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1,
+	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2,
+	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3,
+	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4,
+	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5,
+	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6,
+	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7,
+};
+
 static const struct tegra_mc_client tegra210_mc_clients[] = {
 	{
 		.id = 0x00,
@@ -1077,4 +1155,6 @@
 	.atom_size = 64,
 	.client_id_mask = 0xff,
 	.smmu = &tegra210_smmu_soc,
+	.emem_regs = tegra210_mc_emem_regs,
+	.num_emem_regs = ARRAY_SIZE(tegra210_mc_emem_regs),
 };
-- 
1.9.1
