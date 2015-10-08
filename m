From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 01/13] of: add config option to enable building of all dtbs
Date: Thu,  8 Oct 2015 12:53:35 -0500
Message-ID: <1444326827-3565-2-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
are not really dependent on a platform being enabled or any other kernel
config, so for testing coverage it is convenient to build all of the dtbs.

In order to only build dtbs, this option can be used by creating an
allno.config file containing:
CONFIG_COMPILE_TEST=y
CONFIG_OF=y
CONFIG_OF_ALL_DTBS=y

And then running:
make KCONFIG_ALLCONFIG=1 allnoconfig
make dtbs

While building the dtbs themselves don't need a cross compiler, the
scripts dependency does need one. This can be hacked around by
commenting out "subdir-y += mod" in scripts/Makefile.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 59bb855..e2a4841 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -23,6 +23,16 @@ config OF_UNITTEST
 
 	  If unsure, say N here, but this option is safe to enable.
 
+config OF_ALL_DTBS
+	bool "Build all Device Tree Blobs"
+	depends on COMPILE_TEST
+	select DTC
+	help
+	  This option builds all possible Device Tree Blobs (DTBs) for the
+	  current architecture.
+
+	  If unsure, say N here, but this option is safe to enable.
+
 config OF_FLATTREE
 	bool
 	select DTC
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
