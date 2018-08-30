From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] of: root #{size,address}-cells clean-ups
Date: Thu, 30 Aug 2018 14:05:20 -0500
Message-ID: <20180830190523.31474-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

This is a small restructuring and clean-up of handling root node
#size-cells and #address-cells (or lack of). As only Sparc needs a 
different default value and only for #address-cells, we can handle that 
locally and remove one more dependency on asm/prom.h.

Rob

Rob Herring (3):
  of/fdt: Scan the root node properties earlier
  of/fdt: avoid re-parsing '#{address,size}-cells' in
    of_fdt_limit_memory
  of: make default address and size cells sizes private

 arch/sparc/include/asm/prom.h |  3 ---
 drivers/of/fdt.c              | 30 +++++-------------------------
 drivers/of/of_private.h       |  8 ++++++++
 include/linux/of.h            |  6 ------
 4 files changed, 13 insertions(+), 34 deletions(-)

-- 
2.17.1
