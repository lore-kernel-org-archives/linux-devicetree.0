From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 13/15] MIPS: malta: remove nonsense memory limit
Date: Fri, 22 May 2015 16:51:12 +0100
Message-ID: <1432309875-9712-14-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
List-Id: devicetree@vger.kernel.org

This cap of Malta memory size to 0x7fff0000 was added by commit
e6ca4e5bf114 "MIPS: malta: malta-memory: Add support for the 'ememsize'
variable" as part of support for EVA, with only the cryptic comment
"Last 64K for HIGHMEM arithmetics". However

  - EVA is used to avoid highmem, both are not enabled at once which
    makes the comment about highmem macros nonsensical.

  - I can think of no good reason for it, and nor could anyone else I
    asked.

So remove this memsize limit.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mti-malta/malta-memory.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/mti-malta/malta-memory.c b/arch/mips/mti-malta/malta-memory.c
index 5660cd6..831f583 100644
--- a/arch/mips/mti-malta/malta-memory.c
+++ b/arch/mips/mti-malta/malta-memory.c
@@ -94,10 +94,6 @@ void __init fw_meminit(void)
 	else
 		memsize = physical_memsize;
 
-	/* Last 64K for HIGHMEM arithmetics */
-	if (memsize > 0x7fff0000)
-		memsize = 0x7fff0000;
-
 	add_memory_region(PHYS_OFFSET, 0x00001000, BOOT_MEM_RESERVED);
 
 	/*
-- 
2.4.1
