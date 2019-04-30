From: Phong Tran <tranmanphong@gmail.com>
Subject: [PATCH V2] of: fix clang -Wunsequenced for be32_to_cpu()
Date: Tue, 30 Apr 2019 21:56:24 +0700
Message-ID: <20190430145624.30470-1-tranmanphong@gmail.com>
References: <46b3e8edf27e4c8f98697f9e7f2117d6@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <46b3e8edf27e4c8f98697f9e7f2117d6@AcuMS.aculab.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, pantelis.antoniou@konsulko.com
Cc: David.Laight@ACULAB.COM, hch@infradead.org, ndesaulniers@google.com, natechancellor@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Phong Tran <tranmanphong@gmail.com>
List-Id: devicetree@vger.kernel.org

Now, make the loop explicit to avoid clang warning.

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
 include/linux/of.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index e240992e5cb6..71ca25ac01f6 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -234,8 +234,8 @@ extern struct device_node *of_find_all_nodes(struct device_node *prev);
 static inline u64 of_read_number(const __be32 *cell, int size)
 {
 	u64 r = 0;
-	while (size--)
-		r = (r << 32) | be32_to_cpu(*(cell++));
+	for(; size--; cell++)
+		r = (r << 32) | be32_to_cpu(*cell);
 	return r;
 }
 
-- 
2.21.0
