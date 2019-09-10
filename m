From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v3 0/5] Read-only memremap()
Date: Tue, 10 Sep 2019 09:08:58 -0700
Message-ID: <20190910160903.65694-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Evan Green <evgreen@chromium.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

This patch series implements a read-only version of memremap() via
a new MEMREMAP_RO flag. If this is passed in the mapping call, we'll
try to map the memory region as read-only if it doesn't intersect
with an existing mapping. Otherwise, we'll try to fallback to other
flags to try to map the memory that way.

The main use case I have is to map the command-db memory region on
Qualcomm devices with a read-only mapping. It's already a const marked
pointer and the API returns const pointers as well, so this series makes
sure that even stray writes can't modify the memory. To get there we
introduce a devm version of memremap() for a reserved memory region, add
a memremap() flag, and implement support for that flag on arm64.

Changes from v2 (https://lkml.kernel.org/r/20190614203717.75479-1-swboyd@chromium.org):
 * Added a comment to kerneldoc for the new MEMREMAP_RO flag
 * Rebased to v5.3-rc1

Changes from v1:
 * Picked up tags and rebased to v5.2-rc3

Stephen Boyd (5):
  reserved_mem: Add a devm_memremap_reserved_mem() API
  soc: qcom: cmd-db: Migrate to devm_memremap_reserved_mem()
  memremap: Add support for read-only memory mappings
  arm64: Add support for arch_memremap_ro()
  soc: qcom: cmd-db: Map with read-only mappings

Cc: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>

 arch/arm64/include/asm/io.h     |  1 +
 drivers/of/of_reserved_mem.c    | 45 +++++++++++++++++++++++++++++++++
 drivers/soc/qcom/cmd-db.c       | 14 +++-------
 include/linux/io.h              |  1 +
 include/linux/of_reserved_mem.h |  6 +++++
 kernel/iomem.c                  | 20 ++++++++++++---
 6 files changed, 74 insertions(+), 13 deletions(-)


base-commit: 5f9e832c137075045d15cd6899ab0505cfb2ca4b
-- 
Sent by a computer through tubes
