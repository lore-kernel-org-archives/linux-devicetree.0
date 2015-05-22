From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 15/15] MIPS: malta: setup post-I/O hole RAM on non-EVA
Date: Fri, 22 May 2015 16:51:14 +0100
Message-ID: <1432309875-9712-16-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

If the system has more than 256MB RAM (ie. more than will fit in the
unmapped kseg[01] regions before the I/O hole) then set up a region to
use that memory via its alias in the upper half of the physical address
space, where the I/O hole is not present. This allows highmem to be used
on Malta without needing to manually specify mem= parameters on the
kernel command line.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mti-malta/malta-dtshim.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mti-malta/malta-dtshim.c b/arch/mips/mti-malta/malta-dtshim.c
index 9074951..6320b44 100644
--- a/arch/mips/mti-malta/malta-dtshim.c
+++ b/arch/mips/mti-malta/malta-dtshim.c
@@ -23,7 +23,7 @@ static unsigned char fdt_buf[16 << 10] __initdata;
 /* determined physical memory size, not overridden by command line args	 */
 extern unsigned long physical_memsize;
 
-#define MAX_MEM_ARRAY_ENTRIES 1
+#define MAX_MEM_ARRAY_ENTRIES 2
 
 static unsigned __init gen_fdt_mem_array(__be32 *mem_array, unsigned long size)
 {
@@ -37,6 +37,12 @@ static unsigned __init gen_fdt_mem_array(__be32 *mem_array, unsigned long size)
 	} else {
 		size_preio = min_t(unsigned long, size, 256 << 20);
 		mem_array[1] = cpu_to_be32(PHYS_OFFSET + size_preio);
+
+		if (size > size_preio) {
+			entries++;
+			mem_array[2] = cpu_to_be32(0x80000000 + size_preio);
+			mem_array[3] = cpu_to_be32(size - size_preio);
+		}
 	}
 
 	BUG_ON(entries > MAX_MEM_ARRAY_ENTRIES);
-- 
2.4.1
