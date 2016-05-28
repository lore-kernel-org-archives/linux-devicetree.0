From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 0/5] fix some type infos and bugs for arm64/of numa
Date: Sat, 28 May 2016 17:22:52 +0800
Message-ID: <1464427377-12712-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Robert Richter <rrichter@cavium.com>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
List-Id: devicetree@vger.kernel.org

v1 -> v2:
1. Base on https://lkml.org/lkml/2016/5/24/679
2. Rewrote of_numa_parse_memory_nodes according to Rob Herring's advice. So that it looks more clear.
3. Rewrote patch 5 because some scenes were not considered before.

Zhen Lei (5):
  of/numa: remove a duplicated pr_debug information
  of/numa: fix a memory@ node can only contains one memory block
  arm64/numa: add nid check for memory block
  of/numa: remove a duplicated warning
  arm64/numa: avoid inconsistent information to be printed

 arch/arm64/mm/numa.c | 11 ++++++++---
 drivers/of/of_numa.c | 42 ++++++++++++------------------------------
 2 files changed, 20 insertions(+), 33 deletions(-)

-- 
2.5.0
