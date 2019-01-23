From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH reset-next 2/2] reset: brcmstb: Fix 32-bit build with 64-bit resource_size_t
Date: Tue, 22 Jan 2019 16:33:45 -0800
Message-ID: <20190123003345.13750-3-f.fainelli@gmail.com>
References: <20190123003345.13750-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123003345.13750-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, rdunlap@infradead.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, paul.gortmaker@windriver.com
List-Id: devicetree@vger.kernel.org

On 32-bit architectures defining resource_size_t as 64-bit (because of
PAE), we can run into a linker failure because of the modulo and the
division against resource_size(), replace the two problematic operations
with an alignment check on the register resource (instead of modulo),
and the division with DIV_ROUND_CLOSEST_ULL().

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: c196cdc7659d ("reset: Add Broadcom STB SW_INIT reset controller driver")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/reset/reset-brcmstb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-brcmstb.c b/drivers/reset/reset-brcmstb.c
index 01ab1f71518b..c4cab8b5052d 100644
--- a/drivers/reset/reset-brcmstb.c
+++ b/drivers/reset/reset-brcmstb.c
@@ -91,7 +91,8 @@ static int brcmstb_reset_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (resource_size(res) % SW_INIT_BANK_SIZE) {
+	if (!IS_ALIGNED(res->start, SW_INIT_BANK_SIZE) ||
+	    !IS_AGLINED(resource_size(res), SW_INIT_BANK_SIZE)) {
 		dev_err(kdev, "incorrect register range\n");
 		return -EINVAL;
 	}
@@ -103,7 +104,8 @@ static int brcmstb_reset_probe(struct platform_device *pdev)
 	dev_set_drvdata(kdev, priv);
 
 	priv->rcdev.owner = THIS_MODULE;
-	priv->rcdev.nr_resets = (resource_size(res) / SW_INIT_BANK_SIZE) * 32;
+	priv->rcdev.nr_resets = DIV_ROUND_CLOSEST_ULL(resource_size(res),
+						      SW_INIT_BANK_SIZE) * 32;
 	priv->rcdev.ops = &brcmstb_reset_ops;
 	priv->rcdev.of_node = kdev->of_node;
 	/* Use defaults: 1 cell and simple xlate function */
-- 
2.17.1
