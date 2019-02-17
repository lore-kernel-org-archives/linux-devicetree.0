From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 0/5] nvmem: sunxi-sid: add SID controller support for H5 and H6
Date: Sun, 17 Feb 2019 11:23:11 -0500
Message-ID: <20190217162316.14111-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Add SID controller support for H5 and H6, and do some
cleanup without functional changes.

Yangtao Li (5):
  nvmem: sunxi-sid: fix wrong description in kernel doc
  nvmem: sunxi-sid: add support for H5's SID controller
  nvmem: sunxi-sid: add binding for H6's SID controller
  nvmem: sunxi-sid: add support for H6's SID controller
  nvmem: sunxi-sid: convert to SPDX license tags

 .../bindings/nvmem/allwinner,sunxi-sid.txt    |  3 ++-
 drivers/nvmem/sunxi_sid.c                     | 23 +++++++++++--------
 2 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.17.0
