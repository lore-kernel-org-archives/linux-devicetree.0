From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH] of: remove select of non-existant OF_DEVICE config symbol
Date: Wed, 26 Nov 2014 15:40:24 +0000
Message-ID: <1417016424-9647-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

The OF_OVERLAY option selects OF_DEVICE, but OF_DEVICE was removed in
commit ba166e900b, "of: remove CONFIG_OF_DEVICE". Remove the unnecessary
select.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
Reported-by: Paul Bolle <pebolle@tiscali.nl>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---

This fixes a bug in my devicetree/next branch which is included in
linux-next. It doesn't apply against mainline. I'll be applying it
directly to my tree.

 drivers/of/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 18b2e2539f84..b5e0c873d4e1 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -88,7 +88,6 @@ config OF_OVERLAY
 	bool
 	depends on OF
 	select OF_DYNAMIC
-	select OF_DEVICE
 	select OF_RESOLVE
 
 endmenu # OF
-- 
1.9.1
