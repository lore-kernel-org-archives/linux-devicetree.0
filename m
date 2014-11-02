From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [PATCH] ARM: kbuild: Fix forced rebuild after 'make dtbs'
Date: Sun,  2 Nov 2014 20:52:29 +0000
Message-ID: <1414961549-31666-1-git-send-email-jason@lakedaemon.net>
References: <CACRpkdYmJWy1_vs0tWRA7SvkQnvbXXKqf7pHpH5b5tZ6vR+KJg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYmJWy1_vs0tWRA7SvkQnvbXXKqf7pHpH5b5tZ6vR+KJg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

After this patch:

  f4d4ffc03efc kbuild: dtbs_install: new make target

was added the kernel tree, Linus Walleij noticed that 'make dtbs' forced
a following 'make zImage' to rebuild the entire tree, even though
nothing had changed.  His report:

  After this patch a while back I have observed the following behaviour
  of the kernel build:

  make zImage
  make zImage
  -> incremental build, just relink

  make zImage
  make dtbs
  make zImage
  -> The whole kernel gets rebuilt

  So now if I happen to recompile my device trees, I suddenly want
  the entire zImage to be rebuilt to? It's by definition not changes
  that affect the kernel build :-(

  I noticed this because my build scripts calls make dtbs && make
  zImage, and started to rebuild absolutely everything all the time.

To fix this, we make only the dtbs_install target depend on the prepare
target.  It's needed to make sure KERNELVERSION is calculated prior to
installing.

Fixes: f4d4ffc03efc: ("kbuild: dtbs_install: new make target")
Reported-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Tested-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
---
Note: I've no idea if this is a 100% correct solution or not.  I know it's
definitely better than what we have currently.  If there is another way to
guarantee KERNELVERSION is set other than depending on 'prepare', I'd love to
hear it.

thx,

Jason.

 arch/arm/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 034a94904d69..ae1c278128f8 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -312,7 +312,9 @@ $(INSTALL_TARGETS):
 	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $(boot)/dts/$@
 
 PHONY += dtbs dtbs_install
-dtbs dtbs_install: prepare scripts
+dtbs: scripts
+	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $@
+dtbs_install: prepare scripts
 	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $@
 
 # We use MRPROPER_FILES and CLEAN_FILES now
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
