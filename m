From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V6 03/25] MIPS: Add dtbs_install target
Date: Thu, 25 Dec 2014 09:48:58 -0800
Message-ID: <1419529760-9520-4-git-send-email-cernekee@gmail.com>
References: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jaedon.shin@gmail.com, abrestic@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Andrew Bresticker <abrestic@chromium.org>

Add the dtbs_install Makefile target to install the dtb files into
$INSTALL_DTBS_PATH.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Tested-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 269db7e..6aadefb 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -352,6 +352,10 @@ PHONY += dtbs
 dtbs: scripts
 	$(Q)$(MAKE) $(build)=arch/mips/boot/dts
 
+PHONY += dtbs_install
+dtbs_install:
+	$(Q)$(MAKE) $(dtbinst)=arch/mips/boot/dts
+
 archprepare:
 ifdef CONFIG_MIPS32_N32
 	@echo '  Checking missing-syscalls for N32'
@@ -388,6 +392,7 @@ define archhelp
 	echo '  uImage               - U-Boot image'
 	echo '  uImage.gz            - U-Boot image (gzip)'
 	echo '  dtbs                 - Device-tree blobs for enabled boards'
+	echo '  dtbs_install         - Install dtbs to $(INSTALL_DTBS_PATH)'
 	echo
 	echo '  These will be default as appropriate for a configured platform.'
 endef
-- 
2.1.1
