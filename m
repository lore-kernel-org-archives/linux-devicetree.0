From: Libor Pechacek <lpechacek@suse.com>
Subject: [PATCH] devicetree: Remove dangling symlinks
Date: Wed, 28 Mar 2018 10:32:14 +0200
Message-ID: <20180328083213.by4sjrk3nx5s4rbk@fm.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
Cc: James Hogan <jhogan@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Olof Johansson <olof@lixom.net>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, trivial@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Support for CRIS and Meta was dropped.

Signed-off-by: Libor Pechacek <lpechacek@suse.com>
Fixes: bb6fb6dfcc17 ("metag: Remove arch/metag/")
Fixes: c690eddc2f3b ("CRIS: Drop support for the CRIS port")
Cc: James Hogan <jhogan@kernel.org>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Olof Johansson <olof@lixom.net>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org
Cc: trivial@kernel.org
Cc: linux-kernel@vger.kernel.org
---
 scripts/dtc/include-prefixes/cris  | 1 -
 scripts/dtc/include-prefixes/metag | 1 -
 2 files changed, 2 deletions(-)
 delete mode 120000 scripts/dtc/include-prefixes/cris
 delete mode 120000 scripts/dtc/include-prefixes/metag

diff --git a/scripts/dtc/include-prefixes/cris b/scripts/dtc/include-prefixes/cris
deleted file mode 120000
index 736d998ba506..000000000000
--- a/scripts/dtc/include-prefixes/cris
+++ /dev/null
@@ -1 +0,0 @@
-../../../arch/cris/boot/dts
\ No newline at end of file
diff --git a/scripts/dtc/include-prefixes/metag b/scripts/dtc/include-prefixes/metag
deleted file mode 120000
index 87a3c847db8f..000000000000
--- a/scripts/dtc/include-prefixes/metag
+++ /dev/null
@@ -1 +0,0 @@
-../../../arch/metag/boot/dts
\ No newline at end of file
-- 
2.13.6
