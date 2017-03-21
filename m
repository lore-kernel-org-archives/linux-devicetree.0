From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3] scripts/dtc: automate getting dtc version and log in update script
Date: Tue, 21 Mar 2017 11:19:56 -0500
Message-ID: <20170321161958.9658-2-robh@kernel.org>
References: <20170321161958.9658-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170321161958.9658-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Further automate the dtc update script to fill in the dtc version and
commit log.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/dtc/update-dtc-source.sh | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
index f5cde799db03..c92e6bd9458d 100755
--- a/scripts/dtc/update-dtc-source.sh
+++ b/scripts/dtc/update-dtc-source.sh
@@ -36,10 +36,19 @@ DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c
 DTC_GENERATED="dtc-lexer.lex.c dtc-parser.tab.c dtc-parser.tab.h"
 LIBFDT_SOURCE="Makefile.libfdt fdt.c fdt.h fdt_empty_tree.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
 
+get_last_dtc_version() {
+	git log --oneline scripts/dtc/ | grep 'upstream' | head -1 | sed -e 's/^.* \(.*\)/\1/'
+}
+
+last_dtc_ver=$(get_last_dtc_version)
+
 # Build DTC
 cd $DTC_UPSTREAM_PATH
 make clean
 make check
+dtc_version=$(git describe HEAD)
+dtc_log=$(git log --oneline ${last_dtc_ver}..)
+
 
 # Copy the files into the Linux tree
 cd $DTC_LINUX_PATH
@@ -60,4 +69,12 @@ sed -i -- 's/#include <libfdt_env.h>/#include "libfdt_env.h"/g' ./libfdt/libfdt.
 sed -i -- 's/#include <fdt.h>/#include "fdt.h"/g' ./libfdt/libfdt.h
 git add ./libfdt/libfdt.h
 
-git commit -e -v -m "scripts/dtc: Update to upstream version [CHANGEME]"
+commit_msg=$(cat << EOF
+scripts/dtc: Update to upstream version ${dtc_version}
+
+This adds the following commits from upstream:
+
+${dtc_log}
+EOF
+)
+git commit -e -v -s -m "${commit_msg}"
-- 
2.10.1
