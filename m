From: Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V2] brcmfmac: Add sg parameters dts parsing
Date: Mon, 11 Dec 2017 02:06:46 -0600
Message-ID: <20171211080640.GA132360@aremote07.aus.cypress.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: brcm80211-dev-list <brcm80211-dev-list-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, brcm80211-dev-list.pdl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Wright Feng <Wright.Feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Stanley Hsu <Stanley.Hsu-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

broken_sg_support, sd_head_align, and sd_sgentry_align are used in
brcmfmac code but not configurable in dts file. Add the parsing logic.
Now they can be configured like below in dts:
	brcm,broken_sg_support;
	brcm,sd_head_align = <4>;
	brcm,sd_sgentry_align = <4>;

Signed-off-by: Chi-hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index aee6e59..fd028b1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -39,6 +39,13 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 	if (of_property_read_u32(np, "brcm,drive-strength", &val) == 0)
 		sdio->drive_strength = val;
 
+	sdio->broken_sg_support = of_property_read_bool(np,
+							"brcm,broken_sg_support");
+	if (of_property_read_u32(np, "brcm,sd_head_align", &val) == 0)
+		sdio->sd_head_align = (u16)val;
+	if (of_property_read_u32(np, "brcm,sd_sgentry_align", &val) == 0)
+		sdio->sd_sgentry_align = (u16)val;
+
 	/* make sure there are interrupts defined in the node */
 	if (!of_find_property(np, "interrupts", NULL))
 		return;
-- 
2.1.0
