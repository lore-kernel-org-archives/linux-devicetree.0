From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 3/7] mailbox: bcm-flexrm-mailbox: Fix mask used in CMPL_START_ADDR_VALUE()
Date: Fri, 21 Jul 2017 12:25:38 +0530
Message-ID: <1500620142-910-4-git-send-email-anup.patel@broadcom.com>
References: <1500620142-910-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500620142-910-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The mask used in CMPL_START_ADDR_VALUE() should be 27bits instead of
26bits. This incorrect mask was causing completion writes to 40bits
physical address fail.

This patch fixes mask used in CMPL_START_ADDR_VALUE() macro.

Fixes: dbc049eee730 ("mailbox: Add driver for Broadcom FlexRM
ring manager")

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
Cc: stable@vger.kernel.org
---
 drivers/mailbox/bcm-flexrm-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/bcm-flexrm-mailbox.c b/drivers/mailbox/bcm-flexrm-mailbox.c
index a0be2ea..46ad305 100644
--- a/drivers/mailbox/bcm-flexrm-mailbox.c
+++ b/drivers/mailbox/bcm-flexrm-mailbox.c
@@ -97,7 +97,7 @@
 
 /* Register RING_CMPL_START_ADDR fields */
 #define CMPL_START_ADDR_VALUE(pa)			\
-	((u32)((((u64)(pa)) >> RING_CMPL_ALIGN_ORDER) & 0x03ffffff))
+	((u32)((((u64)(pa)) >> RING_CMPL_ALIGN_ORDER) & 0x07ffffff))
 
 /* Register RING_CONTROL fields */
 #define CONTROL_MASK_DISABLE_CONTROL			12
-- 
2.7.4
