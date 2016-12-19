From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 20/21] MIPS memblock: Add free low memory test method call
Date: Mon, 19 Dec 2016 05:07:45 +0300
Message-ID: <1482113266-13207-21-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Right after all the necessary reservations are done, free memory
regions can be tested if it is activated with "memtest" parameter.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/mm/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 35e7ba8..ccc0e96 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -452,6 +452,12 @@ void maar_init(void)
 
 void __init paging_init(void)
 {
+	/*
+	 * Test low memory registered within memblock. The method shall test
+	 * valid and free memory only
+	 */
+	early_memtest(PFN_PHYS(min_low_pfn), PFN_PHYS(max_low_pfn));
+
 	/* Initialize page tables */
 	pagetable_init();
 
-- 
2.6.6
