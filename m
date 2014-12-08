From: Tsung-Han Lin <tsunghan.tw@gmail.com>
Subject: [PATCH] staging:board: fix build errors and warnings
Date: Tue,  9 Dec 2014 01:24:09 +0800
Message-ID: <1418059449-15108-1-git-send-email-tsunghan.tw@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, damm+renesas@opensource.se, linux-kernel@vger.kernel.org, robh+dt@kernel.org, grant.likely@linaro.org, horms+renesas@verge.net.au
List-Id: devicetree@vger.kernel.org

Add dummy implementation of 'of_find_all_nodes',
and remove the unnecessary 'of_can_translate_address',
which is already removed in commit
d9c6866be8a145e32da616d8dcbae806032d75b5 ("of: kill off
of_can_translate_address"), to fix the build errors and warnings
found by sparse.

Signed-off-by: Tsung-Han Lin <tsunghan.tw@gmail.com>
---
 drivers/staging/board/board.c | 3 +--
 include/linux/of.h            | 5 +++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/board/board.c b/drivers/staging/board/board.c
index 6050fbdfd31f..d5a6abc84519 100644
--- a/drivers/staging/board/board.c
+++ b/drivers/staging/board/board.c
@@ -11,8 +11,7 @@ static bool find_by_address(u64 base_address)
 	struct resource res;
 
 	while (dn) {
-		if (of_can_translate_address(dn)
-		    && !of_address_to_resource(dn, 0, &res)) {
+		if (!of_address_to_resource(dn, 0, &res)) {
 			if (res.start == base_address) {
 				of_node_put(dn);
 				return true;
diff --git a/include/linux/of.h b/include/linux/of.h
index dfde07e77a63..c2c5021c1ee4 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -616,6 +616,11 @@ static inline const char *of_prop_next_string(struct property *prop,
 	return NULL;
 }
 
+static inline struct device_node *of_find_all_nodes(struct device_node *prev)
+{
+	return NULL;
+}
+
 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
 #endif /* CONFIG_OF */
-- 
2.1.0
