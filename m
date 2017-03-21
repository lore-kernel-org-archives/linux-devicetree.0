From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/3] dtc: update warning settings for new bus and node/property name checks
Date: Tue, 21 Mar 2017 11:19:58 -0500
Message-ID: <20170321161958.9658-4-robh@kernel.org>
References: <20170321161958.9658-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170321161958.9658-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

dtc gained new warnings checking PCI and simple buses, unit address
formatting, and stricter node and property name checking. Disable the
new dtc warnings by default as there are 1000s. As before warnings are
enabled with W=1 or W=2. The strict node and property name checks are a
bit subjective, so they are only enabled for W=2.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib             | 9 ++++++++-
 scripts/dtc/update-dtc-source.sh | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a07f9014944..9ded5cd4c68b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -280,7 +280,14 @@ DTC ?= $(objtree)/scripts/dtc/dtc
 
 # Disable noisy checks by default
 ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
-DTC_FLAGS += -Wno-unit_address_vs_reg
+DTC_FLAGS += -Wno-unit_address_vs_reg \
+	-Wno-simple_bus_reg \
+	-Wno-unit_address_format
+endif
+
+ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),2)
+DTC_FLAGS += -Wnode_name_chars_strict \
+	-Wproperty_name_chars_strict
 endif
 
 # Generate an assembly file to wrap the output of the device tree compiler
-- 
2.10.1
