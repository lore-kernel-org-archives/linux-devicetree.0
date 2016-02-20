From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH 0/3] thermal: hisilicon: enable power allocator for Hi6220
Date: Sat, 20 Feb 2016 23:52:06 +0800
Message-ID: <1455983529-9559-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, kongxinwei <kong.kongxinwei@hisilicon.com>, Javi Merino <javi.merino@arm.com>, Punit Agrawal <Punit.Agrawal@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi6220 has octa-core so it has quite high power consumption when run
benchmark and introduces high temperature for SoC. So need enable
thermal gover to control temperature and also cannot hurt much for
performance after impose cooling operations on CPU.

This patch series is to enable power allocator for Hi6220. The power
allocator just uses only one sensor, so patch 1 is to fix sensor driver
so let it can initialize driver successfully with only enabling one
sensor.

After profiling on Hikey, the power model has been simplized with only
dynamic coefficent, and now it's convienence to pass it from CPU node.
So patch 2 and 3 bind sensor and pass power model parameters.

This patch series have been tested on 96boards Hikey.


Leo Yan (3):
  thermal: hisilicon: support to use any sensor
  arm64: dts: register Hi6220's thermal sensor
  arm64: dts: register Hi6220's thermal zone for power allocator

 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 45 +++++++++++++++++++++++++++++++
 drivers/thermal/hisi_thermal.c            | 33 ++++++++++++++---------
 2 files changed, 65 insertions(+), 13 deletions(-)

-- 
1.9.1

