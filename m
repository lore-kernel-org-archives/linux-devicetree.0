Return-Path: <SRS0=Tq4V=PY=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 1/4] EDAC, altera: Fix S10 persistent register offset
Date: Wed, 16 Jan 2019 17:11:51 -0600
Message-Id: <1547680314-31045-2-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1547680314-31045-1-git-send-email-thor.thayer@linux.intel.com>
References: <1547680314-31045-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Correct the persistent register offset where address
and status are stored.

Fixes: 08f08bfb7b4c ("EDAC, altera: Merge Stratix10 into the Arria10 SDRAM
		      probe routine")
Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/edac/altera_edac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 4213cb0bb2a7..f8664bac9fa8 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -295,8 +295,8 @@ struct altr_sdram_mc_data {
 #define S10_SYSMGR_ECC_INTSTAT_DERR_OFST  0xA0
 
 /* Sticky registers for Uncorrected Errors */
-#define S10_SYSMGR_UE_VAL_OFST            0x120
-#define S10_SYSMGR_UE_ADDR_OFST           0x124
+#define S10_SYSMGR_UE_VAL_OFST            0x220
+#define S10_SYSMGR_UE_ADDR_OFST           0x224
 
 #define S10_DDR0_IRQ_MASK                 BIT(16)
 
-- 
2.7.4
