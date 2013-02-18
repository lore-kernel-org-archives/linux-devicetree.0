From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] <linux/of_platform.h>: fix compilation warnings with DT disabled
Date: Tue, 19 Feb 2013 02:58:25 +0300
Message-ID: <201302190258.25726.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org
Cc: vladimir.barinov@cogentembedded.com, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

=46ix the following compilation warnings (in Simon Horman's renesas.git=
 repo):

In file included from arch/arm/mach-shmobile/setup-r8a7779.c:24:0:
include/linux/of_platform.h:107:13: warning: =E2=80=98struct of_device_=
id=E2=80=99 declared
inside parameter list [enabled by default]
include/linux/of_platform.h:107:13: warning: its scope is only this def=
inition
or declaration, which is probably not what you want [enabled by default=
]
include/linux/of_platform.h:107:13: warning: =E2=80=98struct device_nod=
e=E2=80=99 declared
inside parameter list [enabled by default]

<linux/of_platform.h> only #include's headers with definitions of the a=
bove
mentioned structures if CONFIG_OF_DEVICE=3Dy but uses them even if not.=
 One
solution is to move some #include's out of #ifdef CONFIG_OF_DEVICE and =
use
incomplete declarations for the rest of the structures where the #ifdef=
 move
doesn't help...

Reported-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Actually, it compiles eve without 'struct device_node' declared, I have=
n't
found the reason of this, so left it there...

 include/linux/of_platform.h |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: linux/include/linux/of_platform.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux.orig/include/linux/of_platform.h
+++ linux/include/linux/of_platform.h
@@ -11,9 +11,10 @@
  *
  */
=20
-#ifdef CONFIG_OF_DEVICE
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
+
+#ifdef CONFIG_OF_DEVICE
 #include <linux/pm.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -100,7 +101,7 @@ extern int of_platform_populate(struct d
=20
 #if !defined(CONFIG_OF_ADDRESS)
 struct of_dev_auxdata;
-struct device;
+struct device_node;
 static inline int of_platform_populate(struct device_node *root,
 					const struct of_device_id *matches,
 					const struct of_dev_auxdata *lookup,
