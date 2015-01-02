From: Inha Song <ideal.song@samsung.com>
Subject: [alsa-devel] [PATCH v2 RESEND 0/2] mfd: arizona: Add support for
 OUTn_MONO register control
Date: Fri, 02 Jan 2015 17:03:47 +0900
Message-ID: <1420185829-24886-1-git-send-email-ideal.song@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, ckeepax@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, Inha Song <ideal.song@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch series add support for OUTn_MONO register control using platform data.
Each output signal can be configurated as a mono differential output.
The mono differential configuration is selected using the OUTn_MONO registers.

Changes in v2:
 - fix coding style issue
 - use ">=" instead of "==" in condition check

Inha Song (2):
  mfd: arizona: Add support for OUTn_MONO register control
  mfd: arizona: Update DT binding to support OUTn_MONO init_data

 Documentation/devicetree/bindings/mfd/arizona.txt |  7 +++++++
 drivers/mfd/arizona-core.c                        | 10 ++++++++++
 2 files changed, 17 insertions(+)

-- 
2.0.0.390.gcb682f8
