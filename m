From: Zhou Wang <wangzhou1@hisilicon.com>
Subject: [PATCH v12 8/8] MAINTAINERS: Add pcie-hisi maintainer
Date: Mon, 26 Oct 2015 19:35:50 +0800
Message-ID: <1445859350-26375-9-git-send-email-wangzhou1@hisilicon.com>
References: <1445859350-26375-1-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1445859350-26375-1-git-send-email-wangzhou1@hisilicon.com>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, jingoohan1@gmail.com, pratyush.anand@gmail.com, Arnd Bergmann <arnd@arndb.de>, linux@arm.linux.org.uk, thomas.petazzoni@free-electrons.com, gabriele.paoloni@huawei.com, lorenzo.pieralisi@arm.com, james.morse@arm.com, Liviu.Dudau@arm.com, jason@lakedaemon.net, robh@kernel.org, gabriel.fernandez@linaro.org, Minghuan.Lian@freescale.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zhangjukuo@huawei.com, qiuzhenfa@hisilicon.com, liudongdong3@huawei.com, qiujiang@huawei.com, xuwei5@hisilicon.com, liguozhu@hisilicon.com, Zhou Wang <wangzhou1@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ba7ab7..944a229 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8047,6 +8047,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/xgene-pci-msi.txt
 F:	drivers/pci/host/pci-xgene-msi.c
 
+PCIE DRIVER FOR HISILICON
+M:	Zhou Wang <wangzhou1@hisilicon.com>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
+F:	drivers/pci/host/pcie-hisi.c
+
 PCMCIA SUBSYSTEM
 P:	Linux PCMCIA Team
 L:	linux-pcmcia@lists.infradead.org
-- 
1.9.1
