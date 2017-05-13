From: Sascha Silbe <x-linux@infra-silbe.de>
Subject: [PATCH 2/2] of: fdt: fix unflattening of FDTs containing uncompressed paths
Date: Sat, 13 May 2017 12:22:29 +0200
Message-ID: <20170513102229.22579-3-x-linux@infra-silbe.de>
References: <20170513102229.22579-1-x-linux@infra-silbe.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170513102229.22579-1-x-linux@infra-silbe.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Probably since commit dfbd4c6eff35 ("drivers/of: Split
unflatten_dt_node()"), unflattening an FDT containing uncompressed
node names (e.g. "/gpio@d4019000/gpio@0") will abort after scanning
the root node because fpsize wasn't updated to include the path len.

Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
---
 drivers/of/fdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index e5ce4b59e162..2d5414e644b3 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -309,6 +309,8 @@ static unsigned int populate_node(const void *blob,
 			fpsize += l;
 			allocl = fpsize;
 		}
+	} else {
+		fpsize += allocl;
 	}
 
 	np = unflatten_dt_alloc(mem, sizeof(struct device_node) + allocl,
-- 
2.11.0
