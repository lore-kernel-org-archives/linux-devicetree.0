From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH] of/fdt: don't ignore errors from of_setup_earlycon
Date: Tue, 10 Sep 2019 07:58:33 +0200
Message-ID: <20190910055833.28324-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

If of_setup_earlycon we should keep on iterating earlycon options
instead of breaking out of the loop.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/of/fdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 9cdf14b9aaab..2f6bd03d8e27 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -946,8 +946,8 @@ int __init early_init_dt_scan_chosen_stdout(void)
 		if (fdt_node_check_compatible(fdt, offset, match->compatible))
 			continue;
 
-		of_setup_earlycon(match, offset, options);
-		return 0;
+		if (of_setup_earlycon(match, offset, options) == 0)
+			return 0;
 	}
 	return -ENODEV;
 }
-- 
2.20.1
