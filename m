From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 1/5] mtd: brcmnand: Fix pointer type-cast in brcmnand_write()
Date: Fri, 2 Oct 2015 23:26:42 +0530
Message-ID: <1443808606-21203-2-git-send-email-anup.patel@broadcom.com>
References: <1443808606-21203-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443808606-21203-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Sandeep Tripathy <tripathy@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We should always type-cast pointer to "long" or "unsigned long"
because size of pointer is same as machine word size. This will
avoid pointer type-cast issues on both 32bit and 64bit systems.

This patch fixes pointer type-cast issue in brcmnand_write()
as-per above info.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Vikram Prakash <vikramp@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index fddb795..4cba03d 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1544,9 +1544,9 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 
 	dev_dbg(ctrl->dev, "write %llx <- %p\n", (unsigned long long)addr, buf);
 
-	if (unlikely((u32)buf & 0x03)) {
+	if (unlikely((unsigned long)buf & 0x03)) {
 		dev_warn(ctrl->dev, "unaligned buffer: %p\n", buf);
-		buf = (u32 *)((u32)buf & ~0x03);
+		buf = (u32 *)((unsigned long)buf & ~0x03);
 	}
 
 	brcmnand_wp(mtd, 0);
-- 
1.9.1
