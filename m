From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 0/3] Cleanup some unused functions in fdt.c
Date: Tue, 14 May 2019 13:40:50 -0700
Message-ID: <20190514204053.124122-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
List-Id: devicetree@vger.kernel.org

This series removes some unused functions, marks some more as __init,
marks the FDT as __ro_after_init for some more protections, and updates
the common properties binding to be less Linux specific.

Changes from v1:
 * New patch for dt-bindings and removal of that hunk from patch 2

Stephen Boyd (3):
  dt-bindings: Remove Linuxisms from common-properties binding
  of/fdt: Remove dead code and mark functions with __init
  of/fdt: Mark initial_boot_params as __ro_after_init

Cc: Hsin-Yi Wang <hsinyi@chromium.org>

 .../devicetree/bindings/common-properties.txt | 17 ++++----
 drivers/of/fdt.c                              | 39 +++----------------
 include/linux/of_fdt.h                        | 11 ------
 3 files changed, 14 insertions(+), 53 deletions(-)


base-commit: e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd
-- 
Sent by a computer through tubes
