From: Rob Herring <robh@kernel.org>
Subject: [PATCH] builddeb: Fix inclusion of dtbs in debian package
Date: Wed,  7 Nov 2018 08:36:46 -0600
Message-ID: <20181107143646.27675-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunojpg@gmail.com>
List-Id: devicetree@vger.kernel.org

Commit 37c8a5fafa3b ("kbuild: consolidate Devicetree dtb build rules")
moved the location of 'dtbs_install' target which caused dtbs to not be
installed when building debian package with 'bindeb-pkg' target. Update
the builddeb script to use the same logic that determines if there's a
'dtbs_install' target which is presence of the arch dts directory. Also,
use CONFIG_OF_EARLY_FLATTREE instead of CONFIG_OF as that's a better
indication of whether we are building dtbs.

This commit will also have the side effect of installing dtbs on any
arch that has dts files. Previously, it was dependent on whether the
arch defined 'dtbs_install'.

Fixes: 37c8a5fafa3b ("kbuild: consolidate Devicetree dtb build rules")
Reported-by: Nuno Gonçalves <nunojpg@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/package/builddeb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 90c9a8ac7adb..594b626d83d6 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -83,9 +83,9 @@ else
 fi
 cp "$($MAKE -s image_name)" "$tmpdir/$installed_image_path"
 
-if grep -q "^CONFIG_OF=y" $KCONFIG_CONFIG ; then
+if grep -q "^CONFIG_OF_EARLY_FLATTREE=y" $KCONFIG_CONFIG ; then
 	# Only some architectures with OF support have this target
-	if grep -q dtbs_install "${srctree}/arch/$SRCARCH/Makefile"; then
+	if [ -d "${srctree}/arch/$SRCARCH/boot/dts" ]; then
 		$MAKE KBUILD_SRC= INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install
 	fi
 fi
-- 
2.19.1
