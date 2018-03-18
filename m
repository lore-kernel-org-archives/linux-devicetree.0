From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Subject: [PATCH 1/2] brcmfmac: add new dt entries for SG SDIO settings
Date: Mon, 19 Mar 2018 01:41:00 +0700
Message-ID: <20180318184101.26951-1-alexey.roslyakov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kvalo@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, arend.vanspriel@broadcom.com, franky.lin@broadcom.com, hante.meuleman@broadcom.com, chi-hsien.lin@cypress.com, wright.feng@cypress.com, netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, Alexey Roslyakov <alexey.roslyakov@gmail.com>
List-Id: devicetree@vger.kernel.org

There are 3 fields in SDIO settings (quirks) to workaround some of
the SG SDIO host particularities, i.e higher align requirements for
SG items.
All coding is done the long time ago, but there is no way to change the
driver behavior without patching the kernel.
Add missing devicetree entries.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index aee6e5937c41..0718ca09a40d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -31,6 +31,7 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 	int irq;
 	u32 irqf;
 	u32 val;
+	u16 align;
 
 	if (!np || bus_type != BRCMF_BUSTYPE_SDIO ||
 	    !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
@@ -39,6 +40,15 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 	if (of_property_read_u32(np, "brcm,drive-strength", &val) == 0)
 		sdio->drive_strength = val;
 
+	sdio->broken_sg_support =
+		of_property_read_bool(np, "brcm,broken-sg-support");
+
+	if (of_property_read_u16(np, "brcm,sd-head-align", &align) == 0)
+		sdio->sd_head_align = align;
+
+	if (of_property_read_u16(np, "brcm,sd-sgentry-align", &align) == 0)
+		sdio->sd_sgentry_align = align;
+
 	/* make sure there are interrupts defined in the node */
 	if (!of_find_property(np, "interrupts", NULL))
 		return;
-- 
2.16.1
