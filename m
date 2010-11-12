From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 1/4] x86/of: Support building device tree blob(s) into image.
Date: Thu, 11 Nov 2010 16:03:47 -0800
Message-ID: <1b004c685c67c07a5a0b2b16b3a00dd016e2b759.1289520079.git.dirk.brandewie@gmail.com>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch adds support for linking device tree blobs into vmlinux.
The blobs linked into the image is controlled via kernel config
variables

Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/x86/Kconfig          |    6 +++++-
 arch/x86/boot/dts/Kconfig |    8 ++++++++
 arch/x86/kernel/Makefile  |   11 +++++++++++
 3 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 arch/x86/boot/dts/Kconfig

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5904f38..62c195d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -299,13 +299,17 @@ config X86_BIGSMP
 	---help---
 	  This option is needed for the systems that have more than 8 CPUs
 
-config X86_OF
+menuconfig X86_OF
 	bool "Support for device tree"
 	select OF
 	select OF_FLATTREE
 	---help---
 	  Device tree support on X86.
 
+if X86_OF
+source "arch/x86/boot/dts/Kconfig
+endif
+
 if X86_32
 config X86_EXTENDED_PLATFORM
 	bool "Support for extended (non-PC) x86 platforms"
diff --git a/arch/x86/boot/dts/Kconfig b/arch/x86/boot/dts/Kconfig
new file mode 100644
index 0000000..5380b6b
--- /dev/null
+++ b/arch/x86/boot/dts/Kconfig
@@ -0,0 +1,8 @@
+config CE4100_DTB
+       bool "Intel CE4100"
+       depends on X86_OF && KERNEL_DTB
+
+config TEST_DTB
+       bool "Test DTS"
+       depends on  X86_OF && KERNEL_DTB
+
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 586df14..cf15e8c 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -113,6 +113,17 @@ obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
 obj-$(CONFIG_SWIOTLB)			+= pci-swiotlb.o
 obj-$(CONFIG_X86_OF)			+= prom.o
 
+ifeq ($(CONFIG_KERNEL_DTB),y)
+obj-$(CONFIG_CE4100_DTB) += ce4100.dtb.o
+obj-$(CONFIG_TEST_DTB) += test.dtb.o
+endif
+
+dtstree	:= $(srctree)/arch/x86/boot/dts
+
+$(obj)/%.dtb: $(dtstree)/%.dts
+	$(call if_changed,dtc)
+
+
 ###
 # 64 bit specific files
 ifeq ($(CONFIG_X86_64),y)
-- 
1.7.2.3
