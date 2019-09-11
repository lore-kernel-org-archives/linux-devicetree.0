From: Colin King <colin.king@canonical.com>
Subject: [PATCH] dtc: fix spelling mistake "mmory" -> "memory"
Date: Wed, 11 Sep 2019 10:31:23 +0100
Message-ID: <20190911093123.11312-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 scripts/dtc/fdtput.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dtc/fdtput.c b/scripts/dtc/fdtput.c
index a363c3cabc59..3755e5f68a5a 100644
--- a/scripts/dtc/fdtput.c
+++ b/scripts/dtc/fdtput.c
@@ -84,7 +84,7 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 			value_size = (upto + len) + 500;
 			value = realloc(value, value_size);
 			if (!value) {
-				fprintf(stderr, "Out of mmory: cannot alloc "
+				fprintf(stderr, "Out of memory: cannot alloc "
 					"%d bytes\n", value_size);
 				return -1;
 			}
-- 
2.20.1
