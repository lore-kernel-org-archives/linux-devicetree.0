From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 07/14] of/platform: Probe "isa" busses by default
Date: Mon, 19 Sep 2016 22:21:24 +0100
Message-ID: <20160919212132.28893-8-paul.burton@imgtec.com>
References: <20160919212132.28893-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160919212132.28893-1-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Since commit 44a7185c2ae6 ("of/platform: Add common method to populate
default bus") platforms calling of_platform_bus_probe from an initcall
is either a rather unsafe race with of_platform_default_populate_init or
a no-op. The MIPS Malta board needs to probe devices under an ISA bus,
which we do support in the of_busses array but until now haven't
included in of_default_bus_match_table.

Add an "isa" entry to of_default_bus_match_table such that we can just
accept use of of_platform_default_populate_init & remove the
Malta-specific match table in a later patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

Changes in v2:
- New patch to deal with 44a7185c2ae6

 drivers/of/platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f39ccd5..d85e431 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -29,6 +29,7 @@
 const struct of_device_id of_default_bus_match_table[] = {
 	{ .compatible = "simple-bus", },
 	{ .compatible = "simple-mfd", },
+	{ .compatible = "isa", },
 #ifdef CONFIG_ARM_AMBA
 	{ .compatible = "arm,amba-bus", },
 #endif /* CONFIG_ARM_AMBA */
-- 
2.9.3
