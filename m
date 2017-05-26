From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v2 0/3] clk: hi3660: add more clocks and fix bugs
Date: Fri, 26 May 2017 15:38:18 +0800
Message-ID: <20170526073821.25971-1-guodong.xu@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: chenjun14@huawei.com, zhongkaihua@huawei.com, zhangfei.gao@linaro.org, leo.yan@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

This patchset adds more clocks for hi3660, video encoder/decoder, ISP. It
includes also bug fixes.

v2 update:
 - added ISP clocks into patch 2.

Chen Jun (2):
  clk: hi3660: fix wrong parent name of clk_mux_sysbus
  clk: hi3660: add clocks for video encoder, decoder and ISP

Zhong Kaihua (1):
  clk: hi3660: Set PPLL2 to 2880M

 drivers/clk/hisilicon/clk-hi3660.c       | 50 +++++++++++++++++++++++++++++---
 include/dt-bindings/clock/hi3660-clock.h | 17 +++++++++++
 2 files changed, 63 insertions(+), 4 deletions(-)

-- 
2.10.2

