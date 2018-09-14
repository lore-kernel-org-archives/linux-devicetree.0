Return-Path: <SRS0=AnC+=L4=nvidia.com=pdeschrijver@kernel.org>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 06/14] memory: tegra: mc: Add support for scaled LA
Date: Fri, 14 Sep 2018 23:03:01 +0300
Message-ID: <1536955389-30442-7-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
References: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkuruturi@nvidia.com, linux-tegra=linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, robh+dt@kernel.org
Cc: daniel@octaforge.org, a.heider@gmail.com, swtcr0@gmail.com, Peter De Schrijver <pdeschrijver@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Besides for each memory client, Tegra210 also has a number of 'scaled latency
allowance' registers. Add support for them.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/memory/tegra/mc.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/tegra/mc.h    |  6 ++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index af4bf29..a7ed8e1 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -138,6 +138,38 @@ void tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate)
 
 	for (i = 0; i < mc->soc->num_emem_regs; ++i)
 		mc_writel(mc, timing->emem_data[i], mc->soc->emem_regs[i]);
+
+}
+
+void tegra_mc_write_scaled_la_configuration(struct tegra_mc *mc,
+					    unsigned long rate)
+{
+	unsigned int i, idx;
+	struct tegra_mc_timing *timing = NULL;
+
+	if (!mc->soc->has_scaled_la)
+		return;
+
+	timing = find_mc_timing(mc, rate);
+	if (!timing) {
+		dev_err(mc->dev, "no memory timing registered for rate %lu\n",
+			rate);
+		return;
+	}
+
+	idx = 0;
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		const struct tegra_mc_la *la = &mc->soc->clients[i].la;
+		mc_modifyl(mc, la->reg, timing->scaled_la_data[idx++],
+			   la->shift, la->mask);
+	}
+
+	for (i = 0; i < mc->soc->num_scaled_la_regs; i++) {
+		mc_modifyl(mc, mc->soc->scaled_la_regs[i],
+			   timing->scaled_la_data[idx++], 0, 0xff);
+		mc_modifyl(mc, mc->soc->scaled_la_regs[i],
+			   timing->scaled_la_data[idx++], 16, 0xff);
+	}
 }
 
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc)
@@ -181,6 +213,28 @@ static int load_one_timing(struct tegra_mc *mc,
 		return err;
 	}
 
+	if (mc->soc->has_scaled_la) {
+		unsigned int num_scaled_la_regs;
+
+		num_scaled_la_regs = mc->soc->num_clients;
+		/* each scaled LA register has a HI and a LO allowance value */
+		num_scaled_la_regs += mc->soc->num_scaled_la_regs * 2;
+		timing->scaled_la_data = devm_kcalloc(mc->dev,
+			num_scaled_la_regs, sizeof(u8), GFP_KERNEL);
+		if (!timing->scaled_la_data)
+			return -ENOMEM;
+
+		err = of_property_read_u8_array(node,
+				"nvidia,scale-la-configuration",
+				timing->scaled_la_data, num_scaled_la_regs);
+		if (err) {
+			dev_err(mc->dev,
+			 "timing %s: failed to read scaled LA configuration\n",
+			 node->name);
+			return err;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 44202ff..fce457c 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -24,6 +24,7 @@ struct tegra_mc_timing {
 	unsigned long rate;
 
 	u32 *emem_data;
+	u8 *scaled_la_data;
 };
 
 /* latency allowance */
@@ -93,12 +94,16 @@ struct tegra_mc_soc {
 	const unsigned long *emem_regs;
 	unsigned int num_emem_regs;
 
+	const unsigned long *scaled_la_regs;
+	unsigned int num_scaled_la_regs;
+
 	unsigned int num_address_bits;
 	unsigned int atom_size;
 
 	u8 client_id_mask;
 
 	const struct tegra_smmu_soc *smmu;
+	bool has_scaled_la;
 };
 
 struct tegra_mc {
@@ -117,5 +122,6 @@ struct tegra_mc {
 
 void tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
+void tegra_mc_write_scaled_la_configuration(struct tegra_mc *mc, unsigned long rate);
 
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
1.9.1
