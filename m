From: Manish Narani <manish.narani@xilinx.com>
Subject: [PATCH 0/3] Add Xilinx AMS Driver
Date: Thu, 30 Aug 2018 15:52:16 +0530
Message-ID: <1535624539-7839-1-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, manish.narani@xilinx.com, leoyang.li@nxp.com, sudeep.holla@arm.com, amit.kucheria@linaro.org, broonie@kernel.org, arnaud.pouliquen@st.com, geert@linux-m68k.org, eugen.hristev@microchip.com, rdunlap@infradead.org, lukas@wunner.de, freeman.liu@spreadtrum.com, vilhelm.gray@gmail.com, tglx@linutronix.de, baolin.wang@linaro.org, gregkh@linuxfoundation.org
Cc: sgoud@xilinx.com, anirudh@xilinx.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add Xilinx AMS driver which is used for Xilinx's ZynqMP AMS controller.
This AMS driver is used to report various interface voltages and
temperatures across the system.
This driver handles AMS module including PS-Sysmon & PL-Sysmon. The
binding documentation is added for understanding of AMS, PS, PL Sysmon
Channels.

Manish Narani (3):
  dt-bindings: iio: adc: Add Xilinx AMS binding documentation
  iio: adc: Add Xilinx AMS driver
  arm64: zynqmp: DT: Add Xilinx AMS node

 .../devicetree/bindings/iio/adc/xilinx-ams.txt     |  159 +++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   26 +
 drivers/iio/adc/Kconfig                            |   10 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/xilinx-ams.c                       | 1081 ++++++++++++++++++++
 drivers/iio/adc/xilinx-ams.h                       |  281 +++++
 6 files changed, 1558 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-ams.txt
 create mode 100644 drivers/iio/adc/xilinx-ams.c
 create mode 100644 drivers/iio/adc/xilinx-ams.h

-- 
2.1.1
