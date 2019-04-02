From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 0/5] nvmem: sunxi-sid: add SID controller support for H6
Date: Tue,  2 Apr 2019 11:45:09 -0400
Message-ID: <20190402154514.11284-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Add SID support for H6, and do some cleanup.
For endianness issue, add a new ref_read func.

Yangtao Li (5):
  nvmem: sunxi-sid: fix wrong description in kernel doc
  nvmem: sunxi-sid: add binding for H6's SID controller
  nvmem: sunxi-sid: convert to SPDX license tags
  nvmem: sunxi-sid: add new reg_read func
  nvmem: sunxi-sid: add support for H6's SID controller
---
v2:
-add a new ref_read func
-only support H6 now
---
 .../bindings/nvmem/allwinner,sunxi-sid.txt    |  3 +-
 drivers/nvmem/sunxi_sid.c                     | 47 +++++++++++++++----
 2 files changed, 39 insertions(+), 11 deletions(-)

-- 
2.17.0
