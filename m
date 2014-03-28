From: Grant Likely <grant.likely@linaro.org>
Subject: [RFC 1/5] of: Add support for ePAPR "stdout-path" property
Date: Fri, 28 Mar 2014 09:08:01 -0700
Message-ID: <1396022885-6102-2-git-send-email-grant.likely@linaro.org>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396022885-6102-1-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, christoffer.dall@linaro.org, linux-kernel@vger.kernel.org, olof@lixom.net, benh@kernel.crashing.org, rob.herring@linaro.org
Cc: Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

ePAPR 1.1 defines the "stdout-path" property for specifying the console
device, but Linux currently only handles the older "linux,stdout-path"
property. This patch adds parsing for the new property name.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
---
 drivers/of/base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 418a4ff9d97c..be2861d69b02 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1955,9 +1955,9 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 		of_chosen = of_find_node_by_path("/chosen@0");
 
 	if (of_chosen) {
-		const char *name;
-
-		name = of_get_property(of_chosen, "linux,stdout-path", NULL);
+		const char *name = of_get_property(of_chosen, "stdout-path", NULL);
+		if (!name)
+			name = of_get_property(of_chosen, "linux,stdout-path", NULL);
 		if (name)
 			of_stdout = of_find_node_by_path(name);
 	}
-- 
1.8.3.2
