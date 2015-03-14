From: Frank Rowand <frowand.list@gmail.com>
Subject: [Patch 5/5] dt: unittest: breadcrumbs to reduce pain of future maintainers
Date: Sat, 14 Mar 2015 00:04:24 -0700
Message-ID: <5503DD78.5070808@gmail.com>
References: <5503C65F.4030000@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5503C65F.4030000@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sonymobile.com>

Fix warnings pointed out by checkpatch.

Checkpatch warns: externs should be avoided in .c files

Reducing pain for future maintainers - adding a comment so that anyone trying
to find where the extern data is created will be able to find it.
(grep will not find that location)


Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
---
 drivers/of/unittest.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: b/drivers/of/unittest.c
===================================================================
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -865,6 +865,10 @@ static int __init selftest_data_add(void
 {
 	void *selftest_data;
 	struct device_node *selftest_data_node, *np;
+	/*
+	 * __dtb_testcases_begin[] and __dtb_testcases_end[] are magically
+	 * created by cmd_dt_S_dtb in scripts/Makefile.lib
+	 */
 	extern uint8_t __dtb_testcases_begin[];
 	extern uint8_t __dtb_testcases_end[];
 	const int size = __dtb_testcases_end - __dtb_testcases_begin;
