Return-Path: <SRS0=AnC+=L4=nvidia.com=pdeschrijver@kernel.org>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 07/14] memory: tegra: scaled LA register for Tegra210
Date: Fri, 14 Sep 2018 23:03:02 +0300
Message-ID: <1536955389-30442-8-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkuruturi@nvidia.com, linux-tegra=linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, robh+dt@kernel.org
Cc: daniel@octaforge.org, a.heider@gmail.com, swtcr0@gmail.com, Peter De Schrijver <pdeschrijver@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/memory/tegra/tegra210.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index aa9dcf0..b4dd533 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -53,6 +53,13 @@
 #define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6			0xbe8
 #define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7			0xbec
 
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0AB			0x694
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0B			0x698
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0C			0x6a0
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0BB			0x69c
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0CB			0x6a4
+#define MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0A			0x690
+
 static const unsigned long tegra210_mc_emem_regs[] = {
 	 MC_EMEM_ADR_CFG,
 	 MC_EMEM_ARB_CFG,
@@ -93,6 +100,15 @@
 	 MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7,
 };
 
+static const unsigned long tegra210_scaled_la_regs[] = {
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0AB,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0B,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0C,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0BB,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0CB,
+	 MC_SCALED_LATENCY_ALLOWANCE_DISPLAY0A,
+};
+
 static const struct tegra_mc_client tegra210_mc_clients[] = {
 	{
 		.id = 0x00,
@@ -1157,4 +1173,7 @@
 	.smmu = &tegra210_smmu_soc,
 	.emem_regs = tegra210_mc_emem_regs,
 	.num_emem_regs = ARRAY_SIZE(tegra210_mc_emem_regs),
+	.scaled_la_regs = tegra210_scaled_la_regs,
+	.num_scaled_la_regs = ARRAY_SIZE(tegra210_scaled_la_regs),
+	.has_scaled_la = true,
 };
-- 
1.9.1
