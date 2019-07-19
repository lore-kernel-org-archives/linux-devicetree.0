From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [TRIVIAL PATCH] of: per-file dtc preprocessor flags
Date: Fri, 19 Jul 2019 22:28:24 +0300
Message-ID: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

As of today we are able to pass custom flags to dtc compiler but not
to dtc preprocessor.
This ability is required for including some board-specific header files.
It allows us to pass defined constants to dts without their duplication
in several places.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 scripts/Makefile.lib | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f1f38c8cdc74..f2595a608dce 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -166,6 +166,8 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
 		 $(addprefix -I,$(DTC_INCLUDE))                          \
 		 -undef -D__DTS__
 
+dtc_cpp_flags  += $(DTC_CPP_FLAGS_$(basetarget))
+
 # Useful for describing the dependency of composite objects
 # Usage:
 #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
-- 
2.21.0
