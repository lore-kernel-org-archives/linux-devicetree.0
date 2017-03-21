From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] dtc updates for 4.12
Date: Tue, 21 Mar 2017 11:19:55 -0500
Message-ID: <20170321161958.9658-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, arm@kernel.org
List-Id: devicetree@vger.kernel.org

This series syncs dtc with current mainline. The primary motivation is 
to pull in the new checks I've worked on. This gives lots of new 
warnings which are turned off by default.

Arm-soc folks, I've left the PCI checks enabled as they are pretty much 
all real errors and there aren't that many (about 1200, but that's lots 
of duplicates). I have a patch for some of them.

Rob

Rob Herring (3):
  scripts/dtc: automate getting dtc version and log in update script
  scripts/dtc: Update to upstream version v1.4.4-8-g756ffc4f52f6
  dtc: update warning settings for new bus and node/property name checks

 scripts/Makefile.lib                 |   9 +-
 scripts/dtc/checks.c                 | 361 +++++++++++++++++++++++++++++++----
 scripts/dtc/data.c                   |  16 +-
 scripts/dtc/dtc-lexer.l              |   3 +-
 scripts/dtc/dtc-lexer.lex.c_shipped  |  77 ++++----
 scripts/dtc/dtc-parser.tab.c_shipped |   6 +-
 scripts/dtc/dtc-parser.y             |   6 +-
 scripts/dtc/dtc.c                    |   9 +-
 scripts/dtc/dtc.h                    |  11 +-
 scripts/dtc/flattree.c               |  58 +++---
 scripts/dtc/libfdt/fdt_rw.c          |   3 +-
 scripts/dtc/libfdt/libfdt.h          |  51 ++++-
 scripts/dtc/libfdt/libfdt_env.h      |  26 +--
 scripts/dtc/livetree.c               |  22 ++-
 scripts/dtc/srcpos.c                 |   2 +-
 scripts/dtc/srcpos.h                 |  11 +-
 scripts/dtc/treesource.c             |   6 +-
 scripts/dtc/update-dtc-source.sh     |  20 +-
 scripts/dtc/util.c                   |  11 +-
 scripts/dtc/util.h                   |  24 ++-
 scripts/dtc/version_gen.h            |   2 +-
 21 files changed, 550 insertions(+), 184 deletions(-)

-- 
2.10.1
