From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] microblaze/PCI: remove duplicated include from pci-common.c
Date: Mon, 11 Mar 2013 22:13:30 +0800
Message-ID: <CAPgLHd9ufsjGd9CvVf7y3jMXoN=rh7uc7jxiwZ9FHSeJ+XRzUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: monstr@monstr.eu, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 arch/microblaze/pci/pci-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/microblaze/pci/pci-common.c b/arch/microblaze/pci/pci-common.c
index 9ea521e..bdb8ea1 100644
--- a/arch/microblaze/pci/pci-common.c
+++ b/arch/microblaze/pci/pci-common.c
@@ -30,7 +30,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
-#include <linux/pci.h>
 #include <linux/export.h>
 
 #include <asm/processor.h>
