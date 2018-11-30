From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/3] kbuild: Enable dtc graph_port warning by default
Date: Fri, 30 Nov 2018 09:16:10 -0600
Message-ID: <20181130151610.30596-3-robh@kernel.org>
References: <20181130151610.30596-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130151610.30596-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

All the 'graph_port' warnings have been fixed or have pending fixes, so
we can enable it by default now.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 46342f0198f6..8e10eb7428ab 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -251,7 +251,6 @@ DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-avoid_unnecessary_addr_size \
 	-Wno-alias_paths \
 	-Wno-graph_child_address \
-	-Wno-graph_port \
 	-Wno-simple_bus_reg \
 	-Wno-unique_unit_address \
 	-Wno-pci_device_reg
-- 
2.19.1
