From: Inha Song <ideal.song@samsung.com>
Subject: [alsa-devel][PATCH 0/2] mfd: arizona: Add support for OUTn_MONO
 register control
Date: Mon, 08 Dec 2014 18:20:20 +0900
Message-ID: <1418030422-27061-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, ckeepax@opensource.wolonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, Inha Song <ideal.song@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch series add support for OUTn_MONO register control using platform data.
Each output signal can be configurated as a mono differential output.
The mono differential configuration is selected using the OUTn_MONO registers.

Inha Song (2):
  mfd: arizona: Add support for OUTn_MONO register control
  mfd: arizona: Update DT binding to support OUTn_MONO init_data

 Documentation/devicetree/bindings/mfd/arizona.txt |  7 +++++++
 drivers/mfd/arizona-core.c                        | 10 ++++++++++
 2 files changed, 17 insertions(+)

-- 
2.0.0.390.gcb682f8
