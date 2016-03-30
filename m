From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v3 0/2] mmc: dw_mmc: controller reset support
Date: Wed, 30 Mar 2016 15:24:54 +0800
Message-ID: <1459322696-29919-1-git-send-email-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.lin@rock-chips.com, jh80.chung@samsung.com, --to=robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ulf.hansson@linaro.org, guodong.xu@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

mmc controller registers may in abnormal state if mmc is used in
bootloader, eg. to load kernel from eMMC. Some controllers cann't
clear their registers when clk is set. They use dedicated reset
logics to do this.

In this patch, a 'resets' property is added into dw_mmc dts
node. When driver does parse_dt and probe, it calls reset API to
deassert the 'reset' of dw_mmc host controller. When probe error or
remove, it calls reset API to assert it.

Chip vendor's actual reset logics is implemented in reset driver, not
in dw_mmc code.

Please also refer to Documentation/devicetree/bindings/reset/reset.txt

Guodong Xu (2):
  Documentation: synopsys-dw-mshc: add binding for resets
  mmc: dw_mmc: add resets support to dw_mmc

 .../devicetree/bindings/mmc/synopsys-dw-mshc.txt     |  4 ++++
 drivers/mmc/host/dw_mmc.c                            | 20 +++++++++++++++++++-
 include/linux/mmc/dw_mmc.h                           |  6 ++++--
 3 files changed, 27 insertions(+), 3 deletions(-)

-- 
1.9.1
