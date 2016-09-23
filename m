From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] of: Prevent unaligned access in of_alias_scan()
Date: Fri, 23 Sep 2016 16:38:27 +0100
Message-ID: <20160923153827.8263-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: devicetree@vger.kernel.org

When allocating a struct alias_prop, of_alias_scan() only requested that
it be aligned on a 4 byte boundary. The struct contains pointers which
leads to us attempting 64 bit writes on 64 bit systems, and if the CPU
doesn't support unaligned memory accesses then this causes problems -
for example on some MIPS64r2 CPUs including the "mips64r2-generic" QEMU
emulated CPU it will trigger an address error exception.

Fix this by requesting alignment for the struct alias_prop allocation
matching that which the compiler expects, using the __alignof__ keyword.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 drivers/of/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 3ce6953..448aa40 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2042,7 +2042,7 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 			continue;
 
 		/* Allocate an alias_prop with enough space for the stem */
-		ap = dt_alloc(sizeof(*ap) + len + 1, 4);
+		ap = dt_alloc(sizeof(*ap) + len + 1, __alignof__(*ap));
 		if (!ap)
 			continue;
 		memset(ap, 0, sizeof(*ap) + len + 1);
-- 
2.10.0
