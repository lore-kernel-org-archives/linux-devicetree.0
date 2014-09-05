From: Robert Richter <rric@kernel.org>
Subject: [PATCH 3/6] dts, arm/arm64: Remove dtbs build rules in sub-makes
Date: Fri,  5 Sep 2014 08:48:09 +0200
Message-ID: <1409899692-1455-4-git-send-email-rric@kernel.org>
References: <1409899692-1455-1-git-send-email-rric@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1409899692-1455-1-git-send-email-rric@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.cz>
Cc: Robert Richter <rrichter@cavium.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Robert Richter <rrichter@cavium.com>

Add dtb files to build targets and let kbuild handle them. Thus,
special dtbs rules can be removed. This eases Makefiles and the
implementation of the support of vendor dtb subdirectories.

Signed-off-by: Robert Richter <rrichter@cavium.com>
---
 arch/arm/Makefile            |  2 +-
 arch/arm/boot/dts/Makefile   | 10 ++--------
 arch/arm64/Makefile          |  2 +-
 arch/arm64/boot/dts/Makefile |  8 ++------
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 1963d9a9a2c4..4d13c6d0a0cc 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -315,7 +315,7 @@ $(BOOT_TARGETS): vmlinux
 PHONY += dtbs dtbs_install
 
 dtbs: prepare scripts
-	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $@
+	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE)
 
 dtbs_install:
 	$(Q)$(MAKE) $(dtbinst)=$(boot)/dts MACHINE=$(MACHINE)
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ab40afb87fb2..cb63c515247c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -492,13 +492,7 @@ dtb-$(CONFIG_MACH_DOVE) += dove-cm-a510.dtb \
 	dove-d3plug.dtb \
 	dove-dove-db.dtb
 
-targets += dtbs dtbs_install
-targets += $(dtb-y)
 endif
 
-# *.dtb used to be generated in the directory above. Clean out the
-# old build results so people don't accidentally use them.
-dtbs: $(addprefix $(obj)/, $(dtb-y))
-	$(Q)rm -f $(obj)/../*.dtb
-
-clean-files := *.dtb
+always		:= $(dtb-y)
+clean-files	:= *.dtb
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 1627861e9bbd..c21b21d6e72d 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -74,7 +74,7 @@ zinstall install: vmlinux
 PHONY += dtbs dtbs_install
 
 dtbs: prepare scripts
-	$(Q)$(MAKE) $(build)=$(boot)/dts $@
+	$(Q)$(MAKE) $(build)=$(boot)/dts
 
 dtbs_install:
 	$(Q)$(MAKE) $(dtbinst)=$(boot)/dts
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 0a14c3828301..d116da5f2f20 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,9 +1,5 @@
 dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
 dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
 
-targets += dtbs dtbs_install
-targets += $(dtb-y)
-
-dtbs: $(addprefix $(obj)/, $(dtb-y))
-
-clean-files := *.dtb
+always		:= $(dtb-y)
+clean-files	:= *.dtb
-- 
2.0.1
