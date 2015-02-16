From: "Matwey V. Kornilov" <matwey@sai.msu.ru>
Subject: [PATCH v2 1/2] of: Add prompt for OF_OVERLAY config
Date: Mon, 16 Feb 2015 09:27:23 +0300
Message-ID: <1424068044-3457-1-git-send-email-matwey@sai.msu.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pebolle@tiscali.nl, "Matwey V. Kornilov" <matwey@sai.msu.ru>
List-Id: devicetree@vger.kernel.org

Add prompt for OF_OVERLAY config option to make in visible in menuconfig/xconfig
to make user be able to set or unset this option.

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
Changes from v1:
 - Explanation commit message has been added to 1/2
 - Add 2/2 (drop depends on OF) as suggested by <pebolle@tiscali.nl>

 drivers/of/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index b5e0c87..fdca685 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -85,7 +85,7 @@ config OF_RESOLVE
 	bool
 
 config OF_OVERLAY
-	bool
+	bool "Device Tree overlays"
 	depends on OF
 	select OF_DYNAMIC
 	select OF_RESOLVE
-- 
2.1.4
