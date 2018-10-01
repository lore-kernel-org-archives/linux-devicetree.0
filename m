From: Rob Herring <robh@kernel.org>
Subject: [PATCH v4 8/9] c6x: enable building all dtbs
Date: Mon,  1 Oct 2018 10:25:30 -0500
Message-ID: <20181001152531.3385-9-robh@kernel.org>
References: <20181001152531.3385-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001152531.3385-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, linux-c6x-dev@linux-c6x.org
List-Id: devicetree@vger.kernel.org

Enable the 'dtbs' target for c6x. This allows building all the dts
files in arch/c6x/boot/dts/ for enabled platforms or when
COMPILE_TEST and OF_ALL_DTBS are enabled.

Cc: Mark Salter <msalter@redhat.com>
Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
Cc: linux-c6x-dev@linux-c6x.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/c6x/boot/dts/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/c6x/boot/dts/Makefile b/arch/c6x/boot/dts/Makefile
index fd937f781d16..f438285c3640 100644
--- a/arch/c6x/boot/dts/Makefile
+++ b/arch/c6x/boot/dts/Makefile
@@ -5,6 +5,12 @@
 
 DTC_FLAGS ?= -p 1024
 
+dtb-$(CONFIG_SOC_TMS320C6455) += dsk6455.dtb
+dtb-$(CONFIG_SOC_TMS320C6457) += evmc6457.dtb
+dtb-$(CONFIG_SOC_TMS320C6472) += evmc6472.dtb
+dtb-$(CONFIG_SOC_TMS320C6474) += evmc6474.dtb
+dtb-$(CONFIG_SOC_TMS320C6678) += evmc6678.dtb
+
 ifneq ($(DTB),)
 obj-y += $(DTB).dtb.o
 endif
-- 
2.17.1
