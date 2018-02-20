Return-Path: <SRS0=XlNi=FO=gmail.com=digetx@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 05/15] memory: tegra: Do not handle spurious interrupts
Date: Tue, 20 Feb 2018 19:25:18 +0300
Message-Id: <48059f0e134d779e65fd92938e4162b191e400de.1519141896.git.digetx@gmail.com>
In-Reply-To: <cover.1519141896.git.digetx@gmail.com>
References: <cover.1519141896.git.digetx@gmail.com>
In-Reply-To: <cover.1519141896.git.digetx@gmail.com>
References: <cover.1519141896.git.digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The ISR reads interrupts-enable mask, but doesn't utilize it. Apply the
mask to the interrupt status and don't handle interrupts that MC driver
haven't asked for. Kernel would disable spurious MC IRQ and report the
error. This would happen only in a case of a very severe bug.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index a4803ac192bb..d2005b995821 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -252,8 +252,11 @@ static irqreturn_t tegra_mc_irq(int irq, void *data)
 	unsigned int bit;
 
 	/* mask all interrupts to avoid flooding */
-	status = mc_readl(mc, MC_INTSTATUS);
 	mask = mc_readl(mc, MC_INTMASK);
+	status = mc_readl(mc, MC_INTSTATUS) & mask;
+
+	if (!status)
+		return IRQ_NONE;
 
 	for_each_set_bit(bit, &status, 32) {
 		const char *error = status_names[bit] ?: "unknown";
-- 
2.16.1
