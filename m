From: Rob Herring <robh@kernel.org>
Subject: [PATCH] char/rtc: Use of_node_name_eq for node name comparisons
Date: Wed,  5 Dec 2018 13:50:19 -0600
Message-ID: <20181205195050.4759-3-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Convert string compares of DT node names to use of_node_name_eq helper
instead. This removes direct access to the node name pointer.

The open coded iterating thru the child node names is converted to use
for_each_child_of_node() instead.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/char/rtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/rtc.c b/drivers/char/rtc.c
index 4948c8bda6b1..62b7c721c732 100644
--- a/drivers/char/rtc.c
+++ b/drivers/char/rtc.c
@@ -866,8 +866,8 @@ static int __init rtc_init(void)
 #ifdef CONFIG_SPARC32
 	for_each_node_by_name(ebus_dp, "ebus") {
 		struct device_node *dp;
-		for (dp = ebus_dp; dp; dp = dp->sibling) {
-			if (!strcmp(dp->name, "rtc")) {
+		for_each_child_of_node(ebus_dp, dp) {
+			if (of_node_name_eq(dp, "rtc")) {
 				op = of_find_device_by_node(dp);
 				if (op) {
 					rtc_port = op->resource[0].start;
-- 
2.19.1
