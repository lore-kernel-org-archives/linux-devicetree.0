From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 1/4] mtd: brcmnand: Fix pointer type-cast in
 brcmnand_write()
Date: Fri, 16 Oct 2015 14:38:54 +0530
Message-ID: <1444986537-28387-2-git-send-email-anup.patel@broadcom.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Sandeep Tripathy <tripathy@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Pramod KUMAR <pramodku@broadcom.com>, linux-arm-kernel@lists.infradead.org, Anup Patel <anup.patel@broadcom.com>
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
