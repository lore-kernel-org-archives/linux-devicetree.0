From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V2 2/2] MIPS: Add dtbs_install target
Date: Tue, 23 Dec 2014 08:43:52 -0800
Message-ID: <1419353032-10340-2-git-send-email-abrestic@chromium.org>
References: <1419353032-10340-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419353032-10340-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: devicetree@vger.kernel.org

Add the dtbs_install Makefile target to install the dtb files into
$INSTALL_DTBS_PATH.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
No changes from v1.
---
 arch/mips/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 9c4b9c8..6ff26bc 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -356,6 +356,10 @@ PHONY += dtbs
 dtbs: scripts
 	$(Q)$(MAKE) $(build)=arch/mips/boot/dts
 
+PHONY += dtbs_install
+dtbs_install:
+	$(Q)$(MAKE) $(dtbinst)=arch/mips/boot/dts
+
 archprepare:
 ifdef CONFIG_MIPS32_N32
 	@echo '  Checking missing-syscalls for N32'
@@ -392,6 +396,7 @@ define archhelp
 	echo '  uImage               - U-Boot image'
 	echo '  uImage.gz            - U-Boot image (gzip)'
 	echo '  dtbs                 - Device-tree blobs for enabled boards'
+	echo '  dtbs_install         - Install dtbs to $(INSTALL_DTBS_PATH)'
 	echo
 	echo '  These will be default as appropriate for a configured platform.'
 endef
-- 
2.2.0.rc0.207.ga3a616c
