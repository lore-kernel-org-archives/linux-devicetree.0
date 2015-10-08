From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 11/13] nios2: enable building of all dtbs
Date: Thu,  8 Oct 2015 12:53:45 -0500
Message-ID: <1444326827-3565-12-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org
List-Id: devicetree@vger.kernel.org

Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
are not really dependent on a platform being enabled or any other kernel
config, so for testing coverage it is convenient to build all of the dtbs.
This builds all dts files in the tree, not just targets listed.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: nios2-dev@lists.rocketboards.org
---
 arch/nios2/boot/dts/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/nios2/boot/dts/Makefile b/arch/nios2/boot/dts/Makefile
index 1c52039..0b6bcf1 100644
--- a/arch/nios2/boot/dts/Makefile
+++ b/arch/nios2/boot/dts/Makefile
@@ -1,3 +1,6 @@
+dtstree		:= $(srctree)/$(src)
+dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
+
 always          := $(dtb-y)
 clean-files     := *.dtb
 
-- 
2.1.4
