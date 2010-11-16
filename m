From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/7] of: Fixes for OF probing on little endian systems
Date: Tue, 16 Nov 2010 14:33:50 -0600
Message-ID: <1289939635-30742-3-git-send-email-robherring2@gmail.com>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1289939635-30742-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Fixes for sdhci-of and ipmi drivers.

Auditing all drivers using of_get_property did not find other
occurrences likely to be used on LE platforms.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 drivers/char/ipmi/ipmi_si_intf.c |    8 ++++----
 drivers/mmc/host/sdhci-of-core.c |    4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 1b33a42..8842044 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2546,7 +2546,7 @@ static int __devinit ipmi_of_probe(struct platform_device *dev,
 {
 	struct smi_info *info;
 	struct resource resource;
-	const int *regsize, *regspacing, *regshift;
+	const __be32 *regsize, *regspacing, *regshift;
 	struct device_node *np = dev->dev.of_node;
 	int ret;
 	int proplen;
@@ -2599,9 +2599,9 @@ static int __devinit ipmi_of_probe(struct platform_device *dev,
 
 	info->io.addr_data	= resource.start;
 
-	info->io.regsize	= regsize ? *regsize : DEFAULT_REGSIZE;
-	info->io.regspacing	= regspacing ? *regspacing : DEFAULT_REGSPACING;
-	info->io.regshift	= regshift ? *regshift : 0;
+	info->io.regsize	= regsize ? be32_to_cpup(regsize) : DEFAULT_REGSIZE;
+	info->io.regspacing	= regspacing ? be32_to_cpup(regspacing) : DEFAULT_REGSPACING;
+	info->io.regshift	= regshift ? be32_to_cpup(regshift) : 0;
 
 	info->irq		= irq_of_parse_and_map(dev->dev.of_node, 0);
 	info->dev		= &dev->dev;
diff --git a/drivers/mmc/host/sdhci-of-core.c b/drivers/mmc/host/sdhci-of-core.c
index c51b711..fa19d84 100644
--- a/drivers/mmc/host/sdhci-of-core.c
+++ b/drivers/mmc/host/sdhci-of-core.c
@@ -122,7 +122,7 @@ static int __devinit sdhci_of_probe(struct platform_device *ofdev,
 	struct sdhci_of_data *sdhci_of_data = match->data;
 	struct sdhci_host *host;
 	struct sdhci_of_host *of_host;
-	const u32 *clk;
+	const __be32 *clk;
 	int size;
 	int ret;
 
@@ -166,7 +166,7 @@ static int __devinit sdhci_of_probe(struct platform_device *ofdev,
 
 	clk = of_get_property(np, "clock-frequency", &size);
 	if (clk && size == sizeof(*clk) && *clk)
-		of_host->clock = *clk;
+		of_host->clock = be32_to_cpup(clk);
 
 	ret = sdhci_add_host(host);
 	if (ret)
-- 
1.7.1
