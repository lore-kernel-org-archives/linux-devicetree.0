From: Rohit Vaswani <rvaswani@codeaurora.org>
Subject: [PATCH 0/3] Add SMP support for MSM8660 and MSM8960
Date: Mon,  3 Jun 2013 17:19:42 -0700
Message-ID: <1370305185-6450-1-git-send-email-rvaswani@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>
Cc: Rohit Vaswani <rvaswani@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This series re-organizes the platsmp.c and adds SMP support for
MSM8660 and MSM8960. We convert to using the cpus property in
device tree and add a "enable-method" property for arm32.

Rohit Vaswani (3):
  msm: platsmp: Consolidate write to pen_release
  ARM: msm: Re-organize platsmp to make it extensible
  ARM: msm: Add SMP support for 8960

 Documentation/devicetree/bindings/arm/cpus.txt     |    8 +
 Documentation/devicetree/bindings/arm/msm/kpss.txt |   16 ++
 Documentation/devicetree/bindings/arm/msm/scss.txt |   15 ++
 arch/arm/boot/dts/msm8660-surf.dts                 |   21 +++
 arch/arm/boot/dts/msm8960-cdp.dts                  |   22 +++
 arch/arm/mach-msm/platsmp.c                        |  165 ++++++++++++++++---
 arch/arm/mach-msm/scm-boot.h                       |    8 +-
 7 files changed, 226 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/msm/kpss.txt
 create mode 100644 Documentation/devicetree/bindings/arm/msm/scss.txt

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
