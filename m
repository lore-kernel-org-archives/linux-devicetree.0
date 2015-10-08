From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 09/13] mips: enable building of all dtbs
Date: Thu,  8 Oct 2015 12:53:43 -0500
Message-ID: <1444326827-3565-10-git-send-email-robh@kernel.org>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1444326827-3565-1-git-send-email-robh@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
are not really dependent on a platform being enabled or any other kernel
config, so for testing coverage it is convenient to build all of the dtbs.
This builds all dts files in the tree, not just targets listed.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/boot/dts/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 778a340..bac7b8d 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -9,6 +9,9 @@ dts-dirs	+= ralink
 
 obj-y		:= $(addsuffix /, $(dts-dirs))
 
+dtstree		:= $(srctree)/$(src)
+dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(foreach d,$(dts-dirs), $(wildcard $(dtstree)/$(d)/*.dts)))
+
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
 clean-files	:= *.dtb *.dtb.S
-- 
2.1.4
