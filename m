From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] kbuild: disable dtc simple_bus_reg warnings by default
Date: Fri, 30 Nov 2018 09:16:09 -0600
Message-ID: <20181130151610.30596-2-robh@kernel.org>
References: <20181130151610.30596-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130151610.30596-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

The updated version of dtc has a bug fix for simple_bus_reg warnings
and lots of warnings are generated now. So disable this warning by
default.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 8fe4468f9bda..46342f0198f6 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -252,6 +252,7 @@ DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-alias_paths \
 	-Wno-graph_child_address \
 	-Wno-graph_port \
+	-Wno-simple_bus_reg \
 	-Wno-unique_unit_address \
 	-Wno-pci_device_reg
 endif
-- 
2.19.1
