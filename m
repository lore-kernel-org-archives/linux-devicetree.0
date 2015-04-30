From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2] scripts/dtc: Update to upstream version 9d3649bd3be245c9
Date: Thu, 30 Apr 2015 08:14:13 -0500
Message-ID: <1430399653-30269-2-git-send-email-robh@kernel.org>
References: <1430399653-30269-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430399653-30269-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Sync dtc with upstream as of commit 9d3649bd3be2 (Add testcases for
fdt_path_offset_namelen()).

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org
---
 scripts/dtc/checks.c                 |   31 +-
 scripts/dtc/data.c                   |   12 +-
 scripts/dtc/dtc-lexer.l              |   65 +-
 scripts/dtc/dtc-lexer.lex.c_shipped  |  516 +++++-----
 scripts/dtc/dtc-parser.tab.c_shipped | 1773 ++++++++++++++++------------------
 scripts/dtc/dtc-parser.tab.h_shipped |  114 ++-
 scripts/dtc/dtc-parser.y             |  147 +--
 scripts/dtc/dtc.c                    |   14 +-
 scripts/dtc/dtc.h                    |   18 +-
 scripts/dtc/flattree.c               |    4 +-
 scripts/dtc/fstree.c                 |   17 +-
 scripts/dtc/libfdt/Makefile.libfdt   |    3 +-
 scripts/dtc/libfdt/fdt.c             |   30 +-
 scripts/dtc/libfdt/fdt.h             |   93 +-
 scripts/dtc/libfdt/fdt_empty_tree.c  |    1 +
 scripts/dtc/libfdt/fdt_ro.c          |   29 +-
 scripts/dtc/libfdt/fdt_rw.c          |   10 +-
 scripts/dtc/libfdt/fdt_sw.c          |   36 +-
 scripts/dtc/libfdt/fdt_wip.c         |    2 +-
 scripts/dtc/libfdt/libfdt.h          |  148 ++-
 scripts/dtc/libfdt/libfdt_env.h      |  104 +-
 scripts/dtc/libfdt/libfdt_internal.h |    6 +-
 scripts/dtc/livetree.c               |    4 +-
 scripts/dtc/srcpos.c                 |   49 +-
 scripts/dtc/srcpos.h                 |   15 +-
 scripts/dtc/treesource.c             |   15 +-
 scripts/dtc/util.c                   |   18 +-
 scripts/dtc/util.h                   |    4 +-
 scripts/dtc/version_gen.h            |    2 +-
 29 files changed, 1745 insertions(+), 1535 deletions(-)

The patch is quite large, so I've only included the diffstat. The full 
patch is created by scripts/dtc/update-dtc-source.sh and can be found 
here[1].

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dtc-import
