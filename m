Return-Path: <SRS0=OP5l=QE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58462 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbfA1TVy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Jan 2019 14:21:54 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190128192152euoutp01e5ea84f11fc7ce6badb252f09ba605a7~_GXUNhTuC3243432434euoutp01X
        for <devicetree@vger.kernel.org>; Mon, 28 Jan 2019 19:21:52 +0000 (GMT)
From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH 0/8] Exynos5 Dynamic Memory Controller driver
Date: Mon, 28 Jan 2019 20:21:31 +0100
Message-Id: <1548703299-15806-1-git-send-email-l.luba@partner.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20190128192150eucas1p14eb93be3b6a54657a48725b4615cc7aa@eucas1p1.samsung.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: b.zolnierkie@samsung.com, myungjoo.ham@samsung.com, krzk@kernel.org, Lukasz Luba <l.luba@partner.samsung.com>
List-ID: <devicetree@vger.kernel.org>

Hi all,

This patch set add support for Exynos5422 SoC for Dynamic Memory Controller.
The driver supports Dynamic Frequency and Voltage Scalling
for the DMC and DRAM. It also provides needed timings for different
speed operations of the DRAM memory.

Regards,
Lukasz Luba

Lukasz Luba (8):
  clk: samsung: add needed IDs for DMC clocks in Exynos5420
  clk: samsung: add new clocks for DMC for Exynos5422 SoC
  clk: samsung: add BPLL rate table for Exynos 5422 SoC
  dt-bindings: devfreq: add DMC device description
  drivers: devfreq: exynos5: add DMC driver
  DT: arm: exynos: add DMC device for exynos5422
  drivers: devfreq: events: add Exynos PPMU new events
  arm: config: exynos: enable DMC driver

 .../devicetree/bindings/devfreq/exynos5-dmc.txt    |  108 ++
 MAINTAINERS                                        |    8 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   81 ++
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      |   22 +
 arch/arm/configs/exynos_defconfig                  |    1 +
 drivers/clk/samsung/clk-exynos5420.c               |   63 +-
 drivers/devfreq/Kconfig                            |   13 +
 drivers/devfreq/Makefile                           |    1 +
 drivers/devfreq/event/exynos-ppmu.c                |    6 +
 drivers/devfreq/exynos5-dmc.c                      | 1335 ++++++++++++++++++++
 include/dt-bindings/clock/exynos5420.h             |   18 +-
 11 files changed, 1650 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/devfreq/exynos5-dmc.txt
 create mode 100644 drivers/devfreq/exynos5-dmc.c

-- 
2.7.4
