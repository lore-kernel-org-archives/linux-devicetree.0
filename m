From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: Re: [PATCH 3/4] Makefile and Kconfig updates for of_dynamci
Date: Wed, 18 Nov 2009 15:46:56 -0600
Message-ID: <4B046B50.4010802@austin.ibm.com>
References: <4B030FC2.9070401@austin.ibm.com> <4B036256.9060809@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B036256.9060809-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Update the Kconfig and Makefile files for drivers/of, powerpc and microblaze
to properly configure for CONFIG_OF_DYNAMIC to build the of_dynamic code.

Updated patch that should apply cleanly to test-devicetree, now with diffstat
output.

Signed-off-by: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
---
 arch/microblaze/Kconfig |    1 +
 arch/powerpc/Kconfig    |    1 +
 drivers/of/Kconfig      |    4 ++++
 drivers/of/Makefile     |    1 +
 4 files changed, 7 insertions(+)

Index: test-devicetree/arch/microblaze/Kconfig
===================================================================
--- test-devicetree.orig/arch/microblaze/Kconfig	2009-11-18 17:34:36.000000000 -0600
+++ test-devicetree/arch/microblaze/Kconfig	2009-11-18 19:26:22.000000000 -0600
@@ -112,6 +112,7 @@
 config OF
 	def_bool y
 	select OF_FLATTREE
+	select OF_DYNAMIC
 
 config PROC_DEVICETREE
 	bool "Support for device tree in /proc"
Index: test-devicetree/arch/powerpc/Kconfig
===================================================================
--- test-devicetree.orig/arch/powerpc/Kconfig	2009-11-18 17:34:36.000000000 -0600
+++ test-devicetree/arch/powerpc/Kconfig	2009-11-18 19:25:25.000000000 -0600
@@ -164,6 +164,7 @@
 config OF
 	def_bool y
 	select OF_FLATTREE
+	select OF_DYNAMIC
 
 config PPC_UDBG_16550
 	bool
Index: test-devicetree/drivers/of/Kconfig
===================================================================
--- test-devicetree.orig/drivers/of/Kconfig	2009-11-18 17:34:36.000000000 -0600
+++ test-devicetree/drivers/of/Kconfig	2009-11-18 19:24:00.000000000 -0600
@@ -2,6 +2,10 @@
 	bool
 	depends on OF
 
+config OF_DYNAMIC
+	bool
+	depends on OF
+
 config OF_DEVICE
 	def_bool y
 	depends on OF && (SPARC || PPC_OF || MICROBLAZE)
Index: test-devicetree/drivers/of/Makefile
===================================================================
--- test-devicetree.orig/drivers/of/Makefile	2009-11-18 17:34:36.000000000 -0600
+++ test-devicetree/drivers/of/Makefile	2009-11-18 19:24:00.000000000 -0600
@@ -1,5 +1,6 @@
 obj-y = base.o
 obj-$(CONFIG_OF_FLATTREE) += fdt.o
+obj-$(CONFIG_OF_DYNAMIC) += of_dynamic.o
 obj-$(CONFIG_OF_DEVICE) += device.o platform.o
 obj-$(CONFIG_OF_GPIO)   += gpio.o
 obj-$(CONFIG_OF_I2C)	+= of_i2c.o
