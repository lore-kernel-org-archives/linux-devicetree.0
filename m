From: Nathan Fontenot <nfont@austin.ibm.com>
Subject: [PATCH 3/4] Makefile and Kconfig updates for of_dynamci
Date: Tue, 17 Nov 2009 20:56:22 -0600
Message-ID: <4B036256.9060809@austin.ibm.com>
References: <4B030FC2.9070401@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4B030FC2.9070401@austin.ibm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

Update the Kconfig and Makefile files for drivers/of, powerpc and microblaze
to properly configure for CONFIG_OF_DYNAMIC to build the of_dynamic code.

Signed-off-by: Nathan Fontenot <nfont@austin.ibm.com>
---

Index: test-devicetree/arch/microblaze/Kconfig
===================================================================
--- test-devicetree.orig/arch/microblaze/Kconfig	2009-11-17 13:52:45.000000000 -0600
+++ test-devicetree/arch/microblaze/Kconfig	2009-11-17 14:01:06.000000000 -0600
@@ -111,6 +111,7 @@
 
 config OF
 	def_bool y
+	select OF_DYNAMIC
 
 config PROC_DEVICETREE
 	bool "Support for device tree in /proc"
Index: test-devicetree/arch/powerpc/Kconfig
===================================================================
--- test-devicetree.orig/arch/powerpc/Kconfig	2009-11-17 13:52:45.000000000 -0600
+++ test-devicetree/arch/powerpc/Kconfig	2009-11-17 14:01:06.000000000 -0600
@@ -163,6 +163,7 @@
 
 config OF
 	def_bool y
+	select OF_DYNAMIC
 
 config PPC_UDBG_16550
 	bool
Index: test-devicetree/drivers/of/Kconfig
===================================================================
--- test-devicetree.orig/drivers/of/Kconfig	2009-11-17 13:52:48.000000000 -0600
+++ test-devicetree/drivers/of/Kconfig	2009-11-17 14:01:06.000000000 -0600
@@ -1,3 +1,7 @@
+config OF_DYNAMIC
+	bool
+	depends on OF
+
 config OF_DEVICE
 	def_bool y
 	depends on OF && (SPARC || PPC_OF || MICROBLAZE)
Index: test-devicetree/drivers/of/Makefile
===================================================================
--- test-devicetree.orig/drivers/of/Makefile	2009-11-17 13:52:48.000000000 -0600
+++ test-devicetree/drivers/of/Makefile	2009-11-17 14:01:06.000000000 -0600
@@ -1,4 +1,5 @@
 obj-y = base.o
+obj-$(CONFIG_OF_DYNAMIC) += of_dynamic.o
 obj-$(CONFIG_OF_DEVICE) += device.o platform.o
 obj-$(CONFIG_OF_GPIO)   += gpio.o
 obj-$(CONFIG_OF_I2C)	+= of_i2c.o
