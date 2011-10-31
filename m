From: Kyle Moffett <Kyle.D.Moffett@boeing.com>
Subject: [RFC PATCH 07/10] powerpc/mpic: Don't open-code dcr_resource_start
Date: Mon, 31 Oct 2011 17:10:08 -0400
Message-ID: <1320095411-20667-8-git-send-email-Kyle.D.Moffett@boeing.com>
References: <1320095411-20667-1-git-send-email-Kyle.D.Moffett@boeing.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1320095411-20667-1-git-send-email-Kyle.D.Moffett@boeing.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Kyle Moffett <Kyle.D.Moffett@boeing.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, Milton Miller <miltonm@bga.com>, Kumar Gala <galak@kernel.crashing.org>, Scott Wood <scottwood@freescale.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Don't open-code the OpenFirmware "dcr-reg" property lookup trying to map
DCR resources.  This makes the code a bit easier to read.

Signed-off-by: Kyle Moffett <Kyle.D.Moffett@boeing.com>
---
 arch/powerpc/sysdev/mpic.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 31a9ada..0342ab8 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -319,11 +319,8 @@ static void _mpic_map_dcr(struct mpic *mpic, struct device_node *node,
 			  struct mpic_reg_bank *rb,
 			  unsigned int offset, unsigned int size)
 {
-	const u32 *dbasep;
-
-	dbasep = of_get_property(node, "dcr-reg", NULL);
-
-	rb->dhost = dcr_map(node, *dbasep + offset, size);
+	phys_addr_t phys_addr = dcr_resource_start(node);
+	rb->dhost = dcr_map(mpic->node, phys_addr + offset, size);
 	BUG_ON(!DCR_MAP_OK(rb->dhost));
 }
 
-- 
1.7.2.5
