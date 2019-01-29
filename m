From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.20 075/117] EDAC, altera: Fix S10 persistent register offset
Date: Tue, 29 Jan 2019 12:35:26 +0100
Message-ID: <20190129113211.253650252@linuxfoundation.org>
References: <20190129113207.477505932@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129113207.477505932@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>, Borislav Petkov <bp@suse.de>, James Morse <james.morse@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, dinguyen@kernel.org, linux-edac <linux-edac@vger.kernel.org>, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

4.20-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thor Thayer <thor.thayer@linux.intel.com>

commit 245b6c6558128327d330549b23d09594c46f58df upstream.

Correct the persistent register offset where address and status are
stored.

Fixes: 08f08bfb7b4c ("EDAC, altera: Merge Stratix10 into the Arria10 SDRAM probe routine")
Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: James Morse <james.morse@arm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: dinguyen@kernel.org
Cc: linux-edac <linux-edac@vger.kernel.org>
Cc: mark.rutland@arm.com
Cc: robh+dt@kernel.org
Cc: stable <stable@vger.kernel.org>
Link: https://lkml.kernel.org/r/1548179287-21760-2-git-send-email-thor.thayer@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/edac/altera_edac.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
 
