From: Phong Tran <tranmanphong@gmail.com>
Subject: [PATCH] of: replace be32_to_cpu to be32_to_cpup
Date: Tue, 30 Apr 2019 16:00:44 +0700
Message-ID: <20190430090044.16345-1-tranmanphong@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, pantelis.antoniou@konsulko.com
Cc: natechancellor@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Phong Tran <tranmanphong@gmail.com>
List-Id: devicetree@vger.kernel.org

The cell is a pointer to __be32.
with the be32_to_cpu a lot of clang warning show that:

./include/linux/of.h:238:37: warning: multiple unsequenced modifications
to 'cell' [-Wunsequenced]
                r = (r << 32) | be32_to_cpu(*(cell++));
                                                  ^~
./include/linux/byteorder/generic.h:95:21: note: expanded from macro
'be32_to_cpu'
                    ^
./include/uapi/linux/byteorder/little_endian.h:40:59: note: expanded
from macro '__be32_to_cpu'
                                                          ^
./include/uapi/linux/swab.h:118:21: note: expanded from macro '__swab32'
        ___constant_swab32(x) :                 \
                           ^
./include/uapi/linux/swab.h:18:12: note: expanded from macro
'___constant_swab32'
        (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
                  ^

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 include/linux/of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index e240992e5cb6..1c35fc8f19b0 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -235,7 +235,7 @@ static inline u64 of_read_number(const __be32 *cell, int size)
 {
 	u64 r = 0;
 	while (size--)
-		r = (r << 32) | be32_to_cpu(*(cell++));
+		r = (r << 32) | be32_to_cpup(cell++);
 	return r;
 }
 
-- 
2.21.0
