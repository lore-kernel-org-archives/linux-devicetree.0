From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 10/16] irqchip/gic: Add missing forward declaration for struct device
Date: Thu,  2 Feb 2017 18:22:20 +0200
Message-ID: <1486052546-19257-11-git-send-email-sakari.ailus@linux.intel.com>
References: <1486052546-19257-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1486052546-19257-1-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
Cc: sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, mika.westerberg@linux.intel.com, rafael@kernel.org, mark.rutland@arm.com, broonie@kernel.org, robh@kernel.org, ahs3@redhat.com
List-Id: devicetree@vger.kernel.org

A pointer to struct device is used in the header as a function argument
but there's no declaration for it. Add one.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/linux/irqchip/arm-gic.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/irqchip/arm-gic.h b/include/linux/irqchip/arm-gic.h
index eafc965..b16afa1 100644
--- a/include/linux/irqchip/arm-gic.h
+++ b/include/linux/irqchip/arm-gic.h
@@ -100,6 +100,7 @@
 
 #include <linux/irqdomain.h>
 
+struct device;
 struct device_node;
 struct gic_chip_data;
 
-- 
2.7.4

