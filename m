From: Sascha Silbe <x-linux@infra-silbe.de>
Subject: [PATCH 1/2] fdt: correctly handle uncompressed node names
Date: Sat, 13 May 2017 12:22:28 +0200
Message-ID: <20170513102229.22579-2-x-linux@infra-silbe.de>
References: <20170513102229.22579-1-x-linux@infra-silbe.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170513102229.22579-1-x-linux@infra-silbe.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When handling uncompressed node names, we need to compare the last
component rather than the entire string.

Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
---
 scripts/dtc/libfdt/fdt_ro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/dtc/libfdt/fdt_ro.c b/scripts/dtc/libfdt/fdt_ro.c
index 3d00d2eee0e3..ca03ff87429c 100644
--- a/scripts/dtc/libfdt/fdt_ro.c
+++ b/scripts/dtc/libfdt/fdt_ro.c
@@ -64,6 +64,9 @@ static int _fdt_nodename_eq(const void *fdt, int offset,
 		/* short match */
 		return 0;
 
+	if (*p == '/')
+		/* Uncompressed node name. Only compare the last part. */
+		p = strrchr(p, '/') + 1;
 	if (memcmp(p, s, len) != 0)
 		return 0;
 
-- 
2.11.0
