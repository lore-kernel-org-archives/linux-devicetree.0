From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 0/3] Update Broadcom Stingray clock entries
Date: Fri, 25 May 2018 09:45:14 -0700
Message-ID: <1527266717-8406-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pramod Kumar <pramod.kumar@broadcom.com>, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch series updates Broadcom Stingray clock entries so they match the
latest ASIC datasheet

This patch series is based off v4.17-rc5 and is available on GIHUB:
repo: https://github.com/Broadcom/arm64-linux.git
branch: sr-clk-v1

Ray Jui (3):
  dt-bindings: clk: Update Stingray binding doc
  clk: bcm: Update and add tingray clock entries
  arm64: dts: Update Stingray clock DT nodes

 .../bindings/clock/brcm,iproc-clocks.txt           |  26 ++--
 .../boot/dts/broadcom/stingray/stingray-clock.dtsi |  26 ++--
 drivers/clk/bcm/clk-sr.c                           | 135 ++++++++++++++++++---
 include/dt-bindings/clock/bcm-sr.h                 |  24 ++--
 4 files changed, 170 insertions(+), 41 deletions(-)

-- 
2.1.4
