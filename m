From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of: enable unittests on UML
Date: Tue, 28 Nov 2017 15:19:34 -0600
Message-ID: <20171128211934.15283-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The unittests can run on UML, but OF_IRQ and OF_ADDRESS need to be
enabled. Rework the kconfig dependencies to enable the unittests. The
unittests cannot build on Sparc, so we need to add an explicit
dependency for !SPARC.

There's one failure in overlay tests because the base DT is not
unflattened early.

Cc: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index ad9a9578f9c4..5020d7ef7494 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -13,7 +13,8 @@ if OF
 
 config OF_UNITTEST
 	bool "Device Tree runtime unit tests"
-	depends on OF_IRQ
+	depends on !SPARC
+	select IRQ_DOMAIN
 	select OF_EARLY_FLATTREE
 	select OF_RESOLVE
 	help
@@ -61,7 +62,7 @@ config OF_DYNAMIC
 
 config OF_ADDRESS
 	def_bool y
-	depends on !SPARC && HAS_IOMEM
+	depends on !SPARC && (HAS_IOMEM || UML)
 	select OF_ADDRESS_PCI if PCI
 
 config OF_ADDRESS_PCI
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
