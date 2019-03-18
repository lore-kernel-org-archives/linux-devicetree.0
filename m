From: Peter Griffin <peter.griffin@linaro.org>
Subject: `From c152138a8ec2bcd8faaac8db01dbb9be547fd021 Mon Sep 17 00:00:00 2001
Date: Mon, 18 Mar 2019 19:38:45 +0000
Message-ID: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: john.stultz@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, yuq825@gmail.com
List-Id: devicetree@vger.kernel.org

Hi folks,

This series adds support for the Mali450 MP4 GPU found on the
hi6220 SoC from HiSilicon. It has been tested with the out
of tree lima drm/mesa driver hosted on freedesktop.org gitlab,
and validated using Weston and kmscube.

regards,

Peter.

Peter Griffin (6):
  dt-bindings: gpu: mali-utgard: add hisilicon,hi6220-mali compatible
  dt-bindings: reset: hisilicon: Update compatible documentation
  arm64: dts: hisilicon: Add Mali-450 MP4 GPU DT entry
  reset: hi6220: Add support for AO reset controller
  dt-bindings: reset: hisilicon: Add ao reset controller
  clk: hi6220: use CLK_OF_DECLARE_DRIVER

 .../devicetree/bindings/gpu/arm,mali-utgard.txt    |  5 +++
 .../bindings/reset/hisilicon,hi6220-reset.txt      |  1 +
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          | 38 ++++++++++++++++
 drivers/clk/hisilicon/clk-hi6220.c                 |  2 +-
 drivers/reset/hisilicon/hi6220_reset.c             | 51 +++++++++++++++++++++-
 include/dt-bindings/reset/hisi,hi6220-resets.h     |  7 +++
 6 files changed, 102 insertions(+), 2 deletions(-)

-- 
2.7.4
