From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 04/13] arm: enable building of all dtbs
Date: Thu,  8 Oct 2015 12:53:38 -0500
Message-ID: <1444326827-3565-5-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, arm@kernel.org, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
are not really dependent on a platform being enabled or any other kernel
config, so for testing coverage it is convenient to build all of the dtbs.
This builds all dts files in the tree, not just targets listed. This
is simpler for arm64 which has a bunch of sub-dirs.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>
---
 arch/arm/boot/dts/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 233159d..349eb12 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -740,5 +740,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 endif
 
+dtstree		:= $(srctree)/$(src)
+dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
+
 always		:= $(dtb-y)
 clean-files	:= *.dtb
-- 
2.1.4
