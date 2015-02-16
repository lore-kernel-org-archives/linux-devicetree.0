From: "Matwey V. Kornilov" <matwey@sai.msu.ru>
Subject: [PATCH v2 2/2] of: Drop superfluous dependance for OF_OVERLAY
Date: Mon, 16 Feb 2015 09:27:24 +0300
Message-ID: <1424068044-3457-2-git-send-email-matwey@sai.msu.ru>
References: <1424068044-3457-1-git-send-email-matwey@sai.msu.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424068044-3457-1-git-send-email-matwey@sai.msu.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pebolle@tiscali.nl, "Matwey V. Kornilov" <matwey@sai.msu.ru>
List-Id: devicetree@vger.kernel.org

The whole menu already depends on OF, so there is no need to additionaly specify it.

Suggested-by: Paul Bolle <pebolle@tiscali.nl>
Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/of/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index fdca685..4831137 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -86,7 +86,6 @@ config OF_RESOLVE
 
 config OF_OVERLAY
 	bool "Device Tree overlays"
-	depends on OF
 	select OF_DYNAMIC
 	select OF_RESOLVE
 
-- 
2.1.4
