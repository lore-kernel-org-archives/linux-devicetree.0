From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] of: make unittest select OF_EARLY_FLATTREE instead of depend on it
Date: Tue,  2 Jun 2015 17:46:44 -0500
Message-ID: <1433285204-4307-4-git-send-email-robh@kernel.org>
References: <1433285204-4307-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433285204-4307-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DT unittest currently requires an arch (typically) to select
OF_EARLY_FLATTREE. Remove this dependency by selecting it directly so that
the unittest can be enabled easily on any architecture. With this and the
prior commit, we can easily enable and run unittests starting with x86
defconfig rather than hunting for the combination of config options to
enable OF on x86.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 415b51d..7e76af9 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -8,7 +8,8 @@ if OF
 
 config OF_UNITTEST
 	bool "Device Tree runtime unit tests"
-	depends on OF_IRQ && OF_EARLY_FLATTREE
+	depends on OF_IRQ
+	select OF_EARLY_FLATTREE
 	select OF_RESOLVE
 	help
 	  This option builds in test cases for the device tree infrastructure
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
