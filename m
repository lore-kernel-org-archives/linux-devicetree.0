From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 0/6] thermal: sti: Add new Thermal driver
Date: Fri, 30 May 2014 10:38:29 +0100
Message-ID: <1401442715-6350-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: lee.jones@linaro.org, kernel@stlinux.com, rui.zhang@intel.com, eduardo.valentin@ti.com, ajitpal.singh@st.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com
List-Id: devicetree@vger.kernel.org

This patchset adds full support for 2 types of Thermal Controllers
produced by STMicroelectronics.  One is a more traditional memory
mapped variant, the other is controlled solely by system configuration
registers.

 Documentation/devicetree/bindings/thermal/st-thermal.txt |  42 ++++++++++++++++
 arch/arm/boot/dts/stih416.dtsi                           |  18 +++++++
 arch/arm/configs/multi_v7_defconfig                      |   2 +
 drivers/thermal/Kconfig                                  |   5 ++
 drivers/thermal/Makefile                                 |   1 +
 drivers/thermal/st/Kconfig                               |  12 +++++
 drivers/thermal/st/Makefile                              |   3 ++
 drivers/thermal/st/st_thermal.c                          | 313 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/thermal/st/st_thermal.h                          | 104 ++++++++++++++++++++++++++++++++++++++
 drivers/thermal/st/st_thermal_memmap.c                   | 209 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/thermal/st/st_thermal_syscfg.c                   | 179 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 11 files changed, 888 insertions(+)

