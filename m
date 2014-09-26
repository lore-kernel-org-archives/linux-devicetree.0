From: Tanmay Inamdar <tinamdar@apm.com>
Subject: [PATCH v10 4/4] MAINTAINERS: entry for APM X-Gene PCIe host driver
Date: Fri, 26 Sep 2014 14:08:27 -0700
Message-ID: <1411765707-28822-5-git-send-email-tinamdar@apm.com>
References: <1411765707-28822-1-git-send-email-tinamdar@apm.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1411765707-28822-1-git-send-email-tinamdar@apm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Rob Landley <rob@landley.net>, Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@apm.com, jcm@redhat.com, Tanmay Inamdar <tinamdar@apm.com>
List-Id: devicetree@vger.kernel.org

Add entry for AppliedMicro X-Gene PCIe host driver.

Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 670b3dc..b18bc49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6942,6 +6942,14 @@ L:	linux-pci@vger.kernel.org
 S:	Maintained
 F:	drivers/pci/host/*spear*
 
+PCI DRIVER FOR APPLIEDMICRO XGENE
+M:	Tanmay Inamdar <tinamdar@apm.com>
+L:	linux-pci@vger.kernel.org
+L:	linux-arm-kernel@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/xgene-pci.txt
+F:	drivers/pci/host/pci-xgene.c
+
 PCMCIA SUBSYSTEM
 P:	Linux PCMCIA Team
 L:	linux-pcmcia@lists.infradead.org
-- 
1.9.1

