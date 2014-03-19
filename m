From: Tanmay Inamdar <tinamdar@apm.com>
Subject: [PATCH v5 4/4] MAINTAINERS: entry for APM X-Gene PCIe host driver
Date: Wed, 19 Mar 2014 16:12:42 -0700
Message-ID: <1395270762-6055-5-git-send-email-tinamdar@apm.com>
References: <1395270762-6055-1-git-send-email-tinamdar@apm.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1395270762-6055-1-git-send-email-tinamdar@apm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Rob Landley <rob@landley.net>, Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@apm.com, jcm@redhat.com, Tanmay Inamdar <tinamdar@apm.com>
List-Id: devicetree@vger.kernel.org

Add entry for AppliedMicro X-Gene PCIe host driver.

Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
---
 MAINTAINERS |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b3fdb0f..cc10644 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6638,6 +6638,13 @@ L:	linux-pci@vger.kernel.org
 S:	Maintained
 F:	drivers/pci/host/*designware*
 
+PCI DRIVER FOR APPLIEDMICRO XGENE
+M:	Tanmay Inamdar <tinamdar@apm.com>
+L:	linux-pci@vger.kernel.org
+L:	linux-arm-kernel@lists.infradead.org
+S:	Maintained
+F:	drivers/pci/host/pci-xgene.c
+
 PCMCIA SUBSYSTEM
 P:	Linux PCMCIA Team
 L:	linux-pcmcia@lists.infradead.org
-- 
1.7.9.5

